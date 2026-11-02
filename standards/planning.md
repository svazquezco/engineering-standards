# Planning and Work Breakdown

Scope: planning engineering changes.

## Outcomes and scope

- Describe the intended user or operational outcome before listing implementation
  steps. Technical work may use a maintainer or operator perspective; do not
  invent an end-user feature to justify infrastructure work.
- Define observable acceptance criteria, exclusions, affected interfaces, and
  the checks that will demonstrate completion.
- Identify unresolved assumptions and decisions that materially change scope.
  Resolve those decisions before dependent implementation.

## Decomposition

- Prefer independent, negotiable, valuable, estimable, small, and testable units
  of work. Split large changes into coherent outcomes that can be reviewed and
  demonstrated independently.
- Prefer an end-to-end slice over separate delivery units for storage, service,
  and presentation layers when those layers have no useful standalone result.
- Establish the outcome list before decomposing each outcome into implementation
  tasks. A single outcome may legitimately touch several components.
- Include tests and documentation in each implementation unit; do not leave
  verification as an unrelated follow-up after the code is considered done.
- Record dependencies and their ordering explicitly. Keep backport work
  separate when it targets another supported release.
- Estimate from the actual implementation and verification work, express
  uncertainty, and revise estimates when assumptions change. Do not impose
  scheduling conventions that the target repository has not adopted.

Plans may live in the current conversation or an explicitly supplied document.
They do not require an issue tracker or persisted workflow checkpoints. Follow
[development](development.md) and [testing](testing.md) during execution.
