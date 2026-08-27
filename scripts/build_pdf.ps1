param(
    [string]$XeLaTeXPath = 'C:\Program Files\MiKTeX\miktex\bin\x64\xelatex.exe',
    [string]$BibTeXPath = 'C:\Program Files\MiKTeX\miktex\bin\x64\bibtex.exe'
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$build = Join-Path $root 'tmp\pdfs\review-build'
$output = Join-Path $root 'output\pdf'
$final = Join-Path $output 'Structured_Tactile_Representations_Bimanual_Review.pdf'

if (-not (Test-Path -LiteralPath $XeLaTeXPath)) { throw "XeLaTeX not found: $XeLaTeXPath" }
if (-not (Test-Path -LiteralPath $BibTeXPath)) { throw "BibTeX not found: $BibTeXPath" }

New-Item -ItemType Directory -Force $build, $output | Out-Null

# Start from a clean auxiliary state. Stale .aux/.out files can become unreadable
# after title or PDF-metadata changes even when the TeX sources are valid.
foreach ($name in @('main.aux','main.bbl','main.blg','main.log','main.out','main.toc','main.pdf')) {
    $artifact = Join-Path $build $name
    if (Test-Path -LiteralPath $artifact) { Remove-Item -LiteralPath $artifact -Force }
}

# Older manual builds may have left source-side artifacts beside main.tex.
# XeLaTeX searches the working directory before --output-directory, so a stale
# root main.bbl can shadow the fresh BibTeX result in the isolated build folder.
foreach ($name in @('main.aux','main.bbl','main.blg','main.log','main.out','main.toc','main.pdf','main.synctex.gz')) {
    $artifact = Join-Path $root $name
    if (Test-Path -LiteralPath $artifact) { Remove-Item -LiteralPath $artifact -Force }
}

& powershell -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'build_evidence_matrix.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Evidence-matrix generation failed.' }

& powershell -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'static_check.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Static validation failed.' }

Push-Location $root
try {
    & $XeLaTeXPath --enable-installer --interaction=batchmode --halt-on-error --output-directory=$build main.tex
    if ($LASTEXITCODE -ne 0) { throw 'XeLaTeX pass 1 failed.' }

    & $BibTeXPath 'tmp\pdfs\review-build\main'
    if ($LASTEXITCODE -ne 0) { throw 'BibTeX failed.' }

    foreach ($pass in 2, 3) {
        & $XeLaTeXPath --enable-installer --interaction=batchmode --halt-on-error --output-directory=$build main.tex
        if ($LASTEXITCODE -ne 0) { throw "XeLaTeX pass $pass failed." }
    }
}
finally {
    Pop-Location
}

$log = Get-Content -LiteralPath (Join-Path $build 'main.log') -Raw
if ($log -match 'Overfull \\hbox') { throw 'Build completed with an overfull box; inspect main.log.' }
if ($log -match 'undefined citations|undefined references') { throw 'Build has unresolved citations or references.' }

Copy-Item -LiteralPath (Join-Path $build 'main.pdf') -Destination $final -Force
Write-Host "Final PDF: $final"
