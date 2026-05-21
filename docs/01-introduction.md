# 1. Introduction and Purpose

## 1.1 Why a new framework

Enterprise architects working in heterogeneous environments routinely face a methodology gap. Each major technology vendor publishes its own architecture framework:

- **VMware** — Cloud Foundation Architecture and Design Guide codifies Conceptual–Logical–Physical layering with the RACR input model and AMPRS quality attributes.
- **Nutanix** — NVD hierarchy with an opinionated full-stack template approach.
- **AWS / Azure / GCP** — Well-Architected Frameworks with overlapping but non-identical pillar definitions.
- **The Open Group** — TOGAF: process-rich, vendor-neutral, and heavy.
- **SABSA** — security architecture in depth.
- **ISO/IEC 25010** — software quality attributes.
- **NIST CSF** — cybersecurity outcomes.

Each is internally coherent and externally incompatible. A practice serving clients across vendors must reconcile them constantly. An architect writing an HLD that integrates a VCF private cloud, an AWS landing zone, and an on-premises OpenShift platform cannot use any single vendor's framework without producing an artifact that systematically under-represents the other two stacks.

MOSAIC was developed to close this gap. It is a **synthesis**, not an invention. Every structural element has an antecedent in a recognized framework; the contribution is in the composition, in the explicit additions of Sovereignty and Adaptability as first-class quality pillars, and in the pluggable overlay model that lets the same methodology serve banking, public sector, healthcare, and AI engagements with consistent vocabulary and decision artifacts.

## 1.2 Goals

- **Vendor neutrality.** No structural element of the framework presumes a specific vendor's products, vocabulary, or architecture conventions.
- **Regulator compatibility.** Outputs are recognizable to ASEAN financial-services regulators (OJK, MAS, BNM, BSP) and to international auditors (PCI, SOC 2, ISO).
- **Operational realism.** The lifecycle method runs from Day-0 design through Day-2 operations and back, with feedback loops codified rather than aspirational.
- **Decision defensibility.** Every consequential design choice is captured as a structured ADR with traceability to inputs and to quality-attribute impact.
- **Practice scalability.** Architects at all seniority levels can apply the framework consistently; outputs are uniform across engagements.

## 1.3 Non-goals

MOSAIC is **not** a certification program. It does not replace vendor documentation, hands-on engineering, or domain expertise. It does not prescribe specific products — those are engagement-specific and emerge from the framework's process, not from the framework itself.

It is **not** a project management methodology; PMBOK, PRINCE2, and agile delivery remain the practice's project standards and complement MOSAIC at the engagement-execution layer.
