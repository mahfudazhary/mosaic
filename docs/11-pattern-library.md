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
5. **Implementation matrix** — one entry per validated vendor realization, with version, prerequisites, trade-offs, and reference to vendor canonical documentation.
6. **Decision criteria** — the questions whose answers determine which Implementation to choose.
7. **Anti-patterns** — known failure modes and the conditions that produce them.
8. **Cross-references** — related patterns and the compliance overlays most affected.

## 11.2 Current pattern inventory

The following patterns are maintained in the library at the time of this document's issue. The list is illustrative, not exhaustive; new patterns are added through the practice's Pattern Working Group process.

| Pattern | Implementations |
| --- | --- |
| [Private Cloud — Hyperconverged](../patterns/private-cloud-hyperconverged.md) | VMware Cloud Foundation; Nutanix AHV; Azure Local (formerly Azure Stack HCI); OpenStack; Proxmox VE; HPE GreenLake Private Cloud. |
| [Private Cloud — Disaggregated](../patterns/private-cloud-disaggregated.md) | Bare-metal + Ceph + KubeVirt; vSphere + external SAN/NAS; OpenShift Virtualization. |
| [Hybrid Cloud Extension](../patterns/hybrid-cloud-extension.md) | VCF on AWS/Azure/Google; Nutanix Cloud Clusters (NC2); Azure Local; AWS Outposts; Google Anthos. |
| [Container Platform](../patterns/container-platform.md) | Red Hat OpenShift; SUSE Rancher; vanilla Kubernetes with CNCF tooling; EKS/AKS/GKE managed. |
| [Service Mesh](../patterns/service-mesh.md) | Istio; Linkerd; Cilium Service Mesh; OpenShift Service Mesh; AWS App Mesh. |
| [Disaster Recovery / Business Continuity](../patterns/disaster-recovery-bcp.md) | VMware Live Site Recovery (formerly SRM); Nutanix Protection Policies; Veeam Replication; Zerto; Druva; native cloud DR services. |
| [Identity and Access Management](../patterns/identity-access-management.md) | Microsoft Entra ID; Okta; Keycloak; FreeIPA; Ping Identity. |
| [Zero-Trust Network](../patterns/zero-trust-network.md) | VMware NSX; Cisco ACI; Calico Cloud; Cisco Secure Workload (Tetration); Zscaler; Cloudflare Zero Trust; Illumio. |
| [Data Platform — Lakehouse](../patterns/data-platform-lakehouse.md) | Databricks; Snowflake; Google BigQuery; Cloudera Data Platform; on-premises Trino + Iceberg. |
| [AI / ML Platform](../patterns/ai-ml-platform.md) | VCF Private AI Foundation with NVIDIA; Red Hat OpenShift AI; NVIDIA AI Enterprise; AWS SageMaker; Google Vertex AI; Azure ML. |
| [Agentic / LLM Operations](../patterns/agentic-llm-operations.md) | Amazon Bedrock AgentCore (GA Oct 2025); Azure AI Foundry; custom LangGraph or LangChain with vLLM; NVIDIA NIM on-premises. |
| [Observability Platform](../patterns/observability-platform.md) | Prometheus + Grafana + Loki + Tempo; Datadog; Dynatrace; Splunk; VCF Operations Suite + Aria Operations for Networks. |
| [Backup and Cyber Recovery](../patterns/backup-cyber-recovery.md) | Veeam; Rubrik; Cohesity; Commvault; native cloud backup with immutable storage. |

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
