import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { SpreadsheetFile, Workbook } from "@oai/artifact-tool";

const project = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const csvPath = path.join(project, "precision_annotations", "precision_annotations.csv");
const outputFlag = process.argv.indexOf("--output");
const outputPath = outputFlag >= 0
  ? path.resolve(process.argv[outputFlag + 1])
  : path.join(project, "precision_annotations", "precision_annotations.xlsx");
const previewFlag = process.argv.indexOf("--preview-dir");
const outputDir = previewFlag >= 0
  ? path.resolve(process.argv[previewFlag + 1])
  : path.join(project, "tmp", "workbook_preview");
await fs.mkdir(outputDir, { recursive: true });

function parseCsv(text) {
  const rows = [];
  let row = [], field = "", quoted = false;
  for (let i = 0; i < text.length; i++) {
    const c = text[i];
    if (quoted) {
      if (c === '"' && text[i + 1] === '"') { field += '"'; i++; }
      else if (c === '"') quoted = false;
      else field += c;
    } else if (c === '"') quoted = true;
    else if (c === ',') { row.push(field); field = ""; }
    else if (c === '\n') { row.push(field.replace(/\r$/, "")); rows.push(row); row = []; field = ""; }
    else field += c;
  }
  if (field.length || row.length) { row.push(field); rows.push(row); }
  return rows.filter(r => r.some(x => x !== ""));
}

function colName(n) {
  let s = "";
  while (n > 0) { const r = (n - 1) % 26; s = String.fromCharCode(65 + r) + s; n = Math.floor((n - 1) / 26); }
  return s;
}

const matrix = parseCsv((await fs.readFile(csvPath, "utf8")).replace(/^\uFEFF/, ""));
const headers = matrix[0];
const records = matrix.slice(1).map(row => Object.fromEntries(headers.map((h, i) => [h, row[i] ?? ""])));

const wb = Workbook.create();
const navy = "#16324F", teal = "#0F6B6D", pale = "#EAF4F4", gold = "#D39B2A", red = "#A63A3A", gray = "#5B6573";

const readme = wb.worksheets.add("README");
readme.getRange("A1:F1").merge();
readme.getRange("A1").values = [["Bimanual Tactile Precision Annotation — 30 Core Papers"]];
readme.getRange("A1:F1").format = { fill: navy, font: { bold: true, color: "#FFFFFF", size: 16 }, rowHeight: 30 };
readme.getRange("A3:B12").values = [
  ["Verified", "2026-08-13"],
  ["Unit", "one paper per row"],
  ["Missing value", "NR = not reported; it does not mean no"],
  ["Evidence rule", "author claim → located evidence → reviewer inference"],
  ["Observability", "separate training privilege, inference privilege, future reference and simulator contact"],
  ["Generalization", "object / sensor / embodiment / topology are coded separately"],
  ["Main output", "Master sheet + Decision Matrix + Evidence Chain + Artifacts"],
  ["Cards", "See precision_annotations/cards for page-located paper notes"],
  ["Scope", "30 papers manually coded from full text; artifact status checked where available"],
  ["Caution", "Code audit findings apply only to inspected public snapshots"]
];
readme.getRange("A3:A12").format = { fill: pale, font: { bold: true, color: navy } };
readme.getRange("A3:B12").format.wrapText = true;
readme.getRange("A3:A12").format.columnWidth = 20;
readme.getRange("B3:B12").format.columnWidth = 74;
readme.freezePanes.freezeRows(1);

