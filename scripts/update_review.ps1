param(
    [switch]$SkipDownload,
    [switch]$BuildPdf,
    [string]$Python = 'python'
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

if (-not $SkipDownload) {
    & $Python (Join-Path $root 'referenced/download_papers.py')
    if ($LASTEXITCODE -ne 0) {
        throw 'Paper download or integrity check failed.'
    }
}

& (Join-Path $PSScriptRoot 'build_evidence_matrix.ps1')
if (-not $?) {
    throw 'Evidence-matrix generation failed.'
}

if ($SkipDownload) {
    & (Join-Path $PSScriptRoot 'validate_repo.ps1')
}
else {
    & (Join-Path $PSScriptRoot 'validate_repo.ps1') -RequireLocalPdfs
}

if ($BuildPdf) {
    & (Join-Path $PSScriptRoot 'build_pdf.ps1')
}

Write-Host 'Review update completed.'
