---
name: Rca
description: Root-cause a bug or failure, then propose the rule or context module that would have prevented it — every bug improves the checked-in AI layer. Produces an RCA report plus a concrete edit to CLAUDE.md or .claude/context/. USE WHEN sdlc rca, root cause analysis, why did this break, post-mortem, bug to rule, improve the ai layer, prevent this next time, system review.
---

# Rca

When the agent (or the code) produces something off, don't just fix it and move on — ask what in the AI layer let it happen. The output is a root-cause analysis *and* a proposed change to the rules/context so the system compounds instead of repeating mistakes. Improvements ship as PRs, the same review process as code.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Rca/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** + **LifeOS** installed (`test -f ~/.claude/LIFEOS/VERSION`).
2. An AI layer to improve: `CLAUDE.md` and/or `.claude/context/` (run `/sdlc:init` if absent).

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **RootCauseToRule** | Any `/sdlc:rca` invocation | `Workflows/RootCauseToRule.md` |

## Template

`Templates/RcaReport.md` — the RCA report shape.

## Output

- `docs/rca/<slug>.md` — the analysis
- A proposed edit (diff) to `CLAUDE.md` or a `.claude/context/` module — presented for review, not auto-applied

## Examples

```
User: "/sdlc:rca the migration ran twice and duplicated rows"
→ Traces the root cause (idempotency assumption not enforced)
→ Writes docs/rca/duplicate-migration.md
→ Proposes a CLAUDE.md hard rule + a .claude/context/migrations.md note, for review
```
