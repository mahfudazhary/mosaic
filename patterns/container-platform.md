# Pattern — Container Platform

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

A Kubernetes-based platform for containerized workloads, with the supporting catalog of cluster lifecycle, networking, storage, identity, and developer-experience tooling that makes it usable as a managed offering for application teams.

## 2. Applicable contexts

**Use this pattern when:**
- Application teams are modernizing toward microservices or containerized batch workloads.
- A unified platform is needed across multiple application portfolios.
- The platform team is funded to operate Kubernetes as a service (not just an infrastructure component).

**Do not use this pattern when:**
- The estate is dominated by traditional monolithic applications with no near-term refactoring plan — adding Kubernetes adds operational surface without value.
- A single application team is the only consumer — a managed cloud Kubernetes service is usually a better fit.

## 3. Logical structure

- **Cluster fleet** — multiple Kubernetes clusters segregated by environment, tenant, or compliance scope.
- **Cluster lifecycle** — provision, upgrade, scale, retire.
- **Cluster network** — CNI with NetworkPolicy and (optionally) overlay encryption.
- **Cluster storage** — CSI with appropriate storage classes for stateful workloads.
- **Identity and policy** — RBAC, admission control, supply-chain attestation.
- **Developer experience** — namespaces-as-a-service, CI/CD integration, observability defaults.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 4 | 3 | 4 | 3 | 3 | 3 | 4 |

## 5. Implementation matrix

| Implementation | Prerequisites | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Red Hat OpenShift | Red Hat subscription; OpenShift skill on platform team | Most opinionated; broadest enterprise feature parity (incl. Virtualization) | Red Hat OpenShift docs |
| SUSE Rancher | Rancher subscription | Multi-cluster orchestration strength; lighter built-in feature catalog than OpenShift | SUSE Rancher docs |
| Vanilla Kubernetes + CNCF tooling (Cilium, Argo, Cert-Manager, etc.) | Strong platform engineering team | Maximum flexibility; highest Day-2 investment | Kubernetes and CNCF project docs |
| EKS / AKS / GKE managed | Hyperscaler account | Lowest operational overhead; cloud-only (or via hybrid extension) | Hyperscaler docs |
| VKS (vSphere Kubernetes Service, formerly TKGS) | VCF | Co-located with VM workloads on VCF; Broadcom commercial trajectory should be monitored | VCF documentation |
| NKP (Nutanix Kubernetes Platform) | Nutanix AOS | Co-located with VM workloads on Nutanix | Nutanix NKP docs |

## 6. Decision criteria

- Existing platform engineering investment and skill profile.
- Whether the underlying virtualization platform's "co-located Kubernetes" offering meets the application team's needs (often yes for VM-adjacent workloads, less so for cloud-native shops).
- Compliance scope — multi-tenant single cluster vs. cluster-per-tenant.
- Whether the engagement is committing to a hyperscaler control plane.

## 7. Anti-patterns

- **Building one large multi-tenant cluster** without compliance-scope segregation — surface area for security and audit failures.
- **Treating the platform as the application team's problem** — leads to inconsistent operations and surprised auditors.
- **Adopting Kubernetes for stateless web apps only** — that's a load-balancer-and-PaaS shape; Kubernetes adds complexity without much payoff.
- **Skipping a paved-road developer experience** — every app team rolls its own CI/CD, observability, and supply chain; toil explodes.

## 8. Cross-references

**Related patterns:** [Service Mesh](service-mesh.md), [Zero-Trust Network](zero-trust-network.md), [Observability Platform](observability-platform.md), [Identity and Access Management](identity-access-management.md), [AI / ML Platform](ai-ml-platform.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [HC](../overlays/healthcare.md).
