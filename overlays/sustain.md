# Compliance Overlay — SUSTAIN

> **Code:** SUSTAIN · **Version:** 1.1 · **Status:** Active
> **Owner:** Practice Compliance Lead · **Last reviewed:** 2026-05

## 1. Applicable context

Architectures supporting clients with sustainability disclosure obligations under CSRD (EU), ISSB IFRS S1/S2 (global), or local equivalents (Indonesian POJK sustainability reporting, SOE-mandated ESG disclosures). Often stacks with sector overlays where the IT estate contributes data to enterprise sustainability reporting.

## 2. Mandate index

| # | Mandate | Source citation | Architectural implication |
| :-: | --- | --- | --- |
| 1 | Corporate Sustainability Reporting Directive | EU Directive 2022/2464 (CSRD) | IT contribution to Scope 1/2/3 carbon, energy, e-waste reporting |
| 2 | IFRS Sustainability Disclosure Standards | ISSB IFRS S1, S2 | Climate-related financial disclosures including value-chain emissions |
| 3 | Indonesian sustainability disclosure | OJK POJK 51/2017 (sustainability finance) and successors | Sustainability report obligations for OJK-supervised entities |
| 4 | Greenhouse Gas Protocol | GHG Protocol Corporate Standard | Standard methodology for organizational emissions accounting |

## 3. Pre-populated Restrictions

| R-ID | Statement | Citation | Waivable |
| --- | --- | --- | :---: |
| R-001 | Energy and emissions data for in-scope IT estate collected, attributable to organizational entity, and audit-trail-retained | CSRD / ISSB | No |
| R-002 | Hardware lifecycle managed with documented refresh policy and e-waste disposition records | CSRD ESRS E5 / local | No |
| R-003 | Where claimed, renewable-energy attestation supported by RECs, PPAs, or facility-level evidence | GHG Protocol | No |
| R-004 | Cloud emissions estimated using provider-supplied or independent methodology; documented and consistent | ISSB S2 | No |

## 4. Pillar floors

| Pillar | Floor | Rationale |
| --- | :---: | --- |
| Sustainability & GreenOps | 3 | Workload-level energy estimates required; lifecycle managed |
| Operability & Observability | 3 | Data collection pipeline required |
| Sovereignty & Compliance | 3 | Reporting evidence retention |

## 5. Default pillar weight presets

SUSTAIN is rarely the dominant overlay; usually stacked. When it is dominant (sustainability-led engagement):

| Pillar | Suggested weight |
| --- | :---: |
| Sustainability & GreenOps | 20 |
| Cost & FinOps | 16 |
| Operability & Observability | 14 |
| Sovereignty & Compliance | 12 |
| Security & Trust | 12 |
| Availability & Resilience | 10 |
| Performance & Scale | 10 |
| Adaptability & Portability | 6 |
| **Total** | **100** |

## 6. Deliverable expectations

| Regulator-expected document | MOSAIC artifact |
| --- | --- |
| Energy and emissions data feed to enterprise ESG reporting | L5 observability specification (extended to energy/carbon metrics) |
| Hardware lifecycle policy and refresh plan | L5 lifecycle plan §6 |
| E-waste disposition records | Operational artifacts (linked from L5) |
| Provider emissions evidence | LLD BoM annotated with emissions data |

## 7. Cross-references

**Patterns most often affected:**
- [Private Cloud — Hyperconverged](../patterns/private-cloud-hyperconverged.md) (hardware refresh, PUE), [AI / ML Platform](../patterns/ai-ml-platform.md) (energy intensity), [Hybrid Cloud Extension](../patterns/hybrid-cloud-extension.md) (cloud-provider emissions data), [Observability Platform](../patterns/observability-platform.md) (collection pipeline).

**Common stacking combinations:** SUSTAIN + ID-FSI; SUSTAIN + ID-GOV; SUSTAIN + EU-FIN; SUSTAIN + AI.

## 8. Version history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 1.0 | 2026-05 | Practice Compliance Lead | Initial issue |
| 1.1 | 2026-05 | Practice Compliance Lead | Refresh on CSRD and ISSB |