const summary = wb.worksheets.add("Summary");
summary.getRange("A1:H1").merge();
summary.getRange("A1").values = [["Evidence-map Summary and BiCG-Rep Decision"]];
summary.getRange("A1:H1").format = { fill: navy, font: { bold: true, color: "#FFFFFF", size: 15 }, rowHeight: 28 };
summary.getRange("A3:B10").values = [
  ["Metric", "Count"],
  ["Precision-coded papers", records.length],
  ["Level A", records.filter(r => r.level === "A").length],
  ["Level B", records.filter(r => r.level === "B").length],
  ["Tactile central = yes", records.filter(r => r.tactile_central === "yes").length],
  ["Real-robot evidence", records.filter(r => r.real_robot === "yes").length],
  ["Explicit graph/field/anchor", records.filter(r => /graph|field|anchor/i.test(r.representation_family)).length],
  ["Strict held-out topology OOD", 0]
];
summary.getRange("A3:B3").format = { fill: teal, font: { bold: true, color: "#FFFFFF" } };
summary.getRange("A3:B10").format.columnWidth = 29;
summary.getRange("D3:H3").merge();
summary.getRange("D3").values = [["Primary conclusion"]];
summary.getRange("D3:H3").format = { fill: teal, font: { bold: true, color: "#FFFFFF" } };
summary.getRange("D4:H8").merge();
summary.getRange("D4").values = [["The defensible BiCG-Rep contribution is not graph use alone. It is observation-grounded inference of dynamic cross-hand/tool interface edges, trained with falsifiable load/contact objectives and evaluated under matched sensing, parameter budgets and topology transfer."]];
summary.getRange("D4:H8").format = { fill: pale, font: { color: navy, size: 12 }, wrapText: true, verticalAlignment: "center" };
summary.getRange("D10:H10").values = [["Go", "Pivot", "Stop", "Tool phase", "First reproduction"]];
summary.getRange("D10:H10").format = { fill: navy, font: { bold: true, color: "#FFFFFF" } };
summary.getRange("D11:H11").values = [[
  "~+5 pp transition macro-F1 or ~-15% load-share MAE; inferred graph keeps ~70% oracle gain",
  "Oracle works but inferred graph does not → privileged-to-observation graph distillation",
  "Oracle graph gives no stable matched-budget gain → benchmark/contact-inference paper",
  "M7–M9 after handover gate; rigid puck/stylus before sponge/brush–dish",
  "VTDexManip handover → PhysGraph stock/corrected → T-Rex offline probes"
]];
summary.getRange("D11:H11").format = { wrapText: true, verticalAlignment: "top", rowHeight: 70 };
for (const c of ["D", "E", "F", "G", "H"]) summary.getRange(`${c}10:${c}11`).format.columnWidth = 24;

const master = wb.worksheets.add("Master");
const endCol = colName(headers.length);
master.getRange(`A1:${endCol}${matrix.length}`).values = matrix;
master.getRange(`A1:${endCol}1`).format = { fill: navy, font: { bold: true, color: "#FFFFFF" }, wrapText: true, rowHeight: 34 };
master.freezePanes.freezeRows(1); master.freezePanes.freezeColumns(6);
master.getRange(`A1:${endCol}${matrix.length}`).format.verticalAlignment = "top";
master.getRange(`A2:${endCol}${matrix.length}`).format.wrapText = true;
for (let i = 1; i <= headers.length; i++) {
  const h = headers[i - 1]; const c = colName(i);
  let width = 16;
  if (["title", "author_claim", "observed_evidence", "main_limitation", "reviewer_inference", "decision_rationale", "evidence_locations"].includes(h)) width = 38;
  else if (["priority", "year", "level", "batch"].includes(h)) width = 9;
  else if (["source_url", "pdf_path", "code_url", "data_url"].includes(h)) width = 28;
  else if (["train_inputs", "deploy_inputs", "baselines", "dataset_scale", "research_decision"].includes(h)) width = 30;
  master.getRange(`${c}:${c}`).format.columnWidth = width;
}
master.tables.add(`A1:${endCol}${matrix.length}`, true, "PrecisionMasterTable");

const decisionHeaders = ["priority","slug","level","task_family","task_topology","deployment_observability","privileged_inference","representation_family","evidence_supports_claim","bicg_impact","research_decision","decision_rationale","evidence_locations"];
const decisionRows = [decisionHeaders, ...records.map(r => decisionHeaders.map(h => r[h]))];
const decision = wb.worksheets.add("Decision Matrix");
decision.getRange(`A1:${colName(decisionHeaders.length)}${decisionRows.length}`).values = decisionRows;
decision.getRange(`A1:${colName(decisionHeaders.length)}1`).format = { fill: teal, font: { bold: true, color: "#FFFFFF" }, wrapText: true };
decision.getRange(`A2:${colName(decisionHeaders.length)}${decisionRows.length}`).format = { wrapText: true, verticalAlignment: "top" };
decision.freezePanes.freezeRows(1); decision.freezePanes.freezeColumns(3);
decision.tables.add(`A1:${colName(decisionHeaders.length)}${decisionRows.length}`, true, "DecisionTable");
for (let i = 1; i <= decisionHeaders.length; i++) decision.getRange(`${colName(i)}:${colName(i)}`).format.columnWidth = i <= 3 ? 10 : 27;

