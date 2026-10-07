param(
    [switch]$RequireLocalPdfs
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$manifestPath = Join-Path $root 'referenced/papers_manifest.tsv'
$matrixPath = Join-Path $root 'evidence_matrix.csv'
$precisionPath = Join-Path $root 'precision_annotations/precision_annotations.csv'
$checksumPath = Join-Path $root 'referenced/checksums.sha256'

foreach ($requiredPath in @($manifestPath, $matrixPath, $precisionPath)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Missing required repository file: $requiredPath"
    }
}

$manifest = @(Import-Csv -LiteralPath $manifestPath -Delimiter ([char]9))
$requiredColumns = @('category','year','slug','title','status','pdf_url','source_url','tags')
$actualColumns = @($manifest[0].PSObject.Properties.Name)
$missingColumns = @($requiredColumns | Where-Object { $_ -notin $actualColumns })
if ($missingColumns) {
    throw "Manifest is missing columns: $($missingColumns -join ', ')"
}

$duplicateSlugs = @($manifest | Group-Object slug | Where-Object Count -gt 1)
if ($duplicateSlugs) {
    throw "Duplicate manifest slugs: $(($duplicateSlugs.Name) -join ', ')"
}

$invalidRows = @()
foreach ($row in $manifest) {
    if (-not $row.category -or -not $row.slug -or -not $row.title -or -not $row.status -or -not $row.source_url) {
        $invalidRows += $row.slug
        continue
    }
    $yearValue = 0
    if (-not [int]::TryParse($row.year, [ref]$yearValue)) {
        $invalidRows += $row.slug
        continue
    }
    $sourceUri = $null
    if (-not [Uri]::TryCreate($row.source_url, [UriKind]::Absolute, [ref]$sourceUri)) {
        $invalidRows += $row.slug
        continue
    }
    if ($row.pdf_url) {
        $pdfUri = $null
        if (-not [Uri]::TryCreate($row.pdf_url, [UriKind]::Absolute, [ref]$pdfUri)) {
            $invalidRows += $row.slug
        }
    }
}
if ($invalidRows) {
    throw "Invalid manifest metadata: $(($invalidRows | Sort-Object -Unique) -join ', ')"
}

$precision = @(Import-Csv -LiteralPath $precisionPath)
if ($precision.Count -ne 30) {
    throw "Expected 30 precision records, found $($precision.Count)."
}
$unknownPrecision = @($precision | Where-Object { $_.slug -notin $manifest.slug })
if ($unknownPrecision) {
    throw "Precision records absent from manifest: $(($unknownPrecision.slug) -join ', ')"
}
$nonPortablePaths = @($precision | Where-Object {
    [IO.Path]::IsPathRooted($_.pdf_path) -or $_.pdf_path -notmatch '^referenced/'
})
if ($nonPortablePaths) {
    throw "Non-portable precision PDF paths: $(($nonPortablePaths.slug) -join ', ')"
}

$tempMatrix = Join-Path ([IO.Path]::GetTempPath()) ("bicg-evidence-" + [guid]::NewGuid().ToString('N') + '.csv')
try {
    & (Join-Path $PSScriptRoot 'build_evidence_matrix.ps1') -ManifestPath $manifestPath -OutputPath $tempMatrix
    # Export-Csv uses the host's line endings, while Git stores this file as LF.
    # Compare the ordered schema and cell values, not serialization details such
    # as CRLF, UTF-8 BOMs, or CSV quoting. Do not ignore real metadata changes.
    $expectedMatrix = @(Import-Csv -LiteralPath $matrixPath)
    $generatedMatrix = @(Import-Csv -LiteralPath $tempMatrix)
    $expectedColumns = @($expectedMatrix[0].PSObject.Properties.Name)
    $generatedColumns = @($generatedMatrix[0].PSObject.Properties.Name)
    $matrixMatches = $expectedMatrix.Count -eq $generatedMatrix.Count -and
        $expectedColumns.Count -eq $generatedColumns.Count
    for ($column = 0; $matrixMatches -and $column -lt $generatedColumns.Count; $column++) {
        $matrixMatches = $expectedColumns[$column] -ceq $generatedColumns[$column]
    }
    for ($row = 0; $matrixMatches -and $row -lt $generatedMatrix.Count; $row++) {
        foreach ($column in $generatedColumns) {
            if ($expectedMatrix[$row].$column -cne $generatedMatrix[$row].$column) {
                $matrixMatches = $false
                break
            }
        }
    }
    if (-not $matrixMatches) {
        throw 'evidence_matrix.csv is stale; regenerate it before committing.'
    }
}
finally {
    if (Test-Path -LiteralPath $tempMatrix) {
        Remove-Item -LiteralPath $tempMatrix -Force
    }
}

& (Join-Path $PSScriptRoot 'static_check.ps1') -Root $root

if ($RequireLocalPdfs) {
    $paperRoot = Join-Path $root 'referenced'
    $pdfFiles = @(Get-ChildItem -LiteralPath $paperRoot -Recurse -File -Filter '*.pdf')
    $checksumMap = @{}
    foreach ($line in Get-Content -LiteralPath $checksumPath) {
        if ($line -notmatch '^([0-9a-fA-F]{64})  (.+)$') {
            throw "Malformed checksum line: $line"
        }
        $checksumMap[$Matches[2].Replace([char]92, '/')] = $Matches[1].ToLowerInvariant()
    }

    foreach ($row in $manifest) {
        $relativePaper = "$($row.category)/$($row.year)_$($row.slug).pdf"
        $localPaper = Join-Path $paperRoot $relativePaper.Replace('/', [IO.Path]::DirectorySeparatorChar)
        if ($row.pdf_url -and -not (Test-Path -LiteralPath $localPaper)) {
            throw "Missing downloadable paper: $relativePaper"
        }
    }

    foreach ($file in $pdfFiles) {
        if ($file.Length -lt 10000) {
            throw "PDF is too small: $($file.FullName)"
        }
        $stream = [IO.File]::OpenRead($file.FullName)
        try {
            $headerBytes = New-Object byte[] 5
            [void]$stream.Read($headerBytes, 0, 5)
            $header = [Text.Encoding]::ASCII.GetString($headerBytes)
        }
        finally {
            $stream.Dispose()
        }
        if ($header -ne '%PDF-') {
            throw "Invalid PDF header: $($file.FullName)"
        }

        $relative = [IO.Path]::GetRelativePath($paperRoot, $file.FullName).Replace([char]92, '/')
        if (-not $checksumMap.ContainsKey($relative)) {
            throw "PDF missing from checksums.sha256: $relative"
        }
        $actualHash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($actualHash -ne $checksumMap[$relative]) {
            throw "Checksum mismatch: $relative"
        }
    }
    if ($checksumMap.Count -ne $pdfFiles.Count) {
        throw "Checksum/PDF count mismatch: checksums=$($checksumMap.Count), pdfs=$($pdfFiles.Count)"
    }
    Write-Host "Local PDF validation passed: $($pdfFiles.Count) files."
}

Write-Host "Repository validation passed: $($manifest.Count) manifest records, $($precision.Count) precision records."
