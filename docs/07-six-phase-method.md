# 7. The Six-Phase Lifecycle Method

The Method is MOSAIC's **operational procedure** — the sequence in which architects apply the three axes to deliver an engagement. The six phases are deliberately short-named so they are memorable and conversational:

> **Frame · Capture · Compose · Calibrate · Commit · Continue**

The phases are **iterative, not waterfall**. Continue feeds operational reality back into Frame, and an engagement may loop through several Compose–Calibrate cycles before Commit.

## 7.1 Phase summary

| Phase | Name | Primary objective | Inputs | Outputs |
| --- | --- | --- | --- | --- |
| 1 | **Frame** | Establish the engagement charter and Layer 0 (Strategy) content | Client brief, RFP, sponsor interviews | Outcome statement, scope, success metrics, sponsor sign-off |
| 2 | **Capture** | Build the CADRE register | Workshops, existing documents, stakeholder interviews, regulatory references | Versioned CADRE register, baselined and signed off |
| 3 | **Compose** | Build the L1–L4 architecture | CADRE register, pattern library, compliance overlays | Layered architecture documents (HLD/LLD draft) |
| 4 | **Calibrate** | Score the design against the eight pillars and validate against CADRE | Composed architecture, engagement-weighted pillar weights | Quality scorecard, gap register, risk-weighted view |
| 5 | **Commit** | Lock the baseline and prepare delivery | Calibrated design, stakeholder approvals | ADR set, BoM, Operational specification, validation plan |
| 6 | **Continue** | Operate, measure, evolve | Production telemetry, audit findings, stakeholder feedback | Drift report, change requests; loop back to Frame |

## 7.2 Phase detail

### 7.2.1 Phase 1 — Frame

Frame establishes the **engagement charter**. The lead architect, working with the engagement partner and the client's executive sponsor, produces Layer 0 content:

- A one-page outcome statement.
- A value hypothesis.
- A set of measurable success criteria (typically three to five).
- A stakeholder-responsibility matrix at the executive level.

Frame is **brief** — typically one to two weeks on a standard engagement. It produces a signed engagement charter that becomes the contract between the practice and the client for the architecture work.

Frame outputs do not typically change during the engagement; if they do, the engagement is re-baselined and Frame is re-executed.

Frame is also the phase where the **engagement-specific pillar weights** are set. Weights are negotiated jointly with the client and recorded in the charter. They govern how the design will be scored at Calibrate and which trade-offs are pre-authorized.

> **Template**: [`templates/engagement-charter/engagement-charter.md`](../templates/engagement-charter/engagement-charter.md)

### 7.2.2 Phase 2 — Capture

Capture builds the **CADRE register**. Architects conduct stakeholder workshops, review existing documentation (current-state architecture, prior engagement deliverables, audit reports, regulatory submissions), and produce a versioned CADRE register that becomes the input to all subsequent phases.

**Capture quality is the single largest predictor of engagement quality.** A weak CADRE register — vague Demands, casually-recorded Assumptions, incomplete Restrictions — produces a weak architecture regardless of how well later phases are executed.

Lead architects should resist pressure to short-cut Capture and should negotiate Capture duration explicitly with engagement managers. **One to three weeks is typical**, with longer durations for engagements with deep compliance overlays or unfamiliar client estates.

Capture closes with a **CADRE baseline review** attended by all named element owners. The baselined register is signed off and version-controlled; subsequent changes flow through formal change control referencing the affected entries.

> **Template**: [`templates/cadre-register/`](../templates/cadre-register/)

### 7.2.3 Phase 3 — Compose

Compose builds the architecture across **Layers 1 through 4**. Architects work top-down through Context, Capability, Logical, and Physical layers, producing HLD and LLD drafts that satisfy the CADRE register.

Compose is the **most creative phase** of the method and the one where architectural craft most visibly applies.

Compose is **iterative within itself**. A typical engagement runs two or three Compose iterations:

