# DecomposeEpic Workflow

Slice an epic/PRD into PIV-sized vertical-slice stories, document the breakdown, publish it to Confluence, and create the missing Jira stories.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
SPECS_DIR: specs/
TEMPLATE: Templates/EpicBreakdown.md
ARGS: $ARGUMENTS   # Jira epic key, Confluence page id, or local PRD path
```

## Instructions

- The PRD/epic is the source of truth; on conflict it wins over cross-referenced material.
- Idempotent: never recreate a Jira story that already exists under the epic.
- Prefer Atlassian MCP; degrade to local-only and report skipped external steps.

## Workflow

### Step 1: Load the source of truth

1. Determine the input type from `$ARGUMENTS`: Jira epic key, Confluence page id, or local file.
2. Fetch it:
   - **Confluence page id** → fetch page body (markdown) via Atlassian MCP.
   - **Jira epic key** → fetch the epic and any linked PRD page as supplementary context.
   - **Local path** → read the file.
3. Load `/directive/foundation.md` for stack/conventions context.

### Step 2: Slice into vertical-slice stories

Break the epic into stories where each:
- is one coherent vertical slice (end-to-end, not a horizontal layer),
- fits ~500–700 lines of plan and one PIV cycle,
- touches distinct files, and
- has its own acceptance criteria.

### Step 3: Map dependencies

Identify which stories can run in parallel vs. sequentially. Produce a dependency graph and suggested execution **waves** (wave 1 = no dependencies, etc.).

### Step 4: Write the local breakdown

1. Slugify the epic name; compute `specs/<epic-slug>/`.
```bash
mkdir -p specs/<epic-slug>
```
2. Write `specs/<epic-slug>/breakdown.md` from `Templates/EpicBreakdown.md`: story titles, scope, file estimates, dependencies, acceptance criteria, and the dependency graph + waves.

### Step 5: Publish to Confluence (if source was Confluence/Jira and MCP present)

Create or update a child page "Spec: <epic name> — Ticket Breakdown" in the same space as the source, mirroring the breakdown. Update in place if it already exists.

### Step 6: Create Jira stories (if a Jira epic key was supplied and MCP present)

1. Query existing child issues of the epic.
2. Create **only the missing** stories as `Story` issues under the epic (match by title). Never duplicate.
3. Record the created/skipped keys.

### Step 7: Report

## Report

```
## Epic Decomposition — {epic}

- Source: {Jira epic | Confluence page | local PRD}
- Local: specs/{epic-slug}/breakdown.md
- Stories: {N} ({list of titles})
- Waves: {wave summary}
- Confluence: {child page url | skipped (no MCP)}
- Jira: created {keys} | skipped existing {keys} | skipped (no MCP)

Next: `/sdlc:plan <story-key>` for a wave-1 story.
```
