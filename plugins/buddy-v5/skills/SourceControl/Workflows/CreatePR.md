# CreatePR Workflow

Create pull requests via gh CLI with generated descriptions.

## Prerequisites

- `gh` CLI must be available
- All changes must be committed
- Branch must be pushed to remote

## Workflow

### Step 1: Verify State

1. Ensure all changes committed:
```bash
git status --porcelain
```
If uncommitted changes: "Please commit changes first."

2. Check current branch and base:
```bash
git branch --show-current
git log origin/main..HEAD --oneline
```

3. Ensure pushed to remote:
```bash
git push -u origin $(git branch --show-current)
```

### Step 2: Analyze Changes

Read commit log for PR description:
```bash
git log origin/main..HEAD --format="%s%n%b"
git diff origin/main..HEAD --stat
```

### Step 3: Generate PR Description

Build description from commits and changes:

```markdown
## Summary
[Brief description from commit messages]

## Changes Made
- [Feature/change 1]
- [Feature/change 2]

## Testing
- [Test coverage description]
- All tests passing

## Related
- Spec: @specs/[spec-folder]/ (if applicable)
- Issue: [TICKET-REF] (if applicable)
```

### Step 4: Create PR

```bash
gh pr create --title "{title}" --body "$(cat <<'EOF'
{body}
EOF
)"
```

### Step 5: Report

```
## Pull Request Created

- PR: {url}
- Title: {title}
- Branch: {branch} -> main
```
