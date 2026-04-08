# Commit Workflow

Complete git commit workflow with conventional commits, mode-aware interaction, and clean commit rules.

## Variables

```
INTERACTION_MODE: default | auto-yes (--yes/-y) | interactive (--interactive/-i)
TICKET_REF: Optional Jira (SDO-123) or GitHub (#10) reference
PERSONAS_DIR: skills/Foundation/Personas/
```

## Instructions

- Parse user arguments for mode, ticket reference, and flags
- Follow mode-aware prompting throughout
- Generate clean conventional commit messages (no AI attribution)
- Verify git repository state before any operations

## Workflow

### Step 1: Parse Arguments

Parse user input to detect:
- **Mode**: `--yes`/`-y` (auto-yes), `--interactive`/`-i` (interactive), no flags (default)
- **Ticket reference**: Jira format (SDO-123, PROJ-456) or GitHub format (#10, #123)

Display: "Running in [mode] mode..."

### Step 2: Verify Repository

1. Check we're in a git repo:
```bash
git rev-parse --git-dir
```
If not: Report "Not in a git repository" and exit.

2. Check for changes:
```bash
git status --porcelain
```
If no changes: Report "Nothing to commit" and exit.

3. Check current branch:
```bash
git branch --show-current
```
If on main/master/staging: Warn "On protected branch. Consider creating a feature branch."

### Step 3: Stage Changes

Based on mode:
- **Auto-yes**: Stage automatically: `git add .`
- **Default/Interactive**: Use AskUserQuestion to confirm staging:
  - Question: "Stage all changes?"
  - Options: "Yes — stage all changes (Recommended)", "No — cancel"

Show staged changes summary:
```bash
git diff --cached --stat
```

### Step 3.5: Load Persona

Load the **Scribe** persona for professional commit message generation:
1. Read `skills/Foundation/Personas/scribe/persona.md`
2. Apply the scribe's writing principles: clarity, conciseness, professional tone
3. Use the scribe's commit message conventions for type selection and description quality

### Step 4: Analyze Changes

Apply the Scribe persona perspective while reading the full diff for commit message generation:
```bash
git diff --cached
```

Analyze:
- What type of change (feat, fix, docs, refactor, etc.)
- What functional area (scope): auth, api, ui, database, config
- What was the primary intent

### Step 5: Generate Commit Message

Format: `[TICKET-REF: ]<type>(<scope>): <description>`

**Commit Types**: feat, fix, docs, style, refactor, perf, test, chore

**Scope Rules**:
- DO use functional areas: api, ui, auth, database, config, docs, tests
- DO use component names: user, payment, dashboard, settings
- DO NOT use "buddy" or tool names as scope

**Description**: Max 50 characters, imperative mood, no period

If TICKET_REF provided, prepend: `SDO-123: feat(auth): add JWT validation`

### Step 6: Confirm Commit

Based on mode:
- **Auto-yes**: Proceed automatically
- **Default/Interactive**: Use AskUserQuestion to confirm the commit message:
  - Question: "Proceed with commit message?"
  - Options: "Yes (Recommended)" with description showing the commit message, "Edit" to provide a different message

### Step 7: Create Commit

Execute using HEREDOC for proper formatting:
```bash
git commit -m "$(cat <<'EOF'
{commit message}
EOF
)"
```

### Step 8: Push to Remote

1. Check remote tracking:
```bash
git rev-parse --abbrev-ref @{upstream} 2>/dev/null
```

2. Based on mode:
   - **Auto-yes**: Push automatically
   - **Default/Interactive**: Use AskUserQuestion to confirm push:
     - Question: "Push to origin/{branch}?"
     - Options: "Yes — push now (Recommended)", "No — skip push"

3. Execute:
   - If tracking exists: `git push origin {branch}`
   - If first push: `git push -u origin {branch}`

### Step 9: Report

```
## Commit Complete

- Commit: {hash} {message}
- Branch: {branch}
- Push: {pushed/not pushed}
```

## Clean Commit Rules (CRITICAL)

Every commit message MUST be completely free of AI references:

**NEVER include:**
- "Generated with Claude Code"
- "Co-Authored-By: Claude"
- Any AI tool references or generation indicators

**ALWAYS produce:**
- Clean, human-style commit messages
- Professional conventional commit format
- Focus only on actual code changes

## Error Handling

- **Not in git repo**: Stop, inform user
- **No changes**: Stop, inform user
- **Protected branch**: Warn, suggest feature branch
- **Merge conflict**: Suggest resolving conflicts first
- **Push failure**: Report error, provide manual push command
