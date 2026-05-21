# Engagement Charter — Bank Sejahtera

> **Phase:** 1 — Frame · **Status:** Signed · **Version:** 1.0 · **Date:** 2026-02-14
> **Practice owner:** A. Lead Architect · **Client sponsor:** Ibu Sari, CIO

---

## 1. Engagement identity

| Field | Value |
| --- | --- |
| Engagement code | MOS-0042 |
| Client | PT Bank Sejahtera Tbk (KBMI 2) |
| Engagement type | Migration / Displacement evaluation + design + plan |
| Phase scope | Frame → Commit; Continue covered under separate Day-2 MSA |
| Start date | 2026-02-17 |
| Target Commit date | 2026-06-30 |

## 2. Primary outcome

> Modernize the core-banking infrastructure to meet evolving regulatory expectations, reduce concentration risk on a single vendor, and provide a foundation for the next five years of digital-banking growth.

## 3. Value hypothesis

A modern dual-site active-active architecture will reduce business-continuity risk (RPO/RTO well inside OJK expectations), decrease the cost of compliance reporting (continuous evidence vs. point-in-time), and create commercial flexibility on platform vendor selection by sustaining at least two viable implementation paths. The Broadcom renewal triggers the decision; the value is durable beyond it.

## 4. Success criteria

| # | Criterion | Measure | Target | Owner |
| :-: | --- | --- | --- | --- |
| 1 | Tier-1 services demonstrate RPO and RTO | Quarterly DR exercise | RPO ≤ 15 min, RTO ≤ 1 hr | Head of IT Risk |
| 2 | OJK ITRM submission accepted | Submission outcome | Accepted without material findings | Compliance Director |
| 3 | TCO over 5 years | TCO model | ≤ status-quo trajectory + 10% | CFO delegate |
| 4 | Viable implementation paths at sign-off | Calibrate evidence | ≥ 2 validated implementations | Lead architect |
| 5 | Engagement closure by target Commit date | Charter timeline | Commit by 2026-06-30 | Practice partner |

## 5. Executive stakeholder matrix

| Role | Name | Authority | Decision rights | Veto rights |
| --- | --- | --- | --- | --- |
| Executive sponsor | Ibu Sari, CIO | Engagement go/no-go | Final architecture sign-off | — |
| Security lead | Pak Budi, CISO | — | Identity, segmentation, audit | Security architecture |
| Risk / continuity lead | Pak Dedi, Head of IT Risk | Delegated from COO | Continuity sign-off | — |
| Finance lead | Pak Eko, CFO delegate | Budget | TCO model approval | — |
| Practice partner | C. Partner | Commercial | Engagement scope | — |
| Practice lead architect | A. Lead Architect | Architecture | Technical decisions | — |

## 6. Scope boundary

**In scope:**
- Core-banking workload running on the current VCF estate.
- Jakarta primary DC; Surabaya secondary DC (currently passive DR).
- Identity and PAM integration for the in-scope workload.
- Observability and runbook scope for the in-scope workload.

**Out of scope:**
- Subsidiary operations (separate stack).
- Digital-channel platform (already on a separate stack).
- BIFast technical-integration work (separate workstream, dependency only).
- End-user devices and branch-office infrastructure.

**Explicit exclusions:**
- Hyperscaler-primary architecture for in-scope workload — rejected per CISO architectural principle.

## 7. Compliance overlays loaded

| Overlay | Version applied | Notes |
| --- | --- | --- |
| ID-FSI | 1.1 (May 2026) | All POJK 11/2022 and UU PDP restrictions in scope; BIFast cited as dependency, not in-scope build |

## 8. Pillar weights (sum = 100)

| Pillar | Weight | Rationale |
| --- | :---: | --- |
| Availability & Resilience | 18 | Tier-1 SLA on payment systems |
| Performance & Scale | 10 | Established baseline; growth steady |
| Security & Trust | 18 | OJK ITRM, CISO veto |
| Operability & Observability | 12 | BAU efficiency, audit-trail need |
| Cost & FinOps | 10 | Budgeted; discipline expected |
| Sustainability & GreenOps | 4 | ESG reporting only, no operational binding |
| Sovereignty & Compliance | 20 | OJK + UU PDP dominate |
| Adaptability & Portability | 8 | Vendor displacement risk hedge |
| **Total** | **100** | |

## 9. Pre-authorized trade-offs

- Cost premium of up to 18% over status quo is acceptable if it materially improves Availability or Adaptability (R-003 envelope).
- A single-vendor primary implementation is acceptable provided a second, fully-validated implementation path exists in the LLD (R-005).
- Sustainability sub-Mature scores are acceptable if ESG reporting integration is on a documented roadmap.

## 10. Confidentiality and handling

| Item | Classification | Notes |
| --- | --- | --- |
| Engagement artifacts (general) | Practice-confidential + Client-confidential | |
| CADRE register | Client-confidential | |
| Pricing and commercial terms | Restricted | CFO delegate only |
| Operational data / telemetry | Client-restricted | OJK access on request |

## 11. Sign-off

| Role | Name | Date | Signature |
| --- | --- | --- | --- |
| Executive sponsor | Ibu Sari, CIO | 2026-02-14 | _signed_ |
| Practice partner | C. Partner | 2026-02-14 | _signed_ |
| Lead architect | A. Lead Architect | 2026-02-14 | _signed_ |

---

## Revision history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 0.1 | 2026-02-04 | A. Lead Architect | Initial draft |
| 0.9 | 2026-02-11 | A. Lead Architect | Sponsor review draft |
| 1.0 | 2026-02-14 | A. Lead Architect | Signed |
