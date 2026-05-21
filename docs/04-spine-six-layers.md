# 4. Axis 1 — The Spine (Six Abstraction Layers)

The Spine is the framework's **vertical axis**. It organizes architectural content by abstraction level, from business outcomes at the top through operational reality at the bottom. The six layers extend a security-architecture framework and an industry-standard Conceptual–Logical–Physical progression to cover both upstream business strategy and downstream operations within the same hierarchy.

Each layer answers a distinct question and produces distinct deliverables. **Crossing layer boundaries during design requires explicit traceability**: a Physical-layer decision must cite the Logical-layer pattern it implements, which must cite the Capability it satisfies, which must cite the business outcome from the Strategy layer.

## 4.1 Layer summary

| L# | Layer | Question | Owner perspective | Primary deliverables |
| --- | --- | --- | --- | --- |
| **L0** | **Strategy** | _Why?_ | Executive sponsor; CIO/CTO | Outcome statement, value hypothesis, success metrics, investment thesis |
| **L1** | **Context** | _Who / Where?_ | CISO, compliance lead, EA | Stakeholder map, scope boundary, compliance posture, data classification, sovereignty boundary |
| **L2** | **Capability** | _What?_ | Business owner, enterprise architect | Capability map, service catalog, functional architecture, integration scope |
| **L3** | **Logical** | _How (abstract)?_ | Solution architect | Pattern selections, integration flows, technology-class choices, logical topology |
| **L4** | **Physical** | _How (concrete)?_ | Lead engineer, vendor SE | Vendor products, versions, SKUs, configurations, sizing, deployment topology, BoM |
| **L5** | **Operational** | _How to run?_ | Service owner, SRE lead | SLO/SLI/EB definitions, runbooks, observability spec, ops model, lifecycle plan |

## 4.2 Detailed layer definitions

### 4.2.1 Layer 0 — Strategy

Strategy is the framework's anchor. It captures the business outcome the engagement is intended to produce, the value hypothesis that connects technology investment to that outcome, and the success metrics by which both will be measured. Strategy content is authored jointly by the engagement partner and the client's executive sponsor and is signed off as part of the **engagement charter**.

**Typical Strategy artifacts:**

- A one-page outcome statement.
- An investment thesis (five to ten lines on why this work matters now).
- A measurable success-criteria list (no more than five).
- A stakeholder-responsibility matrix at the executive level.

Strategy content **rarely changes during an engagement**. If it does, the engagement is re-baselined and the change is recorded against the project charter, not against the architecture.

### 4.2.2 Layer 1 — Context

Context describes the environment in which the architecture must operate. It includes:

- The full stakeholder map (extending the executive map from Strategy to working-level participants).
- The scope boundary (what is and is not in scope).
- The regulatory posture (which laws and standards apply).
- The data classification taxonomy.
- The sovereignty boundary (jurisdictional limits on where data and processing may reside).

In Indonesian engagements, the Context layer typically carries POJK 11/2022, UU PDP, and Bank Indonesia regulatory references for financial-services clients; **PP 71/2019** (which superseded PP 82/2012) and BSSN cybersecurity guidance for government and SOE clients; and an explicit onshore-only data residency assertion unless the client has obtained specific regulator approval for cross-border transfer.

The Sovereignty pillar (Axis 3) draws its constraints directly from Context.

### 4.2.3 Layer 2 — Capability

Capability is the **bridge between business intent and technology realization**. It describes, in business-architecture terms, what services and functions the solution must provide. Capability descriptions are **technology-agnostic**:

> "Continuous data protection with point-in-time recovery to a separate fault domain" is a capability.
>
> "Product X replication to public-cloud Region Y" is not.

The layer produces three artifacts:

- **Capability map** — hierarchical decomposition of business and technical capabilities.
- **Service catalog** — services the client's IT organization will consume from the architecture.
- **Integration scope** — external systems, applications, or services that connect.

Capabilities are the unit of value handover from architecture to product management; **each capability eventually maps to one or more patterns at Layer 3**.

### 4.2.4 Layer 3 — Logical

Logical is where architecture as a craft happens. It selects **architectural patterns and technology classes — not vendor products**.

> A Logical decision states that the design will use a hyperconverged infrastructure pattern, with software-defined storage and overlay networking, supporting both VM and container workloads, with cross-site asynchronous replication for DR. It does **not** yet state whether the implementation will be implementation A, B, or C from the pattern library.

**Logical artifacts include:**

- The **pattern selection matrix** (which patterns from the library are in scope).
- **Integration flow diagrams** (component relationships and data flows in vendor-neutral notation).
- The **logical topology** (placement of components into security zones, fault domains, and sovereignty boundaries).
- The **technology-class mapping** (HCI vs disaggregated, overlay vs underlay routing, native cloud vs portable).

Logical decisions are the **most consequential** in the framework because they determine the design's shape. They should be recorded as ADRs with explicit options-considered analysis.

### 4.2.5 Layer 4 — Physical

Physical **binds Logical patterns to specific vendor products and configurations**. It produces the deliverables most familiar to engineers and operators:

- Bills of materials.
- Version matrices.
- IP plans.
- Configuration templates.
- Sizing calculations.
- Deployment topologies.
- Integration specifications.

Physical artifacts are **version-specific and date-stamped** because vendor product offerings and supported configurations change continuously.

A consequence of the pattern–implementation separation (Principle 2): **the Physical layer can be re-implemented without re-architecting**. A client that decides to displace one vendor's stack with another's can swap the Physical layer (BoM, configurations, integration specs) for the affected pattern while leaving the Logical layer intact. This is the lever that makes vendor neutrality operationally achievable rather than aspirational.

### 4.2.6 Layer 5 — Operational

Operational defines how the design runs in production:

- **Service-level objectives** (SLOs), supporting service-level indicators (SLIs) and error budgets (EBs) that make SLOs measurable.
- The **runbook set** for routine operations and incident response.
- The **observability specification** (what is monitored, with what thresholds, alerting to whom).
- The **operating model** (who runs what, on what schedule, with what authority).
- The **lifecycle plan** (when and how the architecture will be patched, upgraded, and eventually retired).

Operational content is the **input to the Continue phase**. Production telemetry, audit findings, and stakeholder feedback collected against Operational definitions are the signals that trigger framework re-execution. **An architecture without explicit Operational content cannot complete the lifecycle loop and is by MOSAIC's definition incomplete.**

## 4.3 Cross-layer traceability

Traceability across the Spine is **mandatory**. Each decision artifact carries forward and backward references:

**Forward:**

```
Strategy outcome
    → lists the Capabilities that deliver it
        → each Capability lists the Logical patterns that implement it
            → each Logical pattern lists the Physical implementations that realize it
                → each Physical implementation lists the Operational SLOs it must support
```

**Backward:**

```
Operational SLO
    ← cites the Physical components that produce it
        ← Physical decision cites the Logical pattern it instantiates
            ← Logical pattern cites the Capability it provides
                ← Capability cites the Strategy outcome it supports
```

Traceability is enforced through the [MOSAIC ADR format](08-adr-format.md), which makes layer references a required field. Engagement audits verify traceability completeness as a quality check on the architect's work.
