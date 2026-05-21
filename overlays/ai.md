# Compliance Overlay — AI

> **Code:** AI · **Version:** 1.1 · **Status:** Active
> **Owner:** Practice Compliance Lead · **Last reviewed:** 2026-05

## 1. Applicable context

Architectures that train, fine-tune, or operate AI/ML models — including generative AI, agentic systems, and traditional supervised ML — in regulated contexts. Almost always stacks with a sector overlay (ID-FSI, EU-FIN, HC, etc.) since AI governance is conditioned on the sector context.

## 2. Mandate index

| # | Mandate | Source citation | Architectural implication |
| :-: | --- | --- | --- |
| 1 | NIST AI Risk Management Framework | NIST AI RMF 1.0 + Generative AI Profile | Voluntary but increasingly referenced; map, measure, manage, govern |
| 2 | EU AI Act | EU Regulation 2024/1689 | Risk-tiered obligations: prohibited, high-risk, limited, minimal; specific GPAI obligations |
| 3 | AI management systems | ISO/IEC 42001:2023 | Formal AI management system standard |
| 4 | Sector-specific AI guidelines | OJK (ID-FSI), MAS FEAT (Singapore), FDA on AI/ML SaMD, etc. | Sector-conditioned obligations |
| 5 | Algorithmic decision-making | GDPR Article 22; sectoral fairness rules | Right against solely automated decisions; explainability |

## 3. Pre-populated Restrictions

| R-ID | Statement | Citation | Waivable |
| --- | --- | --- | :---: |
| R-001 | AI risk classification documented for each in-scope use case (e.g., high-risk under EU AI Act, foundation model GPAI tier) | EU AI Act | No |
| R-002 | Model registry with versioning, training-data lineage, evaluation results, intended use | NIST AI RMF / ISO 42001 | No |
| R-003 | Pre-deployment evaluation: accuracy, robustness, fairness, safety; results retained | NIST AI RMF | No |
| R-004 | Human oversight in production for high-risk decision pipelines | EU AI Act Article 14 | Conditional |
| R-005 | Transparency to users where required (e.g., disclosure of AI-generated content under EU AI Act) | EU AI Act | No |
| R-006 | Post-deployment monitoring for drift and incident detection | NIST AI RMF | No |
| R-007 | Personal data used for training subject to lawful basis and minimisation | GDPR / UU PDP / local | Conditional |
| R-008 | Supply-chain attestation for foundation models or third-party AI components | EU AI Act GPAI obligations | No |

## 4. Pillar floors

| Pillar | Floor | Rationale |
| --- | :---: | --- |
| Security & Trust | 4 | Prompt injection, data poisoning, model exfiltration |
| Operability & Observability | 4 | Drift detection and incident monitoring |
| Sovereignty & Compliance | 4 | Training data, inference data residency |
| Adaptability & Portability | 3 | Model and provider switching capability |

## 5. Default pillar weight presets

When AI is the dominant driver (rare — typically stacked with a sector overlay):

| Pillar | Suggested weight |
| --- | :---: |
| Security & Trust | 18 |
| Operability & Observability | 16 |
| Sovereignty & Compliance | 16 |
| Performance & Scale | 14 |
| Cost & FinOps | 14 |
| Adaptability & Portability | 10 |
| Sustainability & GreenOps | 6 |
| Availability & Resilience | 6 |
| **Total** | **100** |

## 6. Deliverable expectations

| Regulator-expected document | MOSAIC artifact |
| --- | --- |
| AI risk classification | Per-use-case section of Calibrate scorecard + CADRE R-restrictions |
| Model registry | L5 Operational specification §1 service catalog (extended to models) |
| Evaluation reports | Operational artifacts (linked from L5) |
| Human-oversight design | L5 operating model + relevant runbooks |
| Drift-monitoring plan | L5 observability specification (extended to model metrics) |
| Post-deployment monitoring evidence | Drift reports (Phase 6) |

## 7. Cross-references

**Patterns most often affected:**
- [AI / ML Platform](../patterns/ai-ml-platform.md), [Agentic / LLM Operations](../patterns/agentic-llm-operations.md), [Data Platform — Lakehouse](../patterns/data-platform-lakehouse.md), [Observability Platform](../patterns/observability-platform.md).

**Common stacking combinations:** AI + ID-FSI; AI + EU-FIN; AI + HC; AI + ID-GOV; AI + SUSTAIN.

## 8. Version history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | 2026-05 | Practice Compliance Lead | Aligned to EU AI Act 2024 |
| 1.1 | 2026-05 | Practice Compliance Lead | NIST GenAI profile added |
