# 3. Framework Overview

MOSAIC is **three orthogonal axes** intersected by a **six-phase lifecycle method**. The axes are independent dimensions along which architectural artifacts are organized; the method is the time sequence in which architects move through them.

The framework is deliberately compact at the conceptual level — six layers, five input elements, eight quality pillars, six method phases — so that architects can hold the entire model in working memory while operating it.

## 3.1 The three axes

Each axis answers a different architectural question and contributes a different kind of artifact to the engagement record.

| Axis | Question answered | What it contributes |
| --- | --- | --- |
| **Axis 1 — Spine** | _How abstract is this decision?_ | Six layers from Strategy through Operational. Provides the abstraction hierarchy that turns business outcomes into deployable artifacts. |
| **Axis 2 — Inputs (CADRE)** | _What forces shape this design?_ | Five categories of design forces: **C**ontext, **A**ssumptions, **D**emands, **R**estrictions, **E**xposure. Provides the inputs that justify and constrain every decision. |
| **Axis 3 — Lens (8 Pillars)** | _How good is this design?_ | Eight quality attributes against which the design is scored. Provides the criteria for evaluating and comparing alternatives. |

## 3.2 The six-phase method

The method is the operational procedure that uses the three axes:

```
Frame → Capture → Compose → Calibrate → Commit → Continue
                                                     │
                                                     └─→ (loops back to Frame)
```

Continue feeds operational reality back into Frame. An engagement may loop through several **Compose → Calibrate** cycles before Commit. See [Section 7](07-six-phase-method.md) for phase detail.

## 3.3 Pluggable modules

Three module categories extend the core framework without modifying it:

| Module | Purpose | Reference |
| --- | --- | --- |
| **Compliance overlays** | Snap regional/sector regulations onto the framework | [Section 10](10-compliance-overlays.md) |
| **Pattern library** | Practice's accumulated knowledge of which patterns work where | [Section 11](11-pattern-library.md) |
| **Maturity model** | Five-level pillar scoring with engagement-weighted fitness | [Section 9](09-maturity-scoring.md) |

Each snaps onto the core framework; **engagements load only the modules relevant to their context**, keeping the working surface minimal.

## 3.4 How the pieces fit together

```
┌────────────────────────────────────────────────────────────────────────────┐
│                           MOSAIC FRAMEWORK                                 │
│                                                                            │
│    AXIS 1                 AXIS 2 (CADRE)                AXIS 3 (Lens)      │
│    SPINE                  Context                       Availability       │
│    L0 Strategy            Assumptions                   Performance        │
│    L1 Context             Demands                       Security           │
│    L2 Capability          Restrictions                  Operability        │
│    L3 Logical             Exposure                      Cost               │
│    L4 Physical                                          Sustainability     │
│    L5 Operational                                       Sovereignty        │
│                                                         Adaptability       │
│                                                                            │
│    ─────────────────────  THE METHOD  ────────────────────────────         │
│    Frame → Capture → Compose → Calibrate → Commit → Continue (loop)        │
│                                                                            │
│    ─────────────────────  PLUGGABLE MODULES  ─────────────────────         │
│    Compliance Overlays · Pattern Library · Maturity Model                  │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

A mental rule of thumb:

- **Spine** = where (which layer) you're working.
- **CADRE** = why this design and not another.
- **Lens** = how good the design is.
- **Method** = when each axis applies.
