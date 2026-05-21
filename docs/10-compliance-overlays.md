# 10. Compliance Overlays

Compliance overlays are **pluggable modules** that extend the framework with regulatory mandates without modifying its core. Each overlay snaps onto an engagement at Frame and:

- Pre-populates the **R (Restrictions)** register with mandatory clauses.
- Defines **minimum acceptable scores** on the affected quality pillars.
- Adds **overlay-specific deliverable expectations**.

Overlays exist because the same architectural problem produces materially different correct answers depending on the regulatory environment. A core-banking architecture in Indonesia under OJK is not the same as one in Singapore under MAS or one in Europe under DORA, even when the technology and workload are identical. Overlays let the framework serve all three contexts with **consistent vocabulary**.

## 10.1 Overlay inventory

The current catalog includes the following modules. Each is maintained as a separate document in [`overlays/`](../overlays/) referencing the relevant regulator publications and updated when those publications are revised.

| Overlay | Applicable context | Primary mandates |
| --- | --- | --- |
| **ID-FSI** | Indonesia financial services | POJK 11/POJK.03/2022 (IT for Commercial Banks); UU 27/2022 (Personal Data Protection); Bank Indonesia payment-system regulations; BIFast technical standards; PP 71/2019 (Electronic Systems and Transactions). |
| **ID-GOV** | Indonesia government and SOE | PP 71/2019; BSSN cybersecurity guidance; Komdigi (Kementerian Komunikasi dan Digital, formerly Kominfo) electronic-system operator registration. |
| **ASEAN-FSI** | ASEAN financial services (non-Indonesia) | MAS TRM Guidelines (Singapore); BNM RMiT (Malaysia); BSP Circular 982 and 1019 (Philippines); Bank of Thailand IT Risk regulations. |
| **GLOBAL-CARD** | Payment-card processing | PCI-DSS v4.0.1; PCI PIN Security; EMVCo specifications. |
| **EU-FIN** | EU financial services and EU-linked operations | DORA; GDPR; NIS2 Directive; EBA guidelines. |
| **HC** | Healthcare | ISO 27799; sector-specific instruments (HIPAA, NHS DSPT, ASEAN local health-data regulations). |
| **AI** | AI and machine-learning workloads | NIST AI Risk Management Framework; EU AI Act; ISO/IEC 42001 AI management systems; sector-specific AI guidelines. |
| **SUSTAIN** | ESG and sustainability reporting | CSRD (EU); ISSB IFRS S1 and S2; local Indonesian sustainability disclosure requirements. |

## 10.2 Overlay structure

Each overlay contains four sections:

- **Mandate index.** Numbered list of regulatory clauses, each cited to the source publication, with a one-sentence summary of the architectural implication.
- **Pre-populated Restrictions.** Ready-to-load R-register entries that translate the mandates into framework-compatible form. Architects load these into the engagement CADRE register at Capture and mark each as applicable or not.
- **Pillar floors.** Minimum acceptable maturity scores on the pillars the overlay primarily affects. For example, the ID-FSI overlay requires `Sovereignty ≥ 4`, `Security ≥ 4`, and `Availability ≥ 4`; designs that score below these floors fail Calibrate and must be remediated before Commit.
- **Deliverable expectations.** Documents the regulator expects to see, with mapping to standard MOSAIC artifacts.

A blank template lives at [`overlays/_template/overlay-template.md`](../overlays/_template/overlay-template.md).

## 10.3 Worked overlay — ID-FSI

The structure of the **ID-FSI** overlay's mandate-to-Restriction mapping:

| Mandate | Architectural implication | Restriction entry |
| --- | --- | --- |
| POJK 11/2022, Article on IT Continuity | Tier-1 services require documented BCP, tested DR, and submission of continuity plan to OJK. | **R-001:** Tier-1 services must satisfy documented RPO ≤ 15 min, RTO ≤ 1 hr, with annual DR test report submitted to OJK. |
| UU 27/2022 PDP, articles on PII residency | Personal data of Indonesian data subjects must remain in Indonesian jurisdiction unless explicit consent or regulator approval is in place. | **R-002:** All PII data flows must terminate in Indonesian jurisdiction; cross-border processing requires regulator notification. |
| POJK 11/2022, IT outsourcing requirements | Third-party cloud or managed services require risk assessment, contractual safeguards, and OJK notification for material outsourcing. | **R-005:** Material third-party arrangements require completed risk assessment, contract review, and pre-implementation OJK notification. |
| BI BIFast technical standards | Payment systems infrastructure must comply with BI-specified availability, latency, and interoperability standards. | **R-008:** Payment-system components must meet BI BIFast latency budgets and availability targets specified in the current technical standard. |

**ID-FSI default pillar floors:**

- Sovereignty & Compliance ≥ 4
- Security & Trust ≥ 4
- Availability & Resilience ≥ 4
- Operability & Observability ≥ 3

Full overlay content is in [`overlays/id-fsi.md`](../overlays/id-fsi.md).

## 10.4 Overlay maintenance

Overlays are maintained by the practice's **Compliance Lead** with input from sector specialists. Each overlay is reviewed **annually** and **on any material change** to the underlying regulatory publication. Overlay version history is maintained separately from the core framework version history.

An engagement **records which overlay versions were applied at Frame**, ensuring it can be audited against the regulatory environment in force at the time of decision-making, not against current regulations.