1. An initial draft that captures the dominant pattern choices.
2. A refinement that resolves trade-offs surfaced by stakeholder review.
3. A final draft that incorporates pre-Calibrate sanity checks.

Each iteration ends with a working-level review with the lead engineers and the client's architecture peers.

Compose draws heavily on the **[Pattern Library](11-pattern-library.md)** at Layer 3 and on vendor validated-design programs at Layer 4. The library is the practice's accumulated knowledge of which patterns work in which contexts. Compose's first action on a new engagement is typically a library scan to identify candidate patterns.

> **Templates**: [`templates/hld/`](../templates/hld/), [`templates/lld/`](../templates/lld/)

### 7.2.4 Phase 4 — Calibrate

Calibrate **measures** the composed design against the eight quality pillars and **validates** it against the CADRE register. It is the phase most often skipped or under-invested in by less mature architects, and **one of the strongest defensive controls** the framework provides against design drift, over-engineering, and under-engineering.

Calibrate produces three deliverables:

- **Quality scorecard** — pillar scores on the 1–5 maturity scale, with the engagement-weighted fitness function applied to produce an overall design score.
- **Gap register** — where the design under-delivers against CADRE Demands or pillar targets, with remediation options.
- **Risk-weighted view** — which Exposure entries remain after the current design, with residual likelihood-impact ratings and mitigation status.

Calibrate is the **formal go/no-go decision point** for the design. The engagement partner, lead architect, and client architecture lead jointly review Calibrate outputs and decide whether to:

- Proceed to Commit, or
- Return to Compose for further iteration, or
- Escalate scope or constraint conflicts to the sponsor.

> **Template**: [`templates/scorecard/`](../templates/scorecard/)

### 7.2.5 Phase 5 — Commit

Commit **locks the baseline**. The architect produces:

- The final ADR set with all decisions recorded and signed off.
- The bill of materials with versions and quantities.
- The Operational specification (Layer 5 content).
- The validation plan that delivery will execute against.

Commit outputs are transferred to the delivery team or to the client's implementation organization. The architect's role in Commit is to ensure traceability and completeness — **no decision lacks an ADR, no requirement lacks a validation test, and no operational target lacks a measurement plan**.

> **Templates**: [`templates/adr/`](../templates/adr/), [`templates/operational-spec/`](../templates/operational-spec/)

### 7.2.6 Phase 6 — Continue

Continue is where the framework's **lifecycle commitment is realized**. Once the architecture is in production, operational telemetry, audit findings, and stakeholder feedback are continuously collected against the Layer 5 Operational specification.

A defined cadence (typically **quarterly**) produces a **drift report** comparing actual operation against design intent. Significant drift triggers a re-execution of the framework starting at Frame, treating the existing architecture as input rather than baseline.

Continue is the phase that distinguishes MOSAIC from project-bounded architecture methodologies. The framework's commitment is that an architecture is a living artifact. **The practice's commitment to clients includes ongoing custodianship, not just initial design.**

> **Template**: [`templates/drift-report/`](../templates/drift-report/)

## 7.3 Phase cadence variations

Not every engagement runs all six phases at full depth. Common engagement shapes:

| Variation | Phases run | Typical duration |
| --- | --- | --- |
| **Pre-sales / Discovery** | Frame + compressed Capture and Compose. Produces a target architecture sketch and a CADRE register sufficient for proposal generation. Calibrate is light-touch; Commit and Continue do not apply. | 1–3 weeks |
| **Health Check** | Capture and Calibrate only. The existing architecture is the input; the output is the scorecard and gap register. Frequently used for audit preparation and pre-renewal assessments. | 2–4 weeks |
| **Migration / Displacement** | Frame, Capture, partial Compose (Layer 3 unchanged; Layer 4 fully re-implemented), Calibrate, Commit, Continue. The framework's pattern-implementation separation makes this variation explicit and efficient. | 8–16 weeks |
| **Full engagement** | All six phases | 12–26 weeks plus Continue |
