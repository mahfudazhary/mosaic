# Drift Report — <CLIENT NAME> — <YYYY-QN>

> **Phase:** 6 — Continue
> **Reporting period:** _YYYY-MM-DD to YYYY-MM-DD_
> **Author:** _Service owner / lead architect_
> **Distribution:** _Sponsor, architecture lead (client), practice partner, lead architect (practice)_

The Drift Report compares **actual operation** against the **design intent captured at Commit**. Significant drift triggers a re-execution of the framework starting at Frame, treating the existing architecture as input rather than baseline.

---

## 1. Executive summary

> _Three to five sentences. The bottom line: is the architecture operating within intent, drifting, or materially diverged? Any framework re-execution recommended?_

## 2. SLO compliance

For each tier-1 (and selected tier-2) service:

| Service | SLO target | Actual (period) | Compliance | Trend | Notes |
| --- | --- | :---: | :---: | :---: | --- |
| | | | ✅ / ⚠️ / ❌ | ↑ / → / ↓ | |

## 3. Pillar maturity — drift vs. Calibrate baseline

| Pillar | Calibrate score | Current score | Δ | Notes |
| --- | :---: | :---: | :---: | --- |
| Availability & Resilience | | | | |
| Performance & Scale | | | | |
| Security & Trust | | | | |
| Operability & Observability | | | | |
| Cost & FinOps | | | | |
| Sustainability & GreenOps | | | | |
| Sovereignty & Compliance | | | | |
| Adaptability & Portability | | | | |
| **Fitness total** | _/500_ | _/500_ | | |

## 4. Audit findings (regulator, internal, external)

| ID | Source | Finding | Severity | Open / Closed | Linked Restriction | Owner | Target close |
| --- | --- | --- | :---: | :---: | --- | --- | --- |
| | | | | | | | |

## 5. Exposure register changes

### Closed since last report
| Exposure ID | Statement | Closure reason |
| --- | --- | --- |
| | | |

### Newly opened
| Exposure ID | Statement | L×I | Mitigation plan | Owner |
| --- | --- | :---: | --- | --- |
| | | | | |

### Status changes
| Exposure ID | Old status / rating | New status / rating | Cause |
| --- | --- | --- | --- |
| | | | |

## 6. Change activity

| Metric | Period value | Trend |
| --- | :---: | :---: |
| Deployment frequency | | |
| Lead time for changes | | |
| Change failure rate (%) | | |
| Mean time to detect (min) | | |
| Mean time to recover (min) | | |
| Toil percentage | | |

## 7. Stakeholder feedback

> _Summary of feedback collected during the period from operators, users, and sponsors. Themes, not anecdotes._

## 8. Drift assessment

| Dimension | Within intent? | Magnitude of drift | Driver |
| --- | :---: | --- | --- |
| L1 Context (scope, sovereignty) | | | |
| L2 Capability | | | |
| L3 Logical (pattern fitness) | | | |
| L4 Physical (configurations, BoM) | | | |
| L5 Operational (SLOs, runbooks, ops model) | | | |

## 9. Recommendation

Tick one:

- [ ] **No action.** Drift within tolerance. Continue current operation.
- [ ] **Targeted remediation.** Specific actions listed below; no framework re-execution.
- [ ] **Partial re-execution.** Capture + Compose + Calibrate cycle for the affected scope.
- [ ] **Full re-execution.** Start at Frame. Treat current architecture as input, not baseline.

### Actions

| # | Action | Owner | Target date |
| :-: | --- | --- | --- |
| 1 | | | |

## 10. Sign-off

| Role | Name | Date | Signature |
| --- | --- | --- | --- |
| Service owner | | | |
| Lead architect (practice) | | | |
| Client architecture lead | | | |

---

## Revision history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | YYYY-MM-DD | | Quarterly report |
