# Pattern — AI / ML Platform

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

GPU-aware infrastructure plus tooling for the ML lifecycle — data preparation, training, model registry, inference serving, and governance — appropriate to the engagement's compliance scope and workload profile (training-heavy vs. inference-heavy vs. agentic).

## 2. Applicable contexts

**Use this pattern when:**
- The client has, or plans, more than a handful of ML or LLM workloads.
- GPU capacity needs to be shared across teams under governed access.
- Model governance is a regulatory requirement (EU AI Act, NIST AI RMF, sector-specific).

**Do not use this pattern when:**
- The engagement is single-application (a single LLM-powered feature) — use a managed inference offering from a hyperscaler.
- The training/inference workload fits comfortably within a single workstation or a cloud-managed notebook.

## 3. Logical structure

- **Data layer** — connection to the [Data Platform — Lakehouse](data-platform-lakehouse.md) for training data and feature store.
- **Compute layer** — GPU pool with scheduling (workload class: training, batch inference, real-time inference).
- **ML lifecycle tooling** — experiment tracking, model registry, evaluation, lineage.
- **Serving layer** — inference endpoints with autoscaling, batching, and observability.
- **Governance layer** — model risk management, bias and safety evaluation, audit log.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 3 | 4 | 3 | 3 | 2 | 2 | 3 | 3 |

Cost and Sustainability are low because GPU economics and energy intensity dominate; deliberate FinOps and GreenOps work elevates them.

## 5. Implementation matrix

| Implementation | Strength | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Implementation A — incumbent-HCI-bundled AI stack | Tight integration with the incumbent HCI platform; GPU-vendor AI Enterprise stack | Incumbent-HCI commercial trajectory; on-prem GPU capacity must be sourced | Incumbent HCI vendor's AI-stack docs |
| Implementation B — enterprise-Kubernetes AI platform | Kubernetes-native; open ecosystem | Kubernetes-distribution skill prerequisite; less opinionated about ML workflow | Kubernetes-distribution vendor's AI-platform docs |
| Implementation C — GPU-vendor AI Enterprise stack (standalone) | Reference architectures for major hypervisors; vendor inference microservices | Hardware and license commitment to the GPU vendor | GPU-vendor AI Enterprise docs |
| Implementation D — Hyperscaler 1 native ML platform | Mature managed MLOps with broad service catalog | Single-hyperscaler lock-in; sovereignty considerations | Hyperscaler's ML-platform docs |
| Implementation E — Hyperscaler 2 native ML platform | Strong on the hyperscaler's foundation models | Single-hyperscaler lock-in; sovereignty considerations | Hyperscaler's ML-platform docs |
| Implementation F — Hyperscaler 3 native ML platform | Tight ecosystem integration | Single-hyperscaler lock-in; sovereignty considerations | Hyperscaler's ML-platform docs |

## 6. Decision criteria

- Training vs. inference workload mix (training favors on-prem economics at scale; inference favors edge/cloud).
- Sovereignty of training data — onshore requirements often drive on-prem GPU procurement.
- Existing platform direction (Kubernetes-first → enterprise-Kubernetes AI platform; incumbent-HCI-first → incumbent-HCI-bundled AI stack).
- Model risk governance requirements (AI overlay loaded?).

## 7. Anti-patterns

- **Treating GPU as just another resource** without scheduling and isolation policy — high-priority training starves inference, or vice-versa.
- **No model registry** — production models cannot be traced to training data, code, or evaluation.
- **Inference SLA without inference observability** — no way to tell when a model is failing or drifting.
- **Cost-blind autoscaling** of inference — surprise GPU bills.

## 8. Cross-references

**Related patterns:** [Data Platform — Lakehouse](data-platform-lakehouse.md), [Agentic / LLM Operations](agentic-llm-operations.md), [Container Platform](container-platform.md), [Observability Platform](observability-platform.md).

**Compliance overlays most affected:** [AI](../overlays/ai.md), [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [HC](../overlays/healthcare.md), [SUSTAIN](../overlays/sustain.md).
