# Pattern — Disaster Recovery / Business Continuity

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

Replication, orchestration, and runbook automation that protects tier-1 services against site loss, system failure, or cyber events, within client-defined RPO and RTO targets and the regulatory continuity expectations of the engagement's compliance overlays.

## 2. Applicable contexts

**Use this pattern when:**
- Tier-1 services have RPO/RTO commitments tighter than a backup-and-restore cycle can meet.
- A regulatory continuity obligation applies (POJK 11/2022 for ID-FSI, DORA for EU-FIN, etc.).
- Concentration risk in a single site or fault domain has been identified.

**Always use this pattern at some level** for production workloads — the choice is which sub-pattern (backup-only, async DR, sync DR, active-active) fits the requirement.

## 3. Logical structure

Four sub-shapes, in increasing protection (and cost):

1. **Backup-and-restore.** Backup to separate fault domain. RTO measured in hours-to-days.
2. **Async replication.** Continuous block-level or VM-level replication to DR site. RPO minutes; RTO ~hours.
3. **Near-sync / sync replication.** Storage replication at metro distance. RPO seconds; RTO ~tens of minutes.
4. **Active-active stretched.** Both sites serve traffic; failover is automatic or near-automatic. RPO ~zero; RTO ~minutes.

## 4. Quality-pillar profile (typical, active-active variant)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 5 | 3 | 3 | 3 | 2 | 2 | 4 | 3 |

## 5. Implementation matrix

| Implementation | Sub-shape supported | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Implementation A — incumbent platform-native DR orchestration | Async + orchestration | Incumbent HCI estates; mature orchestration | Incumbent HCI vendor's DR docs |
| Implementation B — alternative platform-native DR orchestration | Async / Sync / Active-active | Alternative HCI estates; integrated experience | Alternative HCI vendor's DR docs |
| Implementation C — vendor-neutral replication | Backup + async | Vendor-neutral replication; pairs with most platforms | Replication vendor's docs |
| Implementation D — continuous data protection (CDP) appliance | Continuous data protection (CDP) — async with seconds-RPO | Cross-platform; mature CDP; commercial cost | CDP vendor's user guide |
| Implementation E — SaaS backup-and-DR | Cloud-first backup-and-recovery (SaaS) | OpEx model; recovery into managed cloud; sovereignty review essential | SaaS backup-and-DR vendor's docs |
| Implementation F — hyperscaler-native DR services | Async + orchestration | Pairs with hybrid extension pattern; cost predictable | Hyperscaler docs |

## 6. Decision criteria

- What are the contractual or regulatory RPO/RTO targets?
- Is the workload eligible for active-active (sync replication tolerance, application idempotency)?
- Are both sites in the same sovereignty jurisdiction?
- Is a vendor-neutral replication preferable over a platform-native one?

## 7. Anti-patterns

- **DR as documentation only** — no rehearsed exercise. The framework requires evidence of testing.
- **Active-active across non-metro distance** — synchronous replication latency makes the app unusable.
- **Backup as DR** — backup is necessary but not sufficient for tier-1 RTO targets.
- **Single shared backup repository between primary and DR** — common-mode failure surface.
- **Backup as cyber-recovery** without immutability — ransomware encrypts the backups too. See [Backup and Cyber Recovery](backup-cyber-recovery.md).

## 8. Cross-references

**Related patterns:** [Private Cloud — Hyperconverged](private-cloud-hyperconverged.md), [Backup and Cyber Recovery](backup-cyber-recovery.md), [Hybrid Cloud Extension](hybrid-cloud-extension.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md) (POJK 11/2022 continuity), [EU-FIN](../overlays/eu-fin.md) (DORA), [GLOBAL-CARD](../overlays/global-card.md) (PCI-DSS).
