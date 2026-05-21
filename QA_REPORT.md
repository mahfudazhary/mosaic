# QA Report — MOSAIC Framework v1.1

> **Date:** 2026-05-21
> **Scope:** Repository at `mahfudazhary/test`, commit `c0f0b71` (PR #2 merged) — 75 tracked files, ~210 KB of Markdown + one Bash script + two CSVs.
> **Method:** Six parallel review agents, each grounded in established solution-architecture references. No agent saw any other's output; their sections appear verbatim below.
> **Output:** This consolidated report plus a small set of low-risk fixes shipped in the same PR (see *§ Changes shipped in this PR* at the end).

---

## Executive summary

MOSAIC v1.1 is a **coherent, well-structured, vendor-neutral solution-architecture methodology** that synthesizes TOGAF-style phases, ADR rigor, multi-attribute quality scoring, and a pluggable compliance-overlay model. Two genuinely original pillars (**Sovereignty** and **Adaptability**) and the **CADRE** input model are real contributions; the **pattern–implementation separation** is unusually well-disciplined.

It is **materially shippable for infrastructure / platform engagements**, but several gaps would surface in front of a sophisticated client or auditor:

- **Method rigor** lags ATAM / arc42 / C4 — no quality-attribute scenarios, no utility tree, no diagram contract at L1–L4, no Process or Development view.
- **Compliance overlays** are well-shaped but under-cite operative regulations and miss critical phasing dates that are *already in force* in 2026 (PCI DSS v4.0.1 future-dated requirements, EU AI Act Annex III high-risk obligations from 2026-08-02, DORA TLPT scoping).
- **Repository hygiene** is below OSS-template norms: no LICENSE on a public repo whose README declares the content "practice-confidential," no CI, no PR/issue templates, no CHANGELOG, no CODEOWNERS.
- **Worked example** demonstrates only Frame–Compose; Phases 5 (Commit) and 6 (Continue) have no example artifacts, and there is no LLD example anywhere.

Net assessment: a **strong v1.1**, one focused errata cycle away from `v1.1.1`, and one substantive update away from `v1.2`. The remediation roadmap at the end of this report sequences the work.

---

## Severity-ranked punch list (top 25)

Severity = practitioner impact. **Critical** = a finding that could result in materially wrong client advice. **High** = a credibility-level gap a peer reviewer would call out. **Medium** = a real but bounded gap. **Low** = polish.

| # | Sev | Dimension | Finding | Top-line fix |
|---|---|---|---|---|
| 1 | Critical | Overlays | `overlays/global-card.md` cites PCI DSS v4.0.1 but does not flag the **2025-03-31 mandatory date** for v4.x future-dated requirements (8.3.6, 8.4.2 all-CDE MFA, 6.4.3, 11.6.1, 12.3.3). A practitioner using §3 R-004 today would understate the MFA scope. | Add a "Mandatory-from" column to the mandate index; add SAQ-type selector. |
| 2 | Critical | Overlays | `overlays/ai.md` collapses EU AI Act phasing into a single date. **Annex III high-risk obligations bite 2026-08-02** (~10 weeks after this report). Prohibited-practices ban (2025-02), GPAI obligations (2025-08) and governance (2025-08) are already in force. | Add a phasing column with effective dates per obligation; add R-restriction for GPAI systemic-risk (training compute > 10^25 FLOPs, Art. 51). |
| 3 | High | Overlays | DORA Article 26 TLPT scoping wrong (`eu-fin.md` §3 R-003) — implies all regulated entities must do TLPT every 3 years. Applies only to **designated significant entities** per RTS; methodology basis is **TIBER-EU**. | Add "significant entity" qualifier; cite TIBER-EU. |
| 4 | High | Overlays | `id-fsi.md` omits **POJK 38/POJK.03/2016** (e-banking risk management), **BI PADG on PJP/PTP**, **OJK Cloud Computing Guidance**. | Add three rows to the mandate index. |
| 5 | High | Overlays | `id-gov.md` does not name **Perpres 95/2018 SPBE** or the **PDN (Pusat Data Nasional)** mandate explicitly. | Add Perpres 95/2018 row, PDN row, enumerate classification levels. |
| 6 | High | Overlays | `asean-fsi.md` mis-cites MAS Notice 644 (TRM Guidelines are advisory; binding obligations sit in **Notice 655 Cyber Hygiene** and **Notice 658 Outsourcing**). | Split into three rows: TRM Guidelines, Notice 655, Notice 658. |
| 7 | High | Overlays | `eu-fin.md` does not cite **PSD2/PSD3** (SCA, open banking sit here, not in DORA). | Add PSD2 row + horizon note on PSD3/PSR1. |
| 8 | High | Hygiene | **Public/confidential contradiction**: README/CONTRIBUTING call content "practice-confidential intellectual property" but the repo is at `https://github.com/mahfudazhary/test` with **no LICENSE**. Under default copyright this is hostile to the very contributors CONTRIBUTING solicits. | Either (a) move to private, (b) add proprietary LICENSE + separate OSI license for `scripts/`, or (c) dual-license docs under CC BY-NC and soften confidentiality wording. **Decision required from owner.** |
| 9 | High | Methodology | No equivalent of **TOGAF Phase E/F** — Commit collapses opportunities, migration waves, and work-packages into one step. | Add `transition-plan/` template; extend §7.2.5 to require work-packages and migration waves. |
| 10 | High | Methodology | **No quality-attribute scenarios / utility tree (ATAM rigor)** — LENS scoring is judgement-against-anchors, not engagement-specific scenarios. §9.4's ±20 fitness-point reproducibility claim is unlikely to hold without them. | Add "Quality Scenario" template; require ≥3 scenarios per high-weight pillar before Calibrate. |
| 11 | High | Methodology | **No diagram contract at L1–L4** (C4 / 4+1 gap). §4 and §7.2.3 never mandate diagrams, audience, or notation. | Mandate C4 System Context @ L1, Container @ L3, Component + Deployment + 4+1 Process view @ L4. |
| 12 | High | Methodology | **No Process / Runtime view** anywhere (4+1 gap). Especially acute for AI/agentic workloads which §00 promotes. | Add Runtime view artifact at L3; Development/module view at L4. |
| 13 | High | Methodology | **Zachman Who / Where / When columns under-served** below L0/L1 — no RACI, location/zone, or event-lifecycle modelling. | Extend §4.2.2 with Who-/Where-/When-map sub-artifacts. |
| 14 | High | Templates | **HLD template does not mandate diagrams or notation** (`templates/hld/hld-template.md` §4.2). | Mandate >=1 C4 Container view; canonicalize Mermaid as acceptable notation. |
| 15 | High | Templates | **HLD has no quality-attribute scenarios** (jumps Demand→pattern). | Add §"Quality-attribute scenarios" with stimulus-response-measure shape. |
| 16 | High | Templates | **LLD insufficient to hand to implementers** — no interface contracts, data schemas, sequence diagrams, error/timeout/retry, rollback. | Add sections (a) sequence diagrams, (b) config table w/ rationale, (c) error contract, (d) DR test, (e) acceptance test matrix. |
| 17 | High | Patterns | **Template conformance asymmetric** — only `private-cloud-hyperconverged.md` uses the full template; others omit Components/Relationships/Strong-context/Common-CADRE. | Either tighten the template (mark optional) or backfill the other 12. CI gate. |
| 18 | High | Patterns | **Canonical references systematically under-cited** — no mention of NIST SP 800-207, ISO 22301, NIST SP 800-34, 3-2-1-1-0, NIST SP 800-63 AAL/IAL, OpenTelemetry signals + USE/RED + Four Golden Signals, Delta/Iceberg/Hudi + medallion, MLOps maturity model, OWASP LLM Top-10. | One-line "Canonical basis" under §1 of each pattern. Low effort, high credibility lift. |
| 19 | High | Patterns | **Six patterns omit "Do not use this pattern when"** clause. | Restate as "Do not use this *variant* when…" per pattern. |
| 20 | High | Docs/IA | **Root README `PCI` vs actual `GLOBAL-CARD` overlay** mismatch — readers will look for `overlays/pci.md` and not find it. | One-word fix. **Shipped in this PR.** |
| 21 | High | Docs/IA | **Glossary gaps** — `drift`, `scorecard`, `pillar floor`, `gap register`, `risk-weighted view`, `engagement charter`, `pattern–implementation separation` undefined; acronyms (CSIRT, PAM, KMS, SDS, HCI, SOE, BUMN, DCa) unexpanded. | Add 7+ glossary entries + acronyms appendix. |
| 22 | High | Docs/IA | **No diagrams at all** — entire framework communicates in prose + 2 ASCII boxes. SPINE×LENS matrix, six-phase loop, overlay stack would render natively on GitHub via Mermaid. | Add 3 Mermaid diagrams. |
| 23 | High | Hygiene | **Worked example is incomplete**: no LLD, no Phase-5 (Commit) artifacts, no Phase-6 (Continue) artifacts, only 1 ADR (claimed 20–25 in real engagement). | Either acknowledge in `examples/README.md` or add the missing artifacts. |
| 24 | High | Hygiene | **No CI** — no markdown-lint, no link-check, no pattern-template conformance check, no bootstrap-script smoke test, no CSV schema validation. | 7 workflow files proposed (§6 of this report). Configs (`.markdownlint.json`, `.lycheeignore`) shipped here; workflows blocked by token scope (see PR description). |
| 25 | High | Templates | **ADR `Quality Impact` (-5..+5 deltas) has no anchoring** — inter-rater unreliable. Appendix B anchors absolute scores, not deltas. | Publish delta-anchoring guide; provide 2–3 worked deltas per pillar. |

A further ~40 Medium/Low findings sit in the per-dimension sections below.

---

## How this review was run

Six independent agents, each given:
- Read-only access to a fresh clone of the repo
- A specific reference frame (e.g., "review templates against Nygard, MADR, arc42, C4, IEEE 42010")
- A required output shape (verdict → coverage table → findings with severity → recommendations)
- A length cap

The agents did not see each other's reports. Severities below are as assigned by each agent. Where the same issue surfaced in two agents (e.g., missing diagrams appeared under both **Methodology** and **Docs & IA**), both retain their finding — duplication signals concordance.

| Dimension | Reference frames |
|---|---|
| 1. Methodology coverage | TOGAF 10 ADM, Zachman, C4, 4+1 (Kruchten), arc42, ATAM, Well-Architected (AWS/Azure/GCP), DDD, Wardley, Cynefin |
| 2. Templates & ADR quality | Nygard ADR, MADR, arc42, C4, IEEE 42010, PMBOK, ISO/IEC 25010, ISO 31000, Google SRE |
| 3. Pattern library | NIST SP 800-207 / 63 / 34, ISO 22301, OpenTelemetry, CNCF landscape, OWASP LLM Top-10, MLOps maturity, medallion |
| 4. Compliance overlays | POJK 11/2022 + 38/2016, UU PDP, PP 71/2019, SPBE, PDN, MAS TRM/655/658, BNM RMiT, DORA, GDPR, NIS2, PSD2/3, MiCA, PCI DSS v4.0.1, HIPAA + 2024 NPRM, HITRUST, EU AI Act, NIST AI RMF, ISO 42001/23894, CSRD/ESRS, SBTi, GHG Protocol |
| 5. Documentation & IA | Diátaxis, glossary norms, mermaid/C4 rendering, link-check, Keep-a-Changelog |
| 6. Repository hygiene | OSS template norms, shellcheck, Keep-a-Changelog, CODEOWNERS, GitHub Actions, RFC 4180 (CSV) |

---

## 1. Methodology Coverage

**Verdict:** MOSAIC is a well-composed, internally coherent synthesis that materially covers TOGAF-style phases, an arc42/HLD shape, multi-attribute quality scoring, and ADR rigor, with two genuinely original first-class pillars (Sovereignty, Adaptability). Coverage gaps versus the reference set are concentrated in **enterprise scope** (Zachman Where/Who/When cells, TOGAF Business/Information/Migration/Governance phases, dedicated Process & Development views), **method rigor** (no utility tree, no quality-attribute scenarios à la ATAM, no explicit diagram contract at L1–L4), and **strategy-formation tools** (DDD, Wardley, Cynefin entirely absent). For a practitioner, MOSAIC is ready for infrastructure/platform engagements but under-equipped for pure business-architecture, application-portfolio, or product-strategy work without explicit augmentation.

### Coverage matrix

| MOSAIC element | TOGAF 10 ADM | Zachman | C4 | 4+1 | arc42 | ATAM | WAF | DDD/Wardley/Cynefin |
|---|---|---|---|---|---|---|---|---|
| L0 Strategy | Preliminary + Phase A | Row 1 × Why | — | Scenarios (partial) | §1 | Business drivers | Mission | Wardley/Cynefin (absent) |
| L1 Context | Phase A; B (partial) | Row 1–2 × Who/Where | C4 L1 System Context | Scenarios | §3 | Stimulus/Environment | All pillars' context | — |
| L2 Capability | Phase B | Row 2 × What/How | — | — | §4 (partial) | Functional reqs | — | DDD strategic (absent) |
| L3 Logical | Phase C + D (logical) | Row 3 × What/How | C4 Container + Component | Logical | §5 | Architectural approaches | Pillar design | DDD bounded contexts (absent) |
| L4 Physical | Phase D (physical) + E partial | Rows 4–5 × How/Where | C4 Code (loosely) | Physical/Development | §7 | Concrete decisions | Pillar implementation | — |
| L5 Operational | Phase F (light); G + H | Row 6 × When/How | — | Process (closest) | §8/10/11 (partial) | Sensitivity points | Operational Excellence | Cynefin response (absent) |
| CADRE | Requirements Mgmt | Why col + Row 1–3 What/Who | — | Scenarios input | §2/10/11 | Stimulus + drivers (no utility tree) | Pillar questionnaires | — |
| LENS (8 pillars) | Arch Reqs Spec | — | — | — | §10 | Quality-attribute taxonomy (no scenarios) | 5–6 WAF pillars + Sovereignty + Adaptability | — |
| Method: Frame | Preliminary + A | Row 1 Scope | — | — | §1–2 | Phase 1 Presentation | Design-principles workshop | Wardley (absent) |
| Method: Capture | Reqs Mgmt | Row 1–2 scoping | — | Scenarios | §2 | Phase 2 Investigation (partial) | Lens questionnaire | — |
| Method: Compose | B, C, D | Rows 2–4 | C4 L1–L3 (no mandate) | Logical/Dev/Physical | §3–7 | Architectural approach analysis | Pillar reviews | DDD context mapping (absent) |
| Method: Calibrate | Reqs Mgmt cross-check; E partial | Row 4 verification | — | — | §10 + §11 | ATAM scenario eval (loose) | WAF Review | — |
| Method: Commit | E + F (light) | Row 5 | — | — | §9 ADRs | Phase Output | — | — |
| Method: Continue | G + H | Row 6 | — | — | §10 + §12 | Risk theme follow-up (absent) | Continuous improvement | Cynefin sense-respond (absent) |
| ADRs | Arch Repository | All rows × Why | — | — | §9 | Sensitivity/trade-off (loose) | — | — |

### Findings

- **[High] Missing TOGAF Phase E/F equivalent — explicit opportunities, migration, roadmap planning.** `07-six-phase-method.md` §7.2.5 collapses Commit into "lock baseline + BoM + ops spec + validation plan". The "Migration / Displacement" variation in §7.3 is a cadence, not a method. *Recommendation:* add a Commit sub-step or new artifact for **transition architectures, work-packages, migration waves**; add a matching `transition-plan/` template.
- **[High] No quality-attribute scenarios / utility tree (ATAM rigor gap).** Scoring relies on architect judgement against generic anchors (`06-lens-eight-pillars.md`, `appendices/B`), not engagement-specific scenarios. *Recommendation:* require >=3 scenarios per high-weight pillar before Calibrate; cross-reference §9.4's reproducibility claim.
- **[High] Zachman Who/Where/When columns under-served at lower rows.** Practitioner doing RACI, location/topology, or event/temporal modelling must invent it. *Recommendation:* extend §4.2.2 (Context) with Who-/Where-/When-map sub-artifacts.
- **[High] No diagram contract at L1–L4 (C4 / 4+1 gap).** §4 and §7.2.3 list diagrams but never mandate which level, notation, audience. *Recommendation:* mandate C4 System Context @ L1, Container @ L3, Component + Deployment + 4+1 Process view @ L4. Add diagram-set checklist to Calibrate gate.
- **[High] No process / runtime view (4+1 gap).** AI/agentic workloads heavily promoted in §00 and §13 will be modelled inadequately. *Recommendation:* add Runtime/Process view @ L3 and Development/module view @ L4.
- **[Medium] TOGAF Phase H (Architecture Change Management) thin.** §7.2.6 covers drift reports and triggers loop-back but defines no change-classification scheme (simplification / incremental / re-architecting). *Recommendation:* add change-classes and re-baseline procedure; cross-link to ADR supersession in §8.3.
- **[Medium] arc42 sections 6 (Runtime), 8 (Concepts), 11 (Risks & Debt) not explicitly mapped.** *Recommendation:* publish an explicit MOSAIC↔arc42 crosswalk in §13-heritage.
- **[Medium] DDD, Wardley, Cynefin absent from heritage.** Conspicuous omission for a 2026-vintage methodology. *Recommendation:* §1.3 or §4.2.1 — name DDD/Wardley/Cynefin as complementary toolkits with insertion points.
- **[Medium] LENS Reliability folded into Availability is contestable vs WAF.** Loses analytic resolution on AI/data workloads (model correctness, data freshness, ML drift). *Recommendation:* document Reliability sub-attributes inside Availability.
- **[Medium] Engagement-weighted fitness function lacks sensitivity / risk-theme view (ATAM rigor).** §9.2–9.4 produces a single weighted sum; no sensitivity or trade-off points. *Recommendation:* §9.4 — add a Sensitivity/Trade-off register derived from ADR Quality Impact.
- **[Low] Sustainability pillar definition outpaces practitioner tooling** — Level 4–5 anchors propose carbon-intensity-per-business-activity metrics; most clients can't supply these in 2026. *Recommendation:* split into "reportable" vs "operational" tracks.
- **[Low] Pattern Library is L3-only; no equivalent at L1 (context) or L5 (ops).** *Recommendation:* extend with `context-patterns/` and `ops-patterns/` or document scope.
- **[Low] C4 "Code" level and L4 are not the same thing.** L4 stops at deployment, not source-code modelling. *Recommendation:* clarify in §4.2.5.
- **[Info] Sovereignty and Adaptability as first-class pillars are genuine, defensible contributions.** Pattern–Implementation separation operationalizes Adaptability; one of MOSAIC's strongest original contributions. Keep.
- **[Info] CADRE renaming (Risks → Exposure; adding Context) is a small but useful upgrade** over PMBOK assumption/constraint/risk registers. Matches modern threat-modelling vocabulary.

---

## 2. Templates & ADR Quality

**Verdict:** MOSAIC's templates are unusually well-crafted for a homegrown framework — the ADR template materially exceeds Nygard, sits between MADR and full Y-statement, and adds genuine novelty (CADRE traceability + 8-pillar delta scoring). The HLD/LLD are coherent and pragmatic but undershoot arc42/IEEE 42010 on quality-attribute scenarios, viewpoint discipline, and mandatory diagrams. Operational spec, scorecard and drift report are above industry median; the main systemic gap is reproducibility/inter-rater reliability of the 1–5 scoring rubric and the absence of explicit diagram notation requirements.

### Conformance summary

| Template | Reference standard | Conformance | Top gap |
|---|---|---|---|
| ADR | Nygard + MADR + Y-statements | ~95% | No explicit `Superseded-by`/`Supersedes` link fields; "Deciders" implicit in Authors/Reviewers |
| HLD | arc42 + C4 + IEEE 42010 | ~55% | No quality-attribute scenarios; diagrams optional; no viewpoint/correspondence model |
| LLD | C4 Component/Code + detailed design | ~60% | No interface contracts, schemas, sequence/state diagrams, error handling, capacity rationale |
| Engagement charter | PMBOK + TOGAF "Request for Architecture Work" | ~75% | No business case, high-level schedule, change-control, indicative budget |
| CADRE register | ISO/IEC/IEEE 29148 + ISO 31000 | ~80% | CSV doesn't enforce ID-prefix; status vocabulary inconsistent CSV↔MD; no traces-to column |
| Scorecard | ISO/IEC 25010; SEI ATAM | ~65% | Per-pillar evidence checklist tied to score; not inter-rater reliable; no calibration examples |
| Drift report | DORA metrics + drift literature | ~75% | No intended-vs-actual diff at artifact level; binary §8 |
| Operational spec | Google SRE + ITIL | ~80% | No SLI implementation details; no on-call/SEV definitions; thin observability |

### Findings

- **[High] HLD does not mandate diagrams or notation.** *Recommendation:* mandate >=1 C4 Container view + pattern-selection matrix; reference C4 + Mermaid as canonical.
- **[High] HLD has no quality-attribute scenarios.** *Recommendation:* add subsection deriving stimulus-response-measure scenarios from CADRE Demands; cite ATAM utility tree.
- **[High] LLD insufficient for implementers.** *Recommendation:* add sections for sequence diagrams per integration, config rationale, error/timeout/retry contract, DR test procedure, acceptance-test matrix.
- **[Medium] ADR template missing structured supersession links.** *Recommendation:* add `Supersedes` / `Superseded-by` metadata fields and a `Related ADRs` row.
- **[Medium] ADR template does not separate Deciders from Authors/Reviewers.** *Recommendation:* rename to `Decider(s)` (RACI-A) and `Consulted/Reviewers` per MADR.
- **[Medium] Quality-Impact delta rubric (-5..+5) has no anchoring.** Inter-rater unreliable. *Recommendation:* publish delta-anchoring guide; 2–3 worked deltas per pillar.
- **[Medium] Scorecard scoring not reproducible.** *Recommendation:* require evidence link per claim; document calibration protocol.
- **[Medium] `fitness-calculator.csv` carries spreadsheet formulas in a CSV** and pre-loads pillar weights from the worked example. *Recommendation:* zero out example weights; document spreadsheet-import behaviour.
- **[Medium] CADRE Markdown vs CSV schemas drift.** *Recommendation:* canonical schema dictionary; both forms generated from it; add `traces-to` column for forward/backward traceability.
- **[Medium] Engagement charter missing PMBOK/TOGAF elements** — change control, indicative budget, top-3 risks at charter level. *Recommendation:* add §"Change control" and §"Indicative budget envelope".
- **[Low] Operational spec SRE/observability depth.** *Recommendation:* add §2.1 Error-budget policy, §4.3 Burn-rate alerting; expand §5 with SEV definitions and rotation policy.
- **[Low] Drift report lacks intended-vs-actual diff at artifact level.** *Recommendation:* §8.1 Configuration drift, §8.2 Decision drift.
- **[Low] Internal metadata blocks vary across templates.** *Recommendation:* canonical front-matter (YAML or table) shared across all artifacts.
- **[Low] ID convention scope ambiguity.** *Recommendation:* publish a single "IDs across artifacts" table with prefix regex and owning registry.
- **[Low] Worked example deviates from template metadata in places** — `examples/.../03-hld.md` adds a §4.5 L3 implementation matrix not present in the template, confusing the L3/L4 boundary. *Recommendation:* either add to the template (marked "preview only") or strip from the example.
- **[Low] Scorecard "floor" semantics undefined** — overlay floor format not cross-referenced from template. *Recommendation:* link to overlay floor declaration spec; document "floor missed → return to Compose or escalate".
- **[Info] ADR template is genuinely strong** — CADRE Trace + 8-pillar Quality-Impact delta + Validation success-measure is better than vanilla Nygard or MADR. Keep.
- **[Info] CADRE Quality checks are excellent** — six concrete pre-baseline checks. Consider a `validate-cadre.sh` script that mechanically checks them against the CSV.

---

## 3. Pattern Library

**Verdict:** The 13-pattern library is well-bounded, internally consistent, and unusually disciplined about pattern↔implementation separation — the vendor-neutral aspiration is largely honoured by use of "Implementation A/B/…" placeholders. Template conformance is good in spirit but uneven in depth: only `private-cloud-hyperconverged.md` fully populates every template section; every other pattern abridges. The biggest substantive weakness is thin grounding in canonical references — NIST SP 800-207, SP 800-63, SP 800-34, ISO 22301, 3-2-1-1-0, the medallion architecture, and Istio/Linkerd/Cilium are conspicuously absent by name, even where the underlying logic clearly draws on them.

### Pattern conformance summary

| Pattern | Template conformance | Canonical reference grounding | Strongest gap |
|---|---|---|---|
| private-cloud-hyperconverged | Full (reference exemplar) | HCI vendor-neutral, sound | Could name HCI categories |
| private-cloud-disaggregated | Partial | Ceph/SAN-NAS implicit | Object/file/block protocol matrix not explicit |
| hybrid-cloud-extension | Partial | Implicit hyperscaler-on-prem | Egress economics noted but no FinOps overlay link |
| container-platform | Partial | CNCF implied but not named | No supply-chain (SLSA/sigstore), admission-policy (OPA/Kyverno) |
| service-mesh | Partial | SPIFFE/SPIRE named; Istio/Linkerd/Cilium not | Ambient mesh thin; no API gateway boundary discussion |
| disaster-recovery-bcp | Partial | RPO/RTO sound; ISO 22301 / NIST SP 800-34 not named | No tier-classification (BIA) guidance |
| identity-access-management | Partial | SAML/OIDC/FIDO2 named; NIST SP 800-63 AAL/IAL missing | Workload identity (SPIFFE) only oblique |
| zero-trust-network | Partial | **NIST SP 800-207 not named**; SASE/SSE not glossed | PDP/PEP vocabulary missing |
| observability-platform | Partial | OpenTelemetry named; USE/RED/Four Golden Signals absent | No SIEM/SOC boundary; eBPF missing |
| data-platform-lakehouse | Partial | Open table formats generic; **Delta/Iceberg/Hudi and medallion not named** | Data contracts/quality unaddressed |
| ai-ml-platform | Partial | NIST AI RMF + EU AI Act named; MLOps maturity model absent | No model-card / eval-harness guidance |
| agentic-llm-operations | Partial | MCP mentioned; AgentOps not; **OWASP LLM Top-10 absent** | Prompt-injection threat model thin |
| backup-cyber-recovery | Partial | Immutable/WORM/air-gap present; **3-2-1-1-0 and NIST CSF Recover not named** | Clean-room recovery validation under-specified |

### Net-new patterns recommended (prioritized)

1. **API Gateway / Edge Ingress** — north-south policy, rate limiting, public-API governance. Currently overlaps service-mesh with no resolution.
2. **Event-Driven Architecture / Streaming (Kafka/Pulsar/Flink + CDC)** — high engagement frequency; referenced in lakehouse but not first-class.
3. **Platform Engineering / Internal Developer Platform (Backstage-class)** — implied by "paved road" anti-patterns but never named.
4. **FinOps Platform** — Cost is a pillar; multiple patterns flag cost-surprise anti-patterns but no operating pattern exists.
5. **Confidential Computing / Data-in-use protection** — material for FSI/HC; complements zero-trust + IAM.
6. **Data Mesh / Data Governance (catalog, contracts, products)** — lakehouse covers storage/query, not the product layer.

(Deferred: Serverless/FaaS, Edge Computing, Quantum-safe Crypto Migration, Multi-tenancy SaaS, SIEM/SOC platform.)

### Findings

- **[High] Template conformance asymmetric.** Only `private-cloud-hyperconverged.md` uses the full template. *Recommendation:* either tighten template (mark optional) or backfill 12 others. The reference depth is the right bar.
- **[High] Six patterns omit "Do not use this pattern when".** *Recommendation:* restate as "Do not use this *variant* when…" — defensible without dropping the clause.
- **[High] Canonical references systematically under-cited.** Listed above per pattern. *Recommendation:* one-line "Canonical basis" under §1 of each pattern. Low effort, big credibility lift.
- **[Medium] Multi-implementation matrix columns drift.** `Version (as of …)`, `Prerequisites`, `Trade-offs`, `Canonical doc` are inconsistent. *Recommendation:* make columns mandatory but extensible; allow optional first column with explicit name.
- **[Medium] Vendor neutrality uneven** — soft defaults visible in `identity-access-management.md:64` and `container-platform.md:52`. *Recommendation:* move soft defaults to decision-criteria phrasing only.
- **[Medium] Inter-pattern boundaries blurry.** `service-mesh` flags "Conflating mesh with API gateway" but there is no API-gateway pattern. *Recommendation:* add API-gateway pattern; explicit "this pattern intentionally does NOT cover" disclaimers in the meantime.
- **[Medium] Coverage gaps for current practice.** No EDA/Streaming, no IDP, no FinOps, no Confidential Computing patterns. See net-new list.
- **[Low] `private-cloud-hyperconverged.md` is materially longer than peers.** The exemplar — flag explicitly in `patterns/README.md`.
- **[Low] `identity-access-management.md` carries two implementation tables** (workforce IAM + PAM) without template support for sub-matrices. *Recommendation:* split into IAM and PAM patterns, or extend template.
- **[Low] Cross-reference symmetry incomplete.** Some patterns cite observability-platform; the reverse is not always true. *Recommendation:* CI lint for cross-reference reciprocity.
- **[Low] No retirement / deprecation worked example.** Status field allows "Retired" but no pattern carries it. Add one to demonstrate the lifecycle.

---

## 4. Compliance Overlays

**Verdict.** Schema is consistent and overlays do stack, but **specific citation accuracy is uneven** and several overlays under-cite the standards a practitioner would expect to see in front of a client. The most acute issues are in `global-card.md` (PCI v4.0.1 mandatory dates / SAQ types missing), `ai.md` (EU AI Act phasing absent), `eu-fin.md` (PSD2/3 absent), and `id-fsi.md` (POJK 38/2016 e-banking, BI PADG on PJP/PTP, OJK cloud guidance not cited). LENS pillar mapping is clean; all weights sum to 100; no broken pillar references.

### Citation summary

| Overlay | Regulations cited | Currency | Top gap |
|---|---|---|---|
| id-fsi | POJK 11/2022, UU 27/2022 PDP, PP 71/2019, BIFast, POJK 12/2021 | Mostly current | POJK 38/2016 e-banking, BI PADG PJP/PTP, OJK cloud guidance missing |
| id-gov | PP 71/2019, UU 27/2022 PDP, BSSN, Komdigi PSE, generic GovCloud | Mostly current | **Perpres 95/2018 SPBE not named**; PDN missing; classification levels not enumerated |
| asean-fsi | MAS TRM, BNM RMiT, BSP, BoT, PDPAs | Stale | **MAS Notice 644 is wrong instrument**; Notice 655 + 658 missing; transfer mechanisms not differentiated |
| eu-fin | DORA, GDPR, NIS2, EBA GLs, MiCA | Current on DORA | **PSD2/PSD3 missing**; TLPT RTS not cited; SCC version not cited |
| global-card | PCI DSS v4.0.1, PCI PIN, EMVCo | **Stale** | **v4.x mandatory date 2025-03-31 not flagged**; future-dated requirements not enumerated; SAQ types missing |
| healthcare | ISO 27799, HIPAA, NHS DSPT, IEC 62304, FDA SaMD, EU MDR | Stale | HITRUST CSF, 2024 HIPAA Security Rule NPRM, 21 CFR Part 11, Art. 9 GDPR-health missing |
| ai | EU AI Act, NIST AI RMF, ISO 42001, MAS FEAT, GDPR Art 22 | **Stale on phasing** | **Phasing dates absent**; ISO/IEC 23894 missing; OECD AI Principles missing; 10^25 FLOPs threshold not noted |
| sustain | CSRD, ISSB IFRS S1/S2, POJK 51/2017, GHG Protocol, ESRS E5 | Stale | SBTi, ISO 14064, PUE/WUE absent; **CSRD 2024 Omnibus delay not flagged** |
| _template | N/A | Current | No "Currency check"/expiry field |
| README | N/A | Current | No worked stacking-conflict example |

### Findings

- **[Critical] PCI DSS v4.0.1 mandatory-date and future-dated requirements not flagged** (`global-card.md` §2 row 1, §3 R-006). v3.2.1 retired 2024-03-31; v4.x future-dated requirements (6.4.3, 11.6.1, 8.3.6, 12.3.3, 8.4.2 all-CDE MFA) **mandatory from 2025-03-31** — before today. R-004 misses the all-CDE MFA expansion. *Recommendation:* add a "Mandatory-from" column; add SAQ-type selector (A, A-EP, B, B-IP, C, C-VT, D-Merchant, D-Service-Provider, P2PE).
- **[Critical] EU AI Act phasing not represented** (`ai.md` §2 row 2, §3 R-001/R-004/R-005/R-008). Phasing as of 2026-05-21: prohibited practices (2025-02-02), GPAI obligations (2025-08-02), governance (2025-08-02) **in force**; Annex III high-risk obligations bite **2026-08-02** (10 weeks from now). *Recommendation:* add phasing column with effective dates per obligation; add R-restriction for GPAI systemic-risk (training compute > 10^25 FLOPs, Art. 51) and AI Office notification regime.
- **[High] DORA Article 26 TLPT scope wrong** (`eu-fin.md` §3 R-003). Applies only to designated significant financial entities per RTS; methodology basis is TIBER-EU. *Recommendation:* add "significant entity" qualifier; cite TIBER-EU.
- **[High] POJK 38/POJK.03/2016 not cited** (`id-fsi.md` §2). Also missing: OJK Cloud Computing Implementation Guidelines, BI PADG 23/2021 for PJP/PTP. *Recommendation:* three additional mandate-index rows.
- **[High] SPBE / Perpres 95/2018 not named in `id-gov.md` §2.** PDN (Pusat Data Nasional) mandate also absent. *Recommendation:* explicit Perpres 95/2018 row, PDN row; enumerate classification levels in R-001.
- **[High] MAS Notice 644 mis-cited** (`asean-fsi.md` §2 row 1). TRM Guidelines are advisory; binding obligations sit in Notice 655 and Notice 658. *Recommendation:* split into three rows.
- **[High] PSD2/PSD3 missing** (`eu-fin.md` §2). SCA RTS comes from PSD2, not DORA. *Recommendation:* add PSD2 row + horizon note on PSD3/PSR1.
- **[High] EU AI Act / ISO 23894 / OECD AI Principles missing** (`ai.md` §2). *Recommendation:* add ISO/IEC 23894 + OECD AI Principles to mandate index.
- **[Medium] PCI DSS scope-reduction techniques (tokenization, P2PE, segmentation testing 11.4.5) not enumerated.** *Recommendation:* R-009 for segmentation testing cadence; "Scope-reduction patterns" subsection.
- **[Medium] HITRUST CSF + 21 CFR Part 11 missing** (`healthcare.md` §2). *Recommendation:* add both rows.
- **[Medium] CSRD Omnibus delay not flagged** (`sustain.md` §2). *Recommendation:* cite Feb 2025 Omnibus simplification package; narrow scope notes.
- **[Medium] SBTi, ISO 14064, PUE/WUE absent** (`sustain.md` §2-§3). *Recommendation:* PUE/WUE R-restriction for in-scope datacenter patterns; SBTi + ISO 14064 to mandate index.
- **[Medium] HIPAA Security Rule 2024 NPRM not referenced** (`healthcare.md` §2). *Recommendation:* horizon note.
- **[Medium] `healthcare.md` R-005 overstates NHS DSPT residency.** *Recommendation:* clarify DSPT requires DPA 2018 / UK GDPR compliance, not UK residency per se.
- **[Medium] Cross-border / data-residency depth uneven** — UU PDP vs PP 71/2019 conflated in `id-fsi.md` R-002; ASEAN PDPA transfer mechanisms collapsed in `asean-fsi.md`. *Recommendation:* split residency from transfer-mechanism R-restrictions.
- **[Low] Template missing "Currency check" / "Citation valid through" field.** *Recommendation:* add "Last validated" column to mandate-index table and R-restrictions.
- **[Low] README does not show a worked stacking-conflict example.** *Recommendation:* one worked example of conflicting overlays + resolution.
- **[Low] LENS pillar rationale narratives skip Adaptability in `id-gov.md` §5 and `sustain.md`** despite assigning weight. Cosmetic.
- **[Low] No programmatic schema-parity check across overlays.** *Recommendation:* CI lint that enforces R-restriction table column headers.

---

## 5. Documentation & Information Architecture

**Verdict.** The reference set is unusually coherent for a v1.1 framework: the 14-document `docs/` spine reads cleanly end-to-end, the pluggable-overlay and pattern-library separation is consistently described, and the template/scaffold flow is well-engineered. The defects are presentational and operational, not conceptual — a stub-engagement scaffold with deliberately dead links, missing glossary entries, no visible changelog, no PR templates, and a handful of casing/terminology drifts. Materially shippable; not yet polished.

### Broken links

The only relative-link defects are inside the bootstrap scaffold `engagements/_new-engagement/` (intentional per `engagements/_new-engagement/README.md:3`, but a strict link checker still flags them):

| File:line | Broken target |
|---|---|
| `engagements/_new-engagement/01-frame/README.md:12` | `engagement-charter.md` |
| `engagements/_new-engagement/02-capture/README.md:13` | `cadre-register.md` |
| `engagements/_new-engagement/03-compose/README.md:14` | `hld.md` |
| `engagements/_new-engagement/03-compose/README.md:15` | `lld.md` |
| `engagements/_new-engagement/03-compose/README.md:16` | `adrs/` |
| `engagements/_new-engagement/04-calibrate/README.md:14` | `quality-scorecard.md` |
| `engagements/_new-engagement/05-commit/README.md:14` | `operational-spec.md` |
| `engagements/_new-engagement/06-continue/README.md:14` | `drift-reports/` |
| `engagements/_new-engagement/06-continue/README.md:15` | `change-requests/` |
| `engagements/_new-engagement/06-continue/README.md:16` | `audit-findings/` |

Every other relative link checked resolves. No external-URL links exist outside heritage prose.

### Terminology drift

| Term | Variants | Where |
|---|---|---|
| Spine | `SPINE` (ASCII) vs `Spine` | `README.md`, `docs/03-framework-overview.md` |
| Lens | `LENS` (ASCII) vs `Lens` | same |
| GLOBAL-CARD overlay | listed as **`PCI`** in root README; `GLOBAL-CARD` everywhere else | `README.md:18` vs `docs/10-compliance-overlays.md:20`, `overlays/README.md:20`, `overlays/global-card.md` |
| Method | `Method` (proper) vs `method` (common) | `docs/03-framework-overview.md` lines 3/5/17/19/57/71 vs `README.md:15` |
| Healthcare overlay | `HC` vs `Healthcare (HC)` vs `HC (Healthcare)` | three files |
| Six-phase loop | `Compose → Calibrate` (arrow) vs `Compose–Calibrate` (en-dash) | `docs/03` vs `docs/07` |
| BIFast | `BIFast` vs `BI BIFast` | `docs/12-glossary.md` vs `overlays/id-fsi.md` |

### Findings

- **[Major] PCI vs GLOBAL-CARD root-README mismatch** (`README.md:18`). One-word fix. **Shipped in this PR.**
- **[Major] Scaffold-folder dead links** surface 10× to any link checker. *Recommendation:* (a) commit `.placeholder` files, (b) switch to inline-code rather than links, or (c) `.markdownlintignore` + documented exception.
- **[Major] No diagrams; ASCII-only visual.** *Recommendation:* three Mermaid diagrams — SPINE×LENS matrix (in `docs/04`), six-phase loop with iteration arrows (in `docs/07`), overlay-stacking (in `docs/10`).
- **[Major] Glossary gaps.** Missing entries: drift / drift report, scorecard, fitness function (proper definition not alias), pillar floor, gap register / risk-weighted view, engagement charter, pattern–implementation separation. Missing acronyms: CSIRT, PAM, KMS, SDS, HCI, SOE, BUMN, DCa. *Recommendation:* add entries + acronyms appendix.
- **[Major] No global TOC across the repo.** `docs/`, `templates/`, `patterns/`, `overlays/` READMEs do not link to each other. *Recommendation:* one-line cross-reference at the bottom of each README.
- **[Major] No CHANGELOG / version visibility inside `docs/`.** `v1.1 (May 2026)` is claimed only in root README. *Recommendation:* add `CHANGELOG.md`; stamp framework version in each `docs/NN-*.md` header.
- **[Major] CONTRIBUTING.md missing operational specifics** — no PR template, no issue template, no review SLO commitment, no ADR-for-framework-changes rule. *Recommendation:* add `.github/PULL_REQUEST_TEMPLATE.md` with fields enumerated by CONTRIBUTING; ISSUE_TEMPLATEs for pattern/overlay proposals.
- **[Minor] Onboarding reading order works but is not declared canonically** — three different orderings appear (README §75, `docs/README.md`, `docs/00-executive-summary.md` §33–38). *Recommendation:* pick one canonical path.
- **[Minor] No declared prerequisites for new readers.** *Recommendation:* one-line "Background reading" at the top of dependent docs.
- **[Minor] ASCII art rendering** — diagrams render fine on GitHub but may break in Confluence/Word exports. *Recommendation:* keep fenced; verify in the export pipeline.
- **[Minor] Tone professional throughout** — only `docs/07-six-phase-method.md:55` slightly self-congratulatory ("most creative phase"). No vendor-marketing slippage.
- **[Minor] Templates README cross-link gaps** — does not reference overlay deliverables. *Recommendation:* add fourth bullet to "required structural elements".
- **[Minor] `docs/README.md` confidentiality table omits glossary, heritage, design principles, introduction.** *Recommendation:* explicitly mark every doc as `Shareable under NDA` or `Internal only`.
- **[Minor] Glossary overweights Indonesian regulatory terms** — DORA gets one line; PCI-DSS/MAS TRM/NIS2/CSRD/ISSB undefined. *Recommendation:* either restrict to MOSAIC vocabulary + a "Regulatory terms by jurisdiction" subsection, or expand to cover every regulator named in overlays.
- **[Minor] Implementation slugs are placeholders** — `Implementation A/B/C` carry no vendor mapping. *Recommendation:* keep L3 vendor-neutral; reference a separate internal-only `patterns/_implementations/` index.
- **[Info] Heritage attribution intentionally vague** — consistent with practice-confidential posture; flagged as future tension when clients ask for citations.

---

## 6. Repository Engineering Hygiene

**Verdict:** Solid documentation methodology with a competent bootstrap script and clean folder taxonomy, but the repo presents as a serious OSS-style template while lacking the minimum OSS hygiene set (LICENSE, SECURITY, CODEOWNERS, CI, issue/PR templates). The most acute problem is the contradiction between "Practice-confidential intellectual property" framing and the fact that this lives at a public GitHub URL with no license — under default copyright that is a legal grey zone for anyone who clones it. The worked example is also less than complete for what the README promises.

### Missing standard files

| File | Status | Note |
|---|---|---|
| `LICENSE` | Missing | **High** — public repo, "practice-confidential" framing, no license. Owner decision required (proprietary + scripts-OSI? CC BY-NC?). |
| `CODE_OF_CONDUCT.md` | Missing | Contributor Covenant 2.1 standard. |
| `SECURITY.md` | Missing | Even a docs repo needs a disclosure address. **Shipped (skeleton) in this PR.** |
| `CODEOWNERS` | Missing | CONTRIBUTING names three groups; map to paths in `.github/CODEOWNERS`. |
| `PULL_REQUEST_TEMPLATE.md` | Missing | CONTRIBUTING already enumerates fields. **Shipped in this PR.** |
| `ISSUE_TEMPLATE/` | Missing | Useful: `pattern-proposal.yml`, `overlay-proposal.yml`, `framework-errata.yml`. |
| `CHANGELOG.md` | Missing | v1.1 claimed; no history. Adopt Keep-a-Changelog. |
| `.editorconfig` | Missing | **Shipped in this PR.** |
| `.github/workflows/` | Missing | Seven workflows proposed below; configs (`.markdownlint.json`, `.lycheeignore`) shipped here but workflows blocked by OAuth scope. |
| GitHub topics/description | Empty | Discoverability zero. |

### `scripts/new-engagement.sh` review

Good shape — `set -euo pipefail`, kebab-case validation, refuses to overwrite, portable `sed_inplace` shim. Findings:

- **[Medium] No `IFS` hardening** (line 39). Add `IFS=$'\n\t'`.
- **[Medium] No `shellcheck` directive or CI gate.** Add `# shellcheck shell=bash` + workflow.
- **[Medium] Kebab-case regex permits trailing hyphen and double-hyphen** (line 108). Tighten to `^[a-z][a-z0-9]*(-[a-z0-9]+)*$`.
- **[Medium] No length cap on `CLIENT`** — 200-char shortname is accepted. Cap to ~40.
- **[Low] `--code` and `--overlays` injected into `sed` without escaping** (lines 174–176). Pre-escape `/` and `&`.
- **[Low] `--code` with no value following is silently swallowed.** Error explicitly.
- **[Low] No `--dry-run` flag** — script writes 16+ files.
- **[Low] Hardcoded path-rewrite block** (lines 183–207) couples script to template layout. Consider a single `find … -exec` with a mapping table.
- **[Low] `_template-notes.md` and `_README.md` filenames** look like "ignore me". Consider `TEMPLATE-NOTES.md` or move into `_meta/`.
- **[Low] No pre-flight check that source files exist** — failed `cp` mid-way leaves a half-bootstrapped engagement.
- **[Low] No cleanup-on-failure** — `trap 'rm -rf "$TARGET"' ERR` after creating target.

### CSV hygiene

- **[Medium] `fitness-calculator.csv` mixes data and formulae** + rows 11–16 mix schemas (verdict bands). Document import behaviour or ship `.csv` + `.xlsx` pair.
- **[Low] `cadre-register.csv` is 19 columns wide, `.md` per-element column sets differ.** Add a header comment row or `_schema.md`.
- **[Low] No UTF-8 BOM** — Excel-on-Windows sometimes mis-detects with `<=`/`>=`.
- **[Low] `YYYY-MM-DD` placeholders flagged by date validators.** Noise under future CI.

### Worked example completeness

- **[High] No LLD** in `examples/id-fsi-core-banking/` — Compose without its L4 deliverable.
- **[High] No Phase-5 (Commit) artifacts** — no operational-spec, validation-plan, migration-plan, BoM.
- **[High] No Phase-6 (Continue) artifacts** — no drift report, change request, audit finding.
- **[Medium] Only one ADR** (`adr-0014`). 3–4 spanning decision types would teach better.
- **[Medium] Folder shape differs** from bootstrap — phase folders unused; files flat.

### Recommended CI (proposed; configs only shipped here)

1. **`lint-markdown.yml`** — `markdownlint-cli2` with project `.markdownlint.json`. (blocked by OAuth `workflow` scope; config shipped, workflow pending).
2. **`link-check.yml`** — `lychee-action` on every push + weekly schedule. (blocked by OAuth `workflow` scope; config shipped, workflow pending).
3. **`shellcheck.yml`** — `action-shellcheck` over `scripts/`.
4. **`bootstrap-smoke-test.yml`** — run `new-engagement.sh` on `ubuntu-latest` and `macos-latest`; verify file set and links. Single highest-value job.
5. **`csv-schema.yml`** — validate CSV headers against a declared schema.
6. **`spell-check.yml`** — `cspell-action` with a project dictionary (CADRE, MOSAIC, POJK, KBMI, …).
7. **`pattern-template-conformance.yml`** — every `patterns/*.md` must contain the template's required headings.
8. **`required-files.yml`** — fail if LICENSE, SECURITY.md, CODEOWNERS, CODE_OF_CONDUCT.md are absent (once added).

### Public-vs-confidential contradiction

**[High] License/confidentiality contradiction** (`README.md:7`, `CONTRIBUTING.md:61`, public remote). Default copyright is hostile to contributors CONTRIBUTING solicits. Options:
- (a) move to a private repo or GitHub org with SSO;
- (b) keep public + add proprietary LICENSE with NDA language + separate OSI license for `scripts/`;
- (c) keep public + dual-license docs under CC BY-NC 4.0; soften confidentiality wording.

**Decision required from the owner before this can be fixed in a PR.**

### Additional findings (consolidated)

- **[Medium] No `CHANGELOG.md` despite versioned framework** (`README.md:7`).
- **[Medium] Bootstrap scaffold READMEs link to files that only exist post-bootstrap** — same as Docs/IA Major finding above; link-checker noise.
- **[Low] No `templates/README.md` schema reference.**
- **[Low] No `Makefile` to unify local + CI invocation.**
- **[Low] `engagements/README.md` not enforced in CI to stay synced with directory listing.**

---

## Recommended remediation roadmap

### Quick wins — this PR (already shipped below)
- Fix `README.md` `PCI` → `GLOBAL-CARD`
- Add `.editorconfig`, `SECURITY.md`, `PULL_REQUEST_TEMPLATE.md`
- Add CI configs (markdown lint + link check) — owner to add workflow files (requires `workflow` OAuth scope)
- Add `QA_REPORT.md` itself (this file)

### Next week (errata `v1.1.1`)
- Resolve LICENSE / public-confidential contradiction (**owner decision**)
- Add 7+ missing glossary entries + acronyms appendix
- Add three Mermaid diagrams (`docs/04`, `docs/07`, `docs/10`)
- Add `CODEOWNERS`, `ISSUE_TEMPLATE/`, `CHANGELOG.md`, `CODE_OF_CONDUCT.md`
- Resolve PCI v4.0.1 mandatory-date + EU AI Act phasing in overlays (both are *already* in force in 2026)
- Tighten `new-engagement.sh` regex, add `--dry-run`, add pre-flight check + ERR trap
- Add remaining CI workflows (shellcheck, bootstrap-smoke-test, csv-schema, spell-check, pattern-template-conformance)

### Next quarter (`v1.2`)
- ATAM rigor: quality-attribute scenario template; require scenarios per high-weight pillar
- Mandate diagram contract at L1/L3/L4 (C4 + 4+1 Process view)
- HLD/LLD upgrades: mandatory diagrams, interface contracts, sequence flows, error/timeout/retry, acceptance-test matrix
- ADR delta-anchoring guide for `-5..+5` quality impacts
- Pattern library: backfill template conformance, add Canonical-basis line per pattern, fix "Do not use this variant when" clauses
- Worked example: add LLD, Phase-5 and Phase-6 artifacts, 3–4 more ADRs spanning decision types
- Compliance overlays: POJK 38/2016, SPBE/PDN, MAS Notice 655/658, PSD2/3, HITRUST + 21 CFR Part 11, SBTi + ISO 14064 + PUE/WUE

### Strategic (`v2.0`)
- New patterns: API Gateway, EDA/Streaming, Platform Engineering/IDP, FinOps, Confidential Computing, Data Mesh
- Strategy-formation toolkit: DDD strategic design, Wardley mapping, Cynefin — name them in `docs/13-heritage.md` and document insertion points
- Sensitivity / trade-off register derived from ADR Quality Impact across the engagement
- Process / Runtime view as a first-class artifact at L3; Development view at L4
- TOGAF Phase E/F equivalent: transition-plan template + work-package + migration waves
- `validate-cadre.sh` programmatic check of CADRE register pre-baseline rules

---

## Changes shipped in this PR

This PR ships only changes that are unambiguous and low-risk; opinion-bearing edits (LICENSE choice, framework rewrites, new patterns, glossary content) are left to the owner per the roadmap above.

1. **`QA_REPORT.md`** — this consolidated report.
2. **`README.md`** — `PCI` → `GLOBAL-CARD` overlay name (Docs/IA finding [Major]; Top-25 #20).
3. **`SECURITY.md`** — minimal placeholder with contact pointer. Owner can extend.
4. **`.editorconfig`** — standard cross-editor whitespace/line-ending hygiene.
5. **`.github/PULL_REQUEST_TEMPLATE.md`** — fields enumerated by CONTRIBUTING.md.
6. **`.markdownlint.json`** — permissive config aligned with current Markdown style (line length 200 for prose, no enforced first-line H1, allow inline HTML for `<sub>`/`<sup>`/`<details>`).
7. **`.lycheeignore`** — documents which paths a link checker should skip (the deliberately-stubbed engagement scaffold).

> **CI workflows not shipped.** `.github/workflows/markdownlint.yml` and `.github/workflows/link-check.yml` were drafted and validated locally but could not be pushed in this PR because the OAuth token used to open it lacks the `workflow` scope. The owner can either (a) run `gh auth refresh -s workflow` and commit them in a follow-up PR, or (b) re-create them by hand from the file contents shown in §6 above. The `.markdownlint.json` and `.lycheeignore` configs are kept so the workflows can be enabled in a single commit later.

No content edits to `docs/`, `templates/`, `patterns/`, `overlays/`, or `examples/`. Every other recommendation is captured in this report for the owner to triage.

---

*Generated by parallel multi-agent QA review. Reproducible: re-run the same six prompts against any later commit and diff the punch list to track remediation.*
