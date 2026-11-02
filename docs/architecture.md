# Architecture

This is a documentation repository. It has no application runtime or package installation step.

- `standards/` contains normative, reusable policy scoped by topic and technology.
- `templates/` contains a consumer agent-entry example with explicit placeholders.
- `docs/` describes adoption and maintenance of this repository.
- `scripts/check_docs.py` validates local Markdown file links and document hygiene.
- `.github/workflows/docs.yml` runs the same check on pushes and pull requests.

Consumers pin a Git revision and link to selected standards. They retain their own architecture, setup, commands, and exceptions. There is no installer, automatic synchronization, agent plugin, or enforced dependency on an issue tracker.
