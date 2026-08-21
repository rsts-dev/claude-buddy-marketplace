# CommitAndPR Workflow

Create a conventional commit, push, and open a GitHub PR linking the Jira ticket.

## Variables

```
ARGS: $ARGUMENTS   # optional --yes/-y and a ticket ref (ABC-123, #10)
```

## Instructions

- Confirm before pushing/opening a PR unless `--yes`/`-y` was passed.
- Never commit secrets or unrelated changes; review `git status` first.

## Workflow

### Step 1: Inspect state

```bash
git status --short
git branch --show-current
git diff --stat
```
Parse `$ARGUMENTS` for a ticket ref and interaction mode.

### Step 2: Commit

1. If the buddy plugin is present, delegate to its SourceControl `Commit` workflow for message formatting + clean-commit rules (read `../../../buddy/skills/SourceControl/Workflows/Commit.md` conceptually, or invoke `/buddy:commit`).
2. Otherwise craft a conventional commit yourself: `type(scope): summary (TICKET)` where type ∈ feat|fix|docs|refactor|test|chore. Body: what & why; footer: `Refs: TICKET`.
3. Stage intended files and commit.

### Step 3: Push

```bash
git push -u origin $(git branch --show-current)
```

### Step 4: Open the PR

Prefer the GitHub MCP "create pull request" tool; else `gh`:
```bash
gh pr create --fill --title "<type>: <summary> (TICKET)" --body "<summary>\n\nRefs: TICKET"
```
If neither is available, print the exact `gh pr create` command for the user.

### Step 5: Link the ticket

Ensure the PR body references the Jira ticket (and the Jira ticket references the PR if the Atlassian MCP is available). Trigger `/sdlc:review` on the PR if desired.

## Report

```
## Committed & PR opened — {ticket}

- Commit: {sha} "{message}"
- Branch: {branch} (pushed)
- PR: {url | printed command}
- Linked ticket: {TICKET}

Next: `/sdlc:review {pr}` (or the PR-review Action runs automatically).
```
