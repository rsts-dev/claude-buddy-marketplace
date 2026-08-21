# RootCauseToRule Workflow

Diagnose a failure and turn it into a durable improvement to the AI layer.

## Variables

```
RCA_DIR: docs/rca
CLAUDE_MD: CLAUDE.md
CONTEXT_DIR: .claude/context
TEMPLATE: Templates/RcaReport.md
ARGS: $ARGUMENTS   # description of the bug / failing behavior
```

## Instructions

- Fix-and-forget is not the goal. The deliverable is a prevention: a rule or context change.
- Propose edits; do not silently apply them — they go through review like code.

## Workflow

### Step 1: Establish what happened

From `$ARGUMENTS` and the repo (logs, failing test, diff, recent commits), state the observed behavior vs. expected behavior precisely.

### Step 2: Trace the root cause

Work back to the true cause (not the surface symptom): the assumption, missing guardrail, or unstated convention that allowed it. Cite the code (`file:line`).

### Step 3: Ask "what in the AI layer would have prevented this?"

Decide the smallest durable change:
- A **hard rule** in `CLAUDE.md` (only if it applies to basically every task — keep the file lean), or
- A **context module** addition in `.claude/context/<topic>.md` (for area-specific detail), or
- A **skill/workflow** tweak (if the process, not the code, was the gap).

### Step 4: Write the RCA report

Create `docs/rca/<slug>.md` from `Templates/RcaReport.md`.

### Step 5: Propose the edit

Present a concrete diff for the chosen rule/context change for the user to review. If accepted, it is committed (via `/sdlc:commit`) as its own PR.

## Report

```
## RCA — {slug}

- Symptom: {what broke}
- Root cause: {the real cause, cited}
- Prevention: {CLAUDE.md rule | .claude/context/{topic}.md | skill change}
- Report: docs/rca/{slug}.md
- Proposed edit: {shown for review}

Next: review the proposed rule, then `/sdlc:commit` it as its own PR.
```
