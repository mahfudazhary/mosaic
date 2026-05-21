# Pattern — Backup and Cyber Recovery

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

Backup with immutable storage and isolated recovery environments, designed to be effective both for traditional data loss and for cyber events (ransomware, destructive intrusion). Complements — does not replace — [Disaster Recovery](disaster-recovery-bcp.md).

## 2. Applicable contexts

**Always required.** Even active-active patterns need a backup; replication is not backup, and DR does not protect against logical corruption or cyber events.

The pattern decision is the **immutability and isolation level** of the backup, not whether to have one.

## 3. Logical structure

- **Backup engine** — schedules, runs, and tracks backup jobs.
- **Backup repository** — immutable storage (object lock, WORM, or air-gapped tape).
- **Cyber-recovery vault** — isolated environment (separate identity, network, optionally air-gapped) where verified-clean backups are restored to validate they are recoverable and uncompromised.
- **Restore orchestration** — runbook automation for mass restore.
- **Detection** — anomaly detection in backup metadata to flag suspected encryption events.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 3 | 4 | 3 | 2 | 2 | 4 | 3 |

## 5. Implementation matrix

| Implementation | Strength | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Veeam | Broad source coverage; immutability options for hardened repos and object storage; cyber-recovery features | Repository design discipline needed | Veeam Backup and Replication docs |
| Rubrik | Strong cyber-recovery story; appliance model | Commercial; appliance form factor; license cost | Rubrik docs |
| Cohesity | Hyperconverged backup; broad data services | Appliance scale-out economics | Cohesity docs |
| Commvault | Mature feature breadth; recent cyber-recovery emphasis (Metallic etc.) | Heavy feature set; admin complexity | Commvault docs |
| Native cloud backup with immutable storage (AWS Backup + S3 Object Lock; Azure Backup + immutable vaults; GCS Object Versioning) | Cost-efficient at scale; cloud-managed | Sovereignty considerations; full restore performance must be validated | Hyperscaler docs |

## 6. Decision criteria

- Immutability requirement (regulator-driven, insurer-driven, or both).
- Sovereignty of the backup data — onshore-only requirements rule out some cloud backup options.
- Source diversity — physical, virtual, container, SaaS, database-native — and the implementation's coverage of each.
- Whether a cyber-recovery vault is in scope (often regulator-driven for FSI).

## 7. Anti-patterns

- **Backups on the same storage as production** — common-mode failure during a destructive event.
- **Backups but no immutability** — ransomware encrypts the backups too.
- **Immutability but no restore rehearsal** — restore performance is a surprise.
- **No anomaly detection on backup volumes** — an encryption event is invisible until a recovery is attempted.
- **Cyber-recovery vault that shares identity with production** — defeats the isolation purpose.

## 8. Cross-references

**Related patterns:** [Disaster Recovery / Business Continuity](disaster-recovery-bcp.md), [Identity and Access Management](identity-access-management.md), [Zero-Trust Network](zero-trust-network.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [GLOBAL-CARD](../overlays/global-card.md), [HC](../overlays/healthcare.md).
