# Engagement Templates

This folder holds **copy-and-customize templates** for engagement deliverables. Each subfolder contains a template plus the README that explains what the template is for and how to fill it out.

## How to use

**Don't edit these files directly.** Copy them into your engagement folder under `engagements/<your-engagement>/` (or use the bootstrap script).

```bash
./scripts/new-engagement.sh <client-shortname>
```

This copies the `engagements/_new-engagement/` scaffold — which is pre-loaded with the right templates from here — into `engagements/<client-shortname>/`.

## Template inventory

| Subfolder | Used in phase | What it is |
| --- | --- | --- |
| [`engagement-charter/`](engagement-charter/) | Frame (1) | One-page outcome statement + success metrics + pillar weights + executive sponsor sign-off |
| [`cadre-register/`](cadre-register/) | Capture (2) | The CADRE register: C, A, D, R, E tabs in Markdown and CSV |
| [`hld/`](hld/) | Compose (3) | High-Level Design template covering L1–L3 |
| [`lld/`](lld/) | Compose (3) | Low-Level Design template covering L4 |
| [`adr/`](adr/) | Compose (3) and Commit (5) | The MOSAIC ADR template plus naming conventions |
| [`scorecard/`](scorecard/) | Calibrate (4) | Quality scorecard with weighted fitness calculator |
| [`operational-spec/`](operational-spec/) | Commit (5) | L5 deliverable: SLO/SLI/EB, runbooks, observability spec, ops model, lifecycle plan |
| [`drift-report/`](drift-report/) | Continue (6) | Quarterly drift report comparing actual operation to design intent |

## When templates conflict with reality

Templates are starting points. Customize freely for your engagement. The **only required structural elements** are:

- ADRs use the [eight-field MOSAIC ADR format](../docs/08-adr-format.md#81-adr-template).
- CADRE entries use the [common-fields schema](../docs/appendices/A-cadre-register-template.md) plus element-specific extensions.
- The scorecard uses the [engagement-weighted fitness function](../docs/09-maturity-scoring.md#92-engagement-weighted-fitness-function).

Other artifacts (HLD, LLD, ops spec) can be freely restructured as long as they cover the layer content described in [Section 4](../docs/04-spine-six-layers.md).

## Proposing template improvements

If you significantly improve a template during an engagement, open a PR. See [`CONTRIBUTING.md`](../CONTRIBUTING.md).
