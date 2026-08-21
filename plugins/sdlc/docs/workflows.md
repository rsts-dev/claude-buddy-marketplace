# SDLC Plugin Workflows Reference

[< Back to SDLC README](../README.md) | [All Docs](../../../docs/README.md)

Per-command detail. Each skill routes to a single workflow (`## Variables` / `## Workflow` / `## Report`).

## Overview

| Command | Skill | Workflow | Reuses buddy |
|---------|-------|----------|--------------|
| `/sdlc:init` | Init | `RunInit` | Foundation |
| `/sdlc:prime` | Prime | `PrimeContext` | — |
| `/sdlc:spec` | Spec | `DecomposeEpic` | — (complements buddy Spec) |
| `/sdlc:plan` | Plan | `PlanFeature` | Plan template (if present) |
| `/sdlc:implement` | Implement | `ExecutePlan` | Implementation (TDD ExecuteTasks) |
| `/sdlc:validate` | Validate | `RunValidation` | — |
| `/sdlc:review` | Review | `ReviewChanges` | — |
| `/sdlc:commit` | Commit | `CommitAndPR` | SourceControl (Commit) |
| `/sdlc:rca` | Rca | `RootCauseToRule` | — |

---

## init — RunInit
Verify LifeOS + git → delegate foundation to buddy (`/directive/foundation.md`) → analyze code and draft a lean `CLAUDE.md` (rules cited to `file:line`) → write `.claude/context/*.md` modules → scaffold `.mcp.json` → present for human review. Non-destructive; never overwrites without a diff + confirmation.

## prime — PrimeContext (Research)
Load external context (Jira issue + Confluence page via Atlassian MCP; degrade to pasted text/local file) → explore the codebase (git ls-files, recent commits, entry points, foundation, CLAUDE.md) → emit a scanning-friendly report with task context, where it lands, and open questions. Optionally persists `specs/<slug>/research.md`.

## spec — DecomposeEpic
Load the epic/PRD (Confluence/Jira/local; PRD wins on conflict) → slice into vertical-slice stories (~500–700-line plans, one PIV cycle each, distinct files, own AC) → map dependencies into execution waves → write `specs/<epic-slug>/breakdown.md` → publish a Confluence child page → create only the missing Jira stories under the epic (idempotent).

## plan — PlanFeature (Plan)
Gather primed context → understand the feature → **reduce assumptions** by interviewing the user (AskUserQuestion) → write a context-rich handoff plan at `specs/<slug>/plan.md` (story, files to touch, new files, atomic tasks, testing strategy, validation commands, acceptance criteria) → stop at the human-review gate. No code is written here.

## implement — ExecutePlan (Implement)
Load the approved plan in a fresh context → if tasks exist, delegate to buddy's Implementation (`ExecuteTasks`, TDD red-green-refactor), else execute plan steps directly → update checkboxes in place → stop on ambiguity rather than assuming → hand off to validation. Build only what the plan specifies.

## validate — RunValidation (Validate)
Discover the real commands from `CLAUDE.md`/foundation → run test, lint, type-check, build → report PASS/FAIL per level with verbatim failure output and `file:line`. Never claims success without evidence.

## review — ReviewChanges
Get the diff (`gh pr diff <n>` / GitHub MCP, or the working diff) → review correctness + security against `CLAUDE.md` rules and context modules → emit one structured comment ranked by severity → optionally install `.github/workflows/claude-review.yml` for automatic per-PR review. Augments, never replaces, human review.

## commit — CommitAndPR
Inspect state → craft a conventional commit (delegating message rules to buddy SourceControl when present) → push → open a GitHub PR (GitHub MCP or `gh`) linking the Jira ticket → optionally cross-link in Jira. Confirms before pushing unless `--yes`.

## rca — RootCauseToRule
Establish observed vs. expected → trace the true root cause (cited) → ask "what in the AI layer would have prevented this?" → write `docs/rca/<slug>.md` → propose a concrete edit to `CLAUDE.md` (only if universal) or a `.claude/context/` module (area-specific), for review. Every bug compounds into a durable improvement.
