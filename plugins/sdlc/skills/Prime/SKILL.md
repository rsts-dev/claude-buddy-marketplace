---
name: Prime
description: The Research step of R-PIV. Load external task context (a Jira issue and/or Confluence page) via MCP, then explore the codebase to see how the work fits, producing a scanning-friendly priming report before any planning. USE WHEN sdlc prime, prime, research a ticket, load context, prime context, understand this codebase, pull jira issue, read confluence page before planning.
---

# Prime

Establish shared understanding before planning: pull the ticket and docs, map the codebase, and report *what needs doing* and *how the code is organized*. Priming a fresh session first is the discipline that keeps later steps grounded.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Prime/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** + **LifeOS** installed (`test -f ~/.claude/LIFEOS/VERSION`).
2. Foundation at `/directive/foundation.md` (run `/sdlc:init` if missing). `CLAUDE.md` is read if present.
3. **MCP (recommended)**: Atlassian server for Jira/Confluence. Without it, paste the ticket text or pass a local file; Prime degrades gracefully and says so.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **PrimeContext** | Any `/sdlc:prime` invocation | `Workflows/PrimeContext.md` |

## Output

A priming report (to the conversation). Optionally persisted to `specs/<slug>/research.md` when a spec folder exists.

## Examples

```
User: "/sdlc:prime ABC-123"
→ Fetches Jira ABC-123 (summary, description, acceptance criteria) via Atlassian MCP
→ Follows any linked Confluence page
→ Maps the codebase (git ls-files, entry points, recent commits, foundation, CLAUDE.md)
→ Reports task context + tech stack + where the work lands + open questions
```
