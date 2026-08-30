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

The paper archive now lives inside this repository. The 86 local PDFs total
about 1.05 GiB and are intentionally ignored by Git; collaborators reconstruct
them from the manifest and public URLs instead of pushing copyrighted binaries.

## Quick start

Metadata-only validation, suitable immediately after cloning:

    pwsh ./scripts/validate_repo.ps1

Download all openly available papers and verify their hashes:

    python ./referenced/download_papers.py
    pwsh ./scripts/validate_repo.ps1 -RequireLocalPdfs

Regenerate the archive-wide matrix and run validation in one command:

    pwsh ./scripts/update_review.ps1 -SkipDownload

GitHub Actions runs the metadata validation on every push and pull request.
No repository license has been selected yet; choose one before making the
repository public.

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
powershell -ExecutionPolicy Bypass -File scripts/build_pdf.ps1
```

The script regenerates the evidence matrix, performs static checks, compiles in
`tmp/pdfs/review-build`, and copies the named final PDF to `output/pdf`.

The manuscript is a **curated scoping review**, not a PRISMA-complete systematic
review or a quantitative meta-analysis. The initial evidence freeze was
2026-08-12 (74 records), and core full-text coding was completed on 2026-08-13.
Both rapid-surveillance rounds were integrated into the main review on
2026-08-30, refreezing the narrative corpus at 91 records; see Appendix A and
`weekly_updates/`. The 30-paper precision denominator remains unchanged. Papers
promoted into that purposive core still require the precision schema, a located
evidence card, and precision QA.
