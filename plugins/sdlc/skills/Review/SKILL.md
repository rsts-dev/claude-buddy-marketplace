---
name: Review
description: AI first-pass code review of the current diff or a GitHub PR — correctness and security — emitted as a single structured comment that augments (not replaces) the human reviewer. Can also install the PR-review GitHub Action. USE WHEN sdlc review, code review, review my changes, review this PR, ai review, security review of the diff, pre-PR review.
---

# Review

Give the human reviewer a running start: review the diff for correctness and security, and post one focused comment on what to look at. It is not a replacement for QA or a human reviewer — it sets the starting point and typically makes review meaningfully faster.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Review/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** + **LifeOS** installed (`test -f ~/.claude/LIFEOS/VERSION`).
2. A git repo with changes or a PR. GitHub integration via the GitHub MCP or the `gh` CLI (degrade to a printed comment if neither is present).

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **ReviewChanges** | Any `/sdlc:review` invocation | `Workflows/ReviewChanges.md` |

## Template

`Templates/ReviewComment.md` — the single structured comment shape.

## GitHub Action

`ReviewChanges` can optionally write `.github/workflows/claude-review.yml` so every PR is reviewed automatically (requires the repo to hold an auth token/secret). The action runs the same review on the PR diff and posts one comment.

## Output

One structured review comment (posted to the PR via MCP/`gh`, or printed).

## Examples

```
User: "/sdlc:review 42"
→ Fetches the diff for PR #42 (gh pr diff / GitHub MCP)
→ Reviews correctness + security
→ Posts a single structured comment: summary, findings by severity, what to check manually
```
