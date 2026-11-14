# Python coding

Scope: Python source code. Unit tests follow
[Python testing](python-testing.md).

- Write identifiers, comments, docstrings, logs, and errors in English.
- Use type annotations for source functions and public interfaces. Keep public
  APIs explicit.
- Give public functions, methods, and classes useful Google-style docstrings. Do
  not add module docstrings at the start of Python files, including
  `__init__.py`. Avoid comments that restate the code.
- Follow PEP 8 unless project tooling defines a different convention. Keep
  pyproject.toml as the source of truth for lint and type-check configuration.
- Follow the project’s existing lint and formatter configuration. For new
  projects, initialize Ruff with `select = ["ALL"]`, Google-style docstring
  checks, and documented exceptions for module/package docstrings, tests, and
  formatter compatibility. Review newly enabled rules when upgrading Ruff.
- Follow the project’s existing type-checker configuration and source scope. For
  new projects, initialize Pyright with `typeCheckingMode = "strict"` for
  production code in pyproject.toml. Tests and fixtures follow the project’s
  test policy.
- Use a maximum line length of 120 characters. Set `line-length = 120` under
  `[tool.ruff]` in pyproject.toml.
- Order imports in standard-library, third-party, and local groups,
  alphabetically within each group, enforced by Ruff’s import-sorting rule
  (`I001`) rather than the formatter.
- Within a module, group constants, classes, public functions, and non-public
  helpers; sort names alphabetically within each group when dependencies permit.
- Within a class, use this top-to-bottom order: class attributes, construction
  methods (`__new__`, `__init__`), other special methods, properties, public
  methods, protected methods (`_name`), and private methods (`__name`). Sort
  names alphabetically within each group. Keep property setters and deleters
  beside their getter. Preserve ordering required by execution or framework
  behavior.
- Inject external clients at integration boundaries. Keep helpers on a class
  when they serve only that class; use module functions for shared behavior.
- Use `pathlib.Path` for filesystem paths. Convert paths at API boundaries that
  require a different representation.
- Specify UTF-8 explicitly for text file reads and writes. If an external format
  requires another encoding, use that encoding and document the format
  requirement at the boundary.
- Use context managers for filesystem resources that support them. Release
  resources without context manager support in a `finally` block.
- For applications and tools, put the production package directly in the
  repository root. Reusable libraries may place it under `src/` or use the flat
  layout. In both layouts, use the project name in snake_case (for example,
  `ExampleApp` uses `example_app`). Keep `tests/` at the repository root and
  mirror the package structure there.
- Group related modules by responsibility. Avoid generic utils modules
  accumulating unrelated behavior.
- Prefer simple, intention-revealing names and explicit control flow.
- Correct findings instead of disabling checks. If a suppression is unavoidable,
  scope it to one rule and explain the reason beside it.

See [dependencies](dependencies.md), [error handling](error-handling.md), and
[CLI](cli.md).
