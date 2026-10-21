# Review protocol

## Review identity

- **Working title:** *Structured Tactile Representations for Bimanual
  Contact-Rich Manipulation: Task Topologies, Physical Grounding, and Evidence*
- **Review type:** curated scoping review with a reproducible local evidence
  map.
- **Initial manuscript evidence freeze:** 2026-08-12.
- **Current manuscript evidence freeze:** 2026-10-21, after integrating the
  located full-text audits and their interpretation into the narrative.
- **Core full-text coding completed:** 2026-08-13.
- **Latest rapid-surveillance update:** 2026-10-21 UTC, screening new releases
  and revisions after 2026-10-14; see the dated screening record for boundaries.
- **Unit of analysis:** a scholarly work or, for one explicitly marked record,
  a community data index.
- **Current manuscript and living archive:** 136 records; 135 scholarly works
  and one resource index. This pass adds 15 located full-text archive audits,
  plus re-audits of ForeTac v2 and ILA v2 (no duplicate study records).
  The 30-paper precision subset is unchanged.
- **PDF-cache evidence:** 86 validated PDFs and five source-only entries are the
  recorded 2026-08-30 historical snapshot, not a fresh local-cache claim. The
  October 7 update verified three selected PDFs. The October 14 update used
  fourteen official HTML full texts and two official PDFs. The complete archive was not downloaded
  or revalidated. The October 21 pass uses official full texts, with selected
  PDFs documented separately; it does not refresh the historical cache. The current manifest has 131 PDF URLs and five source-only
  records; a URL does not establish local availability.


This protocol follows the reporting intent of PRISMA-ScR, but the present draft
does not claim PRISMA compliance: it was assembled by one reviewer from a
decision-oriented archive, does not reproduce searches across every indexed
database, and does not use dual independent screening.

## Review questions

1. What information must a tactile representation retain for bimanual,
   contact-rich manipulation?
2. How do current methods organize tactile evidence across taxels, fingers,
   links, hands, objects, tools, workpieces, and time?
3. Which structural priors are observed at deployment and which depend on
   simulator contacts, object state, future references, or other privileged
   variables?
4. How is representation quality evaluated beyond closed-loop task success?
5. Which conclusions are supported by matched-budget comparisons,
   out-of-distribution tests, causal interventions, and uncertainty analysis?
6. Which research gaps are specific to handover/load transfer and cooperative
   tool--workpiece manipulation?

## Eligibility criteria

### Include

- robot tactile representation learning, visuo-tactile control, contact-state
  estimation, or tactile-informed dynamics;
- bimanual dexterous manipulation, robot--robot/robot--human handover, or
  coordinated tool use;
- graph, object-centric, spatially anchored, contact-field, or physics-informed
  representations relevant to contact-rich manipulation;
- datasets and benchmarks that materially affect how these questions can be
  evaluated;
- peer-reviewed articles, officially listed accepted papers, and clearly
  labelled preprints.

### Exclude from study-level synthesis

- non-scholarly project or index pages without a corresponding study;
- purely haptic display, telepresence, medical palpation, or material
  classification work with no relevant representation or manipulation result;
- duplicate versions, retaining the most informative version while preserving
  publication-status notes.

## Evidence fields

The evidence map uses two explicitly different coding layers:

1. **Living archive map (136 records; 135 scholarly):** title, abstract, status and
   artifact metadata, selective full text, and rule-assisted coarse coding. This
   layer supports coverage and corpus accounting. The narrative synthesis and
   archive counts use the 136-record snapshot refrozen on 2026-10-21. The 45 records
   admitted across the October updates additionally have located full-text archive audits in
   `referenced/fulltext_audits.tsv`, which override coarse rules. These audits
   explicitly check inputs, structure, splits, metrics, and claim boundaries;
   they do not complete the separate precision schema or replicate results.
2. **Core precision subset (30 scholarly papers; 19 Level A and 11 Level B):**
   purposively selected direct competitors, benchmarks, structural methods,
   mechanics/tool-use references, and local-encoder candidates. Every paper was
   read in full and has a separate evidence card. Level A additionally audits
   available code/artifact evidence; Level B focuses on method and study evidence.

Archive-wide records are annotated along orthogonal axes:

- publication/evidence status;
- task/contact topology;
- tactile evidence type;
- representation level;
- structural prior;
- deployment observability;
- evaluation setting;
- study-level inclusion status.

The precision subset additionally records task topology and role structure,
simultaneous load path, train/deploy inputs, privileged information, label and
ground-truth provenance, representation unit and structure source, baselines,
split unit, seeds/statistics, four separate OOD categories (object, sensor,
embodiment, topology), intervention and uncertainty evidence, artifact status,
and a three-part evidence chain: author claim, located evidence, and reviewer
inference.

These fields are intentionally not collapsed into a single quality score. For
example, a formally published simulator benchmark can have strong task coverage
but weak deployment evidence; a recent preprint can have valuable real tactile
data but unresolved reproducibility.

## Synthesis method

The review uses narrative and tabular synthesis. It compares problem
formulations and evaluation protocols; it does not pool performance numbers
because sensor layouts, embodiments, task definitions, data budgets, and
success metrics are not commensurate. Quantitative counts describe the archived
corpus only and must not be interpreted as publication-rate estimates for the
whole field.

Descriptive counts from the precision subset are reported only with an explicit
denominator and coding rule. The completed audit found 0/30 studies satisfying
the strict held-out contact-topology OOD criterion under deployment-observable
inference. This historical 0/30 result is not an estimate for the expanded
archive. Strict topology OOD requires the contact participants or edge
structure itself to be held out; object, tool-geometry, contact-mode, or semantic
composition variation within the same participant structure is coded separately.

## Update procedure

1. Add or correct the record in `referenced/papers_manifest.tsv`.
2. Preserve the exact status and authoritative source URL.
3. Run `scripts/build_evidence_matrix.ps1`.
4. Manually audit new records, including version-specific full text, and update
   `referenced/fulltext_audits.tsv` with evidence locations and claim boundaries
   where applicable. Metadata-only leads remain outside the study corpus.
5. Decide whether the record belongs in the purposive core. If it does, complete
   the precision schema, add a located-evidence card, and rerun precision QA.
6. Re-run the static checker and rebuild the PDF.
7. Record the surveillance date separately from a manuscript corpus-freeze and/or
   precision-coding date. Do not silently replace one date with another.

## Known limitations

- single-reviewer screening and coding;
- no dual extraction or inter-rater agreement; the 30-paper precision subset is
  purposive rather than statistically representative;
- English-language and robotics/ML venue bias;
- a rapidly changing 2025--2026 preprint frontier;
- incomplete code/data availability verification for every work;
- the remaining 105 scholarly records are outside the precision schema;
  45 have located full-text archive audits across the October passes, while 60 retain
  the older lighter archive-wide coding;
- taxonomy fields are reviewer coding derived from titles, abstracts, papers,
  and project metadata, not author confirmation;
- no formal risk-of-bias instrument suitable across all represented study
  types.
