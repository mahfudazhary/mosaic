# 05 — Commit

**Phase objective:** lock the baseline and prepare delivery.

**Typical duration:** 1–2 weeks.

## Inputs
- Calibrated design (passed Calibrate).
- All stakeholder approvals.

## Outputs
- `adrs/` — the **complete, accepted** ADR set. ADRs move from `../03-compose/adrs/` here on acceptance.
- `bom.md` (create) — bill of materials with versions and quantities (or link to the LLD's §2 if the BoM lives there).
- [`operational-spec.md`](operational-spec.md) — L5 Operational specification (SLO/SLI/EB, runbook index, observability spec, operating model, lifecycle plan).
- `validation-plan.md` (create) — what delivery must validate.
- `migration-plan.md` (create) — if the engagement includes migration.

## Commit means commit

- Every consequential decision has an `Accepted` ADR.
- Every Demand has a validation test.
- Every Operational target has a measurement plan.
- No artifact is in a "to be completed" state.
- The complete artifact set is reviewed by sponsor + practice partner + client architecture lead.

## Handover

Commit outputs are transferred to:

- The delivery team or the client's implementation organization.
- The Day-2 / Continue team for the new architecture.

The lead architect's continuing involvement is governed by the engagement's Continue scope — see Phase 6.

## Checklist before exiting Commit

- [ ] All ADRs in `Accepted` status (or explicitly `Superseded` / `Deprecated`).
- [ ] BoM finalized, dated, and version-stamped.
- [ ] Operational specification covers all six L5 sub-areas.
- [ ] Validation plan complete with mapping back to Demands.
- [ ] Migration plan (if applicable) signed by sponsor.
- [ ] Compliance-overlay deliverables present and mapped to MOSAIC artifacts (see the overlay's §6).
- [ ] Engagement sign-off recorded.
