# No Pester or local paper cache required. Run with PowerShell 7 on any OS.
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$fixture = Join-Path ([IO.Path]::GetTempPath()) ('review-validation-' + [guid]::NewGuid().ToString('N'))
$utf8 = [Text.UTF8Encoding]::new($false)
$passed = 0

function Assert-Validation([string]$Name, [bool]$ShouldPass) {
    $failure = $null
    try {
        & (Join-Path $fixture 'scripts/validate_repo.ps1') 6>$null
    }
    catch {
        $failure = $_
    }
    if ($ShouldPass -and $failure) { throw "$Name failed: $failure" }
    if (-not $ShouldPass) {
        if (-not $failure) { throw "$Name incorrectly accepted a stale matrix." }
        if ($failure.Exception.Message -notmatch 'evidence_matrix.csv is stale') {
            throw "$Name failed for an unrelated reason: $failure"
        }
    }
    $script:passed++
    Write-Host "PASS: $Name"
}

try {
    New-Item -ItemType Directory -Path $fixture | Out-Null
    # Copy only files required by validation, never the large local paper cache.
    foreach ($directory in @('scripts', 'sections', 'precision_annotations/cards')) {
        $target = Join-Path $fixture $directory
        New-Item -ItemType Directory -Path $target -Force | Out-Null
        Copy-Item -Path (Join-Path $root "$directory/*") -Destination $target -Recurse
    }
    New-Item -ItemType Directory -Path (Join-Path $fixture 'referenced') | Out-Null
    foreach ($file in @('main.tex', 'metadata.tex', 'references.bib', 'evidence_matrix.csv',
        'referenced/papers_manifest.tsv', 'referenced/fulltext_audits.tsv',
        'precision_annotations/precision_annotations.csv')) {
        Copy-Item -LiteralPath (Join-Path $root $file) -Destination (Join-Path $fixture $file)
    }

    $matrixPath = Join-Path $fixture 'evidence_matrix.csv'
    $original = [IO.File]::ReadAllText($matrixPath).Replace("`r`n", "`n")
    foreach ($ending in @("`n", "`r`n")) {
        $name = if ($ending -eq "`n") { 'LF' } else { 'CRLF' }
        [IO.File]::WriteAllText($matrixPath, $original.Replace("`n", $ending), $utf8)
        Assert-Validation "$name serialization" $true
    }
    [IO.File]::WriteAllText($matrixPath, $original, [Text.UTF8Encoding]::new($true))
    Assert-Validation 'UTF-8 BOM serialization' $true

    # A changed value, even only its case, must still fail.
    [IO.File]::WriteAllText($matrixPath, $original, $utf8)
    $rows = @(Import-Csv -LiteralPath $matrixPath)
    $rows[0].title += ' STALE'
    $rows | Export-Csv -LiteralPath $matrixPath -NoTypeInformation -Encoding utf8
    Assert-Validation 'Changed title' $false

    [IO.File]::WriteAllText($matrixPath, $original, $utf8)
    $rows = @(Import-Csv -LiteralPath $matrixPath)
    $rows[0].slug = $rows[0].slug.ToUpperInvariant()
    $rows | Export-Csv -LiteralPath $matrixPath -NoTypeInformation -Encoding utf8
    Assert-Validation 'Case-sensitive cell values' $false

    [IO.File]::WriteAllText($matrixPath, $original, $utf8)
    $rows = @(Import-Csv -LiteralPath $matrixPath)
    $rows[1..($rows.Count - 1)] | Export-Csv -LiteralPath $matrixPath -NoTypeInformation -Encoding utf8
    Assert-Validation 'Missing row' $false

    [IO.File]::WriteAllText($matrixPath, $original, $utf8)
    $rows = @(Import-Csv -LiteralPath $matrixPath)
    [array]::Reverse($rows)
    $rows | Export-Csv -LiteralPath $matrixPath -NoTypeInformation -Encoding utf8
    Assert-Validation 'Reordered rows' $false

    [IO.File]::WriteAllText($matrixPath, $original.Replace('"record_id"', '"record_ID"'), $utf8)
    Assert-Validation 'Case-sensitive column names' $false

    [IO.File]::WriteAllText($matrixPath, $original, $utf8)
    $rows = @(Import-Csv -LiteralPath $matrixPath)
    $rows | Select-Object *, @{Name='unexpected'; Expression={ 'extra' }} |
        Export-Csv -LiteralPath $matrixPath -NoTypeInformation -Encoding utf8
    Assert-Validation 'Unexpected column' $false

    # Explicit full-text overrides and status provenance remain auditable.
    [IO.File]::WriteAllText($matrixPath, $original, $utf8)
    $rows = @(Import-Csv -LiteralPath $matrixPath)
    if (($rows | Where-Object slug -eq 'TactiDex').evidence_tier -ne 'preprint_or_author_claim') {
        throw 'Author-reported acceptance was upgraded to verified acceptance.'
    }
    $script:passed++; Write-Host 'PASS: Author-reported acceptance tier'
    $biview = $rows | Where-Object slug -eq 'BiView-Touch'
    if ($biview.task_contact_topology -ne 'human_bimanual_shared_object_and_role_asymmetric_tasks' -or
        $biview.coding_note -notmatch 'Full-text archive audit 2026-10-07') {
        throw 'Located full-text override was not applied.'
    }
    $script:passed++; Write-Host 'PASS: Located full-text override'
    $auditPath = Join-Path $fixture 'referenced/fulltext_audits.tsv'
    $auditOriginal = [IO.File]::ReadAllText($auditPath)
    $auditRows = @(Import-Csv -LiteralPath $auditPath -Delimiter ([char]9))
    $auditRows[0].representation_level += '_changed'
    $auditRows | Export-Csv -LiteralPath $auditPath -Delimiter ([char]9) -NoTypeInformation -Encoding utf8
    Assert-Validation 'Changed full-text audit makes matrix stale' $false
    [IO.File]::WriteAllText($auditPath, $auditOriginal, $utf8)

    foreach ($case in @('Duplicate', 'Unknown', 'Missing')) {
        $auditRows = @(Import-Csv -LiteralPath $auditPath -Delimiter ([char]9))
        if ($case -eq 'Duplicate') { $auditRows += $auditRows[0] }
        if ($case -eq 'Unknown') { $auditRows[0].slug = 'absent-study' }
        if ($case -eq 'Missing') { $auditRows[0].evidence_locator = '' }
        $auditRows | Export-Csv -LiteralPath $auditPath -Delimiter ([char]9) -NoTypeInformation -Encoding utf8
        $failure = $null
        try { & (Join-Path $fixture 'scripts/build_evidence_matrix.ps1') 6>$null }
        catch { $failure = $_ }
        $expected = switch ($case) {
            'Duplicate' { 'Duplicate full-text audit' }
            'Unknown' { 'Full-text audit absent from manifest' }
            'Missing' { 'Missing audit field evidence_locator' }
        }
        if (-not $failure -or $failure.Exception.Message -notmatch $expected) {
            throw "$case audit case failed for the wrong reason: $failure"
        }
        $script:passed++; Write-Host "PASS: $case full-text audit rejected"
        [IO.File]::WriteAllText($auditPath, $auditOriginal, $utf8)
    }

    Write-Host "Validation regression tests passed: $passed."
}
finally {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
}
