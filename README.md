# Structured Tactile Representations for Bimanual Contact-Rich Manipulation

This directory contains a standalone English scoping-review manuscript and its
reproducibility artifacts. It is deliberately independent of the BiCG-Rep
master's proposal: the review maps the field first and treats explicit contact
graphs as one testable representation hypothesis among several.

中文读者可先看 [阅读导览](阅读导览.md)，协作者请同时阅读
[CONTRIBUTING](CONTRIBUTING.md)。

## Repository layout

    .
    ├── main.tex, sections/, references.bib
    ├── review_protocol.md
    ├── evidence_matrix.csv
    ├── precision_annotations/
    ├── referenced/
    │   ├── papers_manifest.tsv
    │   ├── download_papers.py
    │   └── thematic PDF cache folders
    ├── weekly_updates/
    ├── scripts/
    └── .github/

The paper archive is reconstructed locally. The recorded 2026-08-30 snapshot
contains 86 PDFs totaling about 1.05 GiB. PDFs are intentionally ignored by Git;
collaborators reconstruct them from the manifest and public URLs instead of
pushing copyrighted binaries. This October pass verifies only three selected
new PDFs; it does not refresh the 86-file historical cache. The current manifest
has 100 PDF URLs and five source-only records, not 100 freshly validated PDFs.

## Quick start

Metadata-only validation, suitable immediately after cloning:

    pwsh ./scripts/validate_repo.ps1

Download all openly available papers and verify their hashes:

    python ./referenced/download_papers.py
    pwsh ./scripts/validate_repo.ps1 -RequireLocalPdfs

Regenerate the archive-wide matrix and run validation in one command:

    pwsh ./scripts/update_review.ps1 -SkipDownload

GitHub Actions runs metadata validation and script regression tests on Windows
and Linux for every push and pull request. Repository code and original review
materials are available under the [MIT License](LICENSE). Third-party papers
remain subject to their own licenses and are not included in Git.

## Deliverables

- `main.tex` and `sections/`: review manuscript source.
- `references.bib`: bibliography with publication status kept explicit.
- `review_protocol.md`: scope, review questions, eligibility criteria, and
  screening limitations.
- `weekly_updates/`: dated rapid-surveillance addenda for papers announced
  after the initial manuscript evidence freeze.
- `sections/11_update_log.tex`: manuscript appendix recording corpus updates,
  evidence-layer changes, and their effect on the synthesis.
- `referenced/`: manifest, reproducible downloader, checksum report, and the
  ignored local PDF cache.
- `referenced/fulltext_audits.tsv`: version-specific archive-level full-text
  overrides with evidence locations; separate from precision coding.
- `evidence_matrix.csv`: one row per archived record, generated from the
  repository manifest with transparent rule-assisted archive-wide annotations.
- `precision_annotations/precision_annotations.csv` and `.xlsx`: full-text
  precision coding for the purposive 30-paper core (19 Level A, 11 Level B).
- `precision_annotations/cards/`: one located-evidence card per core paper;
  `precision_annotations/精标综合结论.md` translates the audit into research
  decisions without treating reviewer inference as an author claim.
- `scripts/build_evidence_matrix.ps1`: regenerates the evidence matrix.
- `scripts/static_check.ps1`: checks citations, labels, and prohibited claims.
- `scripts/validate_repo.ps1`: checks portable paths, manifest uniqueness,
  evidence-matrix freshness, precision records, and optional local PDFs.
- `output/pdf/Structured_Tactile_Representations_Bimanual_Review.pdf`: compiled
  review manuscript.

## Build

From this directory, the reproducible build is:

```powershell
pwsh ./scripts/build_pdf.ps1
```

Use PowerShell 7 and a TeX distribution with XeLaTeX and BibTeX (MiKTeX or
TeX Live), including the TeX Gyre fonts and packages used by `main.tex`, with
both tools on `PATH`. Explicit paths can also be supplied with `-XeLaTeXPath`
and `-BibTeXPath`. The script regenerates the evidence matrix, performs static checks, compiles in
`tmp/pdfs/review-build`, and copies the named final PDF to `output/pdf`.

Run the dependency-free script regression tests with:

    pwsh ./scripts/tests/test_validation.ps1

The manuscript is a **curated scoping review**, not a PRISMA-complete systematic
review or a quantitative meta-analysis. The initial evidence freeze was
2026-08-12 (74 records), and core full-text coding was completed on 2026-08-13.
The August rounds refroze the corpus at 91 records. The 2026-10-07 catch-up
adds 14 located full-text archive audits (13 new releases and one older-work
revision discovery), integrates their conclusions, and refreezes it at 105
records (104 scholarly, one resource). See Appendix A and
[the screening record](weekly_updates/2026-10-07_literature-update.md). The 30-paper precision denominator remains unchanged. Papers
promoted into that purposive core still require the precision schema, a located
evidence card, and precision QA.

The English review PDF is rebuilt for this update. The Chinese reading-guide
Markdown is current; its older PDF export remains a historical snapshot.
