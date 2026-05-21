# MOSAIC Framework — Consultant Template

**MOSAIC** — _Modular, Outcome-driven Solution Architecture and Implementation Compass_ — is a vendor-neutral, outcome-driven architecture methodology for enterprise solution architects.

This repository is the **practice template** for running engagements with MOSAIC. It bundles the framework reference, ready-to-fill engagement templates, a pattern library, compliance overlays, and a worked example. Clone, customize per engagement, commit your work, contribute reusable artifacts back.

> Framework version: **v1.1** (May 2026) · Practice-confidential intellectual property.

---

## What's in here

| Folder | Purpose | Treat as |
| --- | --- | --- |
| [`docs/`](docs/) | The framework reference — Spine, CADRE, Lens, six-phase Method, ADRs, maturity model, glossary | Read-only (update only via Practice Methodology Working Group) |
| [`templates/`](templates/) | Empty templates you copy per engagement: charter, CADRE register, ADR, scorecard, HLD/LLD, ops spec, drift report | Copy → fill → commit |
| [`patterns/`](patterns/) | Pattern Library at the Logical layer (L3) with multi-vendor Implementation matrix | Reuse; propose additions via PR |
| [`overlays/`](overlays/) | Pluggable compliance overlays (ID-FSI, ID-GOV, ASEAN-FSI, EU-FIN, PCI, AI, HC, SUSTAIN) | Load relevant ones at Frame |
| [`examples/`](examples/) | Worked example — Indonesian FSI core-banking modernization (anonymized) | Reference; don't edit |
| [`engagements/`](engagements/) | Where each live engagement lives — one folder per client/project | Create via the bootstrap script |
| [`scripts/`](scripts/) | Helper scripts (engagement bootstrap, scorecard calculator) | Run as needed |

---

## Quick start — using this repo on a new engagement

```bash
# 1. Clone the template to a working repo for your engagement
git clone <this-repo> mosaic-<client-shortname>
cd mosaic-<client-shortname>

# 2. Bootstrap an engagement folder
./scripts/new-engagement.sh <client-shortname>

# 3. Open the generated folder and work through the six phases
cd engagements/<client-shortname>
```

The script copies `engagements/_new-engagement/` to `engagements/<your-name>/` with all six phase folders pre-populated with the right templates.

If you prefer no script: just copy `engagements/_new-engagement/` manually.

---

## The framework in 60 seconds

**Three axes** answer three questions, intersected by a **six-phase method**.

```
                   ┌────────────────────────────────────────────────┐
                   │              AXIS 3 — LENS (8 Pillars)         │
                   │ Avail · Perf · Sec · Ops · Cost · Sustain ·    │
                   │ Sovereignty · Adaptability                     │
                   └────────────────────────────────────────────────┘
                                       ▲
                                       │ scored against
                                       │
   AXIS 1 — SPINE                      │
   L0 Strategy                         │
   L1 Context        ◄────────────  Architecture  ────────────►   AXIS 2 — INPUTS (CADRE)
   L2 Capability                    being designed                Context · Assumptions ·
   L3 Logical                          │                          Demands · Restrictions ·
   L4 Physical                         │                          Exposure
   L5 Operational                      │ shaped by
                                       ▼
                  Frame → Capture → Compose → Calibrate → Commit → Continue
                                            (loop back to Frame)
```

- **Spine** = abstraction hierarchy (Strategy → Operational, 6 layers)
- **CADRE** = the forces that shape every decision
- **Lens** = the eight quality pillars you score the design against
- **Method** = the operational procedure that uses all three axes

Read [`docs/03-framework-overview.md`](docs/03-framework-overview.md) first, then [`docs/07-six-phase-method.md`](docs/07-six-phase-method.md).

---

## The seven operating principles (in precedence order)

1. **Outcome anchors everything.** Every decision traces to a business outcome.
2. **Patterns before products.** L3 selects patterns; L4 binds them to vendor products.
3. **Every consequential decision is recorded.** As a MOSAIC ADR.
4. **Quality is multi-dimensional and explicit.** Eight pillars, scored.
5. **Sovereignty is first-class.** Not a sub-attribute of security.
6. **Lifecycle, not Day-0.** Continue feeds back to Frame.
7. **Pragmatic over ideal.** Restrictions win over Demands; gaps become Exposure.

When guidance conflicts, defer to these in order.

---

## Where to start (by role)

| Role | Read this | Then |
| --- | --- | --- |
| Executive / engagement partner | [`docs/00-executive-summary.md`](docs/00-executive-summary.md), [`docs/03-framework-overview.md`](docs/03-framework-overview.md) | [`docs/appendices/C-quick-reference-card.md`](docs/appendices/C-quick-reference-card.md) |
| Lead architect | Everything in `docs/` | Use [`templates/`](templates/) and [`patterns/`](patterns/) on engagement |
| Pre-sales architect | [`docs/03-framework-overview.md`](docs/03-framework-overview.md), [`patterns/`](patterns/), [`examples/`](examples/) | Use Frame + compressed Capture templates |
| Compliance / risk partner | [`docs/10-compliance-overlays.md`](docs/10-compliance-overlays.md), [`docs/09-maturity-scoring.md`](docs/09-maturity-scoring.md) | Maintain overlays in [`overlays/`](overlays/) |

---

## Customizing per project

Every engagement is different. Customization happens in three places:

1. **`engagements/<name>/`** — your engagement's own artifacts. Always customize here.
2. **`overlays/<your-overlay>.md`** — if the engagement introduces a new regulatory context, add an overlay and propose it back via PR.
3. **`patterns/<new-pattern>.md`** — if you select a pattern not yet in the library, add it (with at least one validated Implementation) and propose it back.

Do **not** modify `docs/` content on a per-engagement basis. Framework changes flow through the Practice Methodology Working Group on a 12-month cadence (interim errata permitted).

---

## Repository conventions

- **Markdown for all narrative artifacts.** ADRs, CADRE entries, HLD/LLD content, ops specs.
- **CSV for registers and scorecards.** Easier to manipulate in spreadsheet workflows.
- **One ADR per file** in `engagements/<name>/05-commit/adrs/adr-NNNN-<slug>.md`.
- **Versioned in git.** Don't email artifacts — link to the repo.
- **Practice-confidential by default.** Selected sections (Framework Overview, Pattern Library structure, ADR template) may be shared with clients under engagement NDA. Compliance overlay content is internal-only.

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for how to propose pattern/overlay additions back to the practice library.

---

## Heritage

MOSAIC is a synthesis, not an invention. It borrows from SABSA, VMware CLP/RACR/AMPRS, TOGAF ADM, ISO 25010, AWS/Azure/GCP WAF, NIST CSF, SRE/ITIL/IT4IT, Zachman, Nygard ADRs, CMMI, and the Christopher Alexander pattern tradition. Full attribution in [`docs/13-heritage.md`](docs/13-heritage.md).

The unique contributions are:
1. **Sovereignty** and **Adaptability** as first-class quality pillars (not sub-attributes).
2. Explicit **pattern–implementation separation** that lets a single pattern carry multiple vendor realizations.
3. **Pluggable compliance overlays** that snap onto the framework without modifying its core.
4. **Engagement-weighted fitness function** for pillar scoring.

---

## Contact

Practice Methodology Working Group · framework reviewed and republished on a 12-month cadence · interim updates released as numbered errata.

Issues / proposed extensions: open a GitHub issue or PR against this repo.
