# Pattern Library

This is the practice's accumulated knowledge of which architectural patterns work in which contexts. Each entry describes a pattern at the **Logical layer (L3)** and carries one or more **Implementations at the Physical layer (L4)**.

The pattern–implementation separation is what makes vendor neutrality operationally achievable: an engagement selects a **pattern** based on its CADRE profile and pillar weights, then selects an **implementation** based on commercial, skill, and ecosystem considerations.

## How to use this library on an engagement

1. At the start of Compose, scan the pattern list for candidates that match the engagement's L2 capabilities.
2. For each candidate, read the **Applicable contexts** and **Anti-patterns** sections to confirm fit.
3. Compare the pattern's **Quality-pillar profile** against the engagement's [pillar weights](../docs/09-maturity-scoring.md#92-engagement-weighted-fitness-function).
4. For the selected pattern, choose an **Implementation** from the matrix.
5. Record the pattern selection as an L3 ADR and the implementation selection as an L4 ADR.

## Current inventory

| Pattern | Short description |
| --- | --- |
| [Private Cloud — Hyperconverged](private-cloud-hyperconverged.md) | Compute + storage + virtual networking converged on commodity x86 nodes, software-defined |
| [Private Cloud — Disaggregated](private-cloud-disaggregated.md) | Compute and storage scaled independently; traditional three-tier shape modernized |
| [Hybrid Cloud Extension](hybrid-cloud-extension.md) | On-prem control plane extended into public cloud regions for burst, DR, or regulatory geography |
| [Container Platform](container-platform.md) | Kubernetes-based platform for containerized and modernized workloads |
| [Service Mesh](service-mesh.md) | L7 service-to-service connectivity, identity, and observability |
| [Disaster Recovery / Business Continuity](disaster-recovery-bcp.md) | Replication, orchestration, and runbook automation for tier-1 service continuity |
| [Identity and Access Management](identity-access-management.md) | Centralized identity, federation, MFA, PAM, lifecycle |
| [Zero-Trust Network](zero-trust-network.md) | Identity-aware segmentation and encryption end-to-end |
| [Data Platform — Lakehouse](data-platform-lakehouse.md) | Unified storage + compute for analytical and operational data |
| [AI / ML Platform](ai-ml-platform.md) | GPU-aware infrastructure and tooling for training and inference |
| [Agentic / LLM Operations](agentic-llm-operations.md) | LLM-centric application platform with agent frameworks and inference serving |
| [Observability Platform](observability-platform.md) | Logs, metrics, traces, and synthetic checks at enterprise scale |
| [Backup and Cyber Recovery](backup-cyber-recovery.md) | Immutable backup, cyber-attack isolation, recovery orchestration |

## Proposing a new pattern

See [`CONTRIBUTING.md`](../CONTRIBUTING.md). Patterns require:

- A clearly bounded problem.
- At least one validated Implementation.
- A repeatable applicability check (when to use, when not to use).
- A named owner who accepts maintenance.

Use [`_template/pattern-template.md`](_template/pattern-template.md) as the starting point.
