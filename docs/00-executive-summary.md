# Executive Summary

**MOSAIC** — _Modular, Outcome-driven Solution Architecture and Implementation Compass_ — is the practice's vendor-neutral methodology for designing, delivering, and operating enterprise infrastructure and platform solutions.

It solves a specific problem: every major vendor maintains its own architecture framework with its own vocabulary, and clients increasingly run hybrid estates that touch several of them. MOSAIC consumes any vendor's reference design and produces a coherent, defensible architecture artifact set.

## What MOSAIC provides

- **Three structural axes** — a six-layer abstraction **Spine** (Strategy → Operational), a five-element decision-input model (**CADRE**), and an eight-pillar quality **Lens** covering Availability, Performance, Security, Operability, Cost, Sustainability, Sovereignty, and Adaptability.
- **A six-phase lifecycle method** — Frame, Capture, Compose, Calibrate, Commit, Continue — that closes the loop from Day-0 design to Day-2 operation and back.
- **A standardized ADR format** with mandatory traceability to CADRE inputs and quality-pillar impact.
- **Pluggable compliance overlays** that map regional and sector regulations (OJK, UU PDP, MAS TRM, PCI-DSS, DORA, NIST CSF, ISO 27001) onto the framework without changing its core.
- **A vendor-neutral pattern library** where each architectural pattern carries multiple implementation options. The practice can move a client between implementations by swapping the overlay, not the design.

## Why it matters to the practice

Three commercial pressures motivate MOSAIC.

1. **Vendor disruption.** Recurring upheavals among large infrastructure vendors have destabilized incumbent estates and accelerated client demand for vendor-neutral architecture advice. Clients want to know whether to renew, displace, or rationalize — and they want that advice expressed in language not anchored to any single vendor.
2. **Regulatory sovereignty.** Indonesian and ASEAN regulators have raised expectations around data sovereignty, IT risk governance, and cross-border data transfer. MOSAIC's first-class Sovereignty pillar and pluggable regulatory overlays address this directly.
3. **AI and agentic workloads.** Rapid maturation of AI workloads has introduced new quality concerns — model governance, GPU utilization, energy efficiency — that traditional infrastructure frameworks under-serve. MOSAIC's Sustainability and Adaptability pillars and its AI pattern overlays are designed for this reality.

## How MOSAIC differs from existing frameworks

MOSAIC borrows liberally and credits its sources (see [Heritage](13-heritage.md)). Its unique contributions are four:

1. It elevates **Sovereignty** and **Adaptability** to first-class quality pillars rather than treating them as sub-attributes of Security and Operability.
2. It enforces an explicit **pattern–implementation separation** that lets a single pattern carry multiple realizations.
3. It introduces a pluggable **compliance overlay model** that lets the same framework serve FSI, public sector, healthcare, and AI engagements without forking.
4. It applies an **engagement-weighted fitness function** to pillar scoring, acknowledging that not all pillars matter equally on every engagement.

## Reading path

- Foundations: [Introduction](01-introduction.md), [Design Principles](02-design-principles.md), [Framework Overview](03-framework-overview.md).
- The model: [Spine](04-spine-six-layers.md), [CADRE](05-cadre-inputs.md), [Lens](06-lens-eight-pillars.md).
- The method: [Six-Phase Method](07-six-phase-method.md), [ADRs](08-adr-format.md), [Maturity & Scoring](09-maturity-scoring.md).
- Pluggable modules: [Compliance Overlays](10-compliance-overlays.md), [Pattern Library](11-pattern-library.md).
- Reference: [Heritage](13-heritage.md), [Glossary](12-glossary.md), and the [appendices](appendices/).

New architects should read the foundations and the model before attempting an engagement; experienced architects can use the method and reference material as working reference.
