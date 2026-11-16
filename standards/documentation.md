# Documentation

Scope: all repositories.

- All repository content must be written in English. This includes
  documentation, code identifiers, comments, docstrings, tests, examples, logs,
  error messages, commit messages, and pull request titles and descriptions.
  Preserve the original wording of required license notices and quoted source
  material.
- README.md must contain only the project title, a brief statement of its
  purpose, and links to project documentation and applicable shared standards.
  Put quick starts, commands, and examples in the linked guides.
- Use relative links to documents in the same repository. Links in README.md
  to shared standards must use the project's adopted version. Pin remote links
  to a published tag or full commit SHA. If the project vendors the standards,
  link to the pinned local copy.
- Keep AGENTS.md as the agent entry point: reading order, relevant policy
  references, commands, and exceptions.
- Projects must provide docs/architecture.md for components and boundaries,
  docs/contributing.md for contribution workflow, and docs/testing.md for
  validation strategy and exact commands.
- Projects with a local development environment must provide
  docs/local-development.md with prerequisites, setup, configuration, and
  commands to run the project locally.
- Projects that provide an application, CLI, API, or library must provide
  docs/usage.md with instructions and examples for its users.
- Add deployment, migrations, and integrations documents when applicable.
- Document local behavior and exceptions without duplicating shared policy.
- Keep tool-specific instruction files thin, pointing to AGENTS.md.
- Use focused documents, predictable names, and short valid examples.
- State new or revised policy using `must` for obligations, `must not` for
  prohibitions, `should` for recommendations, and `may` for permissions. An
  exception to a mandatory rule must have an explicit condition. Introduce
  examples separately from requirements.
- Update affected documentation in the same change as behavior. Do not describe
  planned features as available.
