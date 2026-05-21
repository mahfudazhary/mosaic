# Appendix A — CADRE Register Template

The CADRE register is maintained as a spreadsheet with one tab per element. This appendix documents the schema; ready-to-use Markdown and CSV forms live in [`templates/cadre-register/`](../../templates/cadre-register/).

## All elements (common fields)

| Field | Notes |
| --- | --- |
| **ID** | Format `<C\|A\|D\|R\|E>-NNN`, sequential within element |
| **Statement** | Single sentence |
| **Source** | Workshop, document, regulator, stakeholder name |
| **Owner** | Named individual |
| **Status** | `Active` / `Validated` / `Superseded` / `Closed` |
| **Related ADRs** | Comma-separated ADR IDs |
| **Pillar tags** | Which of the eight pillars this entry primarily affects |
| **Date captured / Date last reviewed** | ISO date stamps |

## Demands tab — additional fields

| Field | Notes |
| --- | --- |
| **Type** | `Functional` / `Non-functional` |
| **Testability criterion** | How compliance is verified |
| **MoSCoW priority** | `Must` / `Should` / `Could` / `Won't` |

## Restrictions tab — additional fields

| Field | Notes |
| --- | --- |
| **Subcategory** | `Operational constraint` / `Compliance mandate` / `Architectural principle` |
| **Citation** | Regulatory clause or contractual reference |
| **Waivable** | `Yes` / `No` / `Conditional` |

## Exposure tab — additional fields

| Field | Notes |
| --- | --- |
| **Type** | `Risk` / `Dependency` / `Threat` |
| **Likelihood** | 1 (low) to 5 (high) |
| **Impact** | 1 (low) to 5 (high) |
| **Residual rating** | After mitigation |
| **Mitigation plan** | Short narrative |
| **Mitigation owner** | Named individual |
