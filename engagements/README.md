# Engagements

This folder is where **per-client engagement artifacts live**. One subfolder per engagement.

## Conventions

- Folder name: `<client-shortname>` or `<client-shortname>-<engagement-code>` if multiple engagements run for the same client.
- Use kebab-case: `bank-sejahtera`, `acme-corp-mos-0042`, `bumn-cloud-discovery`.
- Each engagement folder follows the six-phase scaffold (see [`_new-engagement/`](_new-engagement/)).
- Commit all artifacts. The engagement folder **is** the engagement record.

## Bootstrap a new engagement

```bash
./scripts/new-engagement.sh <client-shortname>
```

This copies the `_new-engagement/` template into `engagements/<client-shortname>/` and prepares the six phase folders pre-populated with the relevant templates.

## Confidentiality

Engagement folders are **client-confidential**. Default classification applies unless the engagement charter specifies otherwise. Do not share engagement content outside the engagement team without explicit sponsor approval.

## What lives in each engagement folder

The standard scaffold mirrors the six phases of the MOSAIC method:

```
engagements/<name>/
├── README.md                # Engagement-specific overview, status, current phase
├── 01-frame/                # Engagement charter, stakeholder maps, pillar weights
├── 02-capture/              # CADRE register and supporting workshop notes
├── 03-compose/              # HLD, LLD draft, in-progress ADRs (status: Proposed)
├── 04-calibrate/            # Quality scorecard, gap register, risk-weighted view
├── 05-commit/               # Accepted ADRs, final BoM, L5 Operational specification, validation plan
└── 06-continue/             # Drift reports, change requests, audit findings
```

Adjust freely for the engagement's phase scope (e.g., a Discovery engagement only fills `01-frame/` and `02-capture/`).
