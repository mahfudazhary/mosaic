# ADR-0001 — Adopt overlay networking for east-west traffic between security zones

| Field | Value |
| --- | --- |
| **Status** | Accepted |
| **Layer** | L3 |
| **Date** | 2026-03-14 |
| **Authors** | A. Lead Architect |
| **Reviewers** | B. Network Lead, C. CISO Delegate |

---

## CADRE Trace

- **Context:** C-002 (current network is flat VLAN per DC; segmentation is firewall-only and operationally expensive).
- **Demands:** D-004 (workload-to-workload traffic must be encrypted), D-006 (policy changes must propagate within 5 minutes).
- **Restrictions:** R-001 (zero-trust posture mandated by client architecture board), R-007 (no per-host agent on hypervisor management plane).
- **Exposure:** E-004 (east-west compromise blast radius), E-009 (network policy drift between primary and DR sites).

## Problem

The current network is segmented only at perimeter firewalls; intra-zone east-west traffic is unencrypted and unfiltered. R-001 requires zero-trust segmentation across the estate. Three options for the east-west fabric were evaluated against the L2 capability "service-to-service segmentation with central policy."

## Options Considered

### Option A — Continue firewall-based segmentation with finer VLAN division
Lowest disruption, no new product to operate. Fails to satisfy R-001 (no encryption at L2 between hosts on the same VLAN) and adds operational toil (VLAN proliferation, change-control overhead). Estimated 6–8 month roll-out per zone.

### Option B — Overlay networking with software-defined segmentation, encrypted by default
Satisfies R-001 (per-flow encryption and identity-aware policy). Compatible with multiple implementations (hypervisor-native segmentation, network-fabric segmentation, container-native segmentation, eBPF segmentation). Adds a new operational surface but consolidates segmentation policy into one control plane. Requires uplift in operator skills.

### Option C — Per-host agent micro-segmentation
Satisfies R-001. Highest control granularity. Violates R-007 (no agents on hypervisor management plane) and would require carve-out negotiation with CISO. Higher cost on a per-workload basis.

## Quality Impact

Delta against status quo (firewall-only segmentation), scored −5 to +5.

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | −1 | +4 | +2 | −1 | 0 | +1 | +2 |

## Decision

**Adopt Option B — overlay networking with software-defined segmentation.**

This option uniquely satisfies R-001 within R-007 and significantly improves the Security pillar (the engagement's third-highest weight). The −1 Performance impact (encryption overhead) is acceptable given current headroom and is mitigated by hardware-offload-capable NICs. The +2 Adaptability impact reflects compatibility with multiple implementations — Implementation selection deferred to a Layer-4 ADR.

## Consequences

**Positive:**
- Zero-trust east-west posture achieved end-to-end.
- Policy is centrally managed and version-controlled, eliminating drift (closes E-009).
- Reduces firewall rulebase size by ~60% (operational simplification).

**Negative:**
- New operational surface; team requires training (2–4 person-weeks).
- Encryption overhead consumes ~2% CPU per hypervisor under peak load (within headroom).
- Initial license and rollout cost: estimated IDR 4.8 billion over 18 months.

**Follow-up actions:**

| Action | Owner | Target date |
| --- | --- | --- |
| Implementation selection (Layer-4 ADR) | A. Lead Architect | 2026-04-15 |
| Operator training plan | B. Network Lead | 2026-04-30 |
| Performance validation with encryption enabled | Performance Engineering | 2026-06-01 |

## Validation

- **Success measure:** 100% of east-west traffic between security zones flows over the overlay with policy enforced and encryption enabled, measured continuously via the observability platform. Policy change propagation ≤ 5 min P95 (closes D-006).
- **Review trigger:** any change to R-001 (zero-trust mandate) or R-007 (agent-on-hypervisor restriction); any vendor change to the selected Implementation that materially affects feature parity.

---

## Revision history

| Date | Status change | Author | Notes |
| --- | --- | --- | --- |
| 2026-03-04 | Proposed | A. Lead Architect | Initial draft after Compose iteration 2 |
| 2026-03-14 | Accepted | A. Lead Architect | Sign-off by Network Lead and CISO Delegate |
