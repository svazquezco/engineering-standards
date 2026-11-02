"""Validate repository Markdown using only the Python standard library."""

from pathlib import Path
import re
from urllib.parse import unquote, urlsplit


def main() -> int:
    """Report invalid document hygiene and local file references."""
    root = Path(__file__).resolve().parents[1]
    errors = []
    for path in sorted(root.rglob("*.md")):
        if ".git" in path.relative_to(root).parts:
            continue
        content = path.read_text(encoding="utf-8")
        relative = path.relative_to(root)
        if not content.strip() or not content.endswith("\n"):
            errors.append(f"{relative}: empty document or missing final newline")
        fence = None
        for number, line in enumerate(content.splitlines(), 1):
            if line.rstrip() != line:
                errors.append(f"{relative}:{number}: trailing whitespace")
            marker = re.match(r"^\s*(`{3,}|~{3,})", line)
            if marker:
                token = marker.group(1)
                if fence is None:
                    fence = token
                elif token[0] == fence[0] and len(token) >= len(fence):
                    fence = None
                continue
            if fence:
                continue
            for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", line):
                url = urlsplit(target)
                if url.scheme or url.netloc or not url.path:
                    continue
                resolved = (path.parent / unquote(url.path)).resolve()
                if not resolved.is_relative_to(root) or not resolved.exists():
                    errors.append(f"{relative}:{number}: invalid local link: {target}")
    if errors:
        print("\n".join(errors))
        return 1
    print("Documentation checks passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
