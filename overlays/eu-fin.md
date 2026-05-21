# Compliance Overlay — EU-FIN

> **Code:** EU-FIN · **Version:** 1.1 · **Status:** Active
> **Owner:** Practice Compliance Lead · **Last reviewed:** 2026-05

## 1. Applicable context

EU financial-services institutions and EU-linked operations of non-EU firms. Applies under DORA (Digital Operational Resilience Act) for financial entities and to their ICT third-party service providers. Stacks with [GLOBAL-CARD](global-card.md), [AI](ai.md), and [SUSTAIN](sustain.md) as relevant.

## 2. Mandate index

| # | Mandate | Source citation | Architectural implication |
| :-: | --- | --- | --- |
| 1 | Digital Operational Resilience Act | EU Regulation 2022/2554 (DORA) — applicable from 17 January 2025 | ICT risk management framework; resilience testing; incident reporting; third-party ICT risk; oversight of critical third parties |
| 2 | General Data Protection Regulation | EU Regulation 2016/679 (GDPR) | Personal data; data subject rights; transfer mechanisms; DPO designation; DPIA |
| 3 | NIS2 Directive | EU Directive 2022/2555 | Cybersecurity baseline for in-scope sectors including finance |
| 4 | EBA Guidelines | EBA outsourcing, ICT risk, security risk-management guidelines | Sector-specific extensions of DORA |
| 5 | MiCA (where applicable) | EU Regulation 2023/1114 | Crypto-asset service providers |

## 3. Pre-populated Restrictions

| R-ID | Statement | Citation | Waivable |
| --- | --- | --- | :---: |
| R-001 | DORA ICT risk management framework documented, with periodic review and senior-management ownership | DORA Article 6 | No |
| R-002 | Critical or important functions covered by Business Impact Analysis with documented recovery objectives | DORA Article 11 | No |
| R-003 | Threat-led penetration testing (TLPT) every 3 years for in-scope entities | DORA Article 26 | No |
| R-004 | ICT-related incident classification and reporting per DORA timelines | DORA Article 19 | No |
| R-005 | Register of ICT third-party arrangements; pre-contractual due diligence; exit strategies | DORA Articles 28-30 | No |
| R-006 | Personal data subject to GDPR — lawful basis, DPIA where required, international transfer mechanism (SCC, adequacy decision) | GDPR | Conditional |
| R-007 | NIS2 cybersecurity baseline implemented where in-scope | NIS2 | No |

## 4. Pillar floors

| Pillar | Floor | Rationale |
| --- | :---: | --- |
| Availability & Resilience | 4 | DORA operational resilience requirements |
| Security & Trust | 4 | DORA + NIS2 |
| Sovereignty & Compliance | 4 | GDPR + DORA third-party register |
| Adaptability & Portability | 3 | DORA exit-strategy requirement |
| Operability & Observability | 4 | DORA incident reporting timelines |

## 5. Default pillar weight presets

| Pillar | Suggested weight |
| --- | :---: |
| Availability & Resilience | 20 |
| Security & Trust | 18 |
| Sovereignty & Compliance | 16 |
| Operability & Observability | 14 |
| Adaptability & Portability | 10 |
| Performance & Scale | 8 |
| Cost & FinOps | 10 |
| Sustainability & GreenOps | 4 |
| **Total** | **100** |

## 6. Deliverable expectations

| Regulator-expected document | MOSAIC artifact |
| --- | --- |
| ICT risk management framework | L5 Operational specification + Calibrate scorecard |
| Business Impact Analysis | L1 Context + L2 Capability tier assignments + L5 RPO/RTO targets |
| Register of ICT third-party arrangements | CADRE R-restrictions register + Exposure dependencies |
| Exit strategy per critical third party | LLD §8 (second-implementation summary) + Operational lifecycle plan |
| ICT incident reports | L5 Operational specification §3 + alerting routing |
| Records of processing (GDPR Article 30) | L1 data classification + L3 integration flow inventory |

## 7. Cross-references

**Patterns most often affected:**
- [Disaster Recovery / Business Continuity](../patterns/disaster-recovery-bcp.md), [Backup and Cyber Recovery](../patterns/backup-cyber-recovery.md), [Identity and Access Management](../patterns/identity-access-management.md), [Zero-Trust Network](../patterns/zero-trust-network.md), [Observability Platform](../patterns/observability-platform.md).

**Common stacking combinations:** EU-FIN + GLOBAL-CARD; EU-FIN + AI; EU-FIN + SUSTAIN.

## 8. Version history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | 2026-05 | Practice Compliance Lead | DORA-applicable issue |
| 1.1 | 2026-05 | Practice Compliance Lead | Refresh; NIS2 included |
