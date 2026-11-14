# Start a Python project

Use the shared [Python coding](../standards/python-coding.md),
[testing](../standards/python-testing.md), and
[dependency](../standards/dependencies.md) standards. The files in
[templates/python](../templates/python/pyproject.toml) provide initial
configuration; the policy stays in the linked standards.

## Initialize

For a new application, initialize its metadata and environment with:

```sh
uv init --bare --name example-app --python 3.14
```

The example uses the project title `ExampleApp`, distribution name
`example-app`, and Python package `example_app`. Use the equivalent names for
the actual project.

For a reusable library, use
`uv init --lib --build-backend uv --name example-app --python 3.14`. Keep the
generated build-system configuration and `src/example_app/` package. When
merging the template for this layout, omit its `[tool.uv.build-backend]` table
so uv uses its default package discovery under `src/`. Set Pyright's `include`
to `["src/example_app"]` and omit pytest's `pythonpath` setting so tests import
the package installed by uv. For a flat-layout library, move the package to the
repository root and use the template's build-backend settings with the actual
package name.

Merge [templates/python/pyproject.toml](../templates/python/pyproject.toml) into
the project’s pyproject.toml. Keep its existing metadata and merge tables rather
than overwriting them. Dependabot updates only the template’s Dockerfile base
image; review the development dependency ranges, the remote pre-commit-hooks
revision, and the CI action pins in the template at each release, and review
available versions when starting a project. Copy
[.python-version](../templates/python/.python-version) to the project root.

The initial interpreter is Python 3.14. Choose and document the supported Python
range for the actual project; keep `requires-python`, .python-version, package
compatibility, and CI aligned. Ruff derives its target version from
`requires-python`; Pyright uses the configured environment’s interpreter.

For a framework application, use the matching setup below. For other projects,
create production code under `example_app/` for the flat layout or
`src/example_app/` for the src layout. In either case, keep behavioral tests
under `tests/`, mirroring the package structure. Update Pyright’s include list
and any explicit uv module name for the actual package. Do not add empty example
tests only to make CI pass. Keep fixture definitions in the narrowest useful
conftest.py.

```text
ExampleApp/
├── example_app/
│   └── __init__.py
├── tests/
├── Makefile
├── pyproject.toml
└── uv.lock
```

## Scaffold a framework application

Run the chosen setup from the new project's root after `uv init --bare` and
before creating its production package. Replace `example_app` with the project's
Python package name. Choose a compatible minor release for each dependency and
replace `MAJOR.MINOR` in the commands.

### FastAPI

Use Copier 9.17 or later in the 9.x series. Replace
`/path/to/engineering-standards` with the checkout containing the template. Omit
`--defaults` and the `--data` options to select the Copier profile and enter the
package name interactively.

```sh
uv add 'fastapi[standard]==MAJOR.MINOR.*'
copier copy --defaults --data framework=fastapi --data package_name=example_app \
  /path/to/engineering-standards/templates/python/framework .
uv run fastapi dev example_app/main.py
```

The template creates `example_app/main.py` with a FastAPI instance and a
`routers/` package for route modules. Add routers with `app.include_router()` as
the API grows. See [FastAPI's multi-file layout][fastapi-layout].

### Django

```sh
uv add 'django==MAJOR.MINOR.*'
uv run django-admin startproject example_app .
uv run python manage.py check
```

Django creates `manage.py` at the root and the settings, URL configuration,
ASGI, and WSGI modules in `example_app/`. Create feature apps with
`uv run python manage.py startapp feature_name` when needed. Include `manage.py`
and the feature packages in Pyright's production scope. See [Django's project
and app tutorial][django-layout].

### FastMCP

Use the same Copier installation and template path as for FastAPI.

```sh
uv add 'fastmcp==MAJOR.MINOR.*'
copier copy --defaults --data framework=fastmcp --data package_name=example_app \
  /path/to/engineering-standards/templates/python/framework .
uv run fastmcp run example_app/server.py:mcp
```

The template creates `example_app/server.py` with a FastMCP instance for
registering tools, resources, and prompts. The command serves MCP over stdio.
See the [FastMCP quickstart][fastmcp-layout].

[fastapi-layout]: https://fastapi.tiangolo.com/tutorial/bigger-applications/
[django-layout]: https://docs.djangoproject.com/en/stable/intro/tutorial01/
[fastmcp-layout]: https://gofastmcp.com/

## Install and validate

Generate the project’s own lockfile, install development tools, and commit
uv.lock:

```sh
uv lock
uv sync --locked --all-groups
```

Copy [Makefile](../templates/python/Makefile) and the `make/` directory to the
project root. Add `/make/local.mk` to the project’s `.gitignore` for personal
targets. Run `make help` to see the available targets. `make sync` installs the
project and all dependency groups from the lockfile; `make lock` intentionally
updates the lockfile, and `make format` formats code. `make check` runs all
pre-commit hooks and the tests; CI calls the same target.

