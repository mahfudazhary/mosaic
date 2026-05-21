# 06 — Continue

**Phase objective:** operate, measure, evolve. Close the framework loop by feeding operational reality back into Frame when material drift accumulates.

**Cadence:** ongoing; formal drift reports typically quarterly. Annual full review.

## Inputs
- Production telemetry (per the L5 observability specification).
- Audit findings (internal, external, regulator).
- Stakeholder feedback.
- Vendor commercial / product changes that trigger ADR review.

## Outputs
- [`drift-reports/`](drift-reports/) — quarterly drift reports. Most recent at the top.
- [`change-requests/`](change-requests/) — requests for material change; if accepted, may trigger framework re-execution starting at Frame.
- [`audit-findings/`](audit-findings/) — internal, external, or regulator findings.

## Continue cadence

Per the Operational specification, the standard cadence includes:

| Activity | Frequency | Owner |
| --- | --- | --- |
| Drift report against design intent | Quarterly | Service owner |
| DR exercise | Quarterly | DR coordinator |
| Capacity review | Quarterly | Capacity planning |
| Architecture review (full) | Annual | Lead architect (practice) |
| Compliance overlay refresh | On regulator change or annual | Compliance lead |

## Triggers for framework re-execution

Significant drift triggers a re-execution starting at Frame, treating the existing architecture as input rather than baseline.

Examples:

- Sustained SLO breach on a tier-1 service.
- Compliance overlay revision that materially changes pillar floors or restrictions.
- Vendor commercial change affecting an Implementation chosen in the LLD.
- Strategic outcome from Frame is no longer valid (acquisition, divestment, regulator change, major incident).

## Closing the engagement

If the engagement scope includes Continue (typical for full engagements), do not "close" the engagement folder after Commit. Maintain it for the duration of Continue, updating drift reports and triggering re-execution when required.

If Continue is out of scope (typical for Discovery, Health Check, pure Design engagements), the engagement folder is closed at Commit and archived per practice policy.
