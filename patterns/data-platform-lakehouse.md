# Pattern — Data Platform (Lakehouse)

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

A unified data platform combining lake-scale storage with warehouse-style query semantics, on top of open table formats. Supports operational, analytical, and AI/ML workloads from a single source of truth.

## 2. Applicable contexts

**Use this pattern when:**
- Multiple downstream consumers (BI, ML, operational analytics) need shared access to the same data.
- Data volume exceeds traditional warehouse economics.
- Open table formats are a stated requirement for portability (Adaptability).

**Do not use this pattern when:**
- The use case is a single well-bounded OLAP cube — a traditional data warehouse is simpler.
- There is no organizational capacity to operate the platform — proceed with a managed offering instead of self-hosted.

## 3. Logical structure

- **Storage layer** — object storage (on-prem or cloud) holding open-table-format data.
- **Catalog** — table and schema registry (open or vendor-provided REST catalog).
- **Query engines** — separate compute engines for batch, interactive, streaming, and ML.
- **Governance** — lineage, access control, quality, classification.
- **Ingestion** — batch and streaming pipelines.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 4 | 3 | 3 | 3 | 3 | 3 | 4 |

## 5. Implementation matrix

| Implementation | Strength | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Implementation A — SaaS lakehouse | Best-in-class lakehouse story; unified catalog; broad ML integration | SaaS-first; sovereignty considerations; commercial premium | Vendor's lakehouse docs |
| Implementation B — cloud data warehouse | Mature warehouse semantics; growing open-table support | Originally proprietary storage; open-table support recent | Vendor's warehouse docs |
| Implementation C — hyperscaler-native warehouse + open-table | Hyperscaler-native; strong governance | Single-hyperscaler centric; sovereignty considerations | Hyperscaler's warehouse docs |
| Implementation D — on-prem data platform | Strong on-prem story; broad workload coverage | Heavyweight platform; deep operational engagement | On-prem data platform vendor's docs |
| Implementation E — open-source on-prem (open-table + query engine) | Open-source first; lowest lock-in | Engineering investment; no single vendor support pane | Open-source project docs |

## 6. Decision criteria

- Sovereignty of data — does the engagement permit cloud-managed catalogs?
- Workload mix — interactive analytics, streaming, ML, or a balance.
- Existing investments — warehouse-heavy shop vs. compute-engine-heavy vs. on-prem legacy migration.
- Whether table format portability is itself a requirement (an open-table-first architecture preserves choice).

## 7. Anti-patterns

- **Lakehouse as buzzword** — file dump with no catalog, no schema discipline, no governance.
- **Tight coupling to one query engine's proprietary features** when the platform was sold as open.
- **Re-implementing ETL** for every consumer rather than treating curated data as a product.
- **Forcing transactional workloads onto the lakehouse table format** — write-amplification dominates and the lakehouse becomes a poor substitute for an OLTP store.


## 8. Cross-references

**Related patterns:** [AI / ML Platform](ai-ml-platform.md), [Container Platform](container-platform.md), [Observability Platform](observability-platform.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [HC](../overlays/healthcare.md), [AI](../overlays/ai.md).
