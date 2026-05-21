# Low-Level Design (LLD) — <CLIENT NAME>

> **Phase:** 3 — Compose (and Commit) · **Layer covered:** L4 Physical
> **Version:** _N.M_ · **Date:** _YYYY-MM-DD_ · **Lead engineer:** _Name_
> **Status:** _Draft / Reviewed / Final_

This document binds the [HLD](../hld/hld-template.md)'s Logical patterns to **specific vendor products and configurations**. It is **version-specific and date-stamped** — vendor product offerings and supported configurations change continuously.

---

## 1. Implementation matrix

For each Pattern selected in the HLD, the chosen Implementation.

| Pattern (from HLD) | Implementation chosen | Version | Vendor SE contact | L3 ADR | L4 ADR |
| --- | --- | --- | --- | --- | --- |
| | | | | ADR-NNNN | ADR-NNNN |

> **Principle:** Implementation choice is driven by skill availability, existing licensing, ecosystem fit, and commercial terms — not by architecture quality, which the pattern selection has already addressed.

## 2. Bill of materials

> _The complete BoM with SKUs, versions, quantities, support terms. May be maintained as a separate spreadsheet linked here; include the canonical summary version below._

| Line | Component | SKU / part number | Version | Quantity | Support term | Unit cost | Line cost |
| :-: | --- | --- | --- | :---: | --- | --- | --- |
| 1 | | | | | | | |
| | **Total** | | | | | | |

## 3. Sizing

> _Per workload class, the calculated capacity requirements with the headroom assumption stated._

| Workload class | CPU (vCPU) | Memory (GiB) | Storage (TiB) | Network (Gbps) | Headroom | Source |
| --- | :---: | :---: | :---: | :---: | :---: | --- |
| | | | | | | |

## 4. Deployment topology

> _Diagram(s) showing physical placement, network connectivity, fault domain layout, and inter-site links. Use vendor-specific notation where it aids the implementer._

## 5. IP and naming plan

| Subnet / CIDR | Purpose | VLAN | Site | Sovereignty zone |
| --- | --- | --- | --- | --- |
| | | | | |

Naming convention: _document the rule, e.g., `<env>-<site>-<role>-<NN>`_.

## 6. Configuration baselines

For each major component, the configuration baseline. May be templates, hardening guides, or references to managed-as-code repositories.

| Component | Baseline reference | Owner |
| --- | --- | --- |
| | | |

## 7. Integration specifications

For each integration (from HLD §4.3 flows), the implementation detail.

| Flow ID (HLD) | Source endpoint | Sink endpoint | Protocol / port | Auth mechanism | Cert / KMS reference | Owner |
| --- | --- | --- | --- | --- | --- | --- |
| F-001 | | | | | | |

## 8. Fallback / second-implementation summary

> _If R-005 (or equivalent) requires multiple validated implementations, summarize the secondary implementation here at a level sufficient to demonstrate it is real and could be exercised. Detail can live in an appendix._

| Aspect | Primary implementation | Secondary implementation |
| --- | --- | --- |
| Compute / platform | | |
| Storage | | |
| Networking | | |
| DR mechanism | | |
| Estimated cost delta | baseline | |
| Estimated cutover time | | |

## 9. Open items

-

---

## Revision history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 0.1 | YYYY-MM-DD | | Initial draft |
| 1.0 | YYYY-MM-DD | | Commit baseline |
