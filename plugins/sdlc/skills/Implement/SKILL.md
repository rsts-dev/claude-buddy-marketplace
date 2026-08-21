---
name: Implement
description: The Implement step of R-PIV. Execute strictly from an approved plan in a fresh context, delegating to buddy's TDD implementation when a tasks list exists. Build only what the plan specifies; if it drifts, stop and return to planning. USE WHEN sdlc implement, execute plan, build from plan, implement ticket, execute tasks, code the plan.
---

# Implement

Hand the plan to a **fresh agent** and build. The planning conversation may have burned a lot of tokens; a clean context implements from the plan alone and stays sharp. Build exactly what the plan says — no scope creep.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Implement/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** + **LifeOS** installed (`test -f ~/.claude/LIFEOS/VERSION`).
2. An approved plan at `specs/<slug>/plan.md` (run `/sdlc:plan` first).

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **ExecutePlan** | Any `/sdlc:implement` invocation | `Workflows/ExecutePlan.md` |

## Delegation

If the plan (or a sibling `tasks.md`) defines discrete tasks, delegate to buddy's Implementation skill (`ExecuteTasks`, TDD red-green-refactor) to run them. Otherwise execute the plan's step-by-step tasks directly. Either way, update task checkboxes in place.

## Output

Source code changes; updated `specs/<slug>/tasks.md` checkboxes.

## Examples

```
User: "/sdlc:implement abc-123-user-auth"
→ Loads specs/abc-123-user-auth/plan.md (fresh context)
→ Executes tasks in dependency order (delegating to buddy TDD if tasks.md exists)
→ Marks each task done; stops on ambiguity rather than assuming
→ Points the user at `/sdlc:validate`
```
