# Compliance Overlay — ID-GOV

> **Code:** ID-GOV · **Version:** 1.1 · **Status:** Active
> **Owner:** Practice Compliance Lead · **Last reviewed:** 2026-05
> **Source review cadence:** Annual + on BSSN / Komdigi publication change

## 1. Applicable context

Indonesian central government, ministries, regional governments, and state-owned enterprises (BUMN). Stacks with [SUSTAIN](sustain.md) for SOEs with ESG disclosure obligations and with [AI](ai.md) for government AI use cases.

## 2. Mandate index

| # | Mandate | Source citation | Architectural implication |
| :-: | --- | --- | --- |
| 1 | Electronic Systems and Transactions | PP 71/2019 (supersedes PP 82/2012) | Electronic system operator obligations; data classification (public, strategic, non-strategic); residency rules per class |
| 2 | Personal Data Protection Law | UU 27/2022 (UU PDP) | Onshore PII; data subject rights; DPO designation for high-risk processors |
| 3 | National cybersecurity guidance | BSSN technical guidelines | Cybersecurity baselines for government IT; vulnerability and incident reporting to BSSN |
| 4 | Electronic system operator registration | Komdigi (formerly Kominfo) registration requirements | PSE Lingkup Publik / Privat registration; conditions on registration |
| 5 | Government cloud direction | National cloud / GovCloud policy | Use of approved government-grade environments for strategic-class data |

## 3. Pre-populated Restrictions

| R-ID | Statement | Subcategory | Citation | Waivable |
| --- | --- | --- | --- | :---: |
| R-001 | Strategic-electronic-system data must reside in Indonesian jurisdiction in an approved facility | Compliance mandate | PP 71/2019 | No |
| R-002 | PII residency under UU PDP | Compliance mandate | UU 27/2022 | Conditional |
| R-003 | BSSN cybersecurity baseline implemented; incident reporting per BSSN guidance | Compliance mandate | BSSN | No |
| R-004 | Komdigi PSE registration completed prior to production go-live | Compliance mandate | Komdigi regulations | No |
| R-005 | Procurement, lifecycle, and decommissioning per government IT procurement framework | Compliance mandate | National IT procurement policy | No |

## 4. Pillar floors

| Pillar | Floor | Rationale |
| --- | :---: | --- |
| Sovereignty & Compliance | 4 | PP 71/2019 strategic-data residency |
| Security & Trust | 4 | BSSN baseline |
| Operability & Observability | 3 | Audit-trail and reporting needs |

## 5. Default pillar weight presets

| Pillar | Suggested weight |
| --- | :---: |
| Sovereignty & Compliance | 22 |
| Security & Trust | 18 |
| Operability & Observability | 14 |
| Availability & Resilience | 12 |
| Cost & FinOps | 14 |
| Performance & Scale | 8 |
| Adaptability & Portability | 8 |
| Sustainability & GreenOps | 4 |
| **Total** | **100** |

## 6. Deliverable expectations

| Regulator-expected document | MOSAIC artifact |
| --- | --- |
| PSE registration submission | L1 Context + scope boundary + data classification |
| BSSN cybersecurity self-assessment | Calibrate scorecard + Security pillar evidence |
| Data classification record | L1 Context §2.2 |
| Incident response plan | L5 Operational specification |

## 7. Cross-references

**Patterns most often affected:**
- [Private Cloud — Hyperconverged](../patterns/private-cloud-hyperconverged.md), [Identity and Access Management](../patterns/identity-access-management.md), [Zero-Trust Network](../patterns/zero-trust-network.md), [Observability Platform](../patterns/observability-platform.md), [Backup and Cyber Recovery](../patterns/backup-cyber-recovery.md).

**Common stacking combinations:** ID-GOV + SUSTAIN; ID-GOV + AI.

## 8. Version history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | 2026-05 | Practice Compliance Lead | Initial issue |
| 1.1 | 2026-05 | Practice Compliance Lead | PP 71/2019 citation; Komdigi rename reflected |
