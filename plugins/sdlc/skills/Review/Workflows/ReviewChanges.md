# ReviewChanges Workflow

Review the current diff or a GitHub PR and emit one structured comment.

## Variables

```
TEMPLATE: Templates/ReviewComment.md
ARGS: $ARGUMENTS   # optional PR number or branch; default = working diff
```

## Instructions

- One comment, not line noise. Prioritize correctness and security.
- Augment the human reviewer; call out what a person should verify manually.

## Workflow

### Step 1: Get the diff

1. If `$ARGUMENTS` names a PR number: `gh pr diff <n>` (or the GitHub MCP "get pull request diff" tool).
2. Else review the working/branch diff:
```bash
git diff --stat
git diff
```

### Step 2: Review

Assess the diff against `CLAUDE.md` rules and the relevant `.claude/context/` modules:
- **Correctness** — logic errors, missed edge cases, broken contracts, missing tests for new behavior.
- **Security** — injection, authz/authn gaps, secret handling, unsafe deserialization, input validation.
- **Consistency** — deviations from documented patterns/conventions (cite the rule).
Rank findings by severity (blocker / major / minor / nit).

### Step 3: Emit one comment

Fill `Templates/ReviewComment.md`: a one-paragraph summary, findings grouped by severity with `file:line`, and a short "verify manually" list. Post it:
- GitHub MCP or `gh pr comment <n> --body-file -` when a PR is in play, else print it.

### Step 4 (optional): Install the PR-review Action

If the user asks, write `.github/workflows/claude-review.yml` that runs this review on every PR and posts one comment (note it needs an auth secret configured in the repo).

## Report

```
## Review — {PR/branch}

- Findings: {blocker}/{major}/{minor}/{nit}
- Comment: {posted to PR #n | printed}
- Manual checks suggested: {short list}

Next: address blockers, re-run `/sdlc:validate`, then `/sdlc:commit`.
```
