# Contributing to the MOSAIC Practice Template

This repo holds the practice's working methodology. Contributions of two kinds are expected:

1. **Engagement work** — committed under `engagements/<name>/`. No review required from the working group; engagement teams self-govern.
2. **Practice-library additions** — new patterns, new compliance overlays, framework errata, or improved templates. These require review by the Practice Methodology Working Group (or the Practice Architecture Council for patterns).

This document covers #2.

---

## What to contribute

| Contribution | Where | Reviewer |
| --- | --- | --- |
| New pattern | `patterns/<slug>.md` | Practice Architecture Council (quarterly intake) |
| New implementation for existing pattern | edit existing `patterns/<slug>.md` | Same |
| New compliance overlay | `overlays/<slug>.md` | Practice Compliance Lead |
| Errata / clarification to `docs/` framework | edit existing file | Practice Methodology Working Group |
| New template or template improvement | `templates/<area>/` | Practice Methodology Working Group |
| New worked example | `examples/<short-name>/` | Anyone in the working group |

Do **not** modify the framework structure (the six layers, the five CADRE elements, the eight pillars, the six phases) outside a methodology working group cycle. Those are the framework's stable contract.

---

## How to propose

1. **Branch** off `main` with a descriptive name: `pattern/edge-compute`, `overlay/au-fsi`, `errata/section-7-cadence`.
2. **Open a draft PR early** with a one-paragraph proposal in the description: what you're adding, why it's needed, and which engagement(s) surfaced the need.
3. **Use the relevant template** from `_template/` folders where they exist.
4. **Include traceability**: cite the source (workshop, document, regulator publication, vendor spec) for every factual claim.
5. **Mark the PR as ready for review** once the proposal is complete.

PRs that add patterns must include at least one validated Implementation entry. PRs that add overlays must cite the regulator publication and include pre-populated Restrictions.

---

## Review cadence

- **Patterns**: Architecture Council reviews quarterly. Urgent additions can be admitted out-of-cycle by Council Chair.
- **Overlays**: Compliance Lead reviews on-demand. Annual full review of all overlays for regulatory currency.
- **Framework errata**: Working Group reviews monthly. Material changes require 12-month framework version increment.
- **Templates**: Working Group reviews monthly.

---

## Quality standards

Every contribution must:

- **Cite primary sources.** No claim without a reference (regulator publication, vendor doc, peer-reviewed paper, internal engagement record).
- **Be vendor-neutral at L3.** Patterns describe technology classes; product names appear only in the Implementation matrix at L4.
- **Carry an owner.** A named individual (not a team) accepts maintenance responsibility for the artifact's accuracy.
- **Use the practice vocabulary.** Spine, CADRE, Lens, the eight pillars, the six phases. Don't introduce new terms without working-group approval.

---

## Confidentiality

This repo is practice-confidential intellectual property. Selected sections may be shared with clients under engagement NDA:

- **OK to share under NDA**: Framework Overview (section 3), Pattern Library structure (section 11), ADR template (section 8), the quick-reference card.
- **Internal only**: Compliance overlay content, engagement-specific artifacts under `engagements/`, anything labeled "practice-confidential" in the file header.

When in doubt, ask the Practice Director before sharing.
