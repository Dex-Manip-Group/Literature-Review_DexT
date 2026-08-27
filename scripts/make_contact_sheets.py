"""Create four-page contact sheets for visual QA of a rendered PDF."""

from pathlib import Path
from PIL import Image, ImageDraw


root = Path(__file__).resolve().parents[1]
render_dir = root / "tmp" / "pdfs" / "review-render"
out_dir = root / "tmp" / "pdfs" / "review-contact-sheets"
out_dir.mkdir(parents=True, exist_ok=True)

pages = sorted(render_dir.glob("page-*.png"))
if not pages:
    raise SystemExit(f"No rendered pages found in {render_dir}")

for sheet_index, start in enumerate(range(0, len(pages), 4), start=1):
    batch = pages[start : start + 4]
    opened = [Image.open(path).convert("RGB") for path in batch]
    thumb_width = 700
    thumbs = []
    for image in opened:
        height = round(image.height * thumb_width / image.width)
        thumbs.append(image.resize((thumb_width, height), Image.Resampling.LANCZOS))

    cell_height = max(image.height for image in thumbs) + 48
    canvas = Image.new("RGB", (thumb_width * 2 + 36, cell_height * 2 + 36), "#d8dde2")
    draw = ImageDraw.Draw(canvas)
    for index, (image, path) in enumerate(zip(thumbs, batch)):
        x = 12 + (index % 2) * (thumb_width + 12)
        y = 12 + (index // 2) * cell_height
        canvas.paste(image, (x, y + 28))
        page_number = int(path.stem.split("-")[-1])
        draw.text((x + 6, y + 5), f"Page {page_number}", fill="#17232d")

    canvas.save(out_dir / f"sheet-{sheet_index:02d}.png", optimize=True)

print(f"Created {(len(pages) + 3) // 4} contact sheets for {len(pages)} pages")

