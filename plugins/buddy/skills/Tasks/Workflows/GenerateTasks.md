# GenerateTasks Workflow

Generate a TDD-ordered task breakdown from an implementation plan.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
SPECS_DIR: specs/
BUILTIN_DOMAINS_DIR: skills/Foundation/Domains/
USER_DOMAINS_DIR: ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/
PERSONAS_DIR: skills/Foundation/Personas/
```

## Workflow

### Step 1: Verify Prerequisites

1. Check foundation exists. If missing: guide to `/buddy:foundation`.
2. Load foundation, extract type.

### Step 2: Discover Plan

1. Scan `specs/` for folders with `plan.md` but no `tasks.md`
2. If none: "No plans need task breakdown. Run `/buddy:plan` first." Exit.
3. If one: proceed
4. If multiple: ask user
5. If user provided identifier: locate matching folder

### Step 3: Load ALL Design Documents

**Required:**
- `specs/[slug]/plan.md` — tech stack, phases, testing strategy
- `specs/[slug]/spec.md` — requirements, user stories, acceptance criteria

**Optional (load if they exist):**
- `data-model.md` — entities, relationships
- `contracts/` — API endpoint files
- `research.md` — technical decisions
- `quickstart.md` — test scenarios
- `api-specification.raml` or `*.yaml` (MuleSoft)
- `dataweave/mappings.md` (MuleSoft)
- `jdl-model.jdl` (JHipster)
- `frontend-design.md` (JHipster)
- Any other `.md` files in the spec folder

### Step 4: Select Template

Resolve the template dynamically using the foundation type. Check user domains first (higher priority), then built-in:

1. **Try user domain template**: Read `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{foundation-type}/Templates/Tasks.md`
2. **Try built-in domain template**: Read `skills/Foundation/Domains/{foundation-type}/Templates/Tasks.md`
3. **Fallback**: If neither found, read `Templates/DefaultTasks.md`

### Step 5: Load Domain References (if applicable)

If a domain was matched in Step 4, load its profile from the same location (user or built-in):
1. Read `{matched-domain-path}/profile.md`
2. Check the **Reference Materials** table for files tagged with `Load When: Tasks`
3. Load any matching reference files for task structure guidance

### Step 5.5: Load Persona

Load the **QA** persona to ensure comprehensive test coverage:
1. Read `skills/Foundation/Personas/qa/persona.md`
2. Apply the QA persona's testing strategy: test pyramid, quality gates, coverage analysis
3. Ensure TDD ordering follows the persona's test-first methodology

### Step 6: Generate Tasks

Apply the QA persona perspective to create TDD-ordered tasks by category:

**Phase 3.1 — Setup**: Project initialization, dependencies, configuration
**Phase 3.2 — Tests (TDD)**: Contract tests, integration tests (MUST come before implementation)
**Phase 3.3 — Core**: Models, services, API implementations
**Phase 3.4 — Integration**: Database, middleware, external services
**Phase 3.5 — Polish**: Unit tests for edge cases, performance, documentation

**Task format**: `[ID] [P?] Description`
- Sequential numbering: T001, T002, T003...
- `[P]` marker for parallel tasks (different files, no dependencies)
- Each task includes exact file path
- Tests MUST come before implementation (TDD)

### Step 7: Generate Supporting Sections

- **Dependencies graph**: Task relationships
- **Parallel execution examples**: How to run [P] tasks together
- **Validation checklist**: Completeness verification

### Step 8: Clarification Cycle

Scan for `[NEEDS CLARIFICATION]` markers, resolve with user.

### Step 9: Quality Assurance

Validate:
- All API endpoints have corresponding tests
- All entities/models have creation tasks
- All design documents covered
- Tests come before implementation
- Parallel tasks are truly independent
- Each task has exact file path
- Numbering is sequential and correct

### Step 10: Write Tasks

Write to: `specs/[slug]/tasks.md`

### Step 11: Report

```
## Tasks Created

- Path: specs/{slug}/tasks.md
- Total tasks: {count}
- Parallel tasks: {count with [P]}
- Phases: Setup ({n}), Tests ({n}), Core ({n}), Integration ({n}), Polish ({n})
- Domain: {foundation-type}
- Template: {domain template path or fallback}
- Next: Run `/buddy:implement` to execute tasks
```
