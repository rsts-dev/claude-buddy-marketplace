---
name: Spec
description: Decompose an epic or PRD into PIV-sized, vertical-slice stories with a dependency graph and execution waves, write the breakdown locally, publish it to Confluence, and create the missing Jira stories under the epic (idempotent). USE WHEN sdlc spec, decompose epic, slice epic, break down epic, epic to stories, create jira stories, ticket breakdown, spec from prd, plan epic.
---

# Spec

Bridge strategy and execution: turn an epic/PRD into discrete, assignable stories, each executable in a single Plan→Implement→Validate cycle. This complements buddy's Spec skill (which writes a single local feature spec from a description) by working from — and back to — Jira/Confluence.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Spec/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** + **LifeOS** installed (`test -f ~/.claude/LIFEOS/VERSION`).
2. Foundation at `/directive/foundation.md` (run `/sdlc:init` if missing).
3. **MCP (recommended)**: Atlassian server to read the epic/PRD and write stories back. Without it, work from a local PRD file and skip the publish/create steps (report them as skipped).

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **DecomposeEpic** | Any `/sdlc:spec` invocation | `Workflows/DecomposeEpic.md` |

## Template

`Templates/EpicBreakdown.md` — the local breakdown document shape.

## Output

- `specs/<epic-slug>/breakdown.md` (buddy-style `specs/` layout)
- A Confluence child page: "Spec: <epic name> — Ticket Breakdown" (if source was Confluence)
- Jira **Stories** created under the epic for any missing tickets (idempotent)

## Story sizing

Each story is one coherent **vertical slice** (not a horizontal layer), produces roughly a 500–700 line plan, runs in a single PIV cycle, touches distinct files, and has its own clear acceptance criteria — so slices can run in parallel worktrees where dependencies allow.

## Examples

```
User: "/sdlc:spec ABC-100"           (a Jira epic)
→ Reads the epic + linked PRD (Confluence) via MCP
→ Slices into vertical-slice stories with a dependency graph + waves
→ Writes specs/abc-100-<slug>/breakdown.md
→ Publishes a Confluence child page
→ Creates only the missing Stories under ABC-100 (no duplicates)
```
