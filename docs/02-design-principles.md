# 2. Design Principles

Seven principles govern all framework decisions. **When subsequent guidance appears ambiguous, defer to these principles in the listed order of precedence.**

## Principle 1 — Outcome anchors everything

Every architectural decision must trace to a business outcome. Outcomes are captured at Layer 0 (Strategy) of the Spine and recorded in the **Context** element of CADRE. A decision that cannot be traced to an outcome is by definition speculative and must be justified, postponed, or removed.

## Principle 2 — Patterns before products

Logical-layer (L3) decisions describe technology classes and architectural patterns. Physical-layer (L4) decisions bind those patterns to specific vendor products. The two must not be conflated.

An architecture that begins with a product ("we will use Vendor X's converged platform") and works backward to justify it is fragile to changes in commercial conditions, version availability, or regulatory environment. An architecture that begins with a pattern and selects a product from a set of validated implementations is far less exposed to those changes.

## Principle 3 — Every consequential decision is recorded

All decisions at the Logical and Physical layers must be captured as MOSAIC ADRs ([Section 8](08-adr-format.md)). Decisions at the Capability and Operational layers should be recorded; decisions at the Strategy and Context layers must be recorded as part of the engagement charter.

## Principle 4 — Quality is multi-dimensional and explicit

Non-functional requirements are not satisfied by prose assurance. The eight quality pillars (Availability, Performance, Security, Operability, Cost, Sustainability, Sovereignty, Adaptability) are scored numerically against the design with engagement-specific weighting. Scoring is visible to all stakeholders and revisited at each major design checkpoint.

## Principle 5 — Sovereignty is first-class

Data residency, jurisdictional control, and regulatory locality are **not** sub-attributes of security or compliance. They are independent design concerns with their own pillar.

This principle reflects the operating reality of Indonesian and ASEAN engagements, where sovereignty constraints frequently dominate other considerations and are routinely under-represented in vendor frameworks designed for unconstrained hyperscaler consumption.

## Principle 6 — Lifecycle, not Day-0

The framework treats design and operation as a continuous loop, not as sequential phases. The sixth phase (Continue) feeds operational telemetry, audit findings, and stakeholder feedback back into the first phase (Frame). Designs are versioned artifacts that evolve under formal change control, not one-time deliverables.

## Principle 7 — Pragmatic over ideal

Constraints (the R in CADRE) are honored. When a constraint conflicts with a quality target, the constraint wins by default and the gap is recorded as **Exposure**. A design that ships and operates within real constraints is more valuable than a theoretically superior one that does not.

This principle does not license shortcuts; it requires architects to make trade-offs **explicit rather than hidden**.
