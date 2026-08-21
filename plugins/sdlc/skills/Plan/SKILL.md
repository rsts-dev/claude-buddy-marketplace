---
name: Plan
description: The Plan step of R-PIV. Turn one story/ticket into a context-rich handoff plan for a fresh implementing agent, grilling the user first to reduce the agent's assumptions. Produces a reviewable plan artifact, not code. USE WHEN sdlc plan, plan feature, plan a ticket, create implementation plan, handoff plan, reduce assumptions, grill me, plan before implement.
---

# Plan

Spend the effort *before* a line of code is written. The plan is a handoff document: it carries the user story, the files to touch, the new files to create, the step-by-step tasks, and the validation strategy — everything a brand-new agent needs to implement in one pass. Your number one job is to **reduce the agent's assumptions**, so the plan starts by interviewing you.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Plan/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** + **LifeOS** installed (`test -f ~/.claude/LIFEOS/VERSION`).
2. Foundation at `/directive/foundation.md` (run `/sdlc:init` if missing).
3. Recommended: run `/sdlc:prime <ticket>` first so the plan is grounded in loaded context.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **PlanFeature** | Any `/sdlc:plan` invocation | `Workflows/PlanFeature.md` |

## Output

`specs/<slug>/plan.md` (buddy-style `specs/` layout). Reuses buddy's Plan template structure where present.

## Level 3 discipline

The agent will do the coding; you own the plan and validation. Keep the human gate here: the plan is a reviewable artifact (another engineer can read it before tokens are spent building).

## Examples

```
User: "/sdlc:plan ABC-123"
→ Loads primed context (or primes now)
→ Interviews the user via AskUserQuestion to close gaps (each answer = one fewer assumption)
→ Writes specs/<slug>/plan.md: story, files to touch, new files, atomic tasks, tests, validation commands, acceptance criteria
→ Stops for human review before implementation
```
