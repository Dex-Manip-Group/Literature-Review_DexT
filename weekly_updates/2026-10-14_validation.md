# 14 October 2026 validation

Base: unmerged literature PR #2, e73c2e76b521635e04fc5d32239188842338cf75.
The main branch at review start was 6804f9c99d0af044babda4755c0c48d47c3ae9a5
(PR #1 merged). This update is stacked on PR #2 without changing it.

## Passed locally

- Repository metadata, matrix freshness, citation/label and precision validation:
  121 manifest records, 120 scholarly plus one resource, 30 precision records.
- All 15 validation regression tests.
- New-source audit and final synthesis/diff audit; author claims, conditional
  metrics, training/deployment inputs and evidence boundaries retained.
- All 16 new bibliography entries cited; no duplicate keys or slugs.
- Precision directory unchanged, including cards, CSV and workbook.
- XeLaTeX, BibTeX, then two XeLaTeX passes: 36-page English review PDF.
- All pages visually inspected; table placement repaired to remove a near-blank
  page. Figure 1's resource-only branch now correctly originates from screening.
- 13 fonts embedded; no overfull boxes, unresolved references/citations,
  missing-character warnings or out-of-page text. Eleven non-blocking underfull
  spacing warnings remain (body/reference text).
- `git diff --check` passed.

PDF SHA-256: `b179bba14136a48214ff4b90040ceaab833a1f0af0a547d12b4f928d663781af`.

## Evidence and execution limits

Fourteen new studies were audited in official HTML; ForeTac and MorphoPlanner
used official PDFs. These are archive-level full-text audits, not new precision
annotations or experiment replications. Selected PDF checks are recorded
separately. No full historical paper-cache revalidation, gated-data access,
third-party PDF publication, merge, license change or permission change occurred.
The older Chinese guide PDF remains historical; Markdown guides are updated.

Linux checks above are local results. Exact-commit remote CI is reported in the
PR after publication; this file does not pre-claim Windows or remote CI success.
