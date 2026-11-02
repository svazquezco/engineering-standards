# Command-Line Interfaces

Scope: projects exposing command-line interfaces.

## Interface and configuration

- Provide useful `--help` output, validate inputs, and document required
  configuration, examples, side effects, and exit statuses.
- Keep successful output on stdout and diagnostics on stderr. When stdout is a
  machine-readable format, do not mix progress messages into that stream.
- Return a non-zero exit status for failures and preserve the distinction
  between an unsuccessful operation and a valid empty result.
- Use the established CLI framework. Small standalone tools may use the language
  standard library; avoid adding a second parser or framework without a clear
  interface requirement.
- Expose packaged commands through the package's supported entry-point mechanism.
  Document invocation by script path for deliberately standalone scripts.
- Obtain configuration through documented arguments, environment variables, or
  configuration files. Never rely on a developer's personal paths or credentials.

## Execution environments

- Commands must work in every environment the project claims to support. When
  the application ships in a container, verify the documented command and help
  output inside that container as well as on the supported development path.
- Pass subprocess arguments as a structured list when possible. Validate paths
  and identifiers, bound waits, and propagate actionable failures.
- Test argument validation, help, successful output, and failure exit statuses.
  Keep outbound operations isolated from tests.

For Python packages, declare named console entry points under `[project.scripts]`
in `pyproject.toml` when distributing a command. Follow the repository's runtime
and dependency policy rather than mandating a framework for every script.
