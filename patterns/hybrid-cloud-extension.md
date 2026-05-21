# Pattern — Hybrid Cloud Extension

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

Extends an on-premises control plane into one or more public-cloud regions, presenting a consistent operational surface across locations. Used for burst capacity, DR target, regulatory geography (data must reside in a jurisdiction the on-prem facility cannot serve), and gradual migration.

## 2. Applicable contexts

**Use this pattern when:**
- Workload needs to extend into a public-cloud region while keeping the on-prem control plane and operating model.
- DR target requires geography the client does not own.
- Regulatory geography (cross-border subsidiary operations) requires presence in jurisdictions outside primary DCs.
- Strategy is a measured, hybrid steady-state — not a full lift-and-shift to public cloud.

**Do not use this pattern when:**
- Strategy is to retire on-prem entirely — go cloud-native and avoid the extra plane.
- Sovereignty restrictions explicitly forbid the workload from any public-cloud option in any region (then keep all on-prem).
- The relationship with the hyperscaler is unstable enough that the dependency is itself a major Exposure.

## 3. Logical structure

- **On-prem stack** — typically Hyperconverged or Disaggregated private cloud.
- **Cloud region(s)** — provisioned with the hyperscaler's hybrid offering (same hypervisor / management plane as on-prem).
- **Connectivity** — dedicated link (Direct Connect / ExpressRoute / Cloud Interconnect) plus VPN fallback.
- **Identity bridge** — federated identity, common policy plane.
- **Data plane** — replication or storage gateway for stateful workloads spanning sites.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 3 | 3 | 4 | 3 | 3 | 3 | 4 |

Sovereignty score is highly contextual — onshore-only requirements may rule out the cloud-side leg.

## 5. Implementation matrix

| Implementation | Prerequisites | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| VCF on AWS / Azure VMware Solution / Google Cloud VMware Engine | Existing VCF estate; hyperscaler relationship | Operating-model continuity; commercial costs follow Broadcom + hyperscaler | VCF on cloud docs (per hyperscaler) |
| Nutanix Cloud Clusters (NC2) on AWS / Azure | Nutanix estate; hyperscaler subscription | Operating-model continuity; Nutanix-native experience in cloud | Nutanix NC2 docs |
| Azure Local (formerly Azure Stack HCI) | Azure subscription; on-prem hardware from QCS list | Cloud control plane operating on-prem hardware | Microsoft Azure Local docs |
| AWS Outposts | AWS account; eligible region | AWS-native services on-prem; rack-scale unit; limited service catalog parity | AWS Outposts user guide |
| Google Anthos (Distributed Cloud) | GCP project; Anthos subscription | Strong Kubernetes story; less mature for VM-only workloads | Google Anthos docs |

## 6. Decision criteria

- Where is the executive sponsor's strategic preference for the cloud provider?
- Which workloads need to cross — VMs, containers, both?
- What is the data-plane shape — replicated, gatewayed, or both?
- What sovereignty constraints apply to the cloud-side leg?
- Does the engagement budget tolerate consumption-based cloud OpEx in addition to on-prem CapEx?

## 7. Anti-patterns

- **Hybrid as a hedge** — adopting a hybrid pattern because the client cannot decide on a direction. Produces two operational surfaces and the cost of both. Better to pick a direction and treat hybrid as transitional.
- **Asymmetric capabilities** — applications written assuming on-prem performance fail in cloud, or vice-versa.
- **Ignoring egress economics** — cloud-leg storage that frequently sends data back on-prem can exhaust budget faster than any other line item.

## 8. Cross-references

**Related patterns:** [Private Cloud — Hyperconverged](private-cloud-hyperconverged.md), [Disaster Recovery / Business Continuity](disaster-recovery-bcp.md), [Container Platform](container-platform.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [ASEAN-FSI](../overlays/asean-fsi.md), [EU-FIN](../overlays/eu-fin.md).
