# 2026-10-28 Validation and PDF QA

## Scope and preservation

- Base: `literature/2026-10-21`, `efc26142e84ebcc331c529015c4b06a1a232918f`, still unmerged draft PR #4. Main remains `6804f9c99d0af044babda4755c0c48d47c3ae9a5`; PR #2/#3/#4 and their branches are preserved.
- 19 new studies; no removed records. Current archive: 155 records / 154 scholarly / one resource. The 65 archive-audit rows include 64 October admissions and one updated FTP-1 archive audit overlapping the unchanged precision core. Handover/Blind-Baoding audit rows are refreshed, not duplicated.
- 150 PDF URLs and five source-only routes, not a refreshed 150-PDF cache. Status tiers: 49 peer-reviewed, 16 official accepted/programme-listed, 89 preprint/author-claim, one resource.
- All 19 new bibliography keys are cited. Static checks: 13 TeX files, 138 cited keys, 140 bibliography entries, 29 labels.
- All 40 tracked precision-related files, including the 30 evidence cards, CSV/XLSX and reading list, match base Git blobs byte-for-byte. Precision remains 30 records: 19 A, 11 B. License, workflow and all previous dated reports remain unchanged.
- Search date: 2026-10-28 UTC; integrated manuscript evidence freeze: 2026-10-28; precision coding date: 2026-08-13.

## Scientific and metadata QA

Official version histories and exact-version public full texts support admissions and revisions. A second reader independently checked the four physics/control audits and then the integrated text, including FLoRe's external force gauge and condition counts, CW-WAM's fixed-checkpoint bootstrap, OpenTac's source conflicts, PhysLadder's **model-call** budget, and the two late-21-October boundary timestamps. This is selected independent claim QA, not a claim of dual screening across the whole review. The source manifest stores URLs, versions, dates and full-text byte hashes. Experiments/code were not replicated.

## Local checks — distinguish equivalent checks from canonical execution

This clean assistant-cloud environment has no PowerShell runtime. No missing runtime, TeX package, font or other software was installed. The original PowerShell scripts are instead exercised by the existing GitHub Actions workflow on the submitted commit; local checks below are explicitly **not** original PowerShell execution.

1. An independent Python equivalent of the generator, validator and 15 regression cases reproduced the base 136-row evidence matrix byte-for-byte before use. It regenerated the 155-row final matrix and compared ordered columns and every cell with the rules and archive-audit overrides: PASS.
2. Equivalent metadata/static/precision validation: PASS. All 15 analogous regression cases: PASS (LF, CRLF, BOM, changed value/case, missing/reordered row, header case/extra column, author-claim tier, located audit override, stale/duplicate/unknown/missing audit).
3. The generator's fixed suffix now says `Archive-level audit; precision coding remains separate.` instead of falsely asserting that every archive-audited record is outside the core. This is required for FTP-1's overlap; no precision coding changed.
4. Native installed XeLaTeX/BibTeX build: PASS. Existing TeX search paths and a local format generated from the installed `xelatex.ini` were used; no downloads/installation. Compile: XeLaTeX, BibTeX, then repeated XeLaTeX until stable. Source hashes before/after compilation are identical.
5. Minimal portable-font change: retain TeX Gyre when installed; otherwise use installed Latin Modern families. Removed the unused `siunitx` import. No dummy packages or substituted typesetting commands. Pagination differs from the prior 39-page TeX-Gyre PDF because of both added evidence and font fallback.
6. Final TeX log: no warnings, undefined references/citations, overfull boxes or missing characters. BibTeX clean. Fourteen underfull-spacing diagnostics were visually inspected and are nonfatal.
7. `git diff --check`: PASS. All new JSON parses; unique study IDs, exact version links, source-date boundaries and counts agree. Final machine-readable QA/source hashes are in `2026-10-28_build-qa.json`.

## Final authored PDF

- Path: `output/pdf/Structured_Tactile_Representations_Bimanual_Review.pdf`
- 46 A4 pages, 357,592 bytes.
- SHA-256: `73b24171626d46b92bf2f7623f9bdb0970f61715feccb223adfc4445606a7a66`
- All 20 fonts embedded; no encryption or JavaScript.
- All 46 pages rendered and visually checked. Following two final wording edits, changed pages 8 and 29 were inspected individually; the other 44 final rendered pages are pixel-identical to the inspected version. No clipping, overlap, missing glyphs, blank pages or unresolved references found.
- Automated per-page bounding-box/glyph/near-blank checks: PASS. The PDF text confirms `150 model calls`, not tool invocations.
- Only this authored review PDF is committed. Third-party exact-version PDFs and page renders stay local; their selected hashes and QA scope are documented separately.

## Remote verification scope

The new draft is stacked on PR #4, not merged. Publication uses the verified `tomtomLab` account. The remote tree/commit and PDF are checked against this local state. The existing Actions workflow runs original `scripts/validate_repo.ps1` and `scripts/tests/test_validation.ps1` on Windows and Ubuntu for the exact pushed commit and the PR test merge. Both are followed to terminal results. This file records completed local checks, not advance claims about CI; the PR check results and final PR description carry the authoritative remote outcome. CI does not compile the PDF; that compilation and page QA are local.
