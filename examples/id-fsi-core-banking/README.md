# Example — Indonesian FSI Core-Banking Modernization

This is a **fictional, anonymized worked example** that illustrates MOSAIC end-to-end on a representative engagement. Names, figures, and details are composited from anonymized practice experience.

**Use this example to:**

- See the framework applied to a realistic engagement.
- Reference the artifact shapes when filling out templates.
- Train new architects on what a "good" MOSAIC engagement record looks like.

**Do not:**

- Copy the engagement details for a real client without re-doing the underlying work.
- Edit these files. The example is read-only reference material.

---

## Engagement at a glance

| Item | Value |
| --- | --- |
| Client | Bank Sejahtera (fictional) |
| Classification | KBMI 2 commercial bank |
| Trigger | Broadcom subscription renewal due Q3 2026 |
| Scope | Core-banking estate, Jakarta primary + Surabaya DR |
| Sponsor | CIO |
| Veto holders | CISO (security architecture), Head of IT Risk (continuity) |
| Compliance overlays loaded | ID-FSI |
| Engagement type | Migration / Displacement evaluation |

## The asks

1. Evaluate continuing on VMware versus displacing to an alternative platform.
2. Design the resulting target architecture.
3. Build the migration plan.

## What this folder contains

| File | What it is |
| --- | --- |
| [01-engagement-charter.md](01-engagement-charter.md) | Frame phase — outcome, success metrics, pillar weights, sign-off |
| [02-cadre-register.md](02-cadre-register.md) | Capture phase — condensed CADRE register |
| [03-hld.md](03-hld.md) | Compose phase — L1–L3 design |
| [04-scorecard.md](04-scorecard.md) | Calibrate phase — fitness scoring, gap register |
| [adrs/](adrs/) | Selected ADRs (full set in a real engagement would be ~20–25) |

## Outcome summary

The engagement Composed an active-active dual-site HCI design ([ADR-0014](adrs/adr-0014-active-active-hci.md)) with two validated implementations (VCF and Nutanix). Calibrate scored the design at **366/500**, in the recommended target range, with all ID-FSI floors met. The engagement proceeded to Commit; Continue runs through migration delivery and quarterly drift reports for three years.

## Reading order

For a new architect studying the framework: charter → CADRE → HLD → scorecard → ADRs.

For an experienced architect using this as a reference shape: directly to ADRs (they are the densest record of the engagement's reasoning).
