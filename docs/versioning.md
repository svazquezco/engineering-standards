# Versioning

Consumers may pin full commit SHAs before any release exists. This scaffold does not publish tags or releases.

When releases are introduced, use `vMAJOR.MINOR.PATCH` tags and describe policy changes in release notes:

- Major: introduce or strengthen a mandatory rule, remove an adopted standard, or change precedence in a way requiring consumer migration.
- Minor: add an opt-in standard or compatible recommendation.
- Patch: clarify wording, fix examples, or repair links without changing requirements.

Do not move published version tags. A consuming project upgrades deliberately and records exceptions; a new release does not change its pinned baseline automatically. Publishing tags and release notes is a separate authorized action.
