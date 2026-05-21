# High-Level Design — Bank Sejahtera (condensed)

> **Phase:** 3 — Compose · **Iteration:** Final · **Version:** 1.0 · **Date:** 2026-05-15
> **Lead architect:** A. Lead Architect · **Layers covered:** L1, L2, L3

This is the condensed worked-example HLD. The Layer-4 binding lives in a separate LLD; the example documents only the L3 implementation matrix here.

---

## 1. Engagement context (recap from charter)

- **Primary outcome:** modernize core-banking infrastructure; reduce single-vendor concentration risk; foundation for five-year growth.
- **In-scope:** core-banking workload on Jakarta-primary + Surabaya-DR estate.
- **Compliance overlays:** ID-FSI v1.1.
- **Pillar weights:** Sovereignty 20, Availability 18, Security 18, Operability 12, Performance 10, Cost 10, Adaptability 8, Sustainability 4.

## 2. Layer 1 — Context (refined)

### 2.1 Stakeholder map (working-level)

| Name | Role | Responsibilities |
| --- | --- | --- |
| Ibu Sari | CIO, Executive Sponsor | Engagement go/no-go |
| Pak Budi | CISO | Security architecture veto |
| Pak Dedi | Head of IT Risk | Continuity sign-off |
| Pak Eko | CFO delegate | TCO model, budget |
| Bu Rina | Head of Infra Ops | Day-2 readiness |
| Pak Joko | Network Lead | Inter-DC connectivity |
| Pak Hadi | Identity Lead | IAM + PAM integration |

### 2.2 Scope boundary

- **Estate scope:** two data centers — Jakarta primary (active), Surabaya secondary (transitioning from passive DR to active-secondary).
- **Sovereignty boundary:** all components within Indonesian jurisdiction. No cross-border data flow except for vendor telemetry, which is anonymized at source.

### 2.3 Data classification

| Class | Examples | Handling rules |
| --- | --- | --- |
| Public | Marketing content, public-rate cards | No special restriction |
| Internal | Procedures, ops documentation | Internal-network only |
| Confidential | Customer onboarding, transaction history (non-PII fields) | Encrypted at rest and in transit; least-privilege access |
| Restricted | PII, credentials, card data | Onshore only; tokenization where supported; full audit |

PII is classified Confidential or Restricted depending on field combination (NIK alone → Confidential; NIK + transaction → Restricted).

### 2.4 Regulatory posture

| Mandate | Source | In-scope coverage | Restriction ID |
| --- | --- | --- | --- |
| POJK 11/2022 ITRM | OJK | Tier-1 services | R-001 |
| UU 27/2022 PDP | National | All PII flows | R-002 |
| BI BIFast | BI | Payment system integration | (dependency, not in-scope build) |

## 3. Layer 2 — Capability

### 3.1 Capability map (in-scope only)

- **Compute & platform**
  - Virtualized compute pool (mixed VM + container)
  - Stretched-cluster failover orchestration
  - Container runtime for selected modernized services
  - Lifecycle management (patch, upgrade, retire)
- **Data & storage**
  - Distributed storage with cross-site replication
  - Snapshot and point-in-time recovery
  - Immutable backup repository
- **Network & security**
  - Zone-aware east-west segmentation
  - Centralized identity with PAM brokerage
  - Encrypted inter-DC fabric
- **Operations & observability**
  - Unified observability (logs, metrics, traces)
  - Runbook-driven incident response

Twelve capabilities total. Eight in scope; four out of scope (served by existing systems).

### 3.2 Service catalog (in scope)

| Capability ID | Capability | Tier |
| --- | --- | --- |
| CAP-001 | Virtualized compute (VM) | 1 |
| CAP-002 | Container runtime | 2 |
| CAP-003 | Distributed storage | 1 |
| CAP-004 | Cross-site replication | 1 |
| CAP-005 | Immutable backup | 1 |
| CAP-006 | Zone segmentation | 1 |
| CAP-007 | Centralized identity + PAM | 1 |
| CAP-008 | Unified observability | 2 |

### 3.3 Integration scope

| ID | System | Interface | Direction | Owner |
| --- | --- | --- | --- | --- |
| INT-001 | BI BIFast endpoint | TLS to BI gateway | Bi-directional | Payments team (out of scope) |
| INT-002 | Core banking application | SAN/NAS today; converged storage post-cutover | Internal | App team |
| INT-003 | Digital-channel platform | API gateway (existing) | Bi-directional | Channels team (out of scope) |
| INT-004 | OJK reporting | Outbound SFTP to OJK | Outbound | Compliance Director |

## 4. Layer 3 — Logical

### 4.1 Pattern selection matrix

| Capability group | Pattern | L3 ADR | Rationale |
| --- | --- | --- | --- |
| Compute & platform | [Private Cloud — Hyperconverged](../../patterns/private-cloud-hyperconverged.md) (stretched-cluster variant) | ADR-0014 | Satisfies D-001, D-002, D-005. Two validated implementations available. Best-fit pillar profile for engagement weights. |
| Data & storage | Distributed storage with synchronous metro replication + asynchronous long-haul backup to encrypted object storage | ADR-0016 | Satisfies D-001, D-002; supports backup-isolation implied by R-001 |
| Network & security | [Zero-Trust Network](../../patterns/zero-trust-network.md) — overlay segmentation; [IAM](../../patterns/identity-access-management.md) — central identity with PAM | ADR-0011, ADR-0012 | Satisfies D-004 and CISO principle; implementation-agnostic at L3 |
| Operations & observability | [Observability Platform](../../patterns/observability-platform.md) — unified L/M/T; runbook-driven automation; centralized lifecycle | ADR-0019 | Satisfies D-006; pattern-level choice does not bind to a specific stack |
| DR / continuity | [Disaster Recovery / Business Continuity](../../patterns/disaster-recovery-bcp.md) — active-active stretched + orchestrated failover | ADR-0014 (combined with compute) | Driven by R-001 and D-001/D-002 |
| Backup | [Backup and Cyber Recovery](../../patterns/backup-cyber-recovery.md) — immutable repo + isolated recovery | ADR-0021 | Mitigates E-005 |

