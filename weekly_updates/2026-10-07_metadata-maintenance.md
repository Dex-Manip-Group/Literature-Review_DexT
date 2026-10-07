# Metadata and reproducibility maintenance, 2026-10-07

This is a maintenance audit of existing records, not a new literature screening
round. The manuscript evidence freeze remains **2026-08-30**, the corpus remains
**91 records**, and the purposive precision subset remains **30 papers** (19
Level A, 11 Level B). No papers were added or promoted into the precision core.

## Publication metadata corrections

Four manifest rows were still labeled `preprint`, although the matrix generator
overrode them to `peer_reviewed`. Their formal publications all predate the
manuscript freeze. The manifest now records the verified venues and DOI landing
pages, and the generator no longer needs these hidden publication overrides.
The existing open arXiv PDF links are retained.

- **ContactHandover:** corrected the title to *ContactHandover: Contact-Guided
  Robot-to-Human Object Handover* and status to IROS 2024. The existing BibTeX
  title was already correct. Sources: [author-submitted arXiv
  record](https://arxiv.org/abs/2404.01402), [author laboratory publication
  list](https://cair.cs.columbia.edu/research.html), and [publisher-deposited DOI
  metadata](https://api.crossref.org/works/10.1109/IROS58592.2024.10801777).
  The same title, status and source corrections are synchronized to the existing
  precision CSV, evidence card, and XLSX view; all precision coding and the
  original verification date are preserved.
- **Distributed-Tactile-GCN:** corrected status to IEEE RA-L 2022 and added DOI
  `10.1109/LRA.2022.3142417`. Corrected the BibTeX author list to Satoshi
  Funabashi, Tomoki Isobe, Fei Hongyi, Atsumu Hiramoto, Alexander Schmitz, Shigeki
  Sugano, and Tetsuya Ogata. The author-provided BibTeX and publisher metadata
  explicitly record `Hongyi, Fei`. Sources: [author project and
  BibTeX](https://sites.google.com/site/bashifunabashi/mhand-project/in-hand-manipulation),
  [Waseda publication
  record](https://waseda.elsevierpure.com/en/publications/multi-fingered-in-hand-manipulation-with-various-object-propertie/),
  and [publisher-deposited DOI
  metadata](https://api.crossref.org/works/10.1109/LRA.2022.3142417).
- **Multiple-Tactile-Events:** corrected the title to *Identifying Multiple
  Interaction Events from Tactile Data during Robot-Human Object Transfer* and
  status to IEEE RO-MAN 2019. Sources: [author-submitted arXiv
  record](https://arxiv.org/abs/1909.06736) and [publisher-deposited DOI
  metadata](https://api.crossref.org/works/10.1109/RO-MAN46459.2019.8956306).
  The generator recognizes “Object Transfer” as handover/load transfer, so the
  title correction does not inadvertently change the existing task coding.
- **Tactile-Dexterity-Primitives:** corrected status to ICRA 2020 and added DOI
  `10.1109/ICRA40945.2020.9196976` consistently to the manifest and BibTeX.
  Sources: [MIT publication
  record](https://dspace.mit.edu/entities/publication/7d355702-acd2-4d0b-9307-8b10625e546f)
  and [publisher-deposited DOI
  metadata](https://api.crossref.org/works/10.1109/ICRA40945.2020.9196976).

Evidence-tier totals and all other rule-assisted coding remain unchanged:
49 peer-reviewed, 9 accepted/program-listed, 32 preprint/author-claim, and one
community resource.

## Reconstructible taxonomy PDF

The manifest omitted a direct URL for *A Bimanual Manipulation Taxonomy*, even
though the historical local-cache report contained the PDF. The [authors' KIT
PDF](https://h2t.iar.kit.edu/pdf/Krebs2022.pdf) was retrieved and checked against
the existing archive record: **627,358 bytes**, valid `%PDF-` header, and SHA-256
`454b719ddab8a619e983a3b9bfab43657fa6e60aff61e39b8f35244ac7a4bb9e`.
The [KIT publication record](https://publikationen.bibliothek.kit.edu/1000150129)
confirms DOI `10.1109/LRA.2022.3196158`.

The URL is now present and the obsolete `link_only` tag is removed. The manifest
therefore contains **86 downloadable URLs and five source-only records**.
Historical `download_results.json` and checksum records retain their original
snapshot meaning; this audit is not a new download of the entire archive. No
third-party PDFs are committed.

## Validation and build maintenance

- CSV freshness compares ordered column names and case-sensitive cell values.
  Equivalent LF/CRLF line endings and UTF-8 BOMs no longer cause false staleness.
  Changed values, schema, row count, or row order still fail validation.
- Dependency-free regression tests exercise these cases; CI runs metadata and
  regression checks on both Windows and Linux.
- PDF build discovery tolerates absent Windows environment variables, uses
  portable paths for BibTeX, and limits `--enable-installer` to MiKTeX.
- README licensing guidance now points to the existing MIT license, while
  distinguishing third-party paper rights. The license itself is unchanged.

Validation commands:

```powershell
pwsh ./scripts/update_review.ps1 -SkipDownload
pwsh ./scripts/tests/test_validation.ps1
pwsh ./scripts/build_pdf.ps1
```

These commands passed on Linux with PowerShell 7.6.6 and TeX Live. The nine
freshness regression cases passed. The rebuilt manuscript remains 29 pages;
pages 1--24 have unchanged text after whitespace normalization, with corrected
bibliography metadata and consequent reflow on pages 25--28. All pages were
rendered for visual review. There are no overfull boxes or unresolved citations
or references; 12 underfull-box spacing notices remain in the bibliography.

The maintenance audit does not claim a fresh full-archive download or local
`-RequireLocalPdfs` pass. Those require reconstructing all downloadable papers.
