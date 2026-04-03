# InstallPAI Workflow

Fresh installation of PAI with persistent user data at `~/.buddy/` and symlinked integration.

## Variables

```
PAI_REPO: https://github.com/danielmiessler/Personal_AI_Infrastructure.git
BUDDY_DIR: ~/.buddy
MEMORY_DIR: ~/.buddy/MEMORY
PAI_USER_DIR: ~/.buddy/PAI-USER
CLAUDE_DIR: ~/.claude
```

## Instructions

- Use AskUserQuestion at each decision point
- Handle errors gracefully with clear messages
- Clean up temp files on failure
- Never overwrite existing user data without confirmation

## Workflow

### Phase A: Prerequisites & Detection

#### Step 1: Check Prerequisites

1. Verify `git` is available:
```bash
which git
```
If not found, report: "Git is required but not installed. Please install Git and try again." and exit.

2. Verify `curl` is available:
```bash
which curl
```
If not found, report: "curl is required but not installed." and exit.

#### Step 2: Check for Existing Installation

1. Check if `~/.buddy/.pai-version` exists:
```bash
test -f ~/.buddy/.pai-version && cat ~/.buddy/.pai-version
```

2. **If version file exists**: This is an upgrade, not a fresh install. Report to user: "Existing PAI installation detected (version X). Routing to upgrade workflow." Then read and execute `Workflows/UpgradePAI.md` instead. **Stop this workflow.**

3. **If no version file**: Continue with fresh install.

### Phase B: Clone & Detect Latest Version

#### Step 3: Clone PAI Repository

1. Create temp directory:
```bash
mktemp -d
```
Store the result as TEMP_DIR.

2. Inform user: "Cloning PAI repository..."

3. Clone the repository:
```bash
git clone --depth 1 {PAI_REPO} {TEMP_DIR}/pai
```

4. If clone fails, report: "Failed to clone PAI repository. Check your network connection." Clean up temp dir and exit.

#### Step 4: Detect Latest Version

1. List version folders and find the latest:
```bash
ls {TEMP_DIR}/pai/Releases/ | grep '^v[0-9]' | sed 's/v//' | sort -t. -k1,1n -k2,2n -k3,3n | tail -1
```
Prepend `v` to get the full version string. Store as LATEST_VERSION.

2. Validate the release has the expected structure:
```bash
test -d "{TEMP_DIR}/pai/Releases/{LATEST_VERSION}/.claude/MEMORY" && test -d "{TEMP_DIR}/pai/Releases/{LATEST_VERSION}/.claude/PAI/USER"
```
If not found, report: "Release {LATEST_VERSION} does not have the expected structure. Cannot proceed." and exit.

3. Report to user: "Found PAI version {LATEST_VERSION}"

### Phase C: Setup ~/.buddy (Persistent User Data)

#### Step 5: Create ~/.buddy Structure

1. Create directories:
```bash
mkdir -p ~/.buddy/MEMORY
mkdir -p ~/.buddy/PAI-USER
```

#### Step 6: Copy User Data Files

1. Copy MEMORY files:
```bash
cp -r {TEMP_DIR}/pai/Releases/{LATEST_VERSION}/.claude/MEMORY/* ~/.buddy/MEMORY/
```

2. Copy PAI/USER files (flatten PAI/USER to PAI-USER):
```bash
cp -r {TEMP_DIR}/pai/Releases/{LATEST_VERSION}/.claude/PAI/USER/* ~/.buddy/PAI-USER/
```

3. Write version file:
```bash
echo "{LATEST_VERSION}" > ~/.buddy/.pai-version
```

### Phase D: Full PAI Installation

#### Step 7: Backup Existing ~/.claude

1. Check if `~/.claude` exists:
```bash
test -d ~/.claude
```

2. If exists, create backup:
```bash
cp -r ~/.claude ~/.claude-backup-$(date +%Y%m%d)
```
Report: "Backed up existing ~/.claude to ~/.claude-backup-{date}"

#### Step 8: Copy Release to ~/.claude

1. Copy the release:
```bash
cp -r {TEMP_DIR}/pai/Releases/{LATEST_VERSION}/.claude ~/
```

#### Step 9: Create Symlinks

Replace the copied MEMORY and PAI/USER directories with symlinks to `~/.buddy`:

1. Remove the copied MEMORY directory and create symlink:
```bash
rm -rf ~/.claude/MEMORY
ln -s ~/.buddy/MEMORY ~/.claude/MEMORY
```

2. Remove the copied PAI/USER directory and create symlink:
```bash
rm -rf ~/.claude/PAI/USER
ln -s ~/.buddy/PAI-USER ~/.claude/PAI/USER
```

#### Step 10: Create Required Directories

Create directories that PAI expects (these go in ~/.buddy/MEMORY via the symlink):
```bash
mkdir -p ~/.buddy/MEMORY/STATE
mkdir -p ~/.buddy/MEMORY/LEARNING
mkdir -p ~/.buddy/MEMORY/WORK
mkdir -p ~/.buddy/MEMORY/RELATIONSHIP
mkdir -p ~/.buddy/MEMORY/VOICE
```

Create PAI working directories:
```bash
mkdir -p ~/.claude/Plans
mkdir -p ~/.claude/hooks
mkdir -p ~/.claude/skills
mkdir -p ~/.claude/tasks
```

#### Step 11: Run PAI Installer

1. Inform user: "Running PAI installer. This will set up prerequisites (Bun, Claude Code) and configure your installation."

2. Run the installer:
```bash
cd ~/.claude && bash install.sh
```

3. If installer fails, report the error but continue — the core files are already in place.

### Phase E: Cleanup & Verify

#### Step 12: Cleanup

1. Remove temp directory:
```bash
rm -rf {TEMP_DIR}
```

#### Step 13: Verify

Read and execute `Workflows/VerifyInstallation.md` to confirm everything is set up correctly.

### Phase F: Optional Customization

#### Step 14: Offer Customization

1. Use AskUserQuestion:

```
Question: "PAI is installed. Would you like to customize your identity files now?"
Options:
- Yes, customize now — Walk through identity files one by one
- No, skip for now — You can run this later with /pai:pai-setup customize
```

2. If "Yes": Read and execute `Workflows/CustomizeIdentity.md`

## Report

Present the installation summary:

```
## PAI Installation Complete

**Version**: {LATEST_VERSION}
**User Data**: ~/.buddy/
**PAI Installation**: ~/.claude/
**Symlinks**:
  - ~/.claude/MEMORY -> ~/.buddy/MEMORY
  - ~/.claude/PAI/USER -> ~/.buddy/PAI-USER

### What Was Installed
- PAI memory system at ~/.buddy/MEMORY/
- User configuration at ~/.buddy/PAI-USER/
- Full PAI release at ~/.claude/
- Symlinks for persistent user data across upgrades

### Next Steps
1. Run `/pai:pai-setup customize` to set up your identity files
2. Restart your Claude Code session for changes to take effect
```
