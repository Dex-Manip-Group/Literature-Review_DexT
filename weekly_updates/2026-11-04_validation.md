# 2026-11-04 Validation and PDF QA

## Scope and preservation

- Base: `literature/2026-10-28`, `fcedaeedc33ca23f9273e10987c3fc1e14ef2779`. Earlier branches, draft PRs and dated reports are preserved.
- Sixteen new records; no removed studies. Final archive: **171 records / 170 scholarly / one resource**. There are **82 located archive-audit rows**, including the existing FTP-1 precision-core overlap and a new audit of existing VT-MUSE. The purposive precision denominator is unchanged.
- The manifest has **166 PDF URLs and five source-only records**. These are retrieval routes, not a freshly validated local cache.
- Canonical matrix tiers: 49 peer-reviewed; 16 officially accepted/programme-listed; 105 preprint/author-claim; one community resource. Category counts: 15 core, 36 bimanual/handover, 54 tactile representation, 34 graph/physics/contact, 14 tool/workpiece, 18 dataset/benchmark.
- All 43 tracked precision-related files (annotation directory, reading list and three precision-processing scripts) match the base Git blobs byte-for-byte. Core remains 30 complete records, 19 A and 11 B, and 30 evidence cards.
- Surveillance date and integrated manuscript freeze: **2026-11-04 UTC**. Core precision date: **2026-08-13**. Revision discovery is not relabelled as a new first release; official acceptance is not final publication.

## Canonical local execution

Unlike the previous environment's equivalent Python checks, this pass runs the original PowerShell scripts directly.

1. PowerShell **7.6.9** was installed from the [official PowerShell release](https://github.com/PowerShell/PowerShell/releases/tag/v7.6.9). The Linux x64 tarball matches the release's `hashes.sha256`: `1da6d6d6035d651f20e70ddee7c4c15ac6ab8b9fb40ee92240d91263f28a884b`. Writable XDG cache/config/data paths were supplied in the restricted cloud environment.
2. `scripts/build_evidence_matrix.ps1`: **PASS**, 171 ordered records generated with located-audit overrides.
3. `scripts/validate_repo.ps1`: **PASS**, including matrix freshness, metadata, portable precision paths, citations and labels. Static result: **13 TeX files, 154 cited keys, 156 bibliography entries, 29 labels**.
4. `scripts/tests/test_validation.ps1`: **all 15 original regression cases PASS**. These cover serialization, changed values/case, missing/reordered rows, changed/extra headers, status provenance, located overrides, stale audits and duplicate/unknown/incomplete audits.
5. `scripts/build_pdf.ps1`: **PASS**, using installed XeLaTeX and BibTeX. The environment needed explicit installed TeX/font trees and a local format generated from installed `xelatex.ini`. No TeX package or font was installed; no substituted typesetting commands were used. A final layout-only page break keeps subsection 9.3 with its table. Existing conditional Latin Modern fallback was used.
6. Final source SHA-256 values are identical before and after compilation. The machine-readable source and PDF hashes are in `2026-11-04_build-qa.json`.
7. Final XeLaTeX log: **no warnings, overfull boxes, undefined citations/references or missing characters**. BibTeX clean. Fourteen underfull-spacing diagnostics are nonfatal and included in visual review.
8. Independent census, case-insensitive slug uniqueness, all new JSON parsing and `git diff --check`: **PASS**. Only the authored review PDF is changed among tracked PDFs. Third-party source PDFs, tool installations and render intermediates remain outside the deliverables.

## Final authored PDF

- Path: `output/pdf/Structured_Tactile_Representations_Bimanual_Review.pdf`
- **51 A4 pages**, **381,658 bytes**.
- SHA-256: `ac3affd6e245fb2e204b585fbb04aabcfe735f6efa7d630443cd5e62006b52c5`.
- All 20 fonts embedded; no encryption or JavaScript name tree/additional actions.
- Automated checks on all pages: no out-of-page text, replacement glyphs or near-blank pages.
- All 51 rendered pages were visually checked: the build reviewer covered pages 1–28 and a second reader covered pages 29–51. One orphan subsection heading was fixed with a page break. The build reviewer inspected the final changed pages 31–33 individually; all other 48 final page renders are pixel-identical to the inspected version. No clipping, overlap, missing glyphs, unresolved references or orphan headings remain.

## Boundaries

These checks validate repository consistency, reproducible generation and the authored PDF. They do not replicate paper experiments, independently certify every author-reported result, or refresh the historical paper cache. Exact-version source evidence and scientific limitations are recorded in the dated screening, source manifest and prior-version checks. Local validation does not assert a remote CI result; exact-commit GitHub Actions results must be checked after publication.
