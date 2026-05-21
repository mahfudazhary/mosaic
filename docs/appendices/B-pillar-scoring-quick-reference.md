# Appendix B — Pillar Scoring Quick Reference

Use this table during **Calibrate** workshops as a structured prompt for each pillar. Each pillar uses the same five-level scale (Reactive → Innovative) with pillar-specific anchor descriptions.

## Availability & Resilience

| Level | Anchor description |
| :---: | --- |
| **1 — Reactive** | No SLO; ad-hoc recovery. |
| **2 — Basic** | Documented SLO; recovery follows partial runbooks. |
| **3 — Mature** | SLO compliance measured; DR tested annually. |
| **4 — Optimized** | SLO compliance > 99% routine; DR tested quarterly; blast radius known per service. |
| **5 — Innovative** | Closed-loop self-healing in addition to all of Optimized. |

## Performance & Scale

| Level | Anchor description |
| :---: | --- |
| **1 — Reactive** | Performance unknown until users complain. |
| **2 — Basic** | Some metrics; scaling is manual and reactive. |
| **3 — Mature** | p95 latency and throughput tracked; capacity planning quarterly. |
| **4 — Optimized** | Elastic scaling automated; headroom continuously monitored. |
| **5 — Innovative** | Predictive autoscaling with workload-pattern learning. |

## Security & Trust

| Level | Anchor description |
| :---: | --- |
| **1 — Reactive** | Controls present but unmeasured. |
| **2 — Basic** | Control framework documented; coverage partial. |
| **3 — Mature** | Control framework fully applied; MFA universal; patch SLA met. |
| **4 — Optimized** | Zero-trust posture proven; mean time to patch < 7 days for critical; supply chain attested. |
| **5 — Innovative** | Continuous control validation; automated response to detected threats. |

## Operability & Observability

| Level | Anchor description |
| :---: | --- |
| **1 — Reactive** | Operations is reactive; observability limited to availability checks. |
| **2 — Basic** | Runbooks present; logs and metrics available but not unified. |
| **3 — Mature** | Unified observability stack; deployment automation; toil percentage tracked. |
| **4 — Optimized** | Change failure rate < 5%; mean time to detect < 5 minutes; toil percentage < 30%. |
| **5 — Innovative** | Self-healing automation; observability informs continuous architecture optimization. |

## Cost & FinOps

| Level | Anchor description |
| :---: | --- |
| **1 — Reactive** | Cost is opaque and not attributed. |
| **2 — Basic** | Aggregate cost tracked; some attribution. |
| **3 — Mature** | Cost per service or workload measured; reserved/on-demand mix optimized; showback in place. |
| **4 — Optimized** | Unit economics analyzed; continuous optimization; chargeback in place. |
| **5 — Innovative** | Cost-aware architecture decisions integrated into design and operation feedback loop. |

## Sustainability & GreenOps

| Level | Anchor description |
| :---: | --- |
| **1 — Reactive** | No measurement. |
| **2 — Basic** | Facility-level PUE tracked. |
| **3 — Mature** | Workload-level energy estimates available; hardware lifecycle managed; e-waste compliant. |
| **4 — Optimized** | Carbon intensity per business activity measured and reported; refresh strategy optimized for environmental impact. |
| **5 — Innovative** | Closed-loop carbon optimization in real-time workload placement and scaling decisions. |

## Sovereignty & Compliance

| Level | Anchor description |
| :---: | --- |
| **1 — Reactive** | Residency and compliance posture undocumented. |
| **2 — Basic** | Jurisdictional documentation present; some control gaps. |
| **3 — Mature** | All data flows mapped to jurisdictions; controls satisfy applicable mandates; audit findings closed on time. |
| **4 — Optimized** | Continuous compliance monitoring; regulator notifications automated; cross-jurisdictional arrangements pre-approved. |
| **5 — Innovative** | Adaptive compliance posture responding to regulatory change without redesign. |

## Adaptability & Portability

| Level | Anchor description |
| :---: | --- |
| **1 — Reactive** | Heavy vendor lock-in; exit cost uncalculated. |
| **2 — Basic** | Some portability planning; standard interfaces used where convenient. |
| **3 — Mature** | Two or more validated implementations per critical pattern; exit-time estimates published. |
| **4 — Optimized** | API-first architecture; data-portability proven by exercise; lock-in dependencies enumerated and minimized. |
| **5 — Innovative** | Workload portability demonstrated routinely; architecture supports active multi-implementation operation. |
