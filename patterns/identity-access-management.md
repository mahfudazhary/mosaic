# Pattern — Identity and Access Management

> **Layer:** L3 · **Status:** Active · **Owner:** Practice Architecture Council
> **Last reviewed:** 2026-05 · **Version:** 1.1

## 1. Short description

Centralized identity, authentication, authorization, lifecycle, and audit across the estate. Covers workforce identity, customer identity (CIAM is a sub-variant), service identity, and privileged access management (PAM) brokerage.

## 2. Applicable contexts

**Always required** for any non-trivial enterprise architecture. The pattern decision is about which Implementation, not whether to adopt.

**Use the workforce-IAM sub-variant for:**
- Workforce SSO and lifecycle (joiner/mover/leaver).
- MFA enforcement.
- Federation with SaaS estate.

**Use the PAM sub-variant for:**
- Privileged sessions on tier-1 systems.
- Just-in-time elevation.
- Session recording and audit.

## 3. Logical structure

- **Identity store** — authoritative directory (cloud-native or on-prem).
- **Federation hub** — SAML / OIDC issuer.
- **MFA service** — phishing-resistant (FIDO2) preferred for high-assurance scenarios.
- **PAM broker** — credential vault, session broker, recording.
- **Lifecycle engine** — joiner/mover/leaver automation tied to HR system of record.
- **Audit pipeline** — all identity events to SIEM.

## 4. Quality-pillar profile (typical)

| Avail. | Perf. | Sec. | Ops | Cost | Sust. | Sov. | Adap. |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4 | 4 | 4 | 3 | 3 | 4 | 3 | 3 |

## 5. Implementation matrix

| Implementation | Strength | Trade-offs | Canonical doc |
| --- | --- | --- | --- |
| Implementation A — hyperscaler-bundled workforce IAM | Workforce IAM tightly bundled with the hyperscaler's productivity estate; broad SaaS federation catalog | Hyperscaler commercial entanglement; tenant residency considerations for sovereignty-sensitive engagements | Hyperscaler's IAM docs |
| Implementation B — best-of-breed SaaS workforce IAM | Best-of-breed workforce + CIAM | Pure SaaS — sovereignty considerations; commercial premium | SaaS IAM vendor's docs |
| Implementation C — open-source self-hosted IAM | Open-source; self-hosted | Engineering investment to operate; full control over data residency | Open-source IAM project docs |
| Implementation D — Linux-centric open-source IAM | Linux-centric identity for on-prem estates | Limited SaaS federation; aging interfaces | Open-source IAM project docs |
| Implementation E — enterprise IAM with on-prem option | Enterprise IAM with on-prem option | Commercial; full feature parity with workforce + CIAM | Enterprise IAM vendor's docs |

PAM broker implementations (often paired with the above):

| PAM Implementation | Notes |
| --- | --- |
| Implementation a — incumbent enterprise PAM (broker + session recording) | Most mature; commercial premium |
| Implementation b — privileged-session-management leader | Strong in privileged session management |
| Implementation c — mid-market PAM | Mid-market sweet spot |
| Implementation d — secrets-management platform with PAM features | Strong secrets management; PAM features more limited |
| Implementation e — modern engineering-oriented PAM | Modern PAM for engineering use cases |

## 6. Decision criteria

- Existing identity store and how much migration is in scope.
- Sovereignty of identity data (FSI clients often require on-prem or in-jurisdiction identity).
- SaaS estate to federate.
- Productivity-suite footprint — the hyperscaler-bundled workforce IAM is often the default if the productivity estate is heavily on that hyperscaler.
- PAM scope — broker for engineers only, or also operations / DBAs / vendors.

## 7. Anti-patterns

- **Multiple competing identity stores** with no authoritative source — produces drift and security gaps.
- **MFA exceptions for "service accounts"** without compensating controls (service identity, ephemeral credentials).
- **PAM only for "production"** while privileged access exists everywhere — audit gap.
- **No automated joiner/mover/leaver** — orphaned access proliferates and shows up in audits.

## 8. Cross-references

**Related patterns:** [Zero-Trust Network](zero-trust-network.md), [Container Platform](container-platform.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [GLOBAL-CARD](../overlays/global-card.md), [HC](../overlays/healthcare.md).
