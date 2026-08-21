# PrimeContext Workflow

Load external + codebase context for a task and produce a priming report.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
CLAUDE_MD: CLAUDE.md
ARGS: $ARGUMENTS   # Jira key, Confluence page id, or free text
```

## Instructions

- Read-only. Do not modify code during priming.
- Prefer MCP tools; if absent, degrade to `gh`/manual and state the limitation.

## Workflow

### Step 1: Load external task context

1. If `$ARGUMENTS` contains a Jira issue key (e.g. `ABC-123`):
   - Use the Atlassian MCP tools (discover via ToolSearch: "jira issue get") to fetch summary, description, acceptance criteria, status, and linked pages.
2. If it contains a Confluence page id (numeric) or the Jira issue links one:
   - Fetch the page body as markdown via the Atlassian MCP.
3. If no MCP is available: ask the user to paste the ticket/AC or pass a local file path; continue with that. Note the degraded mode in the report.

### Step 2: Explore the codebase

```bash
git ls-files | head -200
git log --oneline -10
git status --short
```
Read foundational docs (`CLAUDE.md`, `README.md`, `/directive/foundation.md`, any `.claude/context/*.md` relevant to the ticket). Identify entry points, configs, schemas, and the core services the ticket touches.

### Step 3: Synthesize

Assemble a scanning-friendly report:
- **Task context** — what the ticket asks; acceptance criteria (from Jira/Confluence)
- **Project purpose & tech stack** — from the foundation
- **Where it lands** — the files/modules likely involved (paths)
- **Conventions & tests** — how this area is built and tested
- **Current focus** — recent commits, active branch, working-tree state
- **Open questions** — assumptions to resolve in `/sdlc:plan`

### Step 4: Optionally persist

If a `specs/<slug>/` folder exists for this work, offer to write the report to `specs/<slug>/research.md`.

## Report

```
## Priming Report — {ticket or focus}

### Task
{summary + acceptance criteria; source: Jira/Confluence/manual}

### Stack & purpose
{from foundation}

### Where it lands
{paths / modules}

### Conventions & tests
{how this area works}

### Current state
{recent commits, branch, status}

### Open questions
- {assumption to resolve before planning}

Next: `/sdlc:plan {ticket}`
```
