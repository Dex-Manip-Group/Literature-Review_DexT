#!/usr/bin/env python3
"""Download and validate open-access PDFs listed in papers_manifest.tsv."""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import os
import pathlib
import shutil
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed


USER_AGENT = "Mozilla/5.0 (compatible; BiCGResearchArchive/1.0; academic-use)"
MIN_PDF_BYTES = 10_000


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=pathlib.Path, default=pathlib.Path(__file__).with_name("papers_manifest.tsv"))
    parser.add_argument("--root", type=pathlib.Path, default=pathlib.Path(__file__).parent)
    parser.add_argument("--workers", type=int, default=6)
    parser.add_argument("--retries", type=int, default=3)
    parser.add_argument("--timeout", type=int, default=90)
    return parser.parse_args()


def load_manifest(path: pathlib.Path) -> list[dict[str, str]]:
    with path.open("r", encoding="utf-8", newline="") as handle:
        rows = list(csv.DictReader(handle, delimiter="\t"))
    required = {"category", "year", "slug", "title", "status", "pdf_url", "source_url", "tags"}
    if not rows or not required.issubset(rows[0]):
        raise ValueError(f"Manifest is empty or missing columns: {sorted(required)}")
    return rows


def sha256(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def validate_pdf(path: pathlib.Path) -> tuple[bool, str]:
    if not path.exists():
        return False, "missing"
    size = path.stat().st_size
    if size < MIN_PDF_BYTES:
        return False, f"too-small:{size}"
    with path.open("rb") as handle:
        header = handle.read(5)
    if header != b"%PDF-":
        return False, f"bad-header:{header!r}"
    return True, "ok"


def fetch_to_path(url: str, destination: pathlib.Path, timeout: int) -> None:
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, "Accept": "application/pdf,*/*"})
    try:
        with urllib.request.urlopen(request, timeout=timeout) as response:
            with destination.open("wb") as handle:
                shutil.copyfileobj(response, handle)
        return
    except urllib.error.URLError as exc:
        curl = shutil.which("curl.exe") if os.name == "nt" else None
        if "CERTIFICATE_VERIFY_FAILED" not in str(exc) or not curl:
            raise

    completed = subprocess.run(
        [
            curl,
            "--fail",
            "--location",
            "--silent",
            "--show-error",
            "--max-time",
            str(timeout),
            "--user-agent",
            USER_AGENT,
            "--output",
            str(destination),
            url,
        ],
        check=False,
        capture_output=True,
        text=True,
    )
    if completed.returncode != 0:
        detail = completed.stderr.strip() or f"curl exit code {completed.returncode}"
        raise RuntimeError(f"system curl fallback failed: {detail}")


def download_one(row: dict[str, str], root: pathlib.Path, retries: int, timeout: int) -> dict[str, object]:
    category = row["category"].strip()
    filename = f'{row["year"].strip()}_{row["slug"].strip()}.pdf'
    destination = root / category / filename
    destination.parent.mkdir(parents=True, exist_ok=True)
    result: dict[str, object] = {
        "category": category,
        "title": row["title"],
        "status": row["status"],
        "source_url": row["source_url"],
        "pdf_url": row["pdf_url"],
        "file": str(destination.relative_to(root)).replace("\\", "/"),
    }

    valid, detail = validate_pdf(destination)
    if valid:
        result.update(download_status="existing", bytes=destination.stat().st_size, sha256=sha256(destination))
        return result

    if not row["pdf_url"].strip():
        result.update(download_status="link_only", detail="No public direct PDF URL recorded")
        return result

    if destination.exists():
        destination.unlink()

    last_error = "unknown"
    for attempt in range(1, retries + 1):
        temp_path: pathlib.Path | None = None
        try:
            with tempfile.NamedTemporaryFile(delete=False, dir=destination.parent, suffix=".part") as temp:
                temp_path = pathlib.Path(temp.name)
            fetch_to_path(row["pdf_url"].strip(), temp_path, timeout)
            valid, detail = validate_pdf(temp_path)
            if not valid:
                raise ValueError(detail)
            os.replace(temp_path, destination)
            result.update(
                download_status="downloaded",
                bytes=destination.stat().st_size,
                sha256=sha256(destination),
                attempts=attempt,
            )
            return result
        except Exception as exc:  # preserve per-paper failure without stopping the archive
            last_error = f"{type(exc).__name__}: {exc}"
            if temp_path and temp_path.exists():
                temp_path.unlink()
            if attempt < retries:
                time.sleep(min(2 ** attempt, 8))

    result.update(download_status="failed", detail=last_error, attempts=retries)
    return result


def write_reports(root: pathlib.Path, results: list[dict[str, object]]) -> None:
    report_path = root / "download_results.json"
    report_path.write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding="utf-8")

    checksum_lines = []
    failures = []
    for result in sorted(results, key=lambda item: str(item["file"])):
        if result.get("sha256"):
            checksum_lines.append(f'{result["sha256"]}  {result["file"]}')
        if result["download_status"] == "failed":
            failures.append(result)
    (root / "checksums.sha256").write_text("\n".join(checksum_lines) + ("\n" if checksum_lines else ""), encoding="utf-8")

    with (root / "failed_downloads.tsv").open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle, delimiter="\t", lineterminator="\n")
        writer.writerow(["category", "title", "pdf_url", "source_url", "detail"])
        for result in failures:
            writer.writerow([result["category"], result["title"], result["pdf_url"], result["source_url"], result.get("detail", "")])


def main() -> int:
    args = parse_args()
    root = args.root.resolve()
    root.mkdir(parents=True, exist_ok=True)
    rows = load_manifest(args.manifest.resolve())

    results: list[dict[str, object]] = []
    total = len(rows)
    with ThreadPoolExecutor(max_workers=max(1, args.workers)) as executor:
        future_map = {
            executor.submit(download_one, row, root, args.retries, args.timeout): row
            for row in rows
        }
        for index, future in enumerate(as_completed(future_map), start=1):
            result = future.result()
            results.append(result)
            print(f'[{index:02d}/{total:02d}] {result["download_status"]:10s} {result["file"]}', flush=True)

    results.sort(key=lambda item: (str(item["category"]), str(item["file"])))
    write_reports(root, results)
    counts: dict[str, int] = {}
    for result in results:
        status = str(result["download_status"])
        counts[status] = counts.get(status, 0) + 1
    print(json.dumps({"total": total, "counts": counts}, ensure_ascii=False), flush=True)
    return 1 if counts.get("failed", 0) else 0


if __name__ == "__main__":
    sys.exit(main())
