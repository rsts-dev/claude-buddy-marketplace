# GeneratePlan Workflow

Generate an implementation plan from an existing feature specification.

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

1. Check foundation exists. If missing: "Run `/buddy:foundation` first." Exit.
2. Load foundation, extract type.

### Step 2: Discover Spec

1. Scan `specs/` for folders with `spec.md` but no `plan.md`
2. If none: "No specs need planning. Run `/buddy:spec` first." Exit.
3. If one: proceed with that folder
4. If multiple: list them and ask user which to plan
5. If user provided identifier in arguments: locate matching folder

### Step 3: Load Specification

Read `specs/[YYYYMMDD-slug]/spec.md` and extract:
- Feature requirements and user stories
- Functional and non-functional requirements
- Success and acceptance criteria
- Technical constraints and dependencies

### Step 4: Select Template

Resolve the template dynamically using the foundation type. Check user domains first (higher priority), then built-in:

1. **Try user domain template**: Read `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{foundation-type}/Templates/Plan.md`
2. **Try built-in domain template**: Read `skills/Foundation/Domains/{foundation-type}/Templates/Plan.md`
3. **Fallback**: If neither found, read `Templates/DefaultPlan.md`

### Step 5: Load Domain References (if applicable)

If a domain was matched in Step 4, load its profile from the same location (user or built-in):
1. Read `{matched-domain-path}/profile.md`
2. Check the **Reference Materials** table for files tagged with `Load When: Plan`
3. Load any matching reference files for architecture and pattern guidance

### Step 5.5: Load Personas

Load the **Architect** persona for design decisions:
1. Read `skills/Foundation/Personas/architect/persona.md`
2. Apply systems thinking, future-proofing, and dependency management principles
3. Use the architect's evaluation criteria (maintainability, scalability, flexibility)

Optionally load additional personas based on spec content:
- If spec mentions security requirements: also load `skills/Foundation/Personas/security/persona.md`
- If spec mentions performance targets: also load `skills/Foundation/Personas/performance/persona.md`
- If spec is frontend-heavy: also load `skills/Foundation/Personas/frontend/persona.md`

### Step 6: Generate Plan

Apply the Architect persona perspective while transforming the specification into a complete implementation plan:
- Define technical context (runtime, frameworks, tools, deployment)
- Document foundation compliance checks
- Define project structure and file organization
- Outline implementation phases with gates and deliverables
- Identify research needs and technical unknowns
- Plan testing strategy (unit, integration, contract)
- Define risk mitigation
- Mark unclear aspects with `[NEEDS CLARIFICATION: ...]`

### Step 7: Clarification Cycle

Same pattern as GenerateSpec: scan markers, present questions, update, change status.

### Step 8: Quality Assurance

Verify all sections filled, markers resolved, consistency, technical accuracy, alignment with foundation and spec.

### Step 9: Write Plan

Write to: `specs/[YYYYMMDD-slug]/plan.md`

### Step 10: Report

```
## Plan Created

- Path: specs/{slug}/plan.md
- Spec: specs/{slug}/spec.md
- Status: {Draft|Ready for Review}
- Domain: {foundation-type}
- Template: {domain template path or fallback}
- Next: Run `/buddy:tasks` to generate task breakdown
```
