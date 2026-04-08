# CreateBranch Workflow

Create feature branches from spec folders or user input.

## Workflow

### Step 1: Determine Branch Name

**From spec folder**: Extract from `specs/YYYYMMDD-feature-name/`
- Strip date prefix
- Use kebab-case
- Example: `specs/20260402-user-authentication/` -> `user-authentication`

**From user input**: Use provided name in kebab-case.

### Step 2: Check Current Branch

```bash
git branch --show-current
```

**Decision logic:**
- On main/staging/master -> create new branch
- On matching feature branch -> proceed (already on it)
- On different feature branch -> Use AskUserQuestion before switching:
  - Question: "You're currently on branch '{current-branch}'. Switch to create '{new-branch}'?"
  - Options: "Yes — switch and create branch", "No — stay on current branch"

### Step 3: Check for Uncommitted Changes

```bash
git status --porcelain
```

If uncommitted changes exist: Use AskUserQuestion to warn and offer options:
- Question: "You have uncommitted changes. How would you like to proceed?"
- Options: "Stash changes — stash and continue", "Commit first — commit before switching", "Cancel — abort branch creation"

### Step 4: Create Branch

```bash
git checkout -b {branch-name}
```

### Step 5: Report

```
## Branch Created

- Branch: {branch-name}
- From: {parent-branch}
- Spec: {spec-folder if applicable}
```
