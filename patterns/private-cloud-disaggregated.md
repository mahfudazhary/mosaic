# Pattern — Private Cloud (Disaggregated)

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

A private-cloud pattern in which compute, storage, and networking scale **independently** rather than as a converged pool. Modernizes the traditional three-tier shape with software-defined storage and overlay networking while keeping compute and storage on separate refresh and scaling cycles.

## 2. Applicable contexts

**Use this pattern when:**
- Capacity growth dimensions diverge significantly (e.g., storage growth dominated by archival or AI training data, compute growth tied to user-facing workloads).
- Existing storage investments (SAN/NAS) must be preserved.
- Storage is shared across multiple compute tenancies (mainframe-adjacent, multi-cluster, hybrid VM/container).

**Do not use this pattern when:**
- The workload profile fits a converged ratio of CPU/storage and operational simplicity is the priority — use Hyperconverged.
- The site is small enough that the operational overhead of two control planes is disproportionate.

## 3. Logical structure

- **Compute pool** — hypervisor cluster(s) or bare-metal Kubernetes consuming external storage.
- **Storage pool** — software-defined or appliance-based, presented via block, file, or object protocols.
- **Network fabric** — independent of compute; carries both storage and east-west traffic, often with VRF or QoS isolation.
- **Control plane** — typically separate management for compute and storage, integrated via APIs.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 4 | 3 | 3 | 3 | 3 | 4 | 4 |

## 5. Implementation matrix

| Implementation | Version (as of 2026-05) | Prerequisites | Trade-offs | Canonical doc |
| --- | --- | --- | --- | --- |
| Implementation A — bare-metal + open-source distributed storage + open-source KVM virtualization | Current major releases of the open-source storage and virtualization layers | Strong platform engineering capability | Vendor-neutral; high operational investment; deepest cost optimization potential | Open-source project docs |
| Implementation B — incumbent hypervisor + external SAN/NAS arrays | Current major release; arrays current | Storage vendor support contract | Conservative shape; well-understood; storage refresh independent of hypervisor | Vendor reference architectures |
| Implementation C — enterprise-Kubernetes-bundled virtualization | Current major release | Vendor subscription; storage layer (vendor-bundled or external) | Containers and VMs in one platform; strong on-prem story; emergent vendor for VM-heavy workloads | Kubernetes-distribution vendor's virtualization docs |

## 6. Decision criteria

- Storage protocol mix needed (block vs file vs object).
- Existing SAN/NAS investments and remaining lifecycle.
- Whether VM migration off the incumbent hypervisor is a strategic direction (then enterprise-Kubernetes-bundled virtualization is attractive).
- Day-2 platform engineering bench depth (open-source distributed-storage operations is non-trivial).

## 7. Anti-patterns

- **Treating open-source distributed storage as a turn-key appliance.** It is a platform that requires platform-engineering investment.
- **Disaggregating "because we always have"** when workload profile actually fits HCI better.
- **Allowing storage and compute refresh cycles to diverge so far** that one tier becomes the bottleneck for the other.

## 8. Cross-references

**Related patterns:** [Private Cloud — Hyperconverged](private-cloud-hyperconverged.md), [Container Platform](container-platform.md), [Backup and Cyber Recovery](backup-cyber-recovery.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md).
