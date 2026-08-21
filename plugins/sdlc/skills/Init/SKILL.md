---
name: Init
description: Bootstrap the checked-in AI layer on a brownfield repo. Delegates the project foundation to buddy, then generates a lean CLAUDE.md (under 300 lines, every rule cited to real code), on-demand .claude/context/ modules, and an .mcp.json scaffold for Jira/Confluence/GitHub. USE WHEN sdlc init, init ai layer, set up ai layer, generate CLAUDE.md, create rules, bootstrap project, onboard repo, brownfield setup.
---

# Init

Turn an existing (brownfield) repository into an AI-native one by checking the **AI layer** into source control: rules (`CLAUDE.md`), on-demand context modules (`.claude/context/`), and tool configuration (`.mcp.json`). Init does not reinvent codebase analysis — it **delegates the foundation to buddy** and layers the AI-native artifacts on top.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Init/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** plugin installed (buddy requires **LifeOS**). LifeOS marker: `test -f ~/.claude/LIFEOS/VERSION`. If missing: "LifeOS is required. Run `/setup:lifeos`, then install the buddy plugin (`/plugin install buddy@claude-buddy-marketplace`)."
2. Run inside a git repository with real code (brownfield). For an empty repo, Init falls back to structured questions.
3. **MCP (recommended)**: Atlassian (Jira/Confluence) + GitHub servers. Optional at init time; `.mcp.json` is scaffolded for later.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **RunInit** | Any `/sdlc:init` invocation | `Workflows/RunInit.md` |

## What it produces

| Artifact | Path | Owner |
|----------|------|-------|
| Project foundation | `/directive/foundation.md` | buddy Foundation (delegated) |
| Global rules | `CLAUDE.md` (repo root, < 300 lines) | Init |
| Context modules | `.claude/context/*.md` | Init |
| MCP config scaffold | `.mcp.json` | Init (if absent) |

## Core principle

Every rule in `CLAUDE.md` must trace to something real in the codebase — cite it (`file:line`). Do not invent aspirational rules the code does not follow. Global rules are only for what applies to basically every task; anything task-specific belongs in a `.claude/context/` module, not the global file (context rot is real — keep `CLAUDE.md` lean).

## Examples

**Example 1: fresh brownfield init**
```
User: "/sdlc:init"
→ Confirms buddy + LifeOS present
→ Runs /buddy:foundation (detects domain, writes /directive/foundation.md)
→ Analyzes the code, derives a lean CLAUDE.md (< 300 lines, rules cited to file:line)
→ Writes .claude/context/{architecture,testing,...}.md for task-specific detail
→ Scaffolds .mcp.json (Atlassian + GitHub) if not present
→ Presents everything for human review before committing
```

## Source

Modeled on Cole Medin's `create-rules` from the ai-native-starter-pack, layered on buddy's Foundation.
