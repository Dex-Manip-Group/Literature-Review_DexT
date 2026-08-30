# Review protocol

## Review identity

- **Working title:** *Structured Tactile Representations for Bimanual
  Contact-Rich Manipulation: Task Topologies, Physical Grounding, and Evidence*
- **Review type:** curated scoping review with a reproducible local evidence
  map.
- **Initial manuscript evidence freeze:** 2026-08-12.
- **Current manuscript evidence freeze:** 2026-08-30, after integrating both
  rapid-surveillance updates into the narrative synthesis.
- **Core full-text coding completed:** 2026-08-13.
- **Latest rapid-surveillance update:** 2026-08-30, covering announcements from
  2026-08-27 through 2026-08-30 (partial-week cutoff, Asia/Singapore).
- **Unit of analysis:** a scholarly work or, for one explicitly marked record,
  a community data index.
- **Current manuscript and living archive:** 91 records in
  `referenced/papers_manifest.tsv`;
  86 locally validated PDF files and five source-only records. Seventeen papers
  have been added by the two post-freeze surveillance updates (ten on 2026-08-26
  and seven on 2026-08-30); they have archive-wide coding but have not been added
  to the 30-paper precision subset.

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

1. **Living archive map (91 records; 90 scholarly):** title, abstract, status and
   artifact metadata, selective full text, and rule-assisted coarse coding. This
   layer supports coverage and corpus accounting. The narrative synthesis and
   archive counts now use the 91-record snapshot refrozen on 2026-08-30.
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
inference. Strict topology OOD requires the contact participants or edge
structure itself to be held out; object, tool-geometry, contact-mode, or semantic
composition variation within the same participant structure is coded separately.

## Update procedure

1. Add or correct the record in `referenced/papers_manifest.tsv`.
2. Preserve the exact status and authoritative source URL.
3. Run `scripts/build_evidence_matrix.ps1`.
4. Manually audit annotations for new records and update rule overrides where
   necessary.
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
- the remaining 60 scholarly records in the living archive have lighter
  archive-wide coding rather than the full precision schema;
- taxonomy fields are reviewer coding derived from titles, abstracts, papers,
  and project metadata, not author confirmation;
- no formal risk-of-bias instrument suitable across all represented study
  types.
