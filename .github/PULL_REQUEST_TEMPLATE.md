## Type of change

<!-- Tick one. See CONTRIBUTING.md for what each implies. -->

- [ ] Pattern — new pattern under `patterns/` (requires >=1 validated implementation)
- [ ] Overlay — new or updated compliance overlay under `overlays/`
- [ ] Framework docs — change to `docs/` (requires Practice Methodology Working Group review)
- [ ] Template — change to anything under `templates/`
- [ ] Example — change to `examples/`
- [ ] Errata / docs polish — typo, link fix, glossary, formatting
- [ ] Tooling / CI — `scripts/`, `.github/`, build/test infrastructure

## Summary

<!-- 1–3 bullets: what changed and why. -->

## Traceability

<!-- Link back to the engagement, ADR, finding, or issue that surfaced this change. -->

- Engagement / source:
- Related ADR(s) or finding(s):
- Backward-compatibility note:

## Required for Pattern PRs

- [ ] Conforms to `patterns/_template/pattern-template.md` headings
- [ ] At least one validated `Implementation` entry with version + canonical doc
- [ ] Cross-references to related patterns updated reciprocally

## Required for Overlay PRs

- [ ] Cites the regulation by exact name + version/year + effective date
- [ ] "Last validated" date set
- [ ] LENS pillar floors and weights sum to 100
- [ ] If a regulation has multi-stage phasing, each stage has its own row

## Reviewer checklist

- [ ] Builds (markdown lint, link check, etc.) pass
- [ ] No broken cross-references introduced
- [ ] No accidental inclusion of client-identifying material
