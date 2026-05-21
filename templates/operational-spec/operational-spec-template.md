# Operational Specification (L5) — <CLIENT NAME>

> **Phase:** 5 — Commit · **Layer covered:** L5 Operational
> **Version:** _N.M_ · **Date:** _YYYY-MM-DD_ · **Service owner:** _Name_
> **Status:** _Draft / Reviewed / Final_

This document defines **how the architecture runs in production**. It is the input to the [Continue phase](../../docs/07-six-phase-method.md#726-phase-6--continue). An architecture without explicit Operational content is by MOSAIC's definition incomplete.

---

## 1. Service catalog and ownership

| Service | Tier (1/2/3) | Service owner | Engineering owner | Hours of cover |
| --- | :---: | --- | --- | --- |
| | | | | |

## 2. SLOs, SLIs, and error budgets

For each tier-1 (and selected tier-2) service:

| Service | SLI | SLO target | Measurement window | Error budget | Owner |
| --- | --- | --- | --- | --- | --- |
| _e.g., Core-banking transaction API_ | _Successful response within 200 ms_ | _99.9% over 30 days_ | _Rolling 30 days_ | _≤ 43.2 min downtime/month_ | _Name_ |

## 3. Runbook set

| # | Scenario | Runbook reference | Last rehearsed | Outcome of last rehearsal |
| :-: | --- | --- | --- | --- |
| 1 | Routine patching of compute platform | RB-001 | YYYY-MM-DD | |
| 2 | Inter-site failover (planned) | RB-002 | YYYY-MM-DD | |
| 3 | Inter-site failover (unplanned) | RB-003 | YYYY-MM-DD | |
| 4 | DR exercise (full) | RB-004 | YYYY-MM-DD | |
| 5 | Security incident — suspected breach | RB-005 | YYYY-MM-DD | |
| 6 | Capacity exhaustion — emergency add | RB-006 | YYYY-MM-DD | |

> Runbooks themselves are maintained separately; this table is the index.

## 4. Observability specification

### 4.1 Coverage

| Signal | Source | Sink | Retention | Owner |
| --- | --- | --- | :---: | --- |
| Structured logs | _All services_ | _Central log platform_ | 90 days hot, 7 years cold | |
| Metrics | _All services_ | | | |
| Traces | | | | |
| Synthetic checks | | | | |
| Audit events | | | | |

### 4.2 Alerting

| Alert | Source | Threshold | Severity | Routing | Runbook |
| --- | --- | --- | :---: | --- | --- |
| | | | P1/P2/P3 | | RB-NNN |

## 5. Operating model

| Function | Performed by | Cadence | Authority |
| --- | --- | --- | --- |
| L1 incident response | | 24×7 | Acknowledge, triage, escalate |
| L2 engineering response | | Business hours + on-call | Diagnose, mitigate, drive RCA |
| L3 vendor escalation | | On demand | Engage vendor SE |
| Change advisory | | Weekly | Approve / reject normal changes |
| Architecture review | | Quarterly | Drift report, framework re-execution trigger |
| Audit response | | On demand | Evidence gathering, regulator engagement |

## 6. Lifecycle plan

| Component | Refresh cycle | Patch cadence | EoL trigger | Owner |
| --- | --- | --- | --- | --- |
| Compute hardware | 5 years | N/A | Vendor EoSL | |
| Hypervisor / OS | | Monthly security; quarterly maintenance | Vendor EoSL | |
| Network firmware | | Quarterly | Vendor EoSL | |
| Application platform | | | | |

## 7. Sovereignty & compliance reporting

| Obligation | Cadence | Owner | Linked Restriction |
| --- | --- | --- | --- |
| _e.g., OJK ITRM annual report_ | Annual | | R-001 |
| _e.g., UU PDP DPO log_ | Continuous; report annually | | R-002 |

## 8. Continue cadence

| Activity | Cadence | Owner | Deliverable |
| --- | --- | --- | --- |
| Drift report against design intent | Quarterly | Service owner | [Drift report](../drift-report/drift-report-template.md) |
| DR exercise | Quarterly | DR coordinator | Test report + corrective actions |
| Capacity review | Quarterly | Capacity planning | Capacity register update |
| Architecture review (full) | Annual | Lead architect (practice) | Framework re-execution recommendation |
| Compliance overlay refresh | On regulator change or annual | Compliance lead | Updated R-register entries |

## 9. Validation plan handover

> _Cross-reference to the validation plan that delivery will execute against. Each success measure here should map to a validation test in delivery._

---

## Revision history

| Version | Date | Author | Notes |
| :-: | --- | --- | --- |
| 0.1 | YYYY-MM-DD | | Initial draft |
| 1.0 | YYYY-MM-DD | | Commit baseline |
