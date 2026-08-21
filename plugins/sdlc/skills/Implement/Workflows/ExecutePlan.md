# ExecutePlan Workflow

Implement strictly from an approved plan, delegating to buddy's TDD execution when a task list exists.

## Variables

```
SPECS_DIR: specs/
ARGS: $ARGUMENTS   # spec slug or path to plan.md
```

## Instructions

- Build only what the plan specifies. If reality contradicts the plan, STOP and return to `/sdlc:plan` — do not improvise scope.
- Keep the human gate: this step writes code, but the user reviews (via `/sdlc:validate` and `/sdlc:review`) before shipping.

## Workflow

### Step 1: Load the plan

1. Resolve the slug/path; read `specs/<slug>/plan.md`. If missing: "No approved plan. Run `/sdlc:plan` first." Stop.
2. Load only the context the plan marks as mandatory reading (the plan is meant to be sufficient).

### Step 2: Choose execution mode

1. If `specs/<slug>/tasks.md` exists or the plan enumerates discrete tasks:
   - Delegate to buddy's Implementation skill (`ExecuteTasks`) for the TDD red-green-refactor cycle. Read and execute buddy's `skills/Implementation/Workflows/ExecuteTasks.md`.
2. Otherwise execute the plan's step-by-step tasks directly, in dependency order.

### Step 3: Execute

For each task/step:
- Apply the action (CREATE/UPDATE/MIRROR/DELETE) per the plan.
- Follow the codebase patterns cited in the plan and `CLAUDE.md`.
- Update the checkbox in place (`- [ ]` → `- [X]`) in `tasks.md` / the plan.
- On a blocking ambiguity or contradiction, stop and ask (AskUserQuestion) rather than assuming.

### Step 4: Hand off to validation

Do not declare done. Point the user at `/sdlc:validate`, then `/sdlc:review`.

## Report

```
## Implementation Progress — {slug}

- Mode: {buddy TDD ExecuteTasks | direct}
- Tasks complete: {done}/{total}
- Files changed: {list}
- Blocked/assumed: {none | details}

Next: `/sdlc:validate` then `/sdlc:review`
```