### 4.2 Logical topology

```
                   ┌─────────────────────────────────────────────────────────┐
                   │            Witness — third site (cloud-region neutral)   │
                   └────────────────────────────┬────────────────────────────┘
                                                │ quorum
                ┌───────────────────────────────┼───────────────────────────────┐
                │                               │                               │
   ┌────────────▼────────────┐  encrypted   ┌───▼─────────────────────────┐
   │  Jakarta — primary DC   │ ◄──────────► │  Surabaya — active-secondary │
   │  HCI cluster (stretched)│ <100km metro │  HCI cluster (stretched)     │
   │  Identity + PAM         │              │  Identity + PAM (replica)    │
   │  Observability primary  │              │  Observability secondary     │
   │  Immutable backup R/W   │              │  Immutable backup mirror     │
   └─────────────────────────┘              └──────────────────────────────┘
```

Sovereignty boundary: both DCs and witness within Indonesian jurisdiction. Witness candidate locations: third-party Indonesian colo (recommended) or BSSN-listed cloud region.

### 4.3 Integration flows (selected)

| Flow | Source | Sink | Protocol class | Data class | Encryption | Identity |
| --- | --- | --- | --- | --- | --- | --- |
| F-001 | Core banking app | Storage layer | Block storage | Restricted (transaction + PII) | At-rest + replicated; in-transit on intra-cluster fabric | Service identity |
| F-002 | Core banking app | BI BIFast | TLS API | Restricted | TLS 1.3 | Mutual-TLS + scheme cert |
| F-003 | Operator → Mgmt plane | Cluster management UI/API | TLS API via PAM broker | Internal | TLS 1.3 + session recording | MFA + PAM credential |
| F-004 | Backup engine | Immutable repo | Object storage with Object Lock | Restricted | Encrypted | Service identity, KMS key |

### 4.4 Technology-class mapping (selected)

| Decision area | Class chosen | Class rejected | ADR |
| --- | --- | --- | --- |
| Compute platform | HCI stretched | Disaggregated; single-site + backup-DR | ADR-0014 |
| East-west fabric | Overlay SDN | VLAN + firewall; per-host agent | ADR-0011 |
| Backup posture | Immutable repo + isolated cyber-recovery vault | Replicated backup only | ADR-0021 |
| Identity | Central directory + federated SaaS + PAM broker | Per-system local accounts | ADR-0012 |

### 4.5 L3 implementation matrix

| Aspect                  | Implementation A — Incumbent HCI (continue) | Implementation B — Alternative HCI (displace) |
| ---                     | ---                                          | ---                                            |
| Compute/platform        | Current major release of the incumbent HCI stack with stretched-cluster storage; vendor-native overlay segmentation | Current major release of the alternative HCI stack with metro-availability variant; vendor-native overlay segmentation |
| DR mechanism            | Incumbent stretched cluster (synchronous between sites) + platform-native DR orchestration for orchestrated failover | Alternative platform metro availability (synchronous) + platform-native protection-policy orchestration |
| Container support       | Incumbent HCI's bundled Kubernetes service on the same HCI instance | Alternative HCI's bundled Kubernetes service on the same HCI cluster |
| Initial CapEx           | IDR 128 billion (hardware refresh + license uplift) | IDR 134 billion (hardware refresh + license + skill transition allowance) |
| Steady-state OpEx       | IDR 36 billion/year (incumbent vendor subscription + support) | IDR 31 billion/year (alternative vendor subscription + support) |
| Skill alignment         | Strong (current operations team trained on incumbent hypervisor) | Moderate (cross-training required; partially mitigates E-002) |
| Vendor concentration    | Single-vendor dependency on the incumbent (E-001 high residual) | Single-vendor dependency on the alternative (E-001 reduced) |

## 5. Traceability matrix (selected)

| Strategy outcome | Capability | Pattern | ADRs |
| --- | --- | --- | --- |
| Reduce concentration risk | CAP-001, CAP-003 | HCI (multi-implementation) | ADR-0014 |
| Meet evolving regulatory expectations | CAP-006, CAP-007, CAP-008 | Zero-Trust + IAM + Observability | ADR-0011, ADR-0012, ADR-0019 |
| Foundation for five-year growth | CAP-001, CAP-002, CAP-004 | HCI + Container + Replication | ADR-0014 |

## 6. Open items for L4 / LLD

- Final implementation selection between incumbent HCI stretched cluster and alternative HCI metro-availability variant (recorded in ADR-0014; LLD ADR confirms binding).
- Witness placement (ADR-0015).
- Inter-site network capacity decision (ADR-0017).
- Observability stack choice (ADR-0019; L4 binding deferred).
- Identity store consolidation plan (separate workstream ADR series).

---

## Revision history

| Version | Date | Iteration | Author | Notes |
| :-: | --- | :-: | --- | --- |
| 0.4 | 2026-04-08 | 1 | A. Lead Architect | Initial draft |
| 0.7 | 2026-04-29 | 2 | A. Lead Architect | After stakeholder review; flow inventory expanded |
| 1.0 | 2026-05-15 | Final | A. Lead Architect | Calibrate-ready |
