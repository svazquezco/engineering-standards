# Development Workflow

Scope: implementation and verification of engineering changes.

## Before changing code

- Read the repository README, agent guidance, relevant architecture documents,
  and instructions scoped to the target files.
- Inspect the working tree and preserve unrelated user changes.
- Confirm the requested outcome, boundaries, affected components, and how the
  result will be verified.
- Ask only when a missing decision would materially change the implementation.

## While changing code

- Make the smallest coherent change that satisfies the request.
- Keep generated files, dependencies, tests, and documentation aligned with
  behavior.
- Avoid unrelated refactors and changes to public interfaces without need.
- Prefer deterministic tooling and focused checks while iterating.

## Before handoff

- Run every applicable repository check and fix introduced failures.
- Review the complete diff for scope drift, secrets, debug output, generated
  artifacts, and accidental formatting changes.
- Report executed checks, failures, skipped checks, risks, and remaining work.
- Never merge, deploy, publish, or enable auto-merge without explicit authority.
