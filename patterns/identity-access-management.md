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
| Microsoft Entra ID | Workforce IAM with M365 estate; broad SaaS federation catalog | Microsoft commercial entanglement; tenant residency considerations for sovereignty-sensitive engagements | Microsoft Entra docs |
| Okta | Best-of-breed workforce + CIAM | Pure SaaS — sovereignty considerations; commercial premium | Okta docs |
| Keycloak | Open-source; self-hosted | Engineering investment to operate; full control over data residency | Keycloak docs |
| FreeIPA | Linux-centric identity for on-prem estates | Limited SaaS federation; aging interfaces | FreeIPA docs |
| Ping Identity | Enterprise IAM with on-prem option | Commercial; full feature parity with workforce + CIAM | Ping Identity docs |

PAM broker implementations (often paired with the above):

| PAM Implementation | Notes |
| --- | --- |
| CyberArk | Most mature; commercial premium |
| BeyondTrust | Strong in privileged session management |
| Delinea (formerly Thycotic) | Mid-market sweet spot |
| HashiCorp Vault | Strong secrets management; PAM features more limited |
| Teleport | Modern PAM for engineering use cases |

## 6. Decision criteria

- Existing identity store and how much migration is in scope.
- Sovereignty of identity data (FSI clients often require on-prem or in-jurisdiction identity).
- SaaS estate to federate.
- M365 footprint — Entra ID often the default if heavy M365.
- PAM scope — broker for engineers only, or also operations / DBAs / vendors.

## 7. Anti-patterns

- **Multiple competing identity stores** with no authoritative source — produces drift and security gaps.
- **MFA exceptions for "service accounts"** without compensating controls (service identity, ephemeral credentials).
- **PAM only for "production"** while privileged access exists everywhere — audit gap.
- **No automated joiner/mover/leaver** — orphaned access proliferates and shows up in audits.

## 8. Cross-references

**Related patterns:** [Zero-Trust Network](zero-trust-network.md), [Container Platform](container-platform.md).

**Compliance overlays most affected:** [ID-FSI](../overlays/id-fsi.md), [EU-FIN](../overlays/eu-fin.md), [GLOBAL-CARD](../overlays/global-card.md), [HC](../overlays/healthcare.md).
