# 03 — Compose

**Phase objective:** build the L1–L4 architecture (HLD + LLD draft).

**Typical duration:** 3–8 weeks, iterative.

## Inputs
- CADRE register (baselined from Capture).
- [Pattern Library](../../../patterns/).
- Compliance overlay deliverable expectations.
- Vendor reference designs at L4.

## Outputs
- [`hld.md`](hld.md) — L1, L2, L3 content.
- [`lld.md`](lld.md) — L4 content (or split into multiple LLD files per domain).
- [`adrs/`](adrs/) — ADRs in `Proposed` status (accept and roll into `../05-commit/adrs/` at Commit).

## Iteration pattern

A typical engagement runs 2–3 Compose iterations:

1. **Initial draft** — dominant pattern choices.
2. **Refinement** — resolves trade-offs surfaced by stakeholder review.
3. **Final draft** — incorporates pre-Calibrate sanity checks.

Each iteration ends with a working-level review with the lead engineers and the client's architecture peers.

## Checklist before exiting Compose

- [ ] L1 Context refined: stakeholder map, scope boundary, data classification, sovereignty boundary.
- [ ] L2 Capability map exists; every Strategy outcome traces to ≥ 1 Capability.
- [ ] L3 Logical: pattern selection matrix complete; every Capability traces to ≥ 1 pattern.
- [ ] L4 Physical: implementation matrix complete; every pattern bound to ≥ 1 implementation.
- [ ] Every L3 and L4 decision has a `Proposed` ADR in `adrs/`.
- [ ] CADRE traceability complete — every ADR cites its CADRE entries.
- [ ] Stakeholder review held; feedback incorporated.
