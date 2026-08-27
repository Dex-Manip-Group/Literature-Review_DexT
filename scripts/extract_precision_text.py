from __future__ import annotations

import csv
import json
import re
from pathlib import Path

from pypdf import PdfReader


ROOT = Path(__file__).resolve().parents[1]
MAP_PATH = ROOT / "precision_annotations" / "precision_annotations.csv"
OUT_DIR = ROOT / "tmp" / "pdfs" / "precision-text"
INDEX_PATH = OUT_DIR / "extraction_index.csv"


def safe_name(value: str) -> str:
    return re.sub(r"[^A-Za-z0-9._-]+", "_", value).strip("_")


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    rows = list(csv.DictReader(MAP_PATH.open(encoding="utf-8-sig")))
    index_rows: list[dict[str, object]] = []

    for row in rows:
        slug = row["slug"]
        pdf_value = row["pdf_path"]

        if pdf_value == "MISSING":
            index_rows.append(
                {"priority": row["priority"], "slug": slug, "status": "missing", "pages": "", "pdf": ""}
            )
            continue

        pdf_path = ROOT / Path(pdf_value)
        if not pdf_path.exists():
            index_rows.append(
                {"priority": row["priority"], "slug": slug, "status": "not_found", "pages": "", "pdf": str(pdf_path)}
            )
            continue

        reader = PdfReader(str(pdf_path))
        out_path = OUT_DIR / f"{int(row['priority']):02d}_{safe_name(slug)}.txt"
        with out_path.open("w", encoding="utf-8") as handle:
            handle.write(json.dumps({
                "priority": int(row["priority"]),
                "slug": slug,
                "title": row["title"],
                "pdf": pdf_value,
                "pages": len(reader.pages),
            }, ensure_ascii=False) + "\n")
            for page_no, page in enumerate(reader.pages, start=1):
                handle.write(f"\n===== PAGE {page_no} =====\n")
                try:
                    text = page.extract_text() or ""
                except Exception as exc:  # preserve a visible extraction failure
                    text = f"[TEXT EXTRACTION ERROR: {type(exc).__name__}: {exc}]"
                cleaned = text.replace("\x00", "").encode("utf-8", "replace").decode("utf-8")
                handle.write(cleaned)
                handle.write("\n")

        index_rows.append(
            {"priority": row["priority"], "slug": slug, "status": "ok", "pages": len(reader.pages), "pdf": pdf_value}
        )

    with INDEX_PATH.open("w", encoding="utf-8-sig", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=["priority", "slug", "status", "pages", "pdf"])
        writer.writeheader()
        writer.writerows(index_rows)


if __name__ == "__main__":
    main()
