# ADR-0014 — Adopt active-active dual-site HCI for core-banking infrastructure

| Field | Value |
| --- | --- |
| **Status** | Accepted |
| **Layer** | L3 |
| **Date** | 2026-04-22 |
| **Authors** | A. Lead Architect |
| **Reviewers** | B. Domain SME, Bu Rina (Head of Infra Ops), Pak Budi (CISO), Pak Dedi (Head of IT Risk) |

---

## CADRE Trace

- **Context:** C-001 (Broadcom subscription renewal Q3 2026), C-003 (Sponsor: CIO; CISO veto on security architecture; Head of IT Risk holds continuity sign-off).
- **Demands:** D-001 (RPO ≤ 15 min for tier-1), D-002 (RTO ≤ 1 hour for tier-1), D-003 (sustained 50k concurrent sessions), D-005 (unified VM + container platform).
- **Restrictions:** R-001 (POJK 11/2022 IT continuity), R-002 (UU PDP onshore PII residency), R-004 (Surabaya facility must be reused), R-005 (single-vendor lock-in unacceptable).
- **Exposure:** E-001 (Broadcom pricing volatility), E-002 (ESXi skill-pool concentration), E-003 (OJK ITRM revision during engagement), E-004 (inter-site fiber outage).

## Problem

The current single-site VCF estate cannot satisfy D-001 and D-002 within R-001 without architectural change. Three pattern options were considered for the future-state core-banking infrastructure, evaluated against the engagement's CADRE register and pillar weights.

## Options Considered

### Option A — Single-site VCF with enhanced backup-and-restore DR
Lowest cost. Fails D-002 (RTO ≥ 4 hours typical for restore-based DR even with optimized tooling). Retains lock-in to a single vendor (violates R-005). Operational simplicity is the only attractive property.

### Option B — Active-active dual-site HCI with synchronous replication between metro-distance DCs
Satisfies D-001, D-002, R-001 (full continuity story including tested DR). Compatible with multiple validated implementations: VCF stretched cluster, Nutanix Metro Availability, and at smaller scale Azure Local stretched. Addresses R-005 (multi-implementation feasibility). Higher initial CapEx; requires inter-site network upgrade (separate ADR-0017). Cross-site witness adds operational complexity.

### Option C — Single-site primary plus near-sync DR to a public-cloud region
Risks R-002 conflict on PII data residency — existing Indonesian-region cloud options do not provide bare-metal capacity adequate for the workload, and sovereign hyperscaler offerings are not yet generally available. Even with available regions, the cross-jurisdiction exposure and the data-egress economics would dominate the design. Eliminated by R-002.

## Quality Impact (Δ vs. status quo, −5 to +5)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **+4** | **+1** | **+1** | **+1** | **−2** | **−1** | **+1** | **+3** |

## Decision

**Adopt Option B — active-active dual-site HCI with synchronous replication between Jakarta and Surabaya.**

Rationale: it satisfies all Demands and Restrictions. It is implementable in two validated vendor implementations (VCF stretched cluster and Nutanix Metro Availability), which directly addresses R-005. The cost premium is justified by the Availability uplift (engagement weight 18) and the Adaptability uplift (engagement weight 8, but elevated by E-001), both of which align with engagement priorities. The Sovereignty preservation (R-002) is non-negotiable and rules out Option C.

The implementation selection between VCF and Nutanix is deferred to ADR-0014b (L4). Both must be carried through Calibrate; one is selected as primary at Commit, with the other documented as the validated fallback per R-005.

## Consequences

**Positive:**
- Tier-1 RPO/RTO satisfied (D-001, D-002).
- Vendor portability between two named implementations (R-005 met).
- Reduced concentration risk on ESXi skill pool (mitigates E-002).
- Aligns with future POJK direction on operational resilience (mitigates E-003).

**Negative:**
- Inter-site network upgrade required (ADR-0017) — adds ~IDR 9 bn CapEx.
- Operating cost increases ~18% vs. status quo (within R-003 envelope by tightest margin).
- Cross-site witness arrangement requires Operational-layer attention (ADR-0015 + L5 §3 runbook).
- Stretched-cluster operations require operator uplift beyond current single-site posture (Operability investment in year 1).

**Follow-up actions:**

| Action | Owner | Target date |
| --- | --- | --- |
| Witness placement decision (ADR-0015) | A. Lead Architect | 2026-04-30 |
| Implementation selection ADR (VCF vs Nutanix primary) (ADR-0014b) | A. Lead Architect | 2026-05-08 |
| Inter-site network upgrade ADR (ADR-0017) | Pak Joko, Network Lead | 2026-05-15 |
| Cross-site failover runbook draft | Bu Rina, Head of Infra Ops | 2026-06-15 |
| Operator training plan (both implementations) | Bu Rina | 2026-06-30 |

## Validation

- **Success measure:** tier-1 RPO ≤ 15 min and RTO ≤ 1 hour demonstrated in quarterly DR exercise. First exercise within 60 days of cutover; subsequent quarterly. Evidence retained for OJK ITRM submission.
- **Review trigger:** any vendor change to stretched-cluster or Metro Availability product positioning (commercial or technical); any change to R-002 sovereignty constraint; any OJK ITRM revision touching tier-1 continuity expectations.

---

## Revision history

| Date | Status change | Author | Notes |
| --- | --- | --- | --- |
| 2026-04-09 | Proposed | A. Lead Architect | After Compose iteration 2 |
| 2026-04-22 | Accepted | A. Lead Architect | All reviewers signed; sponsor noted CISO-veto path on security details |
