# 8. Architecture Decision Records (MOSAIC ADR Format)

Every consequential decision in an engagement is recorded as a **MOSAIC ADR**. The format extends the Nygard ADR template with explicit **CADRE traceability** and **eight-pillar impact scoring**.

ADRs are typically authored at the Logical and Physical layers; Strategy and Context decisions are recorded in the engagement charter, and Capability and Operational decisions are recorded as ADRs only when they involve a non-obvious trade-off.

## 8.1 ADR template

| Field | Content |
| --- | --- |
| **ID** | `ADR-NNNN`, sequential within the engagement |
| **Title** | Short imperative statement ("Use overlay networking for east-west traffic") |
| **Status** | `Proposed` \| `Accepted` \| `Superseded by ADR-XXXX` \| `Deprecated` |
| **Layer** | `L1` \| `L2` \| `L3` \| `L4` \| `L5` |
| **Date** | ISO-formatted date of decision |
| **Authors** | Named individuals who produced the decision |
| **Reviewers** | Named individuals who reviewed and concurred |
| **CADRE Trace** | References to Context, Assumptions, Demands, Restrictions, Exposure entries this decision relies on or affects |
| **Problem** | Two to three sentences describing what is being decided and why |
| **Options Considered** | Each option summarized with its essential trade-off (typically two to four options) |
| **Quality Impact** | Delta against status quo for each of the eight pillars, scored on a five-point scale |
| **Decision** | The chosen option, with reasoning that links it to the CADRE Trace and Quality Impact |
| **Consequences** | Positive and negative consequences, plus follow-up actions with owners |
| **Validation** | Success measure (how the team will know the decision worked) and review trigger (event or date that forces re-evaluation) |

The copy-ready Markdown form is in [`templates/adr/adr-template.md`](../templates/adr/adr-template.md).

## 8.2 Worked ADR example

The following is representative, drawn from an Indonesian FSI engagement. Condensed for illustration; production ADRs typically run to one or two pages. The full worked example lives in [`examples/id-fsi-core-banking/adrs/adr-0014-active-active-hci.md`](../examples/id-fsi-core-banking/adrs/adr-0014-active-active-hci.md).

> **ADR-0014 · Adopt active-active dual-site HCI for core-banking infrastructure**
>
> **Status:** Accepted &nbsp;·&nbsp; **Layer:** L3 &nbsp;·&nbsp; **Date:** 2026-04-22
>
> **Authors:** A. Lead Architect, B. Domain SME
>
> **CADRE Trace**
> - **Context:** C-001 (Broadcom subscription renewal Q3 2026), C-003 (Sponsor: CIO, CISO veto on security architecture).
> - **Demands:** D-002 (RPO ≤ 15 min for tier-1), D-005 (RTO ≤ 1 hour for tier-1), D-009 (sustained 50k concurrent sessions).
> - **Restrictions:** R-001 (POJK 11/2022 ITRM IT continuity), R-002 (UU PDP onshore data residency for PII), R-004 (single-vendor lock-in not acceptable).
> - **Exposure:** E-007 (vendor pricing volatility), E-011 (skill-pool concentration for ESXi operations).
>
> **Problem**
> The current single-site VCF estate cannot satisfy D-002 and D-005 within R-001 without architectural change. Three pattern options were considered for the future-state core-banking infrastructure.
>
> **Options Considered**
> - **A — Single-site VCF with enhanced backup-and-restore DR.** Lowest cost, fails D-005 (RTO ≥ 4 hours typical for restore-based DR), retains lock-in to a single vendor.
> - **B — Active-active dual-site HCI with synchronous replication between metro-distance DCs.** Satisfies D-002, D-005, R-001. Compatible with multiple implementations (VCF stretched cluster, Nutanix Metro Availability, Azure Local stretched). Higher initial cost; requires network upgrade.
> - **C — Single-site primary plus near-sync DR to a public-cloud region.** Risks R-002 conflict on PII data residency; existing Indonesian-region cloud options do not provide adequate bare-metal capacity.
>
> **Quality Impact** (Δ vs. status quo, −5 to +5)
>
> | Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
> | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
> | +4 | +1 | +1 | +1 | −2 | −1 | +1 | +3 |
>
> **Decision**
> Adopt **Option B**. Rationale: it satisfies all Demands and Restrictions. It is implementable in two validated vendor implementations (VCF stretched cluster and Nutanix Metro Availability), which addresses R-004. The cost premium is justified by the Availability uplift and the Adaptability uplift, both of which carry high engagement-specific weights.
>
> **Consequences**
> - **Positive:** tier-1 RPO/RTO satisfied; vendor portability between two named implementations; reduced concentration risk on ESXi skill pool.
> - **Negative:** inter-site network upgrade required (separate ADR-0017); operating cost increases ~18% vs. status quo; complexity of cross-site witness arrangement requires Operational-layer attention.
> - **Follow-up:** ADR-0015 (witness placement), ADR-0017 (network upgrade), Operational spec section 4.3 (cross-site failover runbook).
>
> **Validation**
> - **Success measure:** tier-1 RPO ≤ 15 min and RTO ≤ 1 hour demonstrated in quarterly DR exercise.
> - **Review trigger:** any vendor change to stretched-cluster or Metro Availability product positioning; any change to R-002 sovereignty constraint.

## 8.3 Operating rules

- **Single owner.** Each ADR has one named author. Multiple reviewers are expected; multiple authors are not.
- **Immutable after acceptance.** Status changes from `Proposed` to `Accepted` on sign-off. Subsequent changes require either:
  - a new ADR that supersedes the original (preferred), or
  - a tracked-change amendment with author and reviewer re-sign-off.
- **Citable.** ADRs are cited by ID in subsequent design documents and operational specifications. The ADR is the canonical source; design documents are derivative summaries.
- **Versioned.** ADRs are stored in version control alongside the engagement's other artifacts. The complete ADR set is delivered to the client as part of engagement closeout.
