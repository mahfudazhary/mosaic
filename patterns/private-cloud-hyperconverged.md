# Pattern — Private Cloud (Hyperconverged)

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

A private-cloud pattern in which compute, storage, and virtual networking are converged on commodity x86 (or arm) nodes managed as a single software-defined platform. Each node contributes resources to a shared pool; the platform handles placement, replication, and lifecycle.

## 2. Applicable contexts

**Use this pattern when:**
- Mixed VM and container workloads must share a unified platform.
- Operational simplicity is valued over per-tier optimization.
- Onshore data residency (Sovereignty) precludes hyperscaler-native options for the in-scope workload.
- The estate is sized roughly between "too big for a single converged box" and "too dynamic for traditional three-tier" (~10–500 nodes per cluster typical).

**Do not use this pattern when:**
- Workload profile is dominated by capacity that grows independently of compute (very heavy archival, video, AI training datasets) — consider Disaggregated instead.
- Single-vendor lock-in is unacceptable and no second validated implementation is available in the region.
- Public cloud is the strategic direction and on-prem is being decommissioned.

**Strong context fits:** Indonesian FSI core-banking estates; KBMI 2/3 banks; mid-to-large government workloads; manufacturing OT-adjacent IT.

## 3. Logical structure

### Components
- **Compute** — x86 nodes pooled into clusters.
- **Storage** — distributed software-defined storage spanning all nodes in the cluster.
- **Network** — virtual switching with overlay (typically VXLAN/Geneve) and east-west segmentation.
- **Control plane** — single management UI/API for compute, storage, network lifecycle.
- **Optional services** — built-in DR replication, snapshots, container runtime, lifecycle automation.

### Relationships and data flows
- VMs and containers consume CPU, memory, and storage from the converged pool.
- Storage is replicated across nodes (typically 2× or 3× factor) for fault tolerance.
- Stretched-cluster variants synchronously replicate across two metro-distance sites with a witness in a third location.
- North–south traffic flows through tier-0 routers; east–west through the overlay with policy enforced at the vNIC.

## 4. Quality-pillar profile (typical, when implemented competently)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 3 | 3 | 4 | 3 | 3 | 4 | 3 |

Stretched-cluster variants raise Availability to 5 at the cost of network upgrade (Cost ↓1).

## 5. Implementation matrix

| Implementation | Version (as of 2026-05) | Prerequisites | Trade-offs | Canonical doc |
| --- | --- | --- | --- | --- |
| VMware Cloud Foundation | 9.x | Broadcom subscription; trained ESXi operators; vSAN ESA storage path | Most mature feature set; Broadcom pricing volatility (E-001 archetype) | VCF Architecture and Design Guide |
| Nutanix AOS + AHV | 7.x | Nutanix subscription; AHV familiarity (lower than ESXi) | Strong Day-2 UX; smaller skill pool regionally than VMware | Nutanix Validated Design (NVD) |
| Azure Local (formerly Azure Stack HCI) | 24H2 | Azure subscription for management plane; node hardware from QCS list | Cloud-managed lifecycle; requires outbound connectivity to Azure for full feature set (sovereignty consideration) | Microsoft Azure Local docs |
| OpenStack (Canonical, Red Hat, Mirantis) | 2024.2 "Dalmatian" | Strong platform engineering team | Vendor-neutral; higher Day-2 operational investment | OpenStack Reference Architectures |
| Proxmox VE | 8.x | Smaller scale; community/commercial support hybrid | Low-cost and license-friendly; thinner enterprise feature parity for FSI tier-1 | Proxmox VE Reference Documentation |
| HPE GreenLake Private Cloud Business Edition | Current | GreenLake contract; HPE hardware | Consumption-based commercial model; HPE-managed lifecycle | HPE GreenLake docs |

## 6. Decision criteria — choosing an Implementation

- **What is the operator skill profile today?** Strong ESXi → VCF lowest friction. Mixed or fresh → Nutanix is often faster to value.
- **Is there an organizational commitment to a hyperscaler control plane?** If Azure-native operations and identity are the strategic direction, Azure Local fits.
- **Is commercial concentration risk a stated R-restriction?** If yes, prefer pairing two implementations (VCF + Nutanix is the common ID-FSI pair).
- **Is the engagement budget weighted toward CapEx or OpEx?** Subscription-model implementations are OpEx-heavy; HPE GreenLake explicit consumption-based.
- **What is the inter-site latency for stretched-cluster requirements?** All major implementations have round-trip latency ceilings; verify against the actual fiber path.

## 7. Anti-patterns

- **Conflating pattern with vendor.** Selecting "VCF" before deciding HCI is the right pattern is the most common framework violation (Principle 2).
- **Stretched cluster across non-metro distance.** Synchronous replication beyond ~100 km round-trip degrades application latency unacceptably. Use async + orchestration instead.
- **Skipping the witness.** Two-site stretched clusters without a third-site witness can split-brain under network partition.
- **Mixing GPU and general-purpose nodes in one cluster** without affinity policy — leads to scheduling surprises.
- **Treating the converged platform as a managed service** when no commercial support is contracted — common with OpenStack and Proxmox.

## 8. Cross-references

**Related patterns:**
- [Disaster Recovery / Business Continuity](disaster-recovery-bcp.md) — for the replication and orchestration layer.
- [Container Platform](container-platform.md) — for the Kubernetes runtime atop this pattern.
- [Zero-Trust Network](zero-trust-network.md) — for east-west segmentation.
- [Observability Platform](observability-platform.md) — for the L5 telemetry stack.

**Compliance overlays most affected:**
- [ID-FSI](../overlays/id-fsi.md) — onshore residency and POJK 11/2022 continuity drive most pattern parameters.
- [EU-FIN](../overlays/eu-fin.md) — DORA operational resilience requirements.

**Common CADRE entries:**
- R: onshore data residency, single-vendor lock-in unacceptable.
- D: RPO/RTO targets, sustained transaction throughput, mixed workload support.
- E: vendor pricing volatility, skill-pool concentration.
