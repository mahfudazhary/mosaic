# ADR Templates

This folder holds the MOSAIC ADR template and conventions.

## Files

| File | Purpose |
| --- | --- |
| [`adr-template.md`](adr-template.md) | The blank template. Copy per decision. |
| [`adr-0001-example.md`](adr-0001-example.md) | A worked example you can read alongside the template. |

## Naming convention

- One ADR per file.
- File names: `adr-NNNN-<short-slug>.md` where `NNNN` is zero-padded and sequential within the engagement.
- Slug is kebab-case and ≤ 8 words: `adr-0014-active-active-hci-for-core-banking.md`.

## Storage

Within an engagement, ADRs live under `05-commit/adrs/`. During Compose iteration they may live under `03-compose/adrs/` until they reach `Accepted` status and roll into Commit.

## Status lifecycle

```
Proposed → Accepted → (Superseded by ADR-NNNN | Deprecated)
```

- **Proposed** during Compose. Open for discussion; not yet committed.
- **Accepted** after sign-off by listed Reviewers. Immutable from this point.
- **Superseded by ADR-NNNN** when a later ADR replaces this one. Both ADRs remain in the repo; the superseded ADR points forward, the new ADR points backward.
- **Deprecated** when the decision is withdrawn without a replacement. Rare; usually superseded is preferred.

## Operating rules

See [Section 8.3](../../docs/08-adr-format.md#83-operating-rules) of the framework reference. Summary:

- One author per ADR (multiple reviewers expected).
- Immutable after acceptance — changes go in a new ADR.
- Cited by ID in all derivative documents.
- Versioned in git.
