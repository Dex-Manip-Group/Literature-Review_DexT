param([string]$Root = (Join-Path $PSScriptRoot '..'))

$ErrorActionPreference = 'Stop'
$texFiles = Get-ChildItem -LiteralPath $Root -Recurse -Filter '*.tex'
$tex = ($texFiles | Get-Content -Raw) -join "`n"
$bib = Get-Content -LiteralPath (Join-Path $Root 'references.bib') -Raw

$citeKeys = [regex]::Matches($tex, '\\cite[tp]?(?:\[[^\]]*\])?(?:\[[^\]]*\])?\{([^}]+)\}') |
    ForEach-Object { $_.Groups[1].Value -split ',' } |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ } |
    Sort-Object -Unique
$bibKeys = [regex]::Matches($bib, '@\w+\{([^,]+),') |
    ForEach-Object { $_.Groups[1].Value.Trim() } |
    Sort-Object -Unique

$missing = $citeKeys | Where-Object { $_ -notin $bibKeys }
if ($missing) { throw "Missing BibTeX keys: $($missing -join ', ')" }

$labels = [regex]::Matches($tex, '\\label\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value }
$duplicateLabels = $labels | Group-Object | Where-Object Count -gt 1
if ($duplicateLabels) { throw "Duplicate labels: $(($duplicateLabels.Name) -join ', ')" }

$refs = [regex]::Matches($tex, '\\(?:cref|Cref|ref)\{([^}]+)\}') |
    ForEach-Object { $_.Groups[1].Value -split ',' } |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ } |
    Sort-Object -Unique
$missingLabels = $refs | Where-Object { $_ -notin $labels }
if ($missingLabels) { throw "Missing labels: $($missingLabels -join ', ')" }

$prohibited = @(
    'first bimanual tactile graph',
    'more than 30\\%',
    'independent ground-truth wrench sensor'
)
foreach ($pattern in $prohibited) {
    if ($tex -match $pattern) { throw "Prohibited or unsupported claim found: $pattern" }
}

$precisionPath = Join-Path $Root 'precision_annotations\precision_annotations.csv'
$cardsPath = Join-Path $Root 'precision_annotations\cards'
if (-not (Test-Path -LiteralPath $precisionPath)) {
    throw "Missing precision-annotation table: $precisionPath"
}
$precision = Import-Csv -LiteralPath $precisionPath
if ($precision.Count -ne 30) {
    throw "Expected 30 precision-coded papers, found $($precision.Count)."
}
$incomplete = $precision | Where-Object { $_.coding_status -ne 'complete' }
if ($incomplete) {
    throw "Incomplete precision records: $(($incomplete.slug) -join ', ')"
}
$levelA = @($precision | Where-Object { $_.level -eq 'A' }).Count
$levelB = @($precision | Where-Object { $_.level -eq 'B' }).Count
if ($levelA -ne 19 -or $levelB -ne 11) {
    throw "Unexpected precision levels: A=$levelA, B=$levelB."
}
$cardCount = @(Get-ChildItem -LiteralPath $cardsPath -Filter '*.md' -File).Count
if ($cardCount -ne 30) {
    throw "Expected 30 precision evidence cards, found $cardCount."
}

Write-Host "Static check passed: $($texFiles.Count) TeX files, $($citeKeys.Count) cited keys, $($bibKeys.Count) bibliography entries, $($labels.Count) labels."
Write-Host "Precision evidence passed: 30 complete records (19 Level A, 11 Level B) and 30 evidence cards."
