# Appendix C — Framework Quick-Reference Card

A one-page summary suitable for workshop reference.

---

## The three axes

**Axis 1 — Spine**
`L0 Strategy · L1 Context · L2 Capability · L3 Logical · L4 Physical · L5 Operational`

**Axis 2 — Inputs (CADRE)**
`Context · Assumptions · Demands · Restrictions · Exposure`

**Axis 3 — Lens (8 Pillars)**
`Availability · Performance · Security · Operability · Cost · Sustainability · Sovereignty · Adaptability`

---

## The method

```
Frame → Capture → Compose → Calibrate → Commit → Continue → (loop to Frame)
```

| Phase | Duration | Output |
| --- | --- | --- |
| Frame | 1–2 wk | Engagement charter, L0 content, pillar weights |
| Capture | 1–3 wk | CADRE register (baselined) |
| Compose | 3–8 wk (iterative) | L1–L4 architecture (HLD/LLD draft) |
| Calibrate | 1–2 wk | Quality scorecard, gap register, risk view |
| Commit | 1–2 wk | ADR set, BoM, L5 ops spec, validation plan |
| Continue | Ongoing | Quarterly drift report → loop to Frame |

---

## Decision records

Every L3 and L4 decision recorded as an ADR with: **ID, Title, Status, Layer, Date, Authors, Reviewers, CADRE Trace, Problem, Options Considered, Quality Impact, Decision, Consequences, Validation.**

---

## Scoring

- Each pillar scored **1 (Reactive)** to **5 (Innovative)**.
- Engagement weights **sum to 100**.
- `Fitness = Σ (Pillar_score × Weight)`
- **Recommended target range: 325–400** (avg 3.25–4.0).
- Apply pillar floors from active compliance overlays.

---

## Operating principles (in precedence order)

1. Outcome anchors everything.
2. Patterns before products.
3. Every consequential decision is recorded.
4. Quality is multi-dimensional and explicit.
5. Sovereignty is first-class.
6. Lifecycle, not Day-0.
7. Pragmatic over ideal.
