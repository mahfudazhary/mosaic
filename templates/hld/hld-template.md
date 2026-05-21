# High-Level Design (HLD) — <CLIENT NAME>

> **Phase:** 3 — Compose · **Layers covered:** L1 Context, L2 Capability, L3 Logical
> **Version:** _N.M_ · **Date:** _YYYY-MM-DD_ · **Lead architect:** _Name_
> **Status:** _Draft / Iteration N / Reviewed / Final_

This document is the **architecture in the abstract**. It is vendor-neutral at L3. The product-level realization lives in the [LLD](../lld/lld-template.md).

---

## 1. Engagement context

Brief recap from the [engagement charter](../engagement-charter/engagement-charter.md):

- **Primary outcome:** _..._
- **In-scope:** _..._
- **Compliance overlays:** _..._
- **Pillar weights:** _..._

## 2. Layer 1 — Context (refined)

### 2.1 Stakeholder map (working-level extension of the executive matrix)

| Name | Role | Responsibilities | Decision rights |
| --- | --- | --- | --- |
| | | | |

### 2.2 Scope boundary

**Estate scope:**
-

**Geographic scope:**
-

**Sovereignty boundary:** _Where data and processing may reside. Cite jurisdictional limits._

### 2.3 Data classification taxonomy

| Class | Examples | Handling rules |
| --- | --- | --- |
| Public | | |
| Internal | | |
| Confidential | | |
| Restricted | | |

### 2.4 Regulatory posture

| Mandate | Source | Applicable scope | Restriction ID |
| --- | --- | --- | --- |
| _e.g., POJK 11/2022 ITRM_ | OJK | Tier-1 services | R-001 |

## 3. Layer 2 — Capability

### 3.1 Capability map

> _Hierarchical decomposition of business and technical capabilities. Use a diagram if available; otherwise a nested list._

- Compute & platform
  - …
- Data & storage
  - …
- Network & security
  - …
- Operations & observability
  - …

### 3.2 Service catalog

| Capability ID | Capability | Service consumed | In scope? |
| --- | --- | --- | :---: |
| CAP-001 | | | |

### 3.3 Integration scope

External systems, applications, or services that integrate with the architecture.

| ID | System | Interface type | Direction | Owner |
| --- | --- | --- | --- | --- |
| INT-001 | | | | |

## 4. Layer 3 — Logical

### 4.1 Pattern selection matrix

| Capability group | Pattern (from [Pattern Library](../../patterns/)) | ADR | Rationale |
| --- | --- | --- | --- |
| Compute & platform | | ADR-NNNN | |
| Data & storage | | ADR-NNNN | |
| Network & security | | ADR-NNNN | |
| Operations & observability | | ADR-NNNN | |

### 4.2 Logical topology

> _Diagram or narrative describing the placement of components into security zones, fault domains, and sovereignty boundaries. Vendor-neutral notation._

### 4.3 Integration flows

> _For each significant flow: source, sink, protocol class, data classification, encryption posture, identity posture._

| Flow | Source | Sink | Protocol class | Data class | Encryption | Identity |
| --- | --- | --- | --- | --- | --- | --- |
| F-001 | | | | | | |

### 4.4 Technology-class mapping

| Decision area | Class chosen | Class rejected | ADR |
| --- | --- | --- | --- |
| _e.g., compute platform_ | HCI | Disaggregated | ADR-NNNN |
| _e.g., east-west fabric_ | Overlay SDN | VLAN + firewall | ADR-NNNN |

## 5. Traceability matrix

> Forward traceability from Strategy through Logical. Every Strategy outcome must trace to at least one Capability, and every Capability to at least one Pattern.

| Strategy outcome | Capability | Pattern | ADR(s) |
| --- | --- | --- | --- |
| | | | |

## 6. Open items for L4 / LLD

> _Decisions deferred to the LLD (Layer 4). Each becomes an L4 ADR._

-

---

## Revision history

| Version | Date | Iteration | Author | Notes |
| :-: | --- | --- | --- | --- |
| 0.1 | YYYY-MM-DD | 1 | | Initial draft |
| 0.2 | YYYY-MM-DD | 2 | | After review feedback |
| 1.0 | YYYY-MM-DD | Final | | Calibrate-ready |
