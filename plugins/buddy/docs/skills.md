# Buddy v5 Skills Reference

Complete reference for all 7 skills in the buddy plugin.

## Overview

| Skill | Workflows | Templates | Persona | Domain-Aware |
|-------|-----------|-----------|---------|--------------|
| SourceControl | 3 | — | Scribe | No |
| Foundation | 4 | — | — | Yes (owns domains) |
| Spec | 1 | 1 fallback | PO | Yes |
| Plan | 1 | 1 fallback | Architect (+Security, Performance, Frontend) | Yes |
| Tasks | 1 | 1 fallback | QA | Yes |
| Implementation | 1 | — | Context-dependent (per phase) | Yes |
| Docs | 1 | 1 fallback | Scribe | Yes |

---

## SourceControl

**Command**: `/buddy:commit`

**Description**: Git workflow automation including commits, branch management, and PR creation with conventional commits.

**Persona**: Scribe — loaded during commit message generation for professional writing quality.

### Workflows

#### Commit (`Workflows/Commit.md`)
- Parse arguments (mode, ticket reference)
- Verify repository state
- Stage changes (mode-aware prompting)
- Load Scribe persona
- Analyze diff (detect type, scope, intent)
- Generate conventional commit message
- Confirm and create commit
- Optionally push to remote

**Modes**:
- Default: "Y/n" prompts (Enter accepts)
- Auto-yes (`--yes`/`-y`): Non-interactive
- Interactive (`--interactive`/`-i`): Requires explicit "y"

**Format**: `[TICKET-REF: ]<type>(<scope>): <description>`

#### CreateBranch (`Workflows/CreateBranch.md`)
- Create feature branches from spec folders or user input

#### CreatePR (`Workflows/CreatePR.md`)
- Create pull requests via `gh` CLI with generated descriptions

---

## Foundation

**Command**: `/buddy:foundation`

**Description**: Create and maintain the project foundation document with automatic domain detection, persona system, and semantic versioning.

### Workflows

#### CreateFoundation (`Workflows/CreateFoundation.md`)
- Analyze codebase (structure, technologies, patterns)
- Run DetectDomain to identify technology stack
- Execute domain-specific analysis (`analyze.md`)
- Derive 3-7 core principles
- Create `/directive/foundation.md`

#### UpdateFoundation (`Workflows/UpdateFoundation.md`)
- Load existing foundation
- Apply user-requested changes
- Semantic versioning (MAJOR/MINOR/PATCH)
- Propagate changes to dependent artifacts
- Generate Sync Impact Report

#### DetectDomain (`Workflows/DetectDomain.md`)
- Scan built-in + user domain directories
- Evaluate detection rules with confidence scoring
- HIGH=90, MEDIUM=30, LOW=10 points; threshold=60
- Select best match (user domains take precedence)

#### CreateDomain (`Workflows/CreateDomain.md`)
- Interactive wizard for creating new domains
- Gathers technology stack details
- Generates profile.md, detect.md, analyze.md, 4 templates
- Stores in `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/`

### Sub-Systems

#### Domains (`Domains/`)
4 built-in domains (default, react, jhipster, mulesoft) + unlimited user domains.
Each domain contains: profile.md, detect.md, analyze.md, Templates/, Reference/

#### Personas (`Personas/`)
12 specialist personas loaded by downstream workflows:
architect, security, qa, frontend, backend, devops, performance, refactorer, analyzer, mentor, scribe, po

---

## Spec

**Command**: `/buddy:spec {feature-description}`

**Description**: Generate feature specifications from natural language descriptions.

**Persona**: PO (Product Owner) — loaded for requirement perspective, user stories, acceptance criteria.

### Workflow: GenerateSpec (`Workflows/GenerateSpec.md`)
1. Verify foundation exists
2. Select domain-specific template (user → built-in → fallback)
3. Load domain references tagged `Load When: Spec`
4. Load PO persona
5. Generate specification from feature description
6. Clarification cycle (resolve `[NEEDS CLARIFICATION]` markers)
7. Quality assurance
8. Write to `specs/[YYYYMMDD-slug]/spec.md`

**Output**: `specs/[YYYYMMDD-slug]/spec.md`

---

## Plan

**Command**: `/buddy:plan`

**Description**: Generate implementation plans from feature specifications.

**Persona**: Architect (primary) + Security/Performance/Frontend (contextual).

### Workflow: GeneratePlan (`Workflows/GeneratePlan.md`)
1. Verify foundation exists
2. Discover spec (folder with spec.md but no plan.md)
3. Load specification
4. Select domain-specific template
5. Load domain references tagged `Load When: Plan`
6. Load Architect persona (+ contextual personas based on spec content)
7. Generate plan (technical context, foundation checks, phases, testing, risks)
8. Clarification cycle
9. Write to `specs/[YYYYMMDD-slug]/plan.md`

**Output**: `specs/[YYYYMMDD-slug]/plan.md`

---

## Tasks

**Command**: `/buddy:tasks`

**Description**: Generate TDD-ordered task breakdowns from implementation plans.

**Persona**: QA — loaded for comprehensive test coverage and TDD methodology.

### Workflow: GenerateTasks (`Workflows/GenerateTasks.md`)
1. Verify foundation exists
2. Discover plan (folder with plan.md but no tasks.md)
3. Load ALL design documents (plan, spec, data-model, contracts, etc.)
4. Select domain-specific template
5. Load domain references tagged `Load When: Tasks`
6. Load QA persona
7. Generate TDD-ordered tasks across 5 phases
8. Clarification cycle
9. Write to `specs/[YYYYMMDD-slug]/tasks.md`

**Task Phases**:
- Phase 3.1 — Setup
- Phase 3.2 — Tests (TDD: must fail first)
- Phase 3.3 — Core Implementation (tests pass)
- Phase 3.4 — Integration
- Phase 3.5 — Polish

**Task Format**: `T{NNN} [P] Description` (P = parallel-safe)

**Output**: `specs/[YYYYMMDD-slug]/tasks.md`

---

## Implementation

**Command**: `/buddy:implement`

**Description**: Execute implementation tasks with TDD workflow, progress tracking, and domain-aware references.

**Persona**: Context-dependent per phase (devops, qa, frontend, backend, architect, security, performance, refactorer).

### Workflow: ExecuteTasks (`Workflows/ExecuteTasks.md`)
1. Verify foundation exists
2. Discover tasks.md
3. Load ALL design documents
4. Load domain references tagged `Load When: Implementation`
5. Load phase-appropriate personas
6. Parse tasks and build dependency graph
7. Execute phase-by-phase with checkpoints
8. Update task checkboxes after each task
9. Completion validation
10. Update status to "Completed"

**Phase-Persona Mapping**:
- Setup → DevOps
- Tests → QA
- Core → Frontend/Backend/Architect (by task type)
- Integration → Backend + Security
- Polish → Performance + Refactorer

---

## Docs

**Command**: `/buddy:docs`

**Description**: Generate comprehensive technical documentation from codebase analysis.

**Persona**: Scribe — loaded for professional documentation quality and style.

### Workflow: GenerateDocs (`Workflows/GenerateDocs.md`)
1. Verify foundation exists
2. Check existing docs/ (overwrite/merge/cancel)
3. Select domain-specific template
4. Load domain references tagged `Load When: Docs`
5. Load Scribe persona
6. Analyze codebase
7. Generate documentation files
8. Create navigation index (docs/README.md)
9. Quality assurance

**Output**: `docs/` directory with architecture.md, api-reference.md, setup.md, deployment.md, troubleshooting.md, README.md
