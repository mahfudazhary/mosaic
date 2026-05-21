# CADRE Register Template

The CADRE register is the single most important artifact a lead architect produces in an engagement. Capture quality determines engagement quality.

Two parallel forms are provided so you can work in whichever fits your client:

| Form | When to use |
| --- | --- |
| [`cadre-register.md`](cadre-register.md) | Narrative-heavy engagements; the register lives in the engagement repo and is reviewed in-line |
| [`cadre-register.csv`](cadre-register.csv) | Spreadsheet-driven engagements; import into any spreadsheet tool and round-trip back to CSV |

The two are **equivalent in schema**. Pick one as the canonical version per engagement and stick with it. Don't try to maintain both in parallel.

## Schema

See [Appendix A](../../docs/appendices/A-cadre-register-template.md) for the authoritative field list. Quick form:

| Element | Common fields | Element-specific fields |
| --- | --- | --- |
| **Context** | ID, Statement, Source, Owner, Status, Related ADRs, Pillar tags, Date captured / reviewed | — |
| **Assumptions** | ↑ same | Validation plan, Fallback |
| **Demands** | ↑ same | Type (Functional/NF), Testability criterion, MoSCoW |
| **Restrictions** | ↑ same | Subcategory, Citation, Waivable |
| **Exposure** | ↑ same | Type (Risk/Dep/Threat), Likelihood, Impact, Residual, Mitigation plan, Mitigation owner |

## ID convention

- `C-NNN` Context · `A-NNN` Assumptions · `D-NNN` Demands · `R-NNN` Restrictions · `E-NNN` Exposure.
- Numbers are sequential within element. Never reuse a number, even for closed entries.
- Pre-loaded overlay entries keep their original ID prefix where it makes sense (e.g., `R-001` from ID-FSI stays `R-001` if there's no conflict).

## Lifecycle

1. **Capture** — Phase 2. Fill the register; baseline it; named owners sign off.
2. **Compose** — Phase 3. Every ADR cites CADRE IDs. New entries added under formal change control.
3. **Calibrate** — Phase 4. Validate the design against Demands; surface gaps as Exposure.
4. **Continue** — Phase 6. Drift reports may add Exposure or change Status. Closed entries are not deleted.

## Quality checks before baselining

- Every Demand has a testability criterion.
- Every Restriction has a citation and a `Waivable: Yes/No/Conditional` flag.
- Every Exposure has likelihood, impact, mitigation plan, and named owner.
- Every Assumption has a validation plan **and** a fallback.
- No entry has an empty Owner field.
- Compliance-overlay R-entries are present for every loaded overlay.
