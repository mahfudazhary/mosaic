# Pattern — Observability Platform

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

A unified platform for logs, metrics, traces, and synthetic checks, with alerting and dashboarding sufficient to support the L5 Operational specification — SLO measurement, runbook-driven response, and Day-2 lifecycle.

## 2. Applicable contexts

**Always required.** Every MOSAIC engagement produces L5 content; that content is unmeasurable without an observability platform.

The pattern decision is which Implementation, and how unified vs. layered the stack should be.

## 3. Logical structure

- **Telemetry pipeline** — collection, transformation, routing of logs, metrics, traces.
- **Storage** — separate stores for different signal types are common (hot logs, metrics TSDB, trace store).
- **Query and visualization** — dashboards, query language, alerting rules.
- **Alerting and incident workflow** — paging integration, on-call schedule, runbook linkage.
- **Synthetic and end-user telemetry** — uptime checks, real-user monitoring.
- **Audit pipeline** — security-relevant events routed to SIEM in addition to (or instead of) the observability platform.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 4 | 3 | 5 | 2 | 3 | 3 | 3 |

Operability pillar is by definition near-maximum for a competent implementation. Cost is the most common drag.

## 5. Implementation matrix

| Implementation | Strength | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Prometheus + Grafana + Loki + Tempo (LGTM stack) | Open-source, modular, broad ecosystem | Engineering investment; multi-component operations | Grafana Labs docs |
| Datadog | Single SaaS platform, strong out-of-box experience | SaaS — sovereignty consideration; cost grows with cardinality | Datadog docs |
| Dynatrace | Strong APM and AIOps automation | SaaS-first; cost; agent-based default | Dynatrace docs |
| Splunk | Log analytics depth; broad enterprise install base | Cost at scale; recent Cisco acquisition reshaping commercial offer | Splunk docs |
| VCF Operations Suite + Aria Operations for Networks | Tight integration with VCF estates | Broadcom commercial trajectory; limited cross-estate visibility | VMware Aria docs |
| New Relic | Strong APM; consumption-based pricing | SaaS; some sovereignty consideration | New Relic docs |
| OpenTelemetry-first (vendor-neutral collection) | Portability of telemetry; commit to OTel as the standard | Storage backend(s) still need selection | OpenTelemetry docs |

## 6. Decision criteria

- Sovereignty constraints on telemetry data — many SaaS platforms make sovereignty review essential.
- Existing investments and team familiarity.
- Cost predictability — log cardinality is the biggest cost driver and the easiest to under-estimate.
- Whether the engagement wants to commit to OpenTelemetry as a vendor-neutral collection standard.

## 7. Anti-patterns

- **Two competing observability platforms** running in parallel — operators don't know which to trust.
- **Excellent dashboards, no alerting** — visibility without action is decorative.
- **Alerting without runbooks** — on-call burden balloons; teams stop reading alerts.
- **No SLO-based alerting** — pages on every blip instead of on customer-visible degradation.
- **Logs treated as the universal solvent** — metrics and traces would have caught most issues at a fraction of the cost.

## 8. Cross-references

**Related patterns:** All other patterns reference back to this one. Particularly important for [Container Platform](container-platform.md), [Service Mesh](service-mesh.md), [Disaster Recovery / Business Continuity](disaster-recovery-bcp.md), [AI / ML Platform](ai-ml-platform.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md) (audit trail), [EU-FIN](../overlays/eu-fin.md) (DORA), [GLOBAL-CARD](../overlays/global-card.md) (PCI logging).
