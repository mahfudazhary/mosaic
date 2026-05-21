# Compliance Overlay — ID-FSI

> **Code:** ID-FSI · **Version:** 1.1 · **Status:** Active
> **Owner:** Practice Compliance Lead · **Last reviewed:** 2026-05
> **Source review cadence:** Annual + on OJK / BI / Komdigi publication change

## 1. Applicable context

Indonesian financial-services institutions regulated by Otoritas Jasa Keuangan (OJK), Bank Indonesia (BI), and where applicable Komdigi (Kementerian Komunikasi dan Digital, formerly Kominfo). Covers commercial banks (all KBMI tiers), insurance, multifinance, capital markets, and fintech entities under OJK supervision.

Stacks naturally with [GLOBAL-CARD](global-card.md) for payment-card processing and with [AI](ai.md) for AI-powered banking use cases.

## 2. Mandate index

| # | Mandate | Source citation | Architectural implication |
| :-: | --- | --- | --- |
| 1 | IT Risk Management for Commercial Banks | POJK 11/POJK.03/2022 | Tier-1 services require documented BCP, tested DR, ITRM submission to OJK |
| 2 | IT Outsourcing requirements | POJK 11/POJK.03/2022 | Material third-party arrangements require risk assessment, contract review, and OJK notification |
| 3 | Personal Data Protection Law | UU 27/2022 (UU PDP) | PII of Indonesian data subjects must remain onshore unless explicit consent or regulator approval; data controller obligations apply |
| 4 | Electronic Systems and Transactions | PP 71/2019 (supersedes PP 82/2012) | Electronic system operator obligations including data residency for public/strategic services |
| 5 | BIFast Technical Standards | Bank Indonesia (current standard) | Payment systems must meet BI-specified availability, latency, interoperability |
| 6 | Commercial bank classification | POJK 12/POJK.03/2021 | KBMI tier drives certain capital and operational expectations (replaced BUKU 2021) |
| 7 | Cybersecurity supervision | OJK cybersecurity guidance (annual circulars) | Continuous control monitoring; incident reporting; vulnerability management |

## 3. Pre-populated Restrictions

Load into the engagement [CADRE register](../templates/cadre-register/cadre-register.md). Mark each applicable or `Not applicable — <reason>`.

| R-ID | Statement | Subcategory | Citation | Waivable |
| --- | --- | --- | --- | :---: |
| R-001 | Tier-1 services must satisfy documented RPO ≤ 15 min, RTO ≤ 1 hr, with annual DR test report submitted to OJK | Compliance mandate | POJK 11/2022 | No |
| R-002 | All PII data flows of Indonesian data subjects must terminate in Indonesian jurisdiction; cross-border processing requires regulator notification or explicit subject consent | Compliance mandate | UU 27/2022 PDP | Conditional |
| R-003 | Material third-party / cloud arrangements require completed risk assessment, contract review, and pre-implementation OJK notification | Compliance mandate | POJK 11/2022 IT outsourcing | No |
| R-004 | Electronic system operator registration with Komdigi required for in-scope systems | Compliance mandate | PP 71/2019 | No |
| R-005 | Payment-system components must meet BI BIFast latency budgets and availability targets specified in the current technical standard | Compliance mandate | BI BIFast | No |
| R-006 | Incident reporting to OJK within prescribed timeframes; CSIRT designation; control of cyber-event communications | Compliance mandate | OJK cybersecurity guidance | No |
| R-007 | Cryptographic controls for data at rest and in transit; documented key management and rotation policy | Compliance mandate | POJK 11/2022 | No |
| R-008 | All privileged access subject to PAM brokerage with session recording; audit trail retained per OJK retention | Compliance mandate | POJK 11/2022 | No |

## 4. Pillar floors

| Pillar | Floor (1–5) | Rationale |
| --- | :---: | --- |
| Sovereignty & Compliance | 4 | UU PDP and OJK supervision require optimized-level practices |
| Security & Trust | 4 | OJK ITRM, KMS/PAM expectations |
| Availability & Resilience | 4 | Tier-1 RPO/RTO and DR test reporting |
| Operability & Observability | 3 | Audit-trail and incident-reporting needs |

## 5. Default pillar weight presets

| Pillar | Suggested weight |
| --- | :---: |
| Availability & Resilience | 18 |
| Performance & Scale | 10 |
| Security & Trust | 18 |
| Operability & Observability | 12 |
| Cost & FinOps | 10 |
| Sustainability & GreenOps | 4 |
| Sovereignty & Compliance | 20 |
| Adaptability & Portability | 8 |
| **Total** | **100** |

## 6. Deliverable expectations

| Regulator-expected document | MOSAIC artifact |
| --- | --- |
| OJK ITRM annual submission | L5 Operational specification + L4 BoM + Exposure register |
| BCP / DR documentation | L5 Operational specification §3 (runbooks) + DR test report |
| Personal Data Protection record of processing | L1 Context §2.2 (data classification) + L3 integration flow inventory |
| Third-party risk assessment file | CADRE register R-restrictions + Exposure register entries |
| Incident response plan | L5 Operational specification §3 + §4.2 alerting |
| Annual DR test report | L5 lifecycle plan + DR test runbook outcomes |
| Cybersecurity self-assessment | Calibrate scorecard (Security pillar evidence) + Exposure register |

## 7. Cross-references

**Patterns most often affected:**
- [Private Cloud — Hyperconverged](../patterns/private-cloud-hyperconverged.md)
- [Disaster Recovery / Business Continuity](../patterns/disaster-recovery-bcp.md)
- [Backup and Cyber Recovery](../patterns/backup-cyber-recovery.md)
- [Identity and Access Management](../patterns/identity-access-management.md)
- [Zero-Trust Network](../patterns/zero-trust-network.md)
- [Observability Platform](../patterns/observability-platform.md)

**Common stacking combinations:**
- ID-FSI + GLOBAL-CARD — bank with card processing
- ID-FSI + AI — bank deploying AI for credit, fraud, or customer-engagement use cases
- ID-FSI + SUSTAIN — KBMI 3/4 banks with public ESG disclosure obligations

## 8. Version history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | 2026-05 | Practice Compliance Lead | Initial issue, aligned to MOSAIC framework v1.1 |
| 1.1 | 2026-05 | Practice Compliance Lead | Citations refreshed: PP 71/2019 supersedes PP 82/2012; KBMI replaces BUKU; Komdigi replaces Kominfo |
