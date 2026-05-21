# Pattern — Data Platform (Lakehouse)

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

A unified data platform combining lake-scale storage with warehouse-style query semantics, on top of open table formats (Iceberg / Delta / Hudi). Supports operational, analytical, and AI/ML workloads from a single source of truth.

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
- **Catalog** — table and schema registry (Unity Catalog, Polaris, Glue, Nessie, REST catalog).
- **Query engines** — separate compute engines for batch (Spark, Trino), interactive (Trino, DuckDB), streaming (Flink), and ML.
- **Governance** — lineage, access control, quality, classification.
- **Ingestion** — batch and streaming pipelines.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 4 | 3 | 3 | 3 | 3 | 3 | 4 |

## 5. Implementation matrix

| Implementation | Strength | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Databricks | Best-in-class lakehouse story; Unity Catalog; broad ML integration | SaaS-first; sovereignty considerations; commercial premium | Databricks docs |
| Snowflake | Mature warehouse semantics; growing open-table support | Originally proprietary storage; Iceberg support recent | Snowflake docs |
| Google BigQuery + BigLake | Hyperscaler-native; strong governance | GCP-centric; sovereignty considerations | Google BigQuery docs |
| Cloudera Data Platform | Strong on-prem story; broad workload coverage | Heavyweight platform; deep operational engagement | Cloudera CDP docs |
| On-prem Trino + Iceberg | Open-source first; lowest lock-in | Engineering investment; no single vendor support pane | Trino and Apache Iceberg docs |

## 6. Decision criteria

- Sovereignty of data — does the engagement permit cloud-managed catalogs?
- Workload mix — interactive analytics, streaming, ML, or a balance.
- Existing investments — Snowflake-heavy shop vs. Spark-heavy vs. on-prem Hadoop migration.
- Whether table format portability is itself a requirement (an Iceberg-first architecture preserves choice).

## 7. Anti-patterns

- **Lakehouse as buzzword** — file dump with no catalog, no schema discipline, no governance.
- **Tight coupling to one query engine's proprietary features** when the platform was sold as open.
- **Re-implementing ETL** for every consumer rather than treating curated data as a product.

## 8. Cross-references

**Related patterns:** [AI / ML Platform](ai-ml-platform.md), [Container Platform](container-platform.md), [Observability Platform](observability-platform.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [HC](../overlays/healthcare.md).
