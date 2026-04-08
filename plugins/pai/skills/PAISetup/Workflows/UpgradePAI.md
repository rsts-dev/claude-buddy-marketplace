# UpgradePAI Workflow

Upgrade an existing PAI installation. Merges new files without overwriting user customizations, updates the PAI release, and re-creates symlinks.

## Variables

```
PAI_REPO: https://github.com/danielmiessler/Personal_AI_Infrastructure.git
BUDDY_DIR: ~/.buddy
MEMORY_DIR: ~/.buddy/MEMORY
PAI_USER_DIR: ~/.buddy/PAI-USER
CLAUDE_DIR: ~/.claude
VERSION_FILE: ~/.buddy/.pai-version
```

## Instructions

- Never overwrite user-customized files
- Only add new files from newer releases
- Always backup before modifying ~/.claude
- Re-create symlinks after copying new release
- Use AskUserQuestion at decision points

## Workflow

### Phase A: Detect & Compare Versions

#### Step 1: Check Prerequisites

1. Verify `git` is available:
```bash
which git
```
If not found, report error and exit.

#### Step 2: Read Current Version

1. Read the installed version:
```bash
cat ~/.buddy/.pai-version 2>/dev/null || echo "unknown"
```
Store as CURRENT_VERSION.

2. Report: "Current PAI version: {CURRENT_VERSION}"

#### Step 3: Clone & Detect Latest

1. Create temp directory:
```bash
mktemp -d
```

2. Clone the repository:
```bash
git clone --depth 1 {PAI_REPO} {TEMP_DIR}/pai
```

3. Find latest version:
```bash
ls {TEMP_DIR}/pai/Releases/ | grep '^v[0-9]' | sed 's/v//' | sort -t. -k1,1n -k2,2n -k3,3n | tail -1
```
Prepend `v` to get LATEST_VERSION.

#### Step 4: Compare Versions

1. **If CURRENT_VERSION == LATEST_VERSION**:
   - Report: "Already up to date (version {CURRENT_VERSION})"
   - Use AskUserQuestion:
     ```
     Question: "You're already on the latest version. What would you like to do?"
     Options:
     - Re-run customization — Update your identity files
     - Force reinstall — Reinstall the current version
     - Cancel — Nothing to do
     ```
   - If "Re-run customization": Read and execute `Workflows/CustomizeIdentity.md`, then exit.
   - If "Force reinstall": Continue with Phase B.
   - If "Cancel": Clean up temp dir and exit.

2. **If LATEST_VERSION > CURRENT_VERSION**:
   - Report: "Update available: {CURRENT_VERSION} -> {LATEST_VERSION}"
   - Continue with Phase B.

### Phase B: Merge ~/.buddy User Data (Non-Destructive)

#### Step 5: Merge MEMORY Files

1. For each file in the new release's MEMORY directory:
```bash
# Find files in new release that don't exist locally
cd {TEMP_DIR}/pai/Releases/{LATEST_VERSION}/.claude/MEMORY
find . -type f | while read f; do
  if [ ! -f ~/.buddy/MEMORY/"$f" ]; then
    mkdir -p ~/.buddy/MEMORY/"$(dirname "$f")"
    cp "$f" ~/.buddy/MEMORY/"$f"
    echo "Added: MEMORY/$f"
  fi
done
```

Count and report: "MEMORY: Added N new files"

#### Step 6: Merge PAI-USER Files

1. For each file and directory in the new release's PAI/USER directory:
```bash
cd {TEMP_DIR}/pai/Releases/{LATEST_VERSION}/.claude/PAI/USER
find . -type f | while read f; do
  if [ ! -f ~/.buddy/PAI-USER/"$f" ]; then
    mkdir -p ~/.buddy/PAI-USER/"$(dirname "$f")"
    cp "$f" ~/.buddy/PAI-USER/"$f"
    echo "Added: PAI-USER/$f"
  fi
done
```

2. Count added vs skipped files.

3. Report: "PAI-USER: Added N new files, skipped M existing files (your customizations preserved)"

#### Step 7: Update Version

```bash
echo "{LATEST_VERSION}" > ~/.buddy/.pai-version
```

### Phase C: Upgrade PAI Installation

#### Step 8: Backup ~/.claude

```bash
cp -r ~/.claude ~/.claude-backup-$(date +%Y%m%d)
```
Report: "Backed up ~/.claude to ~/.claude-backup-{date}"

#### Step 9: Copy New Release

```bash
cp -r {TEMP_DIR}/pai/Releases/{LATEST_VERSION}/.claude ~/
```

#### Step 10: Re-Create Symlinks

The `cp` command overwrites the symlinks. Re-create them:

```bash
rm -rf ~/.claude/MEMORY
ln -s ~/.buddy/MEMORY ~/.claude/MEMORY

rm -rf ~/.claude/PAI/USER
ln -s ~/.buddy/PAI-USER ~/.claude/PAI/USER
```

#### Step 11: Run PAI Installer

```bash
cd ~/.claude && bun run PAI-Install/main.ts --mode cli
```

#### Step 12: Rebuild CLAUDE.md

```bash
bun ~/.claude/PAI/Tools/BuildCLAUDE.ts
```

If `bun` is not found, report: "Could not rebuild CLAUDE.md. You may need to run: bun ~/.claude/PAI/Tools/BuildCLAUDE.ts"

### Phase D: Cleanup & Verify

#### Step 13: Cleanup

```bash
rm -rf {TEMP_DIR}
```

#### Step 14: Verify

Read and execute `Workflows/VerifyInstallation.md`

### Phase E: Optional Customization

#### Step 15: Offer Customization

Use AskUserQuestion:

```
Question: "Upgrade complete. Would you like to customize your identity files?"
Options:
- Customize new files only — Only set up files that don't have content yet
- Customize all files — Review and update all identity files
- Skip — Keep current customizations
```

- If "new files only": Read and execute `Workflows/CustomizeIdentity.md` with `mode=new_only`
- If "all files": Read and execute `Workflows/CustomizeIdentity.md` with `mode=all`
- If "Skip": Exit.

## Report

```
## PAI Upgrade Complete

**Previous Version**: {CURRENT_VERSION}
**New Version**: {LATEST_VERSION}
**User Data**: ~/.buddy/ (preserved)
**Backup**: ~/.claude-backup-{date}

### Changes
- MEMORY: Added {N} new files
- PAI-USER: Added {N} new files, preserved {M} existing customizations
- PAI installation updated at ~/.claude/
- Symlinks re-created

### Symlinks
  - ~/.claude/MEMORY -> ~/.buddy/MEMORY
  - ~/.claude/PAI/USER -> ~/.buddy/PAI-USER

### Next Steps
1. Restart your Claude Code session for changes to take effect
```
