# Start a Python project

Use the shared [Python coding](../standards/python-coding.md),
[testing](../standards/python-testing.md), and
[dependency](../standards/dependencies.md) standards. The files in
[templates/python](../templates/python/pyproject.toml) provide initial
configuration; the policy stays in the linked standards.

## Initialize

Use the uv version pinned in the [CI template](../templates/python/checks.yml)
locally. Initialize the new application with the following command.

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
image. Review the remote pre-commit-hooks revision and the CI action pins at
each release. The template leaves development dependencies without a fixed minor
series and configures uv to resolve the latest compatible stable versions. Copy
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
Python package name. The framework commands resolve the latest compatible stable
versions using the merged template settings.

### FastAPI

Use Copier 9.17 or later in the 9.x series. Replace
`/path/to/engineering-standards` with the checkout containing the template. Omit
`--defaults` and the `--data` options to select the Copier profile and enter the
package name interactively.

```sh
uv add 'fastapi[standard]'
copier copy --defaults --data framework=fastapi --data package_name=example_app \
  /path/to/engineering-standards/templates/python/framework .
uv run fastapi dev example_app/main.py
```

The template creates `example_app/main.py` with a FastAPI instance and a
`routers/` package for route modules. Add routers with `app.include_router()` as
the API grows. See [FastAPI's multi-file layout][fastapi-layout].

### Django

```sh
uv add django
uv run django-admin startproject example_app .
uv run python manage.py check
```

Add `manage.py` and any new Django apps to Pyright's production scope. Review
`WPS407` for mutable constants in the generated `example_app/settings.py` before
running `make check`. See [Django's project and app tutorial][django-layout].

### FastMCP

Use the same Copier installation and template path as for FastAPI.

```sh
uv add fastmcp
copier copy --defaults --data framework=fastmcp --data package_name=example_app \
  /path/to/engineering-standards/templates/python/framework .
uv run fastmcp run example_app/server.py:mcp
```

The template creates `example_app/server.py` with a FastMCP instance for
registering tools, resources, and prompts. The `run` command serves MCP over
stdio by default. For a stdio connection, the MCP client launches the command
and manages the server process.

To serve the same instance over Streamable HTTP, run this from the project root.

```sh
uv run fastmcp run example_app/server.py:mcp \
  --transport http --host 127.0.0.1 --port 8765 --path /mcp
```

Enter `http://127.0.0.1:8765/mcp` as the MCP server URL. The server listens only
on loopback. Keep the process running in its terminal while the client uses it.

In another terminal, register the HTTP server with [Codex][codex-mcp] and
confirm that it appears in the list.

```sh
codex mcp add example-app --url http://127.0.0.1:8765/mcp
codex mcp list
```

For [Claude Code][claude-mcp], register the server at user scope to make it
available across your projects, then check its entry and connection status.

```sh
claude mcp add --transport http example-app --scope user http://127.0.0.1:8765/mcp
claude mcp list
```

Use `--scope local` from the project where you want the server if the
registration should be private to you and limited to that project.

See the [FastMCP server guide][fastmcp-layout] for transport details. The
[Compose example](#run-with-compose) binds to `0.0.0.0` inside the container.
Configure port publication separately in Compose to reach it from the host.

[fastapi-layout]: https://fastapi.tiangolo.com/tutorial/bigger-applications/
[django-layout]: https://docs.djangoproject.com/en/stable/intro/tutorial01/
[fastmcp-layout]: https://gofastmcp.com/docs/deployment/running-server
[codex-mcp]: https://developers.openai.com/learn/docs-mcp
[claude-mcp]: https://code.claude.com/docs/en/mcp

## Install and validate

Generate the project’s own lockfile, install development tools, and commit
`uv.lock` to reproduce the same versions on subsequent installations.

```sh
uv lock
uv sync --locked --all-groups
```

Use `uv lock --upgrade` when intentionally updating dependencies.

Copy [Makefile](../templates/python/Makefile) and the `make/` directory to the
project root. Add `/make/local.mk` to the project’s `.gitignore` for personal
targets. Run `make help` to see the available targets. `make sync` installs the
project and all dependency groups from the lockfile; `make lock` intentionally
updates the lockfile, and `make format` formats code. `make check` runs all
pre-commit hooks and the tests; CI calls the same target.

Copy [.pre-commit-config.yaml](../templates/python/.pre-commit-config.yaml) to
the project root. Pre-commit runs file checks on the host and calls Make targets
for Ruff, Flake8, and Pyright in Compose. Those targets use versions from
`uv.lock`. Export any project-specific `UV` or `UV_GROUPS` overrides for Git hooks.
Install the hooks after cloning.

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

## Tool settings

Keep project settings in [pyproject.toml](../templates/python/pyproject.toml).

- **Pyright** checks production code in strict mode. Add production paths to
  `include` and keep test imports out of production modules.
- **Ruff** selects `ALL` plus `pytest-fixture-autouse`. It limits McCabe
  complexity to 6, requires `import datetime as dt`, and bans `from` imports
  from `ast` and `datetime`. The formatter uses double quotes. Ruff checks
  Google-style docstrings and skips modules, packages, and `@property` methods.
  Add accurate copyright notices where required by `CPY001`.
- **Ruff in tests** allows missing annotations and docstrings, assertions,
  autouse fixtures, unused fixture arguments, literal expected values,
  standalone test modules, placeholder credentials, and subprocess calls.
- **wemake** uses default thresholds. `[tool.flake8]` allows repeated strings
  (`WPS226`), code in package initializers (`WPS412`), and `__all__` metadata.
  Only `tests/` can exceed the limits for module members (`WPS202`) and local
  variables (`WPS210`).
  [wemake configuration guide](https://wemake-python-styleguide.readthedocs.io/en/stable/pages/usage/configuration.html)
- **flake8-aaa** checks Arrange, Act, Assert. The `large` style lets the Act
  block include surrounding context managers. Use `# act` to mark the action
  when assigning to a descriptive variable name.
  [Flake8-AAA configuration guide](https://flake8-aaa.readthedocs.io/en/stable/options.html)

Run the [standards adoption setup](adoption.md#set-up-a-new-project) to choose
pinned links, a subtree, or a submodule for the new project. Keep the applicable
references in the generated agent instructions and document the project's exact
setup, checks, and exceptions locally.
