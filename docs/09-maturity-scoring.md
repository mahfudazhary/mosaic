# 9. Maturity and Scoring Model

MOSAIC's quality assessment uses a **five-level maturity scale per pillar** combined with an **engagement-weighted fitness function**. The model is deliberately simple — five levels, eight pillars, one weighted sum — so scores can be computed by hand in a workshop, defended in a stakeholder review, and recomputed quickly as the design evolves.

## 9.1 The five-level maturity scale

| Level | Name | Definition |
| :---: | --- | --- |
| **1** | **Reactive** | Practices addressing this pillar are ad-hoc and undocumented. Outcomes depend on individual heroics. Failure modes are not anticipated; recovery is improvised. |
| **2** | **Basic** | Practices are documented but inconsistently applied. Some tooling is in place; outcomes vary by team or service. Failure modes are partially anticipated; recovery follows partial runbooks. |
| **3** | **Mature** | Practices are consistent, tooled, and owned. Outcomes are predictable and meet target ranges. Failure modes are anticipated and recovery is rehearsed. **Recommended default for general-purpose enterprise architecture.** |
| **4** | **Optimized** | Practices are measured and continuously tuned. Outcomes are routinely better than target and improving over time. Automation handles most routine cases; humans focus on exceptional cases and on tuning the automation itself. |
| **5** | **Innovative** | Practices are adaptive and self-improving. The architecture incorporates closed-loop feedback that adjusts behavior based on observed conditions. Outcomes exceed industry benchmarks. Rarely required and typically reserved for the few pillars on which the client competes in the market. |

Pillar-by-pillar definitions of each level are in [Appendix B](appendices/B-pillar-scoring-quick-reference.md).

## 9.2 Engagement-weighted fitness function

The fitness function combines per-pillar scores into a single design score weighted by engagement-specific pillar importance:

```
Fitness = Σ (Pillar_score_i × Weight_i)   for i in 8 pillars,   where Σ Weight_i = 100
```

Pillar weights are **set during Frame** and recorded in the engagement charter. Weights sum to 100 and are negotiated with the client based on engagement context:

- **Financial-services engagements** over-weight Sovereignty, Security, and Availability.
- **AI engagements** over-weight Performance, Cost, and Sustainability.
- **Public-sector engagements** over-weight Sovereignty, Operability, and Cost.

The [compliance overlays](10-compliance-overlays.md) provide default weight presets that engagements may adopt or modify.

### Example weight set — Indonesian FSI core-banking modernization

| Pillar | Weight | Rationale |
| --- | :---: | --- |
| Sovereignty & Compliance | 20 | OJK and UU PDP constraints dominate |
| Availability & Resilience | 18 | Tier-1 SLA on payment systems |
| Security & Trust | 18 | OJK ITRM, regulator expectations |
| Operability & Observability | 12 | BAU efficiency, audit-trail need |
| Performance & Scale | 10 | Established baseline; growth steady |
| Cost & FinOps | 10 | Budgeted; cost discipline expected |
| Adaptability & Portability | 8 | Vendor displacement risk hedge |
| Sustainability & GreenOps | 4 | ESG reporting only, no operational binding |
| **Total** | **100** | |

## 9.3 Score interpretation

The **maximum possible fitness score is 500** (level 5 on every pillar × total weight 100). Practical guidance:

| Score band | Average pillar | Verdict |
| --- | :---: | --- |
| **Below 250** | < 2.5 | The design is **not yet ready for Commit**. Multiple pillars are at Reactive or Basic levels; remediation is required before delivery. |
| **250–325** | 2.5–3.25 | The design is **operationally viable but has visible weaknesses**. Suitable for non-critical workloads; specific pillar gaps should be acknowledged as Exposure entries. |
| **325–400** | 3.25–4.0 | The **recommended target range** for most enterprise engagements. Mature across most pillars, with optimization in the pillars carrying highest engagement weights. |
| **Above 400** | > 4.0 | The design is **optimized or innovative across most pillars**. Appropriate where the client genuinely competes on architectural quality; on routine engagements it indicates possible over-engineering. |

## 9.4 Scoring mechanics

Scoring is performed in **Calibrate**. The recommended approach:

1. **Structured workshop** facilitated by the lead architect.
2. **Named pillar reviewers** — typically one per pillar drawn from the client's architecture and operations leadership.
3. For each pillar, the reviewer proposes a level against the representative metrics; the workshop discusses; a consensus score is recorded.
4. **Disagreements that cannot be resolved** are recorded as Exposure entries and escalated to the engagement sponsor.

Scores are **reproducible by construction**. They are derived from the design and the CADRE register, not from architect opinion. Two competent architects scoring the same design against the same CADRE register should arrive at the same fitness within **±20 points**. Larger divergences typically indicate that one of the architects has not applied the framework consistently.

A copy-ready scorecard with the fitness formula pre-wired sits in [`templates/scorecard/`](../templates/scorecard/).
