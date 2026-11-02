# Security and Data

Scope: repositories, tooling, and data handling.

- Never commit credentials, tokens, private keys, personal data, or unauthorized private
  repository content.
- Obtain secrets through environment variables or an approved secret provider.
- Sanitize command output, logs, fixtures, URLs, and error messages.
- Validate untrusted paths and inputs before reads, writes, or shell execution.
- Preserve original user data and prefer temporary directories for generated
  working state.
- Use least privilege for access tokens, hooks, plugins, and integrations.
- Stop and request direction before destructive or scope-expanding actions.
