# SDLC Plugin — Tactical AI-Native Development

[< Back to Marketplace](../../README.md) | [Marketplace Docs](../../docs/README.md)

A lean, practical plugin for going **AI-native on brownfield projects**, built around Cole Medin's **R-PIV loop** (Research → Plan → Implement → Validate). It is a **complement to [buddy](../buddy/)** — it reuses buddy's Foundation and adds a checked-in AI layer plus real integration with **Jira/Confluence** (epics → stories → tasks) and **GitHub** (source control + AI PR review) via MCP.

> **Dependency chain:** `sdlc` → `buddy` → LifeOS (installed via the `setup` plugin). sdlc leans on buddy; buddy requires LifeOS.

## Philosophy

Going AI-native isn't a better model — it's a **checked-in AI layer** (rules, skills, MCP config) plus a repeatable **research → plan → implement → validate** loop that keeps a human in the gates. Your number one job with a coding agent is to **reduce its assumptions**. Live at "level 3": the agent writes the code; you own planning and validation.

## What It Does

The 9 commands map to the loop end to end:

| Command | Step | What it does |
|---------|------|--------------|
| `/sdlc:init` | setup | Runs buddy Foundation, then generates a lean `CLAUDE.md` (<300 lines, rules cited to `file:line`), `.claude/context/` modules, and an `.mcp.json` scaffold |
| `/sdlc:prime` | **R**esearch | Loads a Jira issue / Confluence page via MCP and explores the codebase → priming report |
| `/sdlc:spec` | decompose | Slices an epic/PRD into PIV-sized vertical-slice stories; publishes to Confluence; creates Jira stories (idempotent) |
| `/sdlc:plan` | **P**lan | Grills you to reduce assumptions, then writes a context-rich handoff plan |
| `/sdlc:implement` | **I**mplement | Executes strictly from the approved plan in a fresh context (delegates to buddy's TDD) |
| `/sdlc:validate` | **V**alidate | Runs the project's tests, lint, type-check, and build; reports honestly |
| `/sdlc:review` | quality | AI first-pass review of the diff/PR (correctness + security) as one comment |
| `/sdlc:commit` | ship | Conventional commit + push + GitHub PR linking the Jira ticket |
| `/sdlc:rca` | evolve | Root-causes a bug and proposes the rule/context that would have prevented it |

## Prerequisites

- **buddy** plugin — `/plugin install buddy@claude-buddy-marketplace` (provides Foundation + TDD implementation)
- **LifeOS** — `/setup:lifeos` (buddy requires it)
- **git** + **gh** CLI — for source control and PRs
- **MCP servers (recommended)** — Atlassian (Jira/Confluence) and GitHub. See [integrations](docs/integrations.md). Everything degrades gracefully to `gh`/manual when a server is absent.

## Usage

```
# one-time, per repo
/sdlc:init

# per ticket — the R-PIV loop
/sdlc:prime ABC-123
/sdlc:plan ABC-123
/sdlc:implement abc-123-slug
/sdlc:validate
/sdlc:review
/sdlc:commit ABC-123

# scaling & evolution
/sdlc:spec ABC-100        # epic → stories in Jira/Confluence
/sdlc:rca "the migration ran twice"
```

## How it complements buddy

buddy is the full workflow platform (Foundation, domains, personas, spec/plan/tasks/implement/docs). sdlc is the **tactical loop on top**: it delegates foundation and TDD execution to buddy, and adds what buddy doesn't — external Jira/Confluence/GitHub integration, priming/research, assumption-reducing planning, explicit validation, AI PR review, and the bug→rule feedback loop. Use both together.

## Documentation

- [Architecture](docs/architecture.md) — the R-PIV loop, layering on buddy, artifact map
- [Workflows](docs/workflows.md) — per-command detail
- [Integrations](docs/integrations.md) — MCP setup for Jira/Confluence/GitHub, graceful degradation

## Source

Modeled on Cole Medin's "Ultimate Guide to AI-Native Development" and the [`coleam00/ai-native-starter-pack`](https://github.com/coleam00/ai-native-starter-pack) template.
