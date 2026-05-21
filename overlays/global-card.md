# Compliance Overlay — GLOBAL-CARD

> **Code:** GLOBAL-CARD · **Version:** 1.1 · **Status:** Active
> **Owner:** Practice Compliance Lead · **Last reviewed:** 2026-05

## 1. Applicable context

Any architecture that stores, processes, or transmits cardholder data (CHD) or sensitive authentication data (SAD), or that connects to systems that do. Stacks with [ID-FSI](id-fsi.md), [ASEAN-FSI](asean-fsi.md), or [EU-FIN](eu-fin.md) depending on the issuing geography.

## 2. Mandate index

| # | Mandate | Source citation | Architectural implication |
| :-: | --- | --- | --- |
| 1 | Payment Card Industry Data Security Standard | PCI-DSS v4.0.1 | Comprehensive control set across all 12 PCI-DSS requirement areas |
| 2 | PCI PIN Security | PCI PIN Security Requirements | Specific to PIN handling |
| 3 | EMV specifications | EMVCo | Chip-card technical interoperability |
| 4 | Card-scheme operating rules | Per scheme-specific operating rules of the major payment-card schemes | Scheme-specific obligations layered on PCI-DSS |

## 3. Pre-populated Restrictions

| R-ID | Statement | Citation | Waivable |
| --- | --- | --- | :---: |
| R-001 | Network segmentation isolates the cardholder data environment (CDE); explicit traffic flow inventory maintained | PCI-DSS Req 1 | No |
| R-002 | No storage of full track data, CVV/CVC, or PIN/PIN block after authorization | PCI-DSS Req 3.2 | No |
| R-003 | Strong cryptography for storage and transmission of CHD; documented key management | PCI-DSS Req 3, 4 | No |
| R-004 | MFA required for all non-console administrative access into the CDE; all remote access into the CDE | PCI-DSS Req 8.4, 8.5 | No |
| R-005 | Logging of all access to CHD and to systems in the CDE; daily log review; retention ≥ 1 year (3 months immediately accessible) | PCI-DSS Req 10 | No |
| R-006 | Vulnerability management — quarterly internal and external scans; annual penetration test; ASV-attested external scans | PCI-DSS Req 11 | No |
| R-007 | Documented incident response plan with annual test | PCI-DSS Req 12.10 | No |
| R-008 | Service provider obligations: written agreement, due diligence, monitoring of PCI compliance | PCI-DSS Req 12.8 | No |

## 4. Pillar floors

| Pillar | Floor | Rationale |
| --- | :---: | --- |
| Security & Trust | 4 | PCI-DSS is fundamentally a security framework |
| Operability & Observability | 4 | Logging, monitoring, and incident response requirements |
| Availability & Resilience | 3 | Indirect via incident response and BCP |
| Sovereignty & Compliance | 3–4 | Driven by stacked jurisdictional overlay |

## 5. Default pillar weight presets

If GLOBAL-CARD is the dominant overlay (rare — usually stacked):

| Pillar | Suggested weight |
| --- | :---: |
| Security & Trust | 26 |
| Operability & Observability | 18 |
| Availability & Resilience | 14 |
| Sovereignty & Compliance | 14 |
| Cost & FinOps | 10 |
| Performance & Scale | 8 |
| Adaptability & Portability | 6 |
| Sustainability & GreenOps | 4 |
| **Total** | **100** |

## 6. Deliverable expectations

| Regulator-expected document | MOSAIC artifact |
| --- | --- |
| Report on Compliance (RoC) or Self-Assessment Questionnaire (SAQ) | Calibrate scorecard + Security/Operability evidence + L1 scope documentation |
| Scope diagram (CDE, connected systems, out-of-scope segments) | L3 logical topology + L1 scope boundary |
| Cardholder data flow diagram | L3 integration flows |
| ASV scan reports | Operational artifacts (linked from L5) |
| Penetration test report | Operational artifacts (linked from L5) |
| Incident response plan | L5 Operational specification §3 |

## 7. Cross-references

**Patterns most often affected:**
- [Zero-Trust Network](../patterns/zero-trust-network.md) — segmentation and encryption.
- [Identity and Access Management](../patterns/identity-access-management.md) — MFA, PAM.
- [Observability Platform](../patterns/observability-platform.md) — logging coverage and retention.
- [Backup and Cyber Recovery](../patterns/backup-cyber-recovery.md) — backup of in-scope systems.

**Common stacking combinations:** GLOBAL-CARD + ID-FSI / ASEAN-FSI / EU-FIN.

## 8. Version history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | 2026-05 | Practice Compliance Lead | Aligned to PCI-DSS v4.0.1 |
| 1.1 | 2026-05 | Practice Compliance Lead | Editorial refresh |
