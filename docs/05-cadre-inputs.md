# 5. Axis 2 — The Inputs (CADRE)

CADRE is MOSAIC's **input model**. It defines five categories of design forces that shape every architectural decision.

The acronym deliberately replaces an earlier four-element model (Requirements–Assumptions–Constraints–Risks) with a structure that:

- Surfaces **Context** explicitly.
- Separates compliance from operational constraints.
- Renames Risks to **Exposure** to include threats and dependencies, not only probability-times-impact risk items.

CADRE content is captured at the start of each engagement (the [Capture phase](07-six-phase-method.md#722-phase-2--capture)) and **maintained as a living register thereafter**. Every ADR references the CADRE entries it relies on, conflicts with, or escalates, producing bidirectional traceability between forces and decisions.

## 5.1 CADRE summary

| | Element | Definition and scope |
| --- | --- | --- |
| **C** | **Context** | Drivers, stakeholders, scope boundary, success criteria, and environmental factors. Answers: _why is this engagement happening now, for whom, with what intended outcome, and within what envelope?_ |
| **A** | **Assumptions** | Statements taken as true without verification. Verifying them is either impossible at the time or disproportionately expensive. Each assumption carries a validation plan or a fallback if it is invalidated. |
| **D** | **Demands** | Functional requirements (what the system must do) and non-functional requirements (how well it must do it). Demands are the formal contract between business need and technology architecture. Each Demand is testable and owned. |
| **R** | **Restrictions** | Constraints, compliance mandates, and regulatory obligations that bound the solution space. Restrictions are **non-negotiable**; if a Demand conflicts with a Restriction, the Restriction wins and the Demand must be re-stated or escalated. |
| **E** | **Exposure** | Risks, dependencies, and threats — anything that could cause the architecture to fail to deliver. Each Exposure carries a likelihood and impact rating, a mitigation plan, and a named owner. |

## 5.2 Element definitions

### 5.2.1 C — Context

Context establishes the engagement envelope. It is captured during Frame and refined during Capture, typically by the engagement partner and the lead architect together, working from the client brief, the RFP response, and stakeholder interviews.

**Typical Context entries:**

- The primary business driver (e.g., "incumbent-vendor subscription renewal in Q3 2026 triggered displacement evaluation").
- The executive sponsor and their authority limits.
- The working-level stakeholders and their decision rights.
- The geographic and organizational scope.
- The success criteria against which the engagement will be evaluated.

Context entries are **unusually durable** — they often survive across multiple engagements with the same client and become the foundation of practice-account-management content.

### 5.2.2 A — Assumptions

Assumptions name the things the design depends on but cannot or will not verify. An assumption that "the existing 2024 workload-profile assessment remains representative" is typical; verifying it would require a fresh discovery exercise the client has declined to fund.

Assumptions are **not waivers**. Each one carries:

- A **validation plan** — how it will be tested if conditions change.
- A **fallback** — what the design will do if invalidated.

Unmanaged assumptions become Exposure entries by default at the next review.

> **Architect's discipline**: be conservative when recording Assumptions. A bias toward _fewer, deliberate_ Assumptions produces more defensible designs; a bias toward many casual ones produces designs that auditors and successors find difficult to reason about.

### 5.2.3 D — Demands

Demands are the engagement's **formal requirements**. The framework distinguishes two types and recommends both be captured separately:

- **Functional Demands** — what the system must do.
- **Non-functional Demands** — how well it must do it.

Non-functional Demands map directly to the eight quality pillars on Axis 3, providing the link between input and evaluation.

Each Demand carries:

| Field | Notes |
| --- | --- |
| ID | `D-NNN` |
| Statement | Single sentence |
| Testability criterion | How compliance is verified |
| Owner | Who confirms it |
| Priority | MoSCoW: **M**ust, **S**hould, **C**ould, **W**on't |

> A Demand that cannot be tested is incomplete. Either rewrite it until it is testable, or it is a **driver** and belongs in Context rather than Demands.

### 5.2.4 R — Restrictions

Restrictions are the **immovable objects** of the design space. Three subcategories are distinguished:

1. **Operational constraints** — budget envelopes, timeline limits, available skill pools, existing technology investments that must be reused.
2. **Compliance mandates** — obligations imposed by sector regulators (POJK 11/2022 ITRM, MAS TRM, PCI-DSS, DORA), national laws (UU PDP, GDPR), and contractual undertakings (DPAs, MSAs, audit clauses).
3. **Architectural principles** — the client's own pre-existing architectural rules, such as "all critical workloads must operate in active-active dual-DC configuration" or "cloud-native services may not handle restricted-classification data."

Restrictions **cannot be traded against Demands**. If a Demand cannot be satisfied within a Restriction, the architect escalates the conflict to the engagement sponsor. Either:

- The Demand is revised,
- The Restriction is formally waived (if it is waivable), or
- The engagement scope is adjusted.

### 5.2.5 E — Exposure

Exposure captures everything that could go wrong. The framework broadens the traditional Risk register to include three distinguishable types:

- **Risks** — probabilistic events with adverse impact. Each carries a likelihood (1–5), an impact (1–5), and a mitigation owner.
- **Dependencies** — external conditions the design relies on but does not control. Examples: a third-party data feed, a partner integration, an infrastructure delivery from a separate workstream.
- **Threats** — actively adversarial conditions. Captured separately from generic risks because they require different mitigations (controls, monitoring, response plans) and frequently map to Security and Sovereignty pillar requirements.

Exposure entries are the **input to Calibrate**. The design's residual exposure after mitigations is one of the key signals architects use to determine whether the design is ready to commit.

## 5.3 CADRE register structure

Each CADRE element is maintained as its own register (typically a spreadsheet tab). The recommended **minimum schema** for each entry:

| Field | Purpose |
| --- | --- |
| **ID** | Unique identifier in format `<C\|A\|D\|R\|E>-NNN` (e.g., `D-014`, `R-007`) |
| **Statement** | Single-sentence description of the entry |
| **Source** | Who or what produced it (workshop, document, regulator, stakeholder) |
| **Owner** | Named individual accountable for it |
| **Status** | `Active`, `Validated`, `Superseded`, `Closed` |
| **Related decisions** | ADR IDs that cite this entry |
| **Quality pillar tags** | Which of the eight pillars this entry primarily affects |
| **Date captured / last reviewed** | Date stamps for governance |

Element-specific fields extend this minimum:

- **Demands** add testability criteria and MoSCoW priority.
- **Restrictions** add the regulatory or contractual citation and a `Waivable: Yes/No/Conditional` flag.
- **Exposure** adds likelihood, impact, mitigation plan, residual rating, and mitigation owner.

A standardized CADRE Register template is provided as [Appendix A](appendices/A-cadre-register-template.md), with copy-ready formats in [`templates/cadre-register/`](../templates/cadre-register/).
