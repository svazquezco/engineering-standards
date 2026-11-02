# Validation

Requires Python 3.10 or newer and Git. No third-party Python packages are needed.

```sh
python3 scripts/check_docs.py
git diff --check
```

The documentation check fails on broken local file links, links escaping the repository, empty Markdown files, trailing whitespace, or missing final newlines. It checks file existence, not heading fragments, rendered appearance, external URL availability, or policy correctness. Review those manually when changed. Relative examples in code fences are ignored.

GitHub Actions runs the documentation check for pushes and pull requests. There is no application test suite; consuming projects define and run their own tests.
