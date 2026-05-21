# 11. Pattern Library

The Pattern Library is MOSAIC's **accumulated knowledge of which architectural patterns work in which contexts**. Each library entry describes a pattern at the Logical layer (L3) and carries one or more Implementations at the Physical layer (L4).

> The **pattern–implementation separation** is what makes vendor neutrality operationally achievable: an engagement selects a pattern based on its CADRE register and quality-pillar profile, then selects an implementation based on commercial, skill, and ecosystem considerations.

The full library lives in [`patterns/`](../patterns/). The blank template is at [`patterns/_template/pattern-template.md`](../patterns/_template/pattern-template.md).

## 11.1 Library structure

Each Pattern record contains the following sections:

1. **Pattern name and short description.**
2. **Applicable contexts** — when this pattern is the right answer (and when it is not).
3. **Logical structure** — components, relationships, data flows, in vendor-neutral notation.
4. **Quality-pillar profile** — typical scores when the pattern is implemented competently.
5. **Implementation matrix** — one entry per validated realization, with version, prerequisites, trade-offs, and reference to canonical documentation.
6. **Decision criteria** — the questions whose answers determine which Implementation to choose.
7. **Anti-patterns** — known failure modes and the conditions that produce them.
8. **Cross-references** — related patterns and the compliance overlays most affected.

## 11.2 Current pattern inventory

The following patterns are maintained in the library at the time of this document's issue. The list is illustrative, not exhaustive; new patterns are added through the practice's Pattern Working Group process.

| Pattern | Implementations |
| --- | --- |
| [Private Cloud — Hyperconverged](../patterns/private-cloud-hyperconverged.md) | Multiple validated implementations (commercial and open-source). |
| [Private Cloud — Disaggregated](../patterns/private-cloud-disaggregated.md) | Multiple validated implementations (open-source virtualization on commodity storage, traditional hypervisor on external SAN/NAS, container-native virtualization platforms). |
| [Hybrid Cloud Extension](../patterns/hybrid-cloud-extension.md) | Multiple validated implementations (incumbent stacks extended into public clouds; on-premises appliances from hyperscalers; cross-cloud control planes). |
| [Container Platform](../patterns/container-platform.md) | Multiple validated implementations (enterprise distributions, multi-cluster managers, vanilla upstream Kubernetes, hyperscaler-managed services). |
| [Service Mesh](../patterns/service-mesh.md) | Multiple validated implementations (open-source meshes, eBPF-based meshes, vendor-distributed and hyperscaler-native meshes). |
| [Disaster Recovery / Business Continuity](../patterns/disaster-recovery-bcp.md) | Multiple validated implementations (vendor replication and orchestration suites; third-party data-protection platforms; native cloud DR services). |
| [Identity and Access Management](../patterns/identity-access-management.md) | Multiple validated implementations (commercial cloud-native identity platforms, open-source identity providers). |
| [Zero-Trust Network](../patterns/zero-trust-network.md) | Multiple validated implementations (data-center microsegmentation platforms, identity-aware proxies, SASE/ZTNA services, host-based segmentation). |
| [Data Platform — Lakehouse](../patterns/data-platform-lakehouse.md) | Multiple validated implementations (commercial managed lakehouse services, hyperscaler analytics warehouses, on-premises open-table-format stacks). |
| [AI / ML Platform](../patterns/ai-ml-platform.md) | Multiple validated implementations (on-premises private-AI stacks, container-platform-based AI distributions, hyperscaler-managed ML services). |
| [Agentic / LLM Operations](../patterns/agentic-llm-operations.md) | Multiple validated implementations (hyperscaler agent services, vendor AI orchestration platforms, custom open-source agent frameworks with self-hosted inference). |
| [Observability Platform](../patterns/observability-platform.md) | Multiple validated implementations (open-source metrics/logs/traces stacks, commercial observability SaaS platforms, vendor-integrated operations suites). |
| [Backup and Cyber Recovery](../patterns/backup-cyber-recovery.md) | Multiple validated implementations (independent data-protection vendors, native cloud backup with immutable storage). |

## 11.3 Pattern selection procedure

Compose-phase pattern selection follows a defined procedure:

1. **Inventory the Capability layer (L2)** and identify each capability that requires a pattern.
2. **For each capability, query the library for candidate patterns.** Filter by:
   - Applicability — does the pattern fit the engagement's CADRE profile?
   - Compliance-overlay compatibility — does the pattern violate any pre-loaded Restriction?
3. **Score candidate patterns against the engagement's pillar weights.** Patterns whose typical quality profile aligns with the engagement weights are preferred.
4. **For the selected pattern, choose an Implementation** from the matrix. Implementation choice is typically driven by **skill availability, existing licensing, ecosystem fit, and commercial terms** — not by architecture quality, which the pattern selection has already addressed.
5. **Record** the pattern selection and the implementation selection as **ADRs at L3 and L4 respectively**.

## 11.4 Library governance

The pattern library is owned by the **Practice Architecture Council**. New patterns are proposed by individual engagements where existing entries do not fit; the Council reviews proposals quarterly and admits patterns that are:

- **Repeatable** — applicable across multiple engagements.
- **Well-defined** — clear logical structure, decision criteria, and anti-patterns.
- **Supported** — at least one validated implementation.

Patterns that no longer have any validated implementation, or whose implementations are all superseded, are **retired with a transition note pointing forward**.

See [`CONTRIBUTING.md`](../CONTRIBUTING.md) for the proposal procedure.
