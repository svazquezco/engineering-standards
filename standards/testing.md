# Testing

Scope: executable projects; documentation-only repositories may document an applicable validation-only strategy.

- Test observable behavior and public contracts rather than internal implementation details.
- Add a regression test for each defect fix where practical; document why one cannot be automated.
- Keep tests deterministic, isolated, and independent of execution order. Control time, randomness, and external state.
- Separate unit, integration, and end-to-end tests with explicit commands and environment requirements.
- Cover relevant success, boundary, and failure behavior. Do not write tests solely to mirror the implementation.
- Use focused checks while iterating, then run all required repository gates before handoff.
- Define coverage targets in the consuming repository based on risk. Coverage does not replace meaningful assertions.
- Report commands, outcomes, skipped checks, and environmental blockers. Do not claim success for a skipped required check.

Python-specific rules: [Python testing](python-testing.md).
