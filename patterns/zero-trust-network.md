# Pattern — Zero-Trust Network

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

Identity-aware segmentation and encryption across the estate, replacing perimeter-based network security with policy enforced at every flow. Covers east-west microsegmentation, north-south access brokerage, and remote-user access (ZTNA).

## 2. Applicable contexts

**Use this pattern when:**
- The client has a stated zero-trust mandate (architectural principle).
- East-west blast radius from lateral movement is on the threat model.
- Regulatory requirements demand encryption-in-transit between segments (PCI, HIPAA, financial regulators).
- The estate spans on-prem, multi-cloud, and SaaS — perimeter-based security cannot apply uniformly.

## 3. Logical structure

Three layers, often delivered by different implementations:

- **Microsegmentation** — east-west policy and encryption (workload-to-workload).
- **Access brokerage** — north-south policy and conditional access (user-to-workload, both internal and external).
- **Remote access (ZTNA)** — replaces traditional VPN with identity-aware, application-scoped tunneling.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 3 | 5 | 3 | 2 | 3 | 3 | 3 |

## 5. Implementation matrix

| Implementation | Layer covered | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| VMware NSX | Microsegmentation + L4–L7 | Mature on VCF estates; Broadcom commercial trajectory | VMware NSX docs |
| Cisco ACI | Microsegmentation in data center fabric | Strong hardware-network integration; coupled to Cisco fabric | Cisco ACI docs |
| Calico Cloud / Calico Enterprise | Container microsegmentation | Kubernetes-native; CNCF lineage | Tigera Calico docs |
| Cisco Secure Workload (Tetration) | Agent-based microsegmentation | Strong analytics; agent-on-host required | Cisco Secure Workload docs |
| Zscaler (ZIA + ZPA) | Access brokerage + ZTNA | Pure SaaS; sovereignty consideration; deep SASE feature set | Zscaler docs |
| Cloudflare Zero Trust | Access brokerage + ZTNA | Cloudflare network; integrated CDN and DDoS posture | Cloudflare Zero Trust docs |
| Illumio | Agent-based microsegmentation | Strong identity-first model; agent requirement on each protected host | Illumio docs |
| Cilium (eBPF) | Container microsegmentation | eBPF-native; lower overhead; pairs with [Service Mesh](service-mesh.md) | Cilium docs |

## 6. Decision criteria

- Where in the stack does microsegmentation need to live — hypervisor, network fabric, agent, or eBPF?
- Is per-host agent acceptable (R-restriction often forbids this on management plane)?
- Remote-access scope — workforce-only, or also contractors and vendors?
- SaaS commitment vs. on-prem operation for the access-brokerage layer.

## 7. Anti-patterns

- **Zero-trust marketing without policy enforcement** — the buzzword without the controls.
- **Conflating ZTNA with VPN replacement only** — leaves east-west untouched.
- **Allow-by-default microsegmentation policies** — fails the threat model the pattern is meant to address.
- **Combining sovereignty-sensitive policy data with a SaaS-only access brokerage** without considering where that policy data resides.

## 8. Cross-references

**Related patterns:** [Identity and Access Management](identity-access-management.md), [Service Mesh](service-mesh.md), [Observability Platform](observability-platform.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [GLOBAL-CARD](../overlays/global-card.md), [HC](../overlays/healthcare.md).