Copy [.pre-commit-config.yaml](../templates/python/.pre-commit-config.yaml) to
the project root. Ruff and Pyright run as local hooks through the Make targets,
which run the tools in Compose using versions from uv.lock. The pre-commit
runner and general file checks run on the host. Make exports `UV` and
`UV_GROUPS` to hook subprocesses. For hooks invoked directly by Git, export any
project-specific overrides in the shell as well. Install the Git hooks once
after cloning:

```sh
make hooks-install
```

The hooks run locally on every commit; CI runs the same hooks through
`make check` to verify that the rules were applied. Pre-commit requires a Git
repository. Initialize Git if the project is not already a checkout. Before
publishing or updating a PR, agents must run `make check`, fix failures, and
report the result. This is required even when automatic commit hooks are
installed.

The full validation commands are:

```sh
uv run --locked --all-groups pre-commit run --all-files
uv run --locked --all-groups pytest
```

Pytest deliberately fails when there are no collected tests. Add tests for the
project’s first behavior before expecting the full check set to pass. Coverage
thresholds belong in the consuming project’s testing documentation.

Copy [checks.yml](../templates/python/checks.yml) to
`.github/workflows/checks.yml` and
[dependabot.yml](../templates/python/dependabot.yml) to `.github/dependabot.yml`
for projects using GitHub Actions. It synchronizes dependencies, caches
pre-commit environments, and runs `make check`, the same target used locally.
The runner needs Docker with Compose for code analysis and tests. Configure a
runtime/platform matrix when the project supports more environments than the
initial single Linux job.

## Run with Compose

Copy [compose.yml](../templates/python/compose.yml),
[Dockerfile](../templates/python/Dockerfile), and
[.dockerignore](../templates/python/.dockerignore) to the project root alongside
the Makefile. Docker with Compose is required for code analysis, formatting,
tests, and running the app.

```sh
make run
```

The Compose `app` service installs the locked environment. Its default command
runs `python -m example_app`. For a framework application, keep the
`make sync && uv run --locked $$UV_GROUPS` prefix and replace the Python module
command with the matching entry point:

- FastAPI uses `fastapi run example_app/main.py --host 0.0.0.0`.
- Django uses `python manage.py runserver 0.0.0.0:8000` for development.
- FastMCP can use HTTP with
  `fastmcp run example_app/server.py:mcp --transport http --host 0.0.0.0`.

Map the chosen HTTP port in Compose when you need host access. For a generic
module application, implement the entry point in `example_app/__main__.py` and
replace the module name in compose.yml when naming the actual project. A
reusable library only needs this service if it also provides a runnable
application or CLI. Add ports, databases, and health checks only when the
application needs them.

The development image includes uv, Git, Make, and the system library needed by
Pyright’s Node runtime. It trusts the mounted `/workspace` checkout for hook
execution. The source is bind-mounted; the container’s .venv and caches use
named volumes separate from the host environment. Keep interpreter and tool
versions aligned with CI. Add system build dependencies explicitly for native
extensions.

`--all-groups` includes the project’s dependency groups, not optional
distribution extras. For mutually exclusive groups, document a compatible
selection and run Make or Compose with an override such as
`UV_GROUPS="--group dev --group integration"`. Enable optional extras explicitly
when the project needs them. Use the same group selection for synchronization
and command execution, including the Compose command, so uv does not remove
required groups between commands.

## Configuration boundaries

Pyright checks the configured production package in strict mode. Tests,
fixtures, and fixture factories do not require annotations. Production modules
must not import from tests, which would pull test code into production type
analysis. Projects with other production paths must add them to Pyright’s
include list.

Ruff selects ALL, uses Google-style docstrings, and delegates formatting choices
to its formatter. The template excludes module/package docstring requirements,
annotation and function-docstring requirements in tests/fixtures, and the
assertion, unused-fixture-argument, magic-value, and implicit-namespace-package
warnings in tests. Formatter-conflicting indentation, quote, and comma checks
are also excluded. The Google convention excludes incompatible docstring styles.
ALL also includes copyright-notice checks: use accurate ownership notices where
required rather than fabricated attribution. Other rule findings must be fixed
or receive a documented, narrowly scoped exception.

Relevant references:
[Ruff formatter compatibility](https://docs.astral.sh/ruff/formatter/#conflicting-lint-rules),
[Ruff Google convention](https://docs.astral.sh/ruff/settings/#lint_pydocstyle_convention),
[Pyright configuration](https://github.com/microsoft/pyright/blob/main/docs/configuration.md),
and [uv CI](https://docs.astral.sh/uv/guides/integration/github/).

Run the [standards adoption setup](adoption.md#set-up-a-new-project) to choose
pinned links, a subtree, or a submodule for the new project. Keep the applicable
references in the generated agent instructions and document the project's exact
setup, checks, and exceptions locally.
