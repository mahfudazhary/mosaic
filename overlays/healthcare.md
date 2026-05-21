# Compliance Overlay — HC (Healthcare)

> **Code:** HC · **Version:** 1.1 · **Status:** Active
> **Owner:** Practice Compliance Lead · **Last reviewed:** 2026-05

## 1. Applicable context

Healthcare providers, payers, life-sciences organizations, and their technology suppliers handling protected health information (PHI) or equivalent. Geography-specific sub-sections; load only those that apply.

## 2. Mandate index

| # | Mandate | Source citation | Architectural implication |
| :-: | --- | --- | --- |
| 1 | Health Informatics — Information Security Management | ISO 27799 | Sector adaptation of ISO 27001 for health data |
| 2 | HIPAA Security Rule | 45 CFR Parts 160, 162, 164 (US) | Administrative, physical, technical safeguards for PHI |
| 3 | HIPAA Privacy Rule | 45 CFR Part 164 Subpart E (US) | PHI use and disclosure |
| 4 | NHS Data Security and Protection Toolkit (DSPT) | NHS England | Sector requirements for NHS data |
| 5 | ASEAN local health-data regulations | Per-country (e.g., Indonesian health data laws under UU PDP scope) | Localized PHI handling rules |
| 6 | Medical device software | IEC 62304; FDA SaMD guidance; EU MDR | If platform serves SaMD workloads |

## 3. Pre-populated Restrictions

| R-ID | Statement | Citation | Waivable |
| --- | --- | --- | :---: |
| R-001 | PHI subject to encryption at rest and in transit; documented key management | ISO 27799 / HIPAA Security | No |
| R-002 | Access to PHI on least-privilege basis with audit trail; role-based access mapped to job function | HIPAA Security | No |
| R-003 | Breach notification per applicable jurisdiction within prescribed timeframe (HIPAA: 60 days; varies elsewhere) | HIPAA Breach Notification / local | No |
| R-004 | Business Associate Agreements (or equivalents) in place for all PHI handlers | HIPAA | No |
| R-005 | Data residency per local jurisdiction (e.g., NHS DSPT requires UK residency for in-scope data) | Local regulation | Conditional |
| R-006 | Risk analysis documented; reviewed periodically | HIPAA Security Risk Analysis | No |

## 4. Pillar floors

| Pillar | Floor | Rationale |
| --- | :---: | --- |
| Security & Trust | 4 | Encryption, access control, audit are core |
| Sovereignty & Compliance | 4 | PHI residency requirements |
| Operability & Observability | 3 | Audit logging requirement |
| Availability & Resilience | 3 | Clinical safety considerations for clinical systems |

## 5. Default pillar weight presets

| Pillar | Suggested weight |
| --- | :---: |
| Security & Trust | 22 |
| Sovereignty & Compliance | 20 |
| Availability & Resilience | 14 |
| Operability & Observability | 14 |
| Performance & Scale | 10 |
| Cost & FinOps | 10 |
| Adaptability & Portability | 6 |
| Sustainability & GreenOps | 4 |
| **Total** | **100** |

## 6. Deliverable expectations

| Regulator-expected document | MOSAIC artifact |
| --- | --- |
| Risk analysis | Exposure register + Calibrate scorecard |
| Data flow inventory with PHI classification | L1 data classification + L3 integration flows |
| Access control matrix | L5 Operational specification §5 (operating model) |
| Audit log retention plan | L5 Operational specification §4 |
| Business Associate Agreement register | CADRE R-restrictions + Exposure dependencies |

## 7. Cross-references

**Patterns most often affected:**
- [Identity and Access Management](../patterns/identity-access-management.md), [Zero-Trust Network](../patterns/zero-trust-network.md), [Observability Platform](../patterns/observability-platform.md), [Backup and Cyber Recovery](../patterns/backup-cyber-recovery.md), [Data Platform — Lakehouse](../patterns/data-platform-lakehouse.md).

**Common stacking combinations:** HC + AI (clinical AI); HC + SUSTAIN.

## 8. Version history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | 2026-05 | Practice Compliance Lead | Initial issue |
| 1.1 | 2026-05 | Practice Compliance Lead | Editorial refresh |
