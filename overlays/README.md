# Compliance Overlays

Compliance overlays are **pluggable modules** that extend the framework with regulatory mandates without modifying its core. Each overlay snaps onto an engagement at Frame; the loaded overlays are recorded in the engagement charter with the version applied.

## How to use an overlay on an engagement

1. At **Frame**, identify the regulatory environment(s) for the engagement and select the relevant overlay(s) from this folder. Multiple overlays may stack.
2. Record the overlay name and version in the [engagement charter](../templates/engagement-charter/engagement-charter.md#7-compliance-overlays-loaded).
3. At **Capture**, load the overlay's pre-populated R-entries into the engagement's [CADRE register](../templates/cadre-register/cadre-register.md#r--restrictions). Mark each as applicable or `Not applicable — <reason>`.
4. At **Calibrate**, validate the design against the overlay's **pillar floors**. Designs that fall below a floor cannot proceed to Commit until remediated.
5. At **Commit**, ensure the overlay's **deliverable expectations** are produced and signed off.

## Inventory

| Overlay | Version | Applicable context | Status |
| --- | --- | --- | --- |
| [ID-FSI](id-fsi.md) | 1.1 | Indonesia financial services | Active |
| [ID-GOV](id-gov.md) | 1.1 | Indonesia government and SOE | Active |
| [ASEAN-FSI](asean-fsi.md) | 1.1 | ASEAN financial services (non-Indonesia) | Active |
| [GLOBAL-CARD](global-card.md) | 1.1 | Payment-card processing | Active |
| [EU-FIN](eu-fin.md) | 1.1 | EU financial services and EU-linked operations | Active |
| [Healthcare (HC)](healthcare.md) | 1.1 | Healthcare and life sciences | Active |
| [AI](ai.md) | 1.1 | AI and machine-learning workloads | Active |
| [SUSTAIN](sustain.md) | 1.1 | ESG and sustainability reporting | Active |

## Stacking overlays

Overlays can stack on a single engagement. Common combinations:

- **ID-FSI + GLOBAL-CARD** — Indonesian bank with payment-card processing.
- **EU-FIN + AI** — EU financial-services AI use case under DORA + EU AI Act.
- **ID-GOV + SUSTAIN** — Indonesian government engagement with ESG reporting obligations.

When overlays stack, **the most stringent floor wins** for each pillar. Conflicting mandates are surfaced as Exposure entries and escalated to the engagement sponsor for resolution.

## Maintenance

Owned by the practice's **Compliance Lead** with input from sector specialists. Reviewed annually and on any material change to an underlying regulatory publication. Each overlay tracks its own version history independently of the core framework's version.

When proposing a new overlay or revising an existing one, see [`CONTRIBUTING.md`](../CONTRIBUTING.md).
