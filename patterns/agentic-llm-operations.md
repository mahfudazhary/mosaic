# Pattern — Agentic / LLM Operations

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

An application platform for LLM-centric workloads — including multi-step agent orchestration, tool use, retrieval augmentation, and inference serving — with the safety, evaluation, and observability tooling required to operate them in regulated environments.

## 2. Applicable contexts

**Use this pattern when:**
- The client is building one or more agentic or LLM-powered applications.
- Agents need to invoke tools, call other agents, or interact with enterprise data.
- A consistent inference, prompt-governance, and safety-evaluation layer is needed across multiple applications.

**Do not use this pattern when:**
- A single application can be served by a single managed API call with no agent orchestration — use the API directly.
- The estate has fewer than ~3 LLM-powered applications and no near-term plan to grow.

## 3. Logical structure

- **Inference layer** — model serving (managed API, on-prem inference server, or hybrid).
- **Agent framework** — orchestrates multi-step reasoning, tool use, memory, hand-off.
- **Tool catalog** — enterprise-curated functions the agents may invoke (MCP-style or proprietary).
- **Retrieval layer** — vector store and document pipelines for RAG.
- **Safety and evaluation** — pre-deployment red-team, runtime guardrails, post-hoc evaluation.
- **Observability** — prompts, completions, tool calls, costs, latencies, safety events.
- **Governance** — model registry, prompt registry, change control on prompts and tools.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 3 | 3 | 3 | 3 | 2 | 2 | 3 | 3 |

Particularly volatile pillar profile — varies with the agent's autonomy level and the cost of each LLM call.

## 5. Implementation matrix

| Implementation | Strength | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Implementation A — Hyperscaler 1 native agent runtime | Hosted agent runtime; deep hyperscaler service integration | Single-hyperscaler lock-in; sovereignty considerations | Hyperscaler's agent-runtime docs |
| Implementation B — Hyperscaler 2 native agent runtime | Hosted agent runtime; tight ecosystem integration | Single-hyperscaler lock-in; sovereignty considerations | Hyperscaler's agent-runtime docs |
| Implementation C — self-hosted agent framework + open-source inference (on-prem) | Maximum control; on-prem inference for sovereignty-sensitive workloads | Engineering investment; open-source framework churn historically | Project docs for the chosen framework and inference server |
| Implementation D — GPU-vendor inference microservices (on-premises) | Reference inference microservices; multi-model support | Hardware and license commitment to the GPU vendor's stack | GPU-vendor inference microservices docs |
| Implementation E — vendor-neutral inference gateway + open framework | Vendor-neutral inference routing | Engineering investment for gateway operations | Inference-gateway project docs |
| Implementation F — managed model API + agent framework | Strong tool-use and reasoning models; long context; managed safety features | API-only — sovereignty review required for regulated workloads | Managed-model-API docs |

## 6. Decision criteria

- Sovereignty constraints on the inference data (often the hardest constraint to satisfy).
- Tolerance for vendor-managed agent runtime vs. self-hosted.
- Existing platform direction (Kubernetes-first → self-hosted stack; hyperscaler-first → that hyperscaler's native agent runtime).
- Whether the engagement requires reproducibility of agent reasoning for audit (favors fully owned stack).

## 7. Anti-patterns

- **No prompt registry** — production prompts change without audit trail; rollback is impossible.
- **Agents with unbounded tool access** — security surface for prompt-injection attacks.
- **No evaluation gate** before production change — model or prompt updates ship to production without confirmation that they are not regressive.
- **Cost-blind autonomy** — agents that issue unbounded retrieval or tool calls per request.
- **Treating agent outputs as authoritative** in a regulated decision pipeline without human-in-the-loop.

## 8. Cross-references

**Related patterns:** [AI / ML Platform](ai-ml-platform.md), [Data Platform — Lakehouse](data-platform-lakehouse.md), [Identity and Access Management](identity-access-management.md), [Observability Platform](observability-platform.md).

**Compliance overlays most affected:** [AI](../overlays/ai.md), [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [HC](../overlays/healthcare.md).
