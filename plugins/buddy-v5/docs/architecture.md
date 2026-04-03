# Buddy v5 Architecture

## Design Principles

1. **PAI-Native**: Depends on PAI infrastructure for execution, customization, and agent orchestration
2. **Skill-per-Feature**: Each development lifecycle stage is a single, focused skill
3. **Workflow-Driven**: Heavy logic lives in Workflow files, not skill definitions
4. **Domain-Extensible**: Technology-specific knowledge is modular and auto-discovered
5. **Persona-Enhanced**: Expert perspectives loaded on-demand during workflow execution
6. **Template-Cascading**: Three-level template resolution (user domain → built-in domain → fallback)

## System Architecture

```
                    ┌─────────────────────────────────────────────┐
                    │           Commands Layer (7)                │
                    │  commit, foundation, spec, plan, tasks,     │
                    │  implement, docs                            │
                    └──────────────────┬──────────────────────────┘
                                       │
                    ┌──────────────────▼──────────────────────────┐
                    │            Skills Layer (7)                  │
                    │                                              │
                    │  SourceControl ─── Workflows/               │
                    │  Foundation ────── Workflows/ + Domains/    │
                    │                    + Personas/               │
                    │  Spec ──────────── Workflows/ + Templates/  │
                    │  Plan ──────────── Workflows/ + Templates/  │
                    │  Tasks ─────────── Workflows/ + Templates/  │
                    │  Implementation ── Workflows/               │
                    │  Docs ──────────── Workflows/ + Templates/  │
                    └──────────────────┬──────────────────────────┘
                                       │
            ┌──────────────────────────┼──────────────────────────┐
            │                          │                          │
  ┌─────────▼─────────┐   ┌──────────▼──────────┐   ┌──────────▼──────────┐
  │   Domain System   │   │   Persona System    │   │  Template System    │
  │                    │   │                     │   │                     │
  │  Built-in (4):     │   │  12 Specialists:   │   │  Resolution:        │
  │  default, react,   │   │  architect, qa,    │   │  1. User domain     │
  │  jhipster, mulesoft│   │  security, scribe, │   │  2. Built-in domain │
  │                    │   │  frontend, backend, │   │  3. Default fallback│
  │  User domains:     │   │  devops, perf,     │   │                     │
  │  ~/.buddy/PAI-USER/│   │  refactorer, po,   │   │  Per-skill:         │
  │  SKILLCUSTOMIZATIONS│  │  analyzer, mentor  │   │  Spec, Plan, Tasks, │
  │  /Foundation/      │   │                     │   │  Docs               │
  │  Domains/          │   │                     │   │                     │
  └────────────────────┘   └─────────────────────┘   └─────────────────────┘
            │                          │
  ┌─────────▼─────────┐   ┌──────────▼──────────┐
  │  Detection Engine │   │  Persona Loading    │
  │                    │   │                     │
  │  File patterns    │   │  Spec → PO          │
  │  Manifest checks  │   │  Plan → Architect   │
  │  Directory scans  │   │  Tasks → QA         │
  │  Confidence score │   │  Commit → Scribe    │
  │  (HIGH=90,MED=30) │   │  Docs → Scribe      │
  │  Threshold: 60    │   │  Impl → per-phase   │
  └────────────────────┘   └─────────────────────┘
```

## Data Flow

### Development Lifecycle

```
/directive/foundation.md              ← Foundation skill creates this
        │
        ▼
specs/[YYYYMMDD-slug]/
  ├── spec.md                         ← Spec skill creates this
  ├── plan.md                         ← Plan skill creates this
  ├── tasks.md                        ← Tasks skill creates this
  ├── research.md (optional)          ← Plan generates if needed
  ├── data-model.md (optional)        ← Plan generates if needed
  └── contracts/ (optional)           ← Plan generates if needed
        │
        ▼
[Source Code]                         ← Implementation skill executes tasks
        │
        ▼
[Git Commit]                          ← SourceControl skill commits
        │
        ▼
docs/                                 ← Docs skill generates
  ├── README.md
  ├── architecture.md
  ├── api-reference.md
  ├── setup.md
  ├── deployment.md
  └── troubleshooting.md
```

### Template Resolution Flow

```
Foundation Type extracted from /directive/foundation.md
        │
        ▼
Check ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{type}/Templates/{Skill}.md
        │
        ├─ Found → Use user domain template
        │
        └─ Not found → Check skills/Foundation/Domains/{type}/Templates/{Skill}.md
                │
                ├─ Found → Use built-in domain template
                │
                └─ Not found → Use skills/{Skill}/Templates/Default{Skill}.md
```

### Domain Detection Flow

```
DetectDomain Workflow
        │
        ├─ Scan ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/*/
        ├─ Scan skills/Foundation/Domains/*/
        │
        ▼
For each domain: read detect.md
        │
        ├─ File Pattern checks (test -f, find)
        ├─ Manifest checks (grep in pom.xml, package.json, etc.)
        ├─ Directory Structure checks (test -d)
        │
        ▼
Calculate confidence scores
        │
        ├─ HIGH match = 90 points
        ├─ MEDIUM match = 30 points
        ├─ LOW match = 10 points
        │
        ▼
Select domain with highest score >= 60 threshold
        │
        ├─ Tie → Use priority from profile.md
        └─ None → Use "default" domain
```

## Dependency Graph

```
PAI Infrastructure (required)
        │
        ▼
Foundation Skill (must run first)
        │
        ├─ Creates /directive/foundation.md
        ├─ Detects domain (type key)
        │
        ▼
Spec Skill (requires foundation)
        │
        ├─ Uses foundation type for template selection
        ├─ Creates specs/[slug]/spec.md
        │
        ▼
Plan Skill (requires foundation + spec)
        │
        ├─ Uses foundation type for template selection
        ├─ Creates specs/[slug]/plan.md
        │
        ▼
Tasks Skill (requires foundation + plan)
        │
        ├─ Uses foundation type for template selection
        ├─ Creates specs/[slug]/tasks.md
        │
        ▼
Implementation Skill (requires foundation + tasks)
        │
        ├─ Executes tasks in TDD order
        ├─ Updates tasks.md checkboxes
        │
        ▼
SourceControl Skill (independent — can run anytime)
        │
        ├─ Creates commits, branches, PRs
        │
        ▼
Docs Skill (requires foundation — can run anytime after)
        │
        └─ Generates documentation from codebase
```

## Key Architectural Decisions

### 1. Skills Over Agents
v5 consolidated v4's skills + agents + generators into single skills with workflows. This reduced 20+ skills to 7, eliminating indirection and making the system easier to reason about.

### 2. Domains in Foundation
Technology-specific knowledge lives inside Foundation rather than as separate domain skills. This centralizes detection, analysis, and template ownership in one place.

### 3. Personas as Loadable Definitions
Rather than standalone skills that auto-activate, personas are loaded by workflows at specific steps. This gives workflows control over which expert perspective to apply and when.

### 4. Template Cascade
Three-level template resolution (user → built-in → fallback) enables customization without modifying the plugin. User domains override built-in ones by name.

### 5. Declarative Domain Detection
Domains use confidence-scored detection rules (HIGH=90, MEDIUM=30, LOW=10) with a threshold of 60. This prevents false positives while allowing single-file detection for definitive markers.
