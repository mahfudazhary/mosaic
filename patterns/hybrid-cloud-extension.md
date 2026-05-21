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
- **Connectivity** — dedicated link (hyperscaler-provided private interconnect) plus VPN fallback.
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
| Implementation A — incumbent enterprise HCI on Hyperscaler 1 / 2 / 3 | Existing incumbent-HCI estate; hyperscaler relationship | Operating-model continuity; commercial costs follow incumbent HCI vendor + hyperscaler | Incumbent HCI vendor's cloud-extension docs (per hyperscaler) |
| Implementation B — alternative enterprise HCI on Hyperscaler 1 / 2 | Alternative-HCI estate; hyperscaler subscription | Operating-model continuity; alternative-HCI-native experience in cloud | Alternative HCI vendor's cloud-extension docs |
| Implementation C — cloud-managed HCI | Hyperscaler subscription; on-prem hardware from the hyperscaler's qualified list | Cloud control plane operating on-prem hardware | Hyperscaler's cloud-managed HCI docs |
| Implementation D — Hyperscaler 1 on-prem rack appliance | Hyperscaler account; eligible region | Hyperscaler-native services on-prem; rack-scale unit; limited service catalog parity | Hyperscaler's on-prem rack appliance user guide |
| Implementation E — Hyperscaler 3 distributed-cloud platform | Hyperscaler project; platform subscription | Strong Kubernetes story; less mature for VM-only workloads | Hyperscaler's distributed-cloud docs |

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
