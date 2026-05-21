# Pattern — Service Mesh

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

A data-plane and control-plane layer that provides identity-aware service-to-service connectivity, authentication, authorization, encryption, traffic management, and observability for containerized (and increasingly VM-based) workloads.

## 2. Applicable contexts

**Use this pattern when:**
- Multiple microservices need to communicate with shared policy for identity, encryption, and traffic management.
- Zero-trust posture at the L7 layer is required (mTLS between services).
- Cross-cluster or cross-cloud service connectivity is in scope.

**Do not use this pattern when:**
- The estate has fewer than ~10 services and is operationally stable — the mesh adds more complexity than it removes.
- The CNI already provides identity-aware policy at L3/L4 sufficient for the requirement (Cilium without mesh, for example).

## 3. Logical structure

- **Data plane** — sidecar or sidecar-less proxies (envoy, eBPF) handling traffic.
- **Control plane** — pushes configuration and policy to the data plane.
- **Identity** — workload identity (SPIFFE/SPIRE pattern) issued and rotated.
- **Telemetry** — every request emits metrics, logs, and (optionally) traces.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 3 | 3 | 4 | 4 | 3 | 3 | 3 | 4 |

Performance is contextual — proxy-based meshes add ~1–3ms p99; eBPF meshes are typically lower.

## 5. Implementation matrix

| Implementation | Prerequisites | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Istio | Kubernetes; operational maturity | Most feature-complete; complex to operate; sidecar default with ambient mode available | Istio docs |
| Linkerd | Kubernetes | Simpler operations; smaller feature surface | Linkerd docs |
| Cilium Service Mesh | Cilium CNI | eBPF-based; sidecar-free; tight integration with networking | Cilium service mesh docs |
| OpenShift Service Mesh | OpenShift | Bundled, supported Istio variant | Red Hat OpenShift Service Mesh docs |
| AWS App Mesh | AWS workloads | Cloud-native; declining strategic investment from AWS — confirm roadmap | AWS App Mesh docs |

## 6. Decision criteria

- Sidecar tolerance — sidecar density can double pod count and resource cost.
- Skill profile of the platform engineering team.
- Existing CNI choice — Cilium changes the calculus.
- Single-cluster vs. multi-cluster scope.

## 7. Anti-patterns

- **Adopting a mesh for a small estate** — operational overhead exceeds value.
- **Running multiple meshes in one cluster** — conflicting webhooks and telemetry pipelines.
- **Conflating mesh with API gateway** — both serve traffic, but the boundaries and ownership differ.

## 8. Cross-references

**Related patterns:** [Container Platform](container-platform.md), [Zero-Trust Network](zero-trust-network.md), [Observability Platform](observability-platform.md).
