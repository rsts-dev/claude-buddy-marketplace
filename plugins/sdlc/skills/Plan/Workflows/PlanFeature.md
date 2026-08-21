# PlanFeature Workflow

Produce a context-rich, reviewable handoff plan for one story/ticket, after reducing assumptions via a structured interview.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
SPECS_DIR: specs/
ARGS: $ARGUMENTS   # Jira story key, spec slug, or feature description
```

## Instructions

- Do NOT write implementation code in this workflow — the output is a plan.
- Context is king: the plan must contain everything a fresh agent needs for one-pass success (patterns, mandatory reading, validation commands, gotchas, and `file:line` references).

## Workflow

### Step 1: Gather context

1. If a priming report exists (`specs/<slug>/research.md`) or was just produced, use it. Otherwise run the Prime workflow inline (read `../Prime/Workflows/PrimeContext.md`) for the ticket.
2. Load `/directive/foundation.md`, `CLAUDE.md`, and any `.claude/context/*.md` relevant to the area.

### Step 2: Understand the feature

Extract the core problem, the user value, and the complexity. Analyze the codebase structure, existing patterns, dependencies, tests, and integration points the change will hit. Do external research only where a library/version detail is load-bearing.

### Step 3: Reduce assumptions (the grill)

1. List every assumption you would otherwise make (scope, edge cases, data validation, error behavior, roles/permissions, performance, UX).
2. Present them to the user with **AskUserQuestion** (batch the easy ones; slow down where a wrong turn is likely). Each answer removes one assumption from the plan.
3. Fold the answers into the plan. If major gaps remain, ask again rather than guessing.

### Step 4: Write the plan

Create `specs/<slug>/plan.md`. If a buddy Plan template exists for this foundation type, mirror its structure; otherwise use this shape:
- **User story & problem statement**
- **Context references** — files to read (with `file:line`), patterns to mirror (with short code excerpts), docs/links
- **Files to touch** and **new files to create**
- **Step-by-step tasks** — atomic, dependency-ordered, with action keywords (CREATE, UPDATE, MIRROR, DELETE)
- **Testing strategy** — unit, integration, edge cases, E2E
- **Validation commands** — the exact commands `/sdlc:validate` will run
- **Acceptance criteria** + a completion checklist

### Step 5: Human review gate

Present the plan for review. Do not proceed to implementation automatically. When approved, point the user at `/sdlc:implement <slug>` (a fresh agent).

## Report

```
## Plan Ready — {ticket/slug}

- Path: specs/{slug}/plan.md
- Assumptions resolved: {count}
- Files to touch: {n}; new files: {n}
- Validation: {commands}

Review the plan, then hand it to a fresh agent: `/sdlc:implement {slug}`
```
