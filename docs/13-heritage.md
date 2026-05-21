# 13. Heritage and Acknowledgments

MOSAIC is a **synthesis**. Each structural element has an antecedent in a recognized framework. The contribution of MOSAIC is in **composition**, in **two new first-class quality pillars**, and in the **pluggable overlay model**.

This section maps each element of MOSAIC to its sources, both to give credit and to provide architects with pointers for deeper study.

| MOSAIC element | Primary source | What MOSAIC adds or changes |
| --- | --- | --- |
| **Six abstraction layers** (the Spine) | A security-architecture framework; an enterprise virtualization vendor's Conceptual–Logical–Physical framework | Generalized beyond security to apply to compute, network, storage, data, and AI. Explicit L0 (Strategy) and L5 (Operational) extend the typical three-layer Conceptual–Logical–Physical model. |
| **Cross-layer traceability rules** | A foundational enterprise-architecture framework; a vendor-neutral enterprise-architecture method's content metamodel | Mandatory bidirectional citation enforced through the ADR template. |
| **Six-phase lifecycle method** | A vendor-neutral enterprise-architecture method; an IT value-stream reference architecture | Compressed from the source method's eight phases to six and explicitly closed-loop. Continue makes operational feedback first-class. |
| **CADRE input model** | An enterprise virtualization vendor's Requirements–Assumptions–Constraints–Risks input model; an international requirements-engineering standard; a recognized project-management body of knowledge's assumption/constraint/risk registers | Adds Context as explicit element; renames Risks to Exposure to cover threats and dependencies, not only probability-times-impact items. |
| **Eight quality pillars** (the Lens) | An enterprise virtualization vendor's five-attribute quality model; an international software-quality standard; public-cloud Well-Architected Frameworks; FURPS+ | Adds Sovereignty and Adaptability as first-class pillars. Consolidates Recoverability with Availability and Maintainability with Operability. |
| **Architecture Decision Records** | A community-standard ADR format | Adds mandatory CADRE traceability and eight-pillar quality-impact scoring. |
| **Maturity model** | Established maturity models (process, governance, and public-cloud Well-Architected scales) | Five-level scale per pillar with engagement-weighted fitness function. |
| **Compliance overlays** | Practice-original module structure | Pluggable regulatory packs that snap onto the framework without modifying its core. Indonesian, ASEAN, EU, and sector packs maintained separately. |
| **Pattern Library structure** | Vendor validated-design programs; Christopher Alexander's pattern-language tradition | Vendor-neutral patterns with multi-implementation overlays. Pattern selection is decoupled from product selection. |
| **Operational specification (L5)** | The modern site-reliability-engineering tradition (SLO/SLI/error budget); a recognized IT-service-management framework's service value system; an IT value-stream reference architecture's Detect-to-Correct value stream | Integrated as a mandatory architecture deliverable rather than a downstream operations document. |
| **Sovereignty pillar** | Practice-original elevation | Recognized as first-class because regional engagement experience shows sovereignty considerations frequently dominate other concerns and are under-served by hyperscaler-origin frameworks. |
| **Adaptability pillar** | Practice-original elevation | Recognized as first-class because vendor displacement is now a recurring engagement type; clients require exit-cost visibility at design time. |

Architects should regard the source frameworks as **primary references** for the topics each one covers in depth. MOSAIC is the practice's working synthesis. It does not replace the specialist literature on:

- Enterprise architecture (foundational and vendor-neutral frameworks)
- Security architecture (recognized security-architecture frameworks and standards)
- Software quality (international software-quality standards)
- Site reliability (the modern site-reliability-engineering tradition)
- Service management (recognized IT-service-management frameworks)
