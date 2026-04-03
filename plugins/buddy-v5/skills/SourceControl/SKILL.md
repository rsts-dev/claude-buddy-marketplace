---
name: SourceControl
description: Git workflow automation including commits, branch management, and PR creation with conventional commits and clean commit rules. USE WHEN commit, git commit, create branch, pull request, PR, push, git workflow, conventional commit, stage changes, commit message.
---

# SourceControl

Professional git workflow automation with conventional commits, mode-aware interaction, ticket reference parsing, and clean commit rules.

## Customization

**Before executing, check for user customizations at:**
`~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/SourceControl/`

If this directory exists, load and apply any PREFERENCES.md configurations (commit templates, branch naming conventions, protected branches). If not, proceed with defaults.

## Prerequisites

PAI must be installed. Check `~/.buddy/.pai-version`. If missing, inform user: "PAI is required. Run `/pai:pai-setup` to install."

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **Commit** | "commit", default invocation, git changes | `Workflows/Commit.md` |
| **CreateBranch** | "branch", "create branch", spec folder ref | `Workflows/CreateBranch.md` |
| **CreatePR** | "PR", "pull request", "create PR" | `Workflows/CreatePR.md` |

## Auto-Detection

Default invocation routes to **Commit** workflow.

## Configuration

The skill reads configuration from `.claude/hooks.json` (config section) when available:
- `config.git.auto_push` — Auto-push after commit
- `config.git.branch_protection` — Protected branches list
- `config.git.conventional_commits` — Enforce conventional format
- `config.git.sign_commits` — GPG signing

## Examples

**Example 1: Simple commit**
```
User: "/buddy:commit"
-> Detects changes, stages, generates conventional commit message
-> Prompts for confirmation (default mode: Y/n/e)
-> Creates commit, offers to push
```

**Example 2: Commit with ticket reference**
```
User: "/buddy:commit SDO-123 --yes"
-> Auto-yes mode, stages all changes
-> Generates: "SDO-123: feat(auth): add JWT validation"
-> Commits and pushes automatically
```

**Example 3: Create pull request**
```
User: "/buddy:commit PR"
-> Routes to CreatePR workflow
-> Ensures changes committed, generates PR description
-> Creates PR via gh CLI, returns URL
```
