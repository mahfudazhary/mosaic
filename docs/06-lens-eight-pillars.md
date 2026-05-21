# 6. Axis 3 — The Lens (Eight Quality Pillars)

The Lens is MOSAIC's **evaluation framework**. It defines the eight quality attributes against which any design is scored, providing a multi-dimensional view of design fitness that is independent of the specific technology in use.

The eight pillars synthesize and extend the dominant quality frameworks:

- **AMPRS** contributes Availability, Manageability (renamed Operability), Performance, Recoverability (folded into Availability), and Security.
- **ISO/IEC 25010** contributes Maintainability and Portability (rolled into Operability and Adaptability).
- **AWS, Azure, and GCP Well-Architected Frameworks** contribute Cost and Sustainability.
- **MOSAIC adds Sovereignty and Adaptability as first-class pillars**, recognizing them as concerns that the other frameworks under-serve in the regional and commercial contexts the practice operates in.

## 6.1 Pillar summary

| # | Pillar | Scope |
| --- | --- | --- |
| 1 | **Availability & Resilience** | Uptime, fault tolerance, blast radius, disaster recovery and business continuity. Folds traditional Reliability and Recoverability into a single pillar. |
| 2 | **Performance & Scale** | Latency, throughput, headroom, elasticity. Steady-state efficiency and ability to grow without re-architecting. |
| 3 | **Security & Trust** | Confidentiality, integrity, identity, access, audit, supply-chain integrity. Zero-trust posture and threat-model alignment. |
| 4 | **Operability & Observability** | Day-2 operability, observability, automation, lifecycle, manageability. How the architecture is run, monitored, and evolved. |
| 5 | **Cost & FinOps** | Total cost of ownership, unit economics, cost transparency, optimization mechanisms, chargeback and showback capability. |
| 6 | **Sustainability & GreenOps** | Carbon footprint, energy efficiency, hardware lifecycle (refresh, e-waste), alignment with client ESG commitments. |
| 7 | **Sovereignty & Compliance** | Data residency, jurisdictional control, regulatory locality, auditability, sector-specific compliance. **First-class concern.** |
| 8 | **Adaptability & Portability** | Modularity, vendor lock-in, evolvability, exit cost, portability across implementations. **First-class concern.** |

## 6.2 Pillar definitions

### 6.2.1 Availability & Resilience

Measures how reliably the architecture remains operational under normal conditions and continues to deliver value under abnormal conditions. The pillar combines two traditionally-separate concerns — Availability (steady-state uptime, fault tolerance) and Recoverability (recovery from disaster, RPO and RTO targets) — because in practice they are designed together and traded against each other.

**Representative metrics:** SLO compliance (% of period within SLO); mean time between failures; mean time to recover; blast radius (users or services affected by a single fault); fault domain count and distribution; RPO and RTO compliance against business-defined targets; success rate of DR test exercises.

### 6.2.2 Performance & Scale

Measures how efficiently the architecture serves load at current scale and how readily it accommodates growth. Performance covers latency and throughput at steady state; Scale covers headroom, elasticity, and the cost and complexity of growing the architecture by 2×, 10×, or 100×.

**Representative metrics:** p50/p95/p99 latency for primary user journeys; IOPS and bandwidth headroom on critical paths; oversubscription ratios; time-to-scale (how long to add capacity); elasticity range (ratio of peak to baseline capacity the architecture can serve without intervention).

### 6.2.3 Security & Trust

Measures the architecture's ability to protect confidentiality, integrity, and availability of its assets, the trustworthiness of its identity and access systems, and the integrity of its supply chain. **Zero-trust posture is the modern default**; legacy perimeter-based architectures score lower regardless of their absolute control set.

**Representative metrics:** control coverage against the applicable baseline (NIST CSF, CIS, sector-specific); MFA enrollment percentage; mean time to patch (critical/high vulnerabilities); encryption-at-rest and -in-transit coverage; KMS rotation policy adherence; supply-chain attestation completeness; SIEM event ingestion coverage; identified-versus-actual privileged-access paths.

### 6.2.4 Operability & Observability

Measures how operable the architecture is on Day-2: how visible its internal state is, how automated its routine operations are, how well its lifecycle is managed, and how productive its operators can be. This is what frameworks have traditionally called Manageability or Maintainability.

**Representative metrics:** deployment frequency; lead time for changes; change failure rate; mean time to detect; mean time to acknowledge; toil percentage (fraction of operations effort consumed by repetitive unautomated work); observability coverage (percentage of services emitting structured logs, metrics, and traces).

### 6.2.5 Cost & FinOps

Measures economic efficiency over the architecture's lifecycle. Includes capital and operating expense, transparency of cost attribution, mechanisms for ongoing optimization, and support for unit-economics analysis (cost per workload, per transaction, per tenant).

**Representative metrics:** total cost of ownership over the planned lifecycle; unit-cost stability over time; utilization of paid-for capacity; reserved-vs-on-demand mix on cloud workloads; optimization actions executed per period; chargeback or showback coverage of attributable cost.

### 6.2.6 Sustainability & GreenOps

Measures environmental impact: energy efficiency, carbon footprint, hardware lifecycle stewardship, and alignment with the client's ESG commitments. The pillar matters because client ESG reporting obligations (CSRD, ISSB, local Indonesian sustainability disclosures) increasingly require IT-level data, and because energy and cooling cost have become material at hyperscale and AI workloads.

**Representative metrics:** data-center power usage effectiveness (PUE); carbon intensity (gCO₂e per unit of business activity); hardware refresh cycle length; e-waste handling compliance; percentage of workloads on renewable-powered facilities or low-carbon regions.

### 6.2.7 Sovereignty & Compliance

Measures adherence to data residency, jurisdictional control, and regulatory locality requirements. MOSAIC elevates this concern to a **first-class pillar** — separate from Security and Operability — because in the environments the practice operates in (Indonesian FSI under OJK, ASEAN financial services, EU operations under DORA and GDPR), sovereignty considerations frequently dominate other design dimensions and require their own scoring.

**Representative metrics:** residency violations detected; percentage of restricted-classification data in compliant jurisdictions; audit findings closed within agreed timeframe; regulator-approval status of cross-border arrangements; completeness of jurisdictional documentation for each data flow.

### 6.2.8 Adaptability & Portability

Measures the architecture's ability to evolve without forklift change.

- **Adaptability** captures modularity, looseness of coupling, and evolvability over time.
- **Portability** captures freedom from vendor lock-in and the practical cost of moving workloads between implementations.

The pillar is **first-class** because vendor displacement is now a recurring engagement type (Broadcom transitions, hyperscaler exit, cost-driven repatriation) and clients demand exit-cost visibility as part of the original commitment.

**Representative metrics:** API and data portability score (fraction of integrations using standard rather than proprietary interfaces); lock-in dependency count (number of vendor-specific features the architecture relies on); estimated time to exit (how long to move to a different implementation); modularity index (average blast radius of a component replacement).

## 6.3 Scoring

Each pillar is scored on a **five-point scale from Reactive (1) to Innovative (5)**. [Section 9](09-maturity-scoring.md) details the maturity model and the engagement-weighted fitness function that combines pillar scores into an overall design score.

Scoring is performed during **Calibrate** and revisited at each major design checkpoint. Use [Appendix B](appendices/B-pillar-scoring-quick-reference.md) as the workshop prompt for each pillar.
