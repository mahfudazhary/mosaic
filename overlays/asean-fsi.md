# Compliance Overlay — ASEAN-FSI

> **Code:** ASEAN-FSI · **Version:** 1.1 · **Status:** Active
> **Owner:** Practice Compliance Lead · **Last reviewed:** 2026-05
> **Source review cadence:** Semi-annually (covers multiple jurisdictions with independent rule-making cycles)

## 1. Applicable context

ASEAN financial-services institutions outside Indonesia. Covers Singapore (MAS), Malaysia (BNM), Philippines (BSP), Thailand (BOT), and other ASEAN financial regulators. For Indonesia, use [ID-FSI](id-fsi.md) instead. Sub-sections per jurisdiction; load only the relevant sub-section into the engagement.

## 2. Mandate index

| # | Mandate | Source citation | Jurisdiction | Architectural implication |
| :-: | --- | --- | --- | --- |
| 1 | Technology Risk Management Guidelines | MAS Notice 644 / MAS TRM Guidelines | Singapore | Cloud risk assessment; technology outsourcing requirements; cyber resilience |
| 2 | Risk Management in Technology (RMiT) | BNM RMiT Policy Document | Malaysia | IT risk governance; sourcing controls; cybersecurity framework |
| 3 | IT Risk Management Framework | BSP Circular 982 | Philippines | IT governance and risk; technology outsourcing |
| 4 | Cybersecurity Risk Management | BSP Circular 1019 | Philippines | Cybersecurity-specific controls |
| 5 | IT Risk Regulations | Bank of Thailand (BOT) IT Risk Notification | Thailand | IT risk governance and reporting |
| 6 | Data Protection | PDPA Singapore; PDPA Malaysia; Data Privacy Act (Republic Act 10173, Philippines); PDPA Thailand | Jurisdiction-specific | Personal data residency and handling vary by jurisdiction |

## 3. Pre-populated Restrictions

Per-jurisdiction R-restrictions; load the row(s) matching the engagement's jurisdiction.

| R-ID | Statement | Subcategory | Citation | Waivable |
| --- | --- | --- | --- | :---: |
| R-001 (SG) | Material cloud / technology outsourcing arrangements documented and notified to MAS where applicable; risk assessment completed prior to contract | Compliance mandate | MAS TRM | Conditional |
| R-002 (SG) | Personal data handled per PDPA Singapore | Compliance mandate | PDPA Singapore | Conditional |
| R-003 (MY) | RMiT-aligned IT risk governance with documented controls; cloud risk assessment | Compliance mandate | BNM RMiT | No |
| R-004 (MY) | Personal data handled per Malaysia PDPA | Compliance mandate | PDPA Malaysia | Conditional |
| R-005 (PH) | IT outsourcing per BSP Circular 982; cybersecurity controls per Circular 1019 | Compliance mandate | BSP | No |
| R-006 (PH) | Personal data handled per Philippines DPA | Compliance mandate | DPA (Philippines) | Conditional |
| R-007 (TH) | IT risk governance and reporting per BOT IT Risk Notification | Compliance mandate | BOT | No |

## 4. Pillar floors

| Pillar | Floor | Rationale |
| --- | :---: | --- |
| Security & Trust | 4 | All listed regulators emphasize cyber resilience |
| Sovereignty & Compliance | 3–4 | Varies by jurisdiction; MAS less prescriptive on residency than BNM |
| Availability & Resilience | 4 | Sector-wide expectation |
| Operability & Observability | 3 | Audit and incident-reporting needs |

## 5. Default pillar weight presets

| Pillar | Suggested weight |
| --- | :---: |
| Security & Trust | 20 |
| Availability & Resilience | 18 |
| Sovereignty & Compliance | 16 |
| Operability & Observability | 14 |
| Performance & Scale | 10 |
| Cost & FinOps | 10 |
| Adaptability & Portability | 8 |
| Sustainability & GreenOps | 4 |
| **Total** | **100** |

## 6. Deliverable expectations

Per jurisdiction; in general, each requires a comparable subset of the ID-FSI deliverables (ITRM submission equivalent, BCP/DR documentation, third-party risk file, incident response plan).

## 7. Cross-references

**Patterns most often affected:** same set as [ID-FSI](id-fsi.md).

**Common stacking combinations:** ASEAN-FSI + GLOBAL-CARD; ASEAN-FSI + AI.

## 8. Version history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | 2026-05 | Practice Compliance Lead | Initial issue |
| 1.1 | 2026-05 | Practice Compliance Lead | Reference refresh, no material change |
