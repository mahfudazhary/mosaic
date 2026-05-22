# 12. Glossary

| Term | Definition |
| --- | --- |
| **ADR** (Architecture Decision Record) | Structured record of a single architectural decision: context, options, decision, consequences, validation. See [Section 8](08-adr-format.md). |
| **Anti-pattern** | A recurring design choice that appears reasonable but produces predictable negative outcomes; called out per pattern. |
| **Assumptions (A)** | Statements taken as true without proof, recorded in the CADRE register with a validation plan and fallback. The "A" of CADRE. |
| **BCP** | Business Continuity Planning; the organizational discipline governing recovery from disruption. |
| **BIFast** | Bank Indonesia Fast Payment System; real-time retail payment infrastructure with mandatory technical standards for participants. |
| **BoM** | Bill of Materials; the Physical-layer artifact enumerating products, versions, and SKUs. |
| **BSSN** | _Badan Siber dan Sandi Negara_ — Indonesia's National Cyber and Crypto Agency; issues cybersecurity guidance for government and critical infrastructure. |
| **CADRE** | Context, Assumptions, Demands, Restrictions, Exposure — MOSAIC's five-element input model. See [Section 5](05-cadre-inputs.md). |
| **Calibrate** | Phase 4. Scores the design against the eight quality pillars and validates against CADRE. |
| **Capture** | Phase 2. Builds the CADRE register. |
| **CLP** | Conceptual–Logical–Physical — an industry-standard abstraction progression inherited and extended by MOSAIC. |
| **Commit** | Phase 5. Locks the baseline and prepares delivery. |
| **Compliance Overlay** | Pluggable module that extends MOSAIC with sector-specific or regional regulatory mandates. See [Section 10](10-compliance-overlays.md). |
| **Compose** | Phase 3 of the MOSAIC method. Produces L1–L4 architecture documents. |
| **Context (C)** | The environment and stakeholders in which the architecture must operate; the "C" of CADRE. |
| **Continue** | Phase 6. Operational telemetry, audit findings, and stakeholder feedback are collected and feed back into Frame. |
| **Demands** | The **D** in CADRE. Functional and non-functional requirements. |
| **DORA** | EU Digital Operational Resilience Act, applicable from 17 January 2025. |
| **Drift report** | The Continue-phase artifact recording observed deviation between operational reality and the Calibrate-phase baseline. |
| **Engagement charter** | The Frame-phase artifact capturing outcome, value hypothesis, success criteria, executive stakeholder matrix, scope, pillar weights, and pre-authorized trade-offs. |
| **Engagement-weighted fitness** | The MOSAIC scoring function: sum of pillar scores multiplied by engagement-specific pillar weights summing to 100. See [Section 9](09-maturity-scoring.md). |
| **Exposure** | The **E** in CADRE. Risks, dependencies, and threats. |
| **Fitness function** | See _Engagement-weighted fitness_. |
| **Frame** | Phase 1. Establishes the engagement charter and Layer 0 (Strategy) content. |
| **HLD** | High-Level Design; the Compose-phase artifact covering Spine layers L1–L3. |
| **Implementation** | Specific realization of a Pattern (commercial product, open-source stack, or hyperscaler service). See [Section 11](11-pattern-library.md). |
| **KBMI** | _Kelompok Bank berdasarkan Modal Inti_ — Indonesian bank classification by core capital tier (replaced the BUKU classification in 2021 under POJK 12/POJK.03/2021). |
| **Komdigi** | _Kementerian Komunikasi dan Digital_ — Indonesian Ministry of Communication and Digital Affairs (renamed from Kominfo in October 2024 under Presidential Regulation 174/2024). |
| **Layer** (Spine layer) | One of the six abstraction layers (Strategy, Context, Capability, Logical, Physical, Operational). See [Section 4](04-spine-six-layers.md). |
| **Lens** | The eight quality pillars (Axis 3). See [Section 6](06-lens-eight-pillars.md). |
| **LLD** | Low-Level Design; the Compose-phase artifact covering Spine layer L4. |
| **Maturity level** | One of the five-level scores (Reactive, Basic, Mature, Optimized, Innovative) applied to each quality pillar. See [Section 9](09-maturity-scoring.md). |
| **MOSAIC** | Modular, Outcome-driven Solution Architecture and Implementation Compass; the framework named throughout this repository. |
| **Pattern** | An L3 (Logical) architectural construct that solves a recurring problem. See [Section 11](11-pattern-library.md). |
| **Pillar** (Quality pillar) | One of the eight quality attributes (Axis 3). See [Section 6](06-lens-eight-pillars.md). |
| **Pillar floor** | A minimum acceptable score for a quality pillar, imposed by an active compliance overlay. |
| **POJK** | _Peraturan Otoritas Jasa Keuangan_ — regulation issued by Indonesia's Financial Services Authority. POJK 11/POJK.03/2022 governs IT in commercial banks; POJK 12/POJK.03/2021 governs commercial-bank classification. |
| **PP 71/2019** | _Peraturan Pemerintah Nomor 71 Tahun 2019_ — Indonesian government regulation on Electronic Systems and Transactions; supersedes PP 82/2012. |
| **Restrictions** | The **R** in CADRE. Constraints, compliance mandates, and regulatory obligations. |
| **SLO / SLI / EB** | Service Level Objective, Service Level Indicator, Error Budget. Constructs from the modern site-reliability-engineering tradition, adopted by MOSAIC's L5 (Operational) layer. |
| **Spine** | The six-layer abstraction axis (Axis 1). See [Section 4](04-spine-six-layers.md). |
| **UU PDP** | _Undang-Undang Perlindungan Data Pribadi_ (UU 27/2022) — Indonesia's Personal Data Protection Law. |
