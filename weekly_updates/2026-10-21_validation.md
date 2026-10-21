# 2026-10-21 Validation and PDF QA

## Scope and preservation

- Base: `literature/2026-10-14`, commit `f92b00beaa077b9d8ce458bcf6b27a95f03ff267`, still unmerged draft PR #3. Main remains `6804f9c99d0af044babda4755c0c48d47c3ae9a5`.
- 15 new manifest/matrix/audit rows; only existing ForeTac and ILA rows changed. No records removed. 136 archive records, 135 scholarly, 45 located archive audits; 131 PDF URLs and five source-only routes.
- Status tiers: 49 peer-reviewed, eight accepted/programme-listed, 78 preprint/author-claim, one resource.
- All 15 new bibliography keys are cited. Static check: 13 TeX files, 119 cited keys, 121 bibliography entries, 29 labels.
- Precision directory and precision reading list byte-for-byte unchanged from base: 30 complete records, 19 Level A, 11 Level B, 30 evidence cards. Previous dated reports are unchanged.
- Search date and integrated manuscript freeze: 2026-10-21. Precision date: 2026-08-13.

## Local checks

Commands executed on the assistant cloud computer using official portable PowerShell 7.6.6 and a reusable TeX Live/XeLaTeX overlay with official CTAN dependencies:

1. `pwsh scripts/update_review.ps1 -SkipDownload`: PASS, matrix regenerated and metadata/precision checks passed.
2. `pwsh scripts/validate_repo.ps1`: PASS on final source state.
3. `pwsh scripts/tests/test_validation.ps1`: PASS, all 15 regression tests. An initial run while the matrix/citations were still being integrated correctly rejected stale/incomplete state; final reruns passed.
4. `pwsh scripts/build_pdf.ps1`: PASS, XeLaTeX/BibTeX pipeline. One additional XeLaTeX pass stabilized cross-reference labels after pagination changes.
5. Final TeX log: no warnings, undefined citations/references, overfull boxes, or missing characters. BibTeX clean. Underfull-box diagnostics are nonfatal and were visually checked.
6. `git diff --check`: PASS.

No new research software was executed and no complete third-party PDF cache was fetched. Software restoration used the user's existing official PowerShell/LaTeX authorization.

## Final PDF

- Path: `output/pdf/Structured_Tactile_Representations_Bimanual_Review.pdf`
- 39 A4 pages, 286,724 bytes.
- SHA-256: `a3543ccae4a95e525d9f6b97097c1a54dd6314eac626a0858329cb994d5db69f`
- All fonts embedded; no encryption or JavaScript.
- Every page rendered and visually inspected using page images/contact sheets; selected dense/reference pages inspected individually. No clipping, overlapping text, blank pages, unresolved references, missing glyphs or actionable layout issues. Page-boundary/text checks also passed.
- Only the authored review PDF is committed. Third-party exact-version PDFs remain local; their selected checksums are recorded separately.

## Remote verification

The draft PR is stacked on PR #3, not merged. The submitted tree and remote commit are checked against this local state. GitHub Actions results belong to the exact submitted commit and are followed to a terminal result; consult the PR checks for the authoritative remote status. This file records local validation rather than pre-claiming CI success.
