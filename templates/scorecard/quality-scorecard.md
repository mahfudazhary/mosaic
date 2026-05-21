# Quality Scorecard — <CLIENT NAME>

> **Phase:** 4 — Calibrate
> **Version:** _N.M_ · **Date:** _YYYY-MM-DD_
> **Lead architect:** _Name_ · **Pillar reviewers:** _named per pillar below_

This scorecard applies the [engagement-weighted fitness function](../../docs/09-maturity-scoring.md#92-engagement-weighted-fitness-function) to the composed design. Pillar weights come from the [engagement charter](../engagement-charter/engagement-charter.md).

---

## 1. Pillar scores

Each pillar scored **1 (Reactive) → 5 (Innovative)** per [Appendix B](../../docs/appendices/B-pillar-scoring-quick-reference.md). Reviewers proposed scores; workshop discussed; consensus recorded.

| # | Pillar | Reviewer | Score (1–5) | Weight | Weighted score | Floor (from overlay) | Floor met? | Notes / evidence |
| :-: | --- | --- | :---: | :---: | :---: | :---: | :---: | --- |
| 1 | Availability & Resilience | | | | | | | |
| 2 | Performance & Scale | | | | | | | |
| 3 | Security & Trust | | | | | | | |
| 4 | Operability & Observability | | | | | | | |
| 5 | Cost & FinOps | | | | | | | |
| 6 | Sustainability & GreenOps | | | | | | | |
| 7 | Sovereignty & Compliance | | | | | | | |
| 8 | Adaptability & Portability | | | | | | | |
| | **Total** | | | **100** | **_/500_** | | | |

> Weighted score per pillar = Score × Weight. Total = Σ Weighted scores. Max = 500.

## 2. Fitness verdict

| Band | Range | This design |
| --- | --- | :---: |
| Not ready for Commit | < 250 | |
| Operationally viable, weaknesses | 250–325 | |
| **Target — recommended range** | **325–400** | |
| Optimized / possible over-engineering | > 400 | |

- All overlay floors met: **Yes / No** _(list any unmet floors below)_
- Calibrate decision: **Proceed to Commit / Return to Compose / Escalate to sponsor**

## 3. Gap register

Where the design under-delivers against a CADRE Demand, a pillar target, or an overlay floor.

| # | Gap | Linked CADRE / floor | Severity | Remediation option | Owner | Target close |
| :-: | --- | --- | :---: | --- | --- | --- |
| 1 | | | | | | |
| 2 | | | | | | |

## 4. Risk-weighted view (residual Exposure)

Which Exposure entries remain after the current design.

| Exposure ID | Statement | Residual L×I | Mitigation status | Residual owner | Carry into Continue? |
| --- | --- | :---: | --- | --- | :---: |
| E-NNN | | | | | |
| E-NNN | | | | | |

## 5. Sign-off

| Role | Name | Date | Signature |
| --- | --- | --- | --- |
| Lead architect | | | |
| Practice partner | | | |
| Client architecture lead | | | |
| Executive sponsor (if escalated) | | | |

---

## Revision history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 0.1 | YYYY-MM-DD | | After Compose iteration 1 — informational only |
| 1.0 | YYYY-MM-DD | | First formal Calibrate score |
| 1.1 | YYYY-MM-DD | | Post-remediation re-score |
