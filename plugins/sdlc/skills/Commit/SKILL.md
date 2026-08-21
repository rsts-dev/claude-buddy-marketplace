---
name: Commit
description: Create a conventional-format commit, push, and open a GitHub PR that links the Jira ticket. GitHub is the source of record. Reuses buddy's SourceControl for commit formatting when available. USE WHEN sdlc commit, commit, create commit, open PR, push and PR, ship it, create pull request, link jira ticket.
---

# Commit

Ship the change through GitHub: a clean conventional commit, a push, and a PR that references the Jira ticket so the work traces end to end. Keep the human gate — commit after validation and review, not before.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Commit/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** + **LifeOS** installed (`test -f ~/.claude/LIFEOS/VERSION`).
2. `git` and the `gh` CLI (or the GitHub MCP). Without either, Commit makes the local commit and prints the PR command for the user to run.
3. Recommended: `/sdlc:validate` green and `/sdlc:review` addressed first.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **CommitAndPR** | Any `/sdlc:commit` invocation | `Workflows/CommitAndPR.md` |

## Delegation

For commit-message crafting and clean-commit rules, reuse buddy's SourceControl skill (its `Commit` workflow) when the buddy plugin is present; sdlc adds the push + GitHub PR + Jira linkage.

## Output

A git commit, a pushed branch, and a GitHub PR linking the ticket.

## Examples

```
User: "/sdlc:commit ABC-123"
→ Stages + writes a conventional commit (feat/fix/…): "feat: … (ABC-123)"
→ Pushes the branch
→ Opens a PR via gh; body links ABC-123 and summarizes the change
```
