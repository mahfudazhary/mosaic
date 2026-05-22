# Quality Scorecard — Bank Sejahtera

> **Phase:** 4 — Calibrate · **Version:** 1.0 · **Date:** 2026-05-22
> **Lead architect:** A. Lead Architect

---

## 1. Pillar scores

Implementation A — Incumbent HCI (stretched cluster) carried as primary; Implementation B — Alternative HCI (metro-availability variant) documented as fallback per R-005. Scoring against Implementation A; B scores within ±5% on aggregate.

| # | Pillar | Reviewer | Score | Weight | Weighted | Floor | Floor met? | Notes |
| :-: | --- | --- | :---: | :---: | :---: | :---: | :---: | --- |
| 1 | Availability & Resilience | Head of IT Risk | 4 | 18 | 72 | 4 | ✅ | Active-active dual-site; tested DR; meets D-001/D-002. Score 4 not 5 — regular chaos-testing not yet planned. |
| 2 | Performance & Scale | App Infra Lead | 4 | 10 | 40 | — | — | Sized for current workload + 50% headroom; clear scale-out path. |
| 3 | Security & Trust | CISO delegate | 4 | 18 | 72 | 4 | ✅ | Zero-trust, PAM, segmentation. Supply-chain attestation in progress (a 5 would require complete). |
| 4 | Operability & Observability | Bu Rina | 3 | 12 | 36 | 3 | ✅ | Unified observability planned; full Day-2 automation in roadmap year 2. |
| 5 | Cost & FinOps | CFO delegate | 3 | 10 | 30 | — | — | Within budget envelope; cost-attribution to business units not yet implemented. |
| 6 | Sustainability & GreenOps | ESG lead | 3 | 4 | 12 | — | — | Refresh to current-generation hardware reduces PUE; ESG reporting integration in roadmap. |
| 7 | Sovereignty & Compliance | Compliance Director | 4 | 20 | 80 | 4 | ✅ | All onshore; ID-FSI floors met; OJK submission packet drafted. |
| 8 | Adaptability & Portability | Lead architect | 3 | 8 | 24 | — | — | Two implementations validated at L4 (R-005 met). Data-portability score limited by incumbent-platform-specific storage policies. |
| | **Total** | | | **100** | **366 / 500** | | | |

## 2. Fitness verdict

| Band | Range | This design |
| --- | --- | :---: |
| Not ready for Commit | < 250 | |
| Operationally viable, weaknesses | 250–325 | |
| **Target — recommended range** | **325–400** | **✅ (366)** |
| Optimized / possible over-engineering | > 400 | |

- All overlay floors met: **Yes** (Sovereignty ≥ 4, Security ≥ 4, Availability ≥ 4, Operability ≥ 3)
- Calibrate decision: **Proceed to Commit** with Operability roadmap items added to Continue-phase scope.

## 3. Gap register

| # | Gap | Linked | Severity | Remediation | Owner | Target close |
| :-: | --- | --- | :---: | --- | --- | --- |
| 1 | No chaos-testing programme; Availability ceiling 4 | D-001, D-002 | Low | Add chaos-testing item to year-2 roadmap | Head of IT Risk | 2027-Q1 |
| 2 | Supply-chain attestation incomplete; Security ceiling 4 | R-001 | Medium | Adopt SBOM ingestion + vendor attestation review by year 1 close | CISO delegate | 2026-Q4 |
| 3 | No cost-attribution to business units; Cost ceiling 3 | R-003 / Cost pillar | Medium | Implement FinOps tagging and showback within 6 months of go-live | CFO delegate | 2027-Q1 |
| 4 | ESG reporting integration not yet built; Sustainability ceiling 3 | (none mandatory under current scope) | Low | Add to year-2 roadmap | ESG lead | 2027-Q2 |
| 5 | Storage-policy specifics reduce data-portability score | R-005 | Low | Document portability runbook for storage policy at L5 | Storage Lead | Pre-Commit |

## 4. Risk-weighted view (residual Exposure)

| ID | Statement | Residual L×I | Status | Owner | Carry into Continue? |
| --- | --- | :---: | --- | --- | :---: |
| E-001 | Incumbent vendor pricing volatility | 3 (L3 × I3) | Mitigation in place (Adaptability ≥ 4 sustained; 2nd implementation validated) | A. Lead Architect | Yes |
| E-002 | Incumbent-platform skill concentration | 2 | Cross-training plan in place | Head of Infra Ops | Yes |
| E-003 | OJK ITRM revision during engagement | 2 | Designed to best-practice ceiling | Compliance Director | Yes |
| E-004 | Inter-site fiber outage | 2 | Witness placement (ADR-0015) + runbook | Network Lead | Yes |
| E-005 | Cyber event during migration | 3 (L2 × I5 originally) | Phased cutover; immutable backups; enhanced monitoring | CISO | Yes |

## 5. Sign-off

| Role | Name | Date | Signature |
| --- | --- | --- | --- |
| Lead architect | A. Lead Architect | 2026-05-22 | _signed_ |
| Practice partner | C. Partner | 2026-05-22 | _signed_ |
| Client architecture lead | Pak Tono, Head of Architecture (delegate of CIO) | 2026-05-23 | _signed_ |
| Executive sponsor | Ibu Sari, CIO | 2026-05-23 | _signed (escalation: gap #2 noted)_ |

---

## Revision history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 0.5 | 2026-05-18 | A. Lead Architect | After Calibrate workshop |
| 1.0 | 2026-05-22 | A. Lead Architect | Final consensus scores |
