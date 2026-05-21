# 13. Heritage and Acknowledgments

MOSAIC is a **synthesis**. Each structural element has an antecedent in a recognized framework. The contribution of MOSAIC is in **composition**, in **two new first-class quality pillars**, and in the **pluggable overlay model**.

This section maps each element of MOSAIC to its sources, both to give credit and to provide architects with pointers for deeper study.

| MOSAIC element | Primary source | What MOSAIC adds or changes |
| --- | --- | --- |
| **Six abstraction layers** (the Spine) | SABSA (Sherwood Applied Business Security Architecture); VMware CLP (Conceptual–Logical–Physical) from the VCF Architecture and Design Guide | Generalized beyond security to apply to compute, network, storage, data, and AI. Explicit L0 (Strategy) and L5 (Operational) extend the typical CLP three-layer model. |
| **Cross-layer traceability rules** | Zachman Framework (1987); TOGAF Architecture Content Metamodel | Mandatory bidirectional citation enforced through the ADR template. |
| **Six-phase lifecycle method** | TOGAF Architecture Development Method (ADM); IT4IT Reference Architecture | Compressed from TOGAF's eight phases to six and explicitly closed-loop. Continue makes operational feedback first-class. |
| **CADRE input model** | VMware RACR (Requirements–Assumptions–Constraints–Risks); ISO/IEC/IEEE 29148 requirements engineering; PMI PMBOK assumption/constraint/risk registers | Adds Context as explicit element; renames Risks to Exposure to cover threats and dependencies, not only probability-times-impact items. |
| **Eight quality pillars** (the Lens) | VMware AMPRS; ISO/IEC 25010 software quality model; AWS, Azure, and Google Cloud Well-Architected Frameworks; FURPS+ | Adds Sovereignty and Adaptability as first-class pillars. Consolidates Recoverability with Availability and Maintainability with Operability. |
| **Architecture Decision Records** | Michael Nygard ADR format ("Documenting Architecture Decisions," 2011) | Adds mandatory CADRE traceability and eight-pillar quality-impact scoring. |
| **Maturity model** | CMMI; COBIT 2019; AWS Well-Architected maturity scale | Five-level scale per pillar with engagement-weighted fitness function. |
| **Compliance overlays** | Practice-original module structure | Pluggable regulatory packs that snap onto the framework without modifying its core. Indonesian, ASEAN, EU, and sector packs maintained separately. |
| **Pattern Library structure** | Vendor validated-design programs (Nutanix NVD, Cisco CVD, VMware VVD, NetApp NVA, Pure PVD); Christopher Alexander's pattern-language tradition | Vendor-neutral patterns with multi-vendor Implementation overlays. Pattern selection is decoupled from product selection. |
| **Operational specification (L5)** | Google SRE workbook (SLO/SLI/Error Budget); ITIL v4 service value system; IT4IT Detect-to-Correct value stream | Integrated as a mandatory architecture deliverable rather than a downstream operations document. |
| **Sovereignty pillar** | Practice-original elevation | Recognized as first-class because regional engagement experience shows sovereignty considerations frequently dominate other concerns and are under-served by hyperscaler-origin frameworks. |
| **Adaptability pillar** | Practice-original elevation | Recognized as first-class because vendor displacement is now a recurring engagement type; clients require exit-cost visibility at design time. |

Architects should regard the source frameworks as **primary references** for the topics each one covers in depth. MOSAIC is the practice's working synthesis. It does not replace the specialist literature on:

- Enterprise architecture (TOGAF, Zachman)
- Security architecture (SABSA, NIST)
- Software quality (ISO 25010)
- Site reliability (Google SRE)
- Service management (ITIL v4)
