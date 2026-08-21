# RCA: [SHORT TITLE]

**Date**: [DATE]
**Trigger**: [bug report / failing test / incident]
**Severity**: [blocker | major | minor]

## What happened
- **Observed**: [the wrong behavior]
- **Expected**: [what should have happened]

## Root cause
[The true underlying cause — the assumption or missing guardrail, not the symptom.]
Evidence: [`file:line`, log excerpt, commit]

## Why the AI layer allowed it
[Which rule/context was missing or misleading — the gap that let the mistake through.]

## Prevention (proposed)
- **Change type**: [CLAUDE.md hard rule | .claude/context/<topic>.md | skill/workflow]
- **Proposed edit**:
```diff
[the concrete diff to CLAUDE.md or the context module]
```
- **Why this is the right layer**: [general → CLAUDE.md; area-specific → context module; process → skill]

## Follow-ups
- [ ] [Fix the immediate bug]
- [ ] [Land the prevention edit as its own PR]
- [ ] [Backfill a test]
