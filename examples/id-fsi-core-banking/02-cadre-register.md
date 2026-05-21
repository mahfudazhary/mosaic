# CADRE Register — Bank Sejahtera (condensed)

> **Phase:** 2 — Capture · **Baselined:** 2026-03-10 · **Version:** 1.0
> **Lead architect:** A. Lead Architect · **Overlays loaded:** ID-FSI v1.1

This is the condensed worked-example version. A production register would carry 30–60 entries across the five elements.

---

## C — Context

| ID | Statement | Source | Owner | Status | Pillar tags |
| --- | --- | --- | --- | --- | --- |
| C-001 | Incumbent vendor subscription renewal occurs Q3 2026; the engagement decision must precede renewal commitment by no less than four months | Sponsor interview | A. Lead Architect | Active | Cost, Adaptability |
| C-002 | CIO is executive sponsor; CISO holds veto on security architecture; COO has delegated continuity sign-off to Head of IT Risk | Charter | A. Lead Architect | Active | — |
| C-003 | In-scope estate is the core-banking workload in Jakarta and Surabaya. Out-of-scope: subsidiary operations and digital-channel platform (already on a separate stack) | Charter §6 | A. Lead Architect | Active | — |

## A — Assumptions

| ID | Statement | Validation plan | Fallback | Pillar tags |
| --- | --- | --- | --- | --- |
| A-001 | The 2024 workload-profile assessment remains representative of current and 18-month projected load | Refresh assessment in parallel with Compose | Capacity upgrade in year 1 | Performance |
| A-002 | Existing inter-DC fiber capacity is sufficient for synchronous replication at the metro distance involved | Confirm with provider in Compose | Capacity upgrade as ADR-0017 | Availability, Performance |

## D — Demands

| ID | Statement | Type | MoSCoW | Testability | Pillar tags |
| --- | --- | --- | :---: | --- | --- |
| D-001 | Tier-1 services achieve RPO ≤ 15 minutes | Non-functional | M | Quarterly DR exercise | Availability |
| D-002 | Tier-1 services achieve RTO ≤ 1 hour | Non-functional | M | Quarterly DR exercise | Availability |
| D-003 | Architecture supports 50,000 concurrent banking sessions with p95 transaction latency ≤ 200 ms | Non-functional | M | Load test at quarterly cadence | Performance |
| D-004 | All workloads use centralized identity with MFA; privileged access requires PAM brokerage | Non-functional | M | Access path inventory; audit log review | Security |
| D-005 | Architecture supports both VM and container workloads on a unified platform | Functional | S | Deploy both workload types in pilot | Operability, Adaptability |
| D-006 | Day-2 operations are automated to the extent that BAU operator headcount remains flat versus current | Non-functional | S | Quarterly headcount and toil review | Operability |

## R — Restrictions

| ID | Statement | Subcategory | Citation | Waivable |
| --- | --- | --- | --- | :---: |
| R-001 | POJK 11/2022 IT Risk Management — tier-1 services require documented BCP and tested DR with annual report to OJK | Compliance mandate | POJK 11/POJK.03/2022 | No |
| R-002 | UU PDP data residency — PII data must remain in Indonesian jurisdiction | Compliance mandate | UU 27/2022 | Conditional |
| R-003 | Capital budget envelope IDR 145 billion over 24 months; OpEx envelope IDR 38 billion per year steady state | Operational constraint | CFO commitment | Conditional |
| R-004 | Existing Surabaya data-center facility must be reused; no new third-site capacity acquisition is in scope | Operational constraint | Sponsor decision | No |
| R-005 | Single-vendor lock-in is unacceptable; at minimum two viable implementation paths must exist at architecture sign-off | Architectural principle | Client architecture board | No |

## E — Exposure

| ID | Statement | Type | L×I | Residual | Mitigation plan | Owner |
| --- | --- | --- | :---: | :---: | --- | --- |
| E-001 | Incumbent vendor pricing volatility could increase steady-state OpEx beyond R-003 envelope | Risk | 4×4 | 3 | Maintain Adaptability ≥ 4 to preserve displacement option | A. Lead Architect |
| E-002 | Operations staff skilled on the current hypervisor are concentrated in a single team; departure or unavailability would impact Day-2 capacity | Risk | 3×4 | 2 | Cross-train on selected alternative implementation | Head of Infra Ops |
| E-003 | OJK could revise ITRM continuity expectations during the engagement; design must accommodate moderate revision without redesign | Risk | 2×4 | 2 | Design to current best-practice expectations rather than current minimum | Compliance Director |
| E-004 | Inter-site fiber outage during synchronous replication operation could cause workload pause | Dependency | 2×4 | 2 | Witness placement (ADR-0015); documented failover runbook | Network Lead |
| E-005 | Cyber event against the management plane during migration window | Threat | 2×5 | 3 | Phased cutover; immutable backups (cyber-recovery pattern); enhanced monitoring | CISO |

---

## Baseline review sign-off

| Element | Owner | Date |
| --- | --- | --- |
| Context | A. Lead Architect | 2026-03-10 |
| Assumptions | A. Lead Architect | 2026-03-10 |
| Demands | Head of IT Risk + CTO delegate | 2026-03-10 |
| Restrictions | Compliance Director + CFO delegate | 2026-03-10 |
| Exposure | CISO + Head of IT Risk | 2026-03-10 |

## Revision history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 0.5 | 2026-03-03 | A. Lead Architect | After Capture workshop 1 |
| 0.8 | 2026-03-07 | A. Lead Architect | After Capture workshop 2 |
| 1.0 | 2026-03-10 | A. Lead Architect | Baselined |
