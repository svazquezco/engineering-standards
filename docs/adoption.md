# Reference these standards

Add the relevant links from [templates/AGENTS.md](../templates/AGENTS.md) to the consuming project’s AGENTS.md. Keep its existing project instructions.

For example:

```markdown
## Engineering standards

Read the relevant linked standards before working on a task:

- [Documentation](https://github.com/svazquezco/engineering-standards/blob/main/standards/documentation.md)
- [Python coding](https://github.com/svazquezco/engineering-standards/blob/main/standards/python-coding.md)
- [Python unit tests](https://github.com/svazquezco/engineering-standards/blob/main/standards/python-testing.md)
- [Dependencies](https://github.com/svazquezco/engineering-standards/blob/main/standards/dependencies.md)
```

The standards stay in this repository. Reference them rather than copying their contents into each project. Keep project-specific setup, validation commands, and exceptions in the consuming project’s documentation. Agents must open and read the relevant links; if access fails, they must report it.

## Initial Python configuration

Follow [Start a Python project](python-projects.md) to initialize metadata with uv, merge the Python configuration, generate a lockfile, and add the initial CI workflow. The template includes pytest, Ruff ALL with documented exceptions and 120-character lines, strict Pyright for production code, and pre-commit hooks.

## Reference a fixed version

To keep a project on a specific documentation version, replace `main` in every standards URL with the same published tag, such as `v1.0.0`. For example, after that tag is published:

```text
https://github.com/svazquezco/engineering-standards/blob/v1.0.0/standards/documentation.md
```

Check the repository’s published tags before choosing a version. See [versioning](versioning.md) for publication and upgrade steps.

## Following updates

Links to `main` follow the current standards. Changes here become available to all projects using those links the next time the documents are read.

Projects using a fixed tag or commit SHA upgrade explicitly: review the changes and migration steps, update all standards references together, and run the project’s validation commands.

## Precedence and exceptions

Explicit task instructions take precedence over the shared defaults. A consuming repository’s documented local rules override the shared defaults. Record each exception in its AGENTS.md or docs/contributing.md with the affected standard, replacement rule, and reason. Report conflicts rather than silently combining incompatible requirements.
