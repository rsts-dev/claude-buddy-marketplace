# RunInit Workflow

Bootstrap the AI layer on a brownfield repo: delegate the foundation to buddy, then generate a lean `CLAUDE.md`, `.claude/context/` modules, and an `.mcp.json` scaffold.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
CLAUDE_MD: CLAUDE.md
CONTEXT_DIR: .claude/context
MCP_CONFIG: .mcp.json
LIFEOS_MARKER: ~/.claude/LIFEOS/VERSION
CLAUDE_MD_TEMPLATE: Templates/ClaudeMd.md
CONTEXT_TEMPLATE: Templates/ContextModule.md
```

## Instructions

- Additive and non-destructive: never overwrite an existing `CLAUDE.md`, `.claude/context/` module, or `.mcp.json` without showing a diff and getting confirmation.
- Every rule cites real code (`file:line`). Do not invent rules.
- Keep `CLAUDE.md` under 300 lines. Push task-specific detail to context modules.

## Workflow

### Step 1: Verify prerequisites

1. LifeOS installed:
```bash
test -f ~/.claude/LIFEOS/VERSION || echo NO_LIFEOS
```
If `NO_LIFEOS`: "LifeOS is required. Run `/setup:lifeos`, then install the buddy plugin." Stop.

2. Confirm this is a git repo:
```bash
git rev-parse --is-inside-work-tree 2>/dev/null || echo NOT_GIT
```

### Step 2: Delegate the foundation to buddy

1. If `/directive/foundation.md` does not exist, run buddy's Foundation:
   - Read and execute buddy's Foundation skill (`/buddy:foundation`) to detect the domain, analyze the codebase, and write `/directive/foundation.md`.
   - If the buddy plugin is not installed, tell the user: "This step needs the buddy plugin. Install `/plugin install buddy@claude-buddy-marketplace`." Offer to continue with a lightweight self-analysis instead.
2. Load `/directive/foundation.md` and extract the `Foundation Type`, Technology Stack, and Core Principles — reuse them below.

### Step 3: Analyze the codebase for rules

Inspect the real code so every rule is grounded:
```bash
git ls-files | head -200
cat package.json 2>/dev/null || cat pom.xml 2>/dev/null || cat pyproject.toml 2>/dev/null || cat go.mod 2>/dev/null
```
Identify: entry points, naming conventions, core code patterns, error handling, auth, testing approach, and the actual build/test/lint/type-check commands. Note both intended and legacy patterns. Cite specific files and lines for each observation.

### Step 4: Draft a lean CLAUDE.md

Using `Templates/ClaudeMd.md`, draft `CLAUDE.md` (descending generality):
- Project one-liner
- Naming conventions (cited)
- Core code patterns (cited)
- Build & validation commands (the real ones)
- On-demand context table (points at `.claude/context/*.md`)
- Hard rules (general constraints only)
- Gotchas / miscellaneous

Keep it under 300 lines. Anything that is only *sometimes* relevant goes to a context module, not here.

### Step 5: Write on-demand context modules

For each topic that is important but not universal (architecture, auth, testing, risky/legacy patterns), create `.claude/context/<topic>.md` from `Templates/ContextModule.md`. Each module: purpose, when to load, the concrete detail with `file:line` citations. Register each in the CLAUDE.md on-demand context table.

### Step 6: Scaffold .mcp.json

If `.mcp.json` is absent, scaffold it for the tools this workflow expects — Atlassian (Jira/Confluence) and GitHub — with placeholders and a comment telling the user to fill credentials. If it exists, leave it and just report what servers are configured. (See `docs/integrations.md`.)

### Step 7: Human review

Present the derived `CLAUDE.md` and each context module with their code citations. Invite corrections before anything is committed. Do not auto-commit.

## Report

```
## AI Layer Initialized

- Foundation: /directive/foundation.md (Foundation Type: {type}) — via buddy
- Rules: CLAUDE.md ({N} lines; cap 300)
- Context modules: .claude/context/{list}
- MCP: .mcp.json {scaffolded | already present: servers=...}

### Review
Every rule cites file:line. Please review before committing.

### Next
- `/sdlc:prime <ticket>` to research a task
- `/sdlc:spec <epic>` to decompose an epic into stories
```
