# 04 — Calibrate

**Phase objective:** score the design against the eight quality pillars and validate it against the CADRE register.

**Typical duration:** 1–2 weeks.

## Inputs
- Composed architecture from Compose.
- Engagement-weighted pillar weights from the charter.
- Compliance overlay pillar floors.
- [Pillar scoring quick reference](../../../docs/appendices/B-pillar-scoring-quick-reference.md).

## Outputs
- [`quality-scorecard.md`](quality-scorecard.md) — pillar scores, weighted fitness, floor check, verdict.
- `gap-register.md` (create) — gaps with remediation owners and dates. The scorecard's §3 may be sufficient; promote to a separate file when the gap count gets large.
- `risk-weighted-view.md` (create) — residual Exposure after the current design. The scorecard's §4 may be sufficient; promote when needed.

## The scoring workshop

1. **Structured workshop** facilitated by the lead architect.
2. **Named pillar reviewers** — typically one per pillar drawn from client architecture and ops leadership.
3. For each pillar: reviewer proposes level vs. representative metrics; workshop discusses; consensus recorded.
4. **Disagreements that cannot be resolved** are recorded as Exposure entries and escalated to the engagement sponsor.

## Checklist before exiting Calibrate

- [ ] All eight pillars scored with named reviewers.
- [ ] All overlay pillar floors met (or remediation plan in place and accepted by sponsor).
- [ ] Fitness total computed and recorded with the verdict band.
- [ ] Gap register complete with owners and target close dates.
- [ ] Risk-weighted view records residual Exposure (likelihood × impact).
- [ ] Calibrate decision recorded: **Proceed to Commit / Return to Compose / Escalate**.
- [ ] Scorecard reviewed and signed by engagement partner, lead architect, and client architecture lead.

> **Two competent architects scoring the same design against the same CADRE register should arrive at the same fitness within ±20 points.** Larger divergences indicate inconsistent framework application — re-baseline before continuing.
