# Python coding

Scope: Python source code. Unit tests follow [Python testing](python-testing.md).

- Write identifiers, comments, docstrings, logs, and errors in English.
- Use type annotations for source functions and public interfaces. Keep public APIs explicit.
- Give public functions, methods, and classes useful Google-style docstrings. Avoid redundant module docstrings and comments that restate the code.
- Follow PEP 8 unless project tooling defines a different convention. Keep pyproject.toml as the source of truth for lint and type-check configuration.
- Prefer Ruff for linting and formatting. Add other linters only for rules not already covered.
- Group related modules by responsibility. Avoid generic utils modules accumulating unrelated behavior.
- Prefer simple, intention-revealing names and explicit control flow.
- Correct findings instead of disabling checks. If a suppression is unavoidable, scope it to one rule and explain the reason beside it.
- If docstring rules are enabled, align them with the intended module and package documentation policy rather than generating meaningless docstrings.

See [dependencies](dependencies.md).
