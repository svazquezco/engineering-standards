# Copyright 2026 Susana Vázquez
# SPDX-License-Identifier: Apache-2.0

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def main() -> int:
    """Check that standards/index.json and README.md list every standard.

    Returns:
        The process exit status.
    """
    index = json.loads((ROOT / "standards" / "index.json").read_text(encoding="utf-8"))
    indexed = {entry["path"] for entry in index["standards"]}
    present = {path.relative_to(ROOT).as_posix() for path in (ROOT / "standards").glob("*.md")}
    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    errors = [f"{path} is missing from standards/index.json" for path in sorted(present - indexed)]
    errors += [f"{path} in standards/index.json does not exist" for path in sorted(indexed - present)]
    errors += [f"{path} is missing from README.md" for path in sorted(present) if f"({path})" not in readme]
    for error in errors:
        sys.stderr.write(f"{error}\n")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