const evidenceHeaders = ["priority","slug","author_claim","observed_evidence","evidence_supports_claim","reviewer_inference","main_limitation","evidence_locations","unresolved_items"];
const evidenceRows = [evidenceHeaders, ...records.map(r => evidenceHeaders.map(h => r[h]))];
const evidence = wb.worksheets.add("Evidence Chain");
evidence.getRange(`A1:${colName(evidenceHeaders.length)}${evidenceRows.length}`).values = evidenceRows;
evidence.getRange(`A1:${colName(evidenceHeaders.length)}1`).format = { fill: gold, font: { bold: true, color: "#FFFFFF" }, wrapText: true };
evidence.getRange(`A2:${colName(evidenceHeaders.length)}${evidenceRows.length}`).format = { wrapText: true, verticalAlignment: "top" };
evidence.freezePanes.freezeRows(1); evidence.freezePanes.freezeColumns(2);
evidence.tables.add(`A1:${colName(evidenceHeaders.length)}${evidenceRows.length}`, true, "EvidenceChainTable");
for (let i = 1; i <= evidenceHeaders.length; i++) evidence.getRange(`${colName(i)}:${colName(i)}`).format.columnWidth = i <= 2 ? 12 : 35;

const artifactHeaders = ["priority","slug","publication_status","code_status","code_url","data_status","data_url","model_status","license","reproduction_readiness","artifact_evidence","unresolved_items"];
const artifactRows = [artifactHeaders, ...records.map(r => artifactHeaders.map(h => r[h]))];
const artifacts = wb.worksheets.add("Artifacts");
artifacts.getRange(`A1:${colName(artifactHeaders.length)}${artifactRows.length}`).values = artifactRows;
artifacts.getRange(`A1:${colName(artifactHeaders.length)}1`).format = { fill: gray, font: { bold: true, color: "#FFFFFF" }, wrapText: true };
artifacts.getRange(`A2:${colName(artifactHeaders.length)}${artifactRows.length}`).format = { wrapText: true, verticalAlignment: "top" };
artifacts.freezePanes.freezeRows(1); artifacts.freezePanes.freezeColumns(2);
artifacts.tables.add(`A1:${colName(artifactHeaders.length)}${artifactRows.length}`, true, "ArtifactsTable");
for (let i = 1; i <= artifactHeaders.length; i++) artifacts.getRange(`${colName(i)}:${colName(i)}`).format.columnWidth = i <= 2 ? 12 : 25;

const glossary = wb.worksheets.add("Glossary");
glossary.getRange("A1:C1").values = [["Field/value", "Meaning", "QC rule"]];
glossary.getRange("A2:C11").values = [
  ["NR", "Not reported in the paper", "Never recode as no"],
  ["privileged_inference", "Inference consumes simulator truth, full object state, future reference or target touch", "Disqualifies deployment-observation claim"],
  ["independent_force_gt", "Force instrument not reused as policy input/derived estimate", "State dependency explicitly"],
  ["matched_budget", "Same modalities, local encoder, parameter/data budget where possible", "Required for BiCG claims"],
  ["topology_ood", "Held-out contact-participant/edge structure", "Not synonymous with unseen object"],
  ["strong", "Claim directly tested with appropriate controls/statistics for scope", "Scope-limited"],
  ["partial", "Some supporting result, but confounds or missing controls remain", "Default for many system papers"],
  ["weak", "Mostly qualitative or unmatched evidence", "Do not use for causal wording"],
  ["not_tested", "No direct evaluation of the claim", "Use as gap, not negative result"],
  ["coding confidence", "Confidence in evidence extraction, not paper quality", "All 30 full texts coded"]
];
glossary.getRange("A1:C1").format = { fill: red, font: { bold: true, color: "#FFFFFF" } };
glossary.getRange("A1:C11").format.wrapText = true;
glossary.getRange("A:A").format.columnWidth = 24; glossary.getRange("B:B").format.columnWidth = 56; glossary.getRange("C:C").format.columnWidth = 36;

for (const s of [readme, summary, master, decision, evidence, artifacts, glossary]) {
  const preview = await wb.render({ sheetName: s.name, autoCrop: "all", scale: 0.8, format: "png" });
  await fs.writeFile(path.join(outputDir, `${s.name.replaceAll(" ", "_")}.png`), new Uint8Array(await preview.arrayBuffer()));
}
const xlsx = await SpreadsheetFile.exportXlsx(wb);
await xlsx.save(outputPath);
console.log(outputPath);
