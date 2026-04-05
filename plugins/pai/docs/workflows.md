# PAI Plugin Workflows Reference

[< Back to PAI README](../README.md) | [All Docs](../../../docs/README.md)

Complete reference for all workflows in the PAI Setup skill.

## Overview

| Workflow | File | Trigger |
|----------|------|---------|
| **InstallPAI** | `Workflows/InstallPAI.md` | Fresh install, no `~/.buddy/.pai-version` |
| **UpgradePAI** | `Workflows/UpgradePAI.md` | Existing install detected |
| **CustomizeIdentity** | `Workflows/CustomizeIdentity.md` | `customize` argument |
| **VerifyInstallation** | `Workflows/VerifyInstallation.md` | `verify` argument |

---

## InstallPAI

**Trigger**: `/pai:setup` or `/pai:setup install` (no existing installation)

### Phase A: Prerequisites & Detection

1. Verify `git` is available
2. Verify `curl` is available
3. Check `~/.buddy/.pai-version` -- if exists, route to UpgradePAI

### Phase B: Clone & Detect Latest Version

1. Create temp directory
2. Clone PAI repository: `git clone --depth 1`
3. Detect latest version from `Releases/` folder
4. Validate release structure (must contain `.claude/MEMORY` and `.claude/PAI/USER`)

### Phase C: Setup ~/.buddy

1. Create directory structure: `~/.buddy/MEMORY/`, `~/.buddy/PAI-USER/`
2. Copy MEMORY files from release
3. Copy PAI/USER files from release (flattened to PAI-USER)
4. Write version: `echo "v{x.y.z}" > ~/.buddy/.pai-version`

### Phase D: Full PAI Installation

1. Backup existing `~/.claude/` to `~/.claude-backup-{date}` if present
2. Copy release to `~/.claude/`
3. Create symlinks:
   - `~/.claude/MEMORY` -> `~/.buddy/MEMORY`
   - `~/.claude/PAI/USER` -> `~/.buddy/PAI-USER`
4. Create required subdirectories (STATE, LEARNING, WORK, RELATIONSHIP, VOICE)
5. Create PAI working directories (Plans, hooks, skills, tasks)
6. Run PAI installer: `cd ~/.claude && bash install.sh`

### Phase E: Cleanup & Verify

1. Remove temp directory
2. Run VerifyInstallation workflow

### Phase F: Optional Customization

1. Ask user whether to customize identity files now
2. If yes, run CustomizeIdentity workflow

---

## UpgradePAI

**Trigger**: `/pai:setup upgrade` or auto-detected existing installation

### Process

1. Read current version from `~/.buddy/.pai-version`
2. Clone PAI repository to temp directory
3. Detect latest version
4. Compare versions -- skip if already on latest
5. Merge new files into `~/.buddy/` (never overwrites existing user files)
6. Replace `~/.claude/` with fresh release files
7. Re-create symlinks
8. Run PAI installer + BuildCLAUDE.ts
9. Update `~/.buddy/.pai-version`

**Key guarantee**: User customizations in `~/.buddy/PAI-USER/` are never overwritten. Only new files from the release are added.

---

## CustomizeIdentity

**Trigger**: `/pai:setup customize`

Routes to individual customization sub-workflows:

| Sub-Workflow | File | Target |
|-------------|------|--------|
| CustomizeAboutMe | `Workflows/CustomizeAboutMe.md` | `~/.buddy/PAI-USER/ABOUTME.md` |
| CustomizeAISteeringRules | `Workflows/CustomizeAISteeringRules.md` | `~/.buddy/PAI-USER/AISTEERINGRULES.md` |
| CustomizeOpinions | `Workflows/CustomizeOpinions.md` | `~/.buddy/PAI-USER/OPINIONS.md` |
| CustomizeDAIdentity | `Workflows/CustomizeDAIdentity.md` | `~/.buddy/PAI-USER/DAIDENTITY.md` |
| CustomizeWritingStyle | `Workflows/CustomizeWritingStyle.md` | `~/.buddy/PAI-USER/WRITINGSTYLE.md` |
| CustomizeSubdirectories | `Workflows/CustomizeSubdirectories.md` | `~/.buddy/PAI-USER/{dirs}/` |

### What Each Customization Gathers

**ABOUTME.md**: Professional role, title, responsibilities, technical expertise, current goals, knowledge domains.

**AISTEERINGRULES.md**: AI behavioral preferences, things to always/never do, communication style rules, domain-specific rules.

**OPINIONS.md**: Technology preferences, workflow preferences, quality standards, non-negotiables.

**DAIDENTITY.md**: Assistant name and personality, voice characteristics, interaction style, boundaries.

**WRITINGSTYLE.md**: Preferred tone (formal/casual/technical), format preferences (bullets/paragraphs), documentation and code comment style.

**Subdirectories**: TELOS (goals, beliefs, wisdom), BUSINESS (business context), PROJECTS (project registry).

Each sub-workflow:
1. Asks relevant questions via interactive prompts
2. Compiles answers into structured markdown
3. Writes to `~/.buddy/PAI-USER/{file}`
4. Accessible via symlink at `~/.claude/PAI/USER/{file}`

---

## VerifyInstallation

**Trigger**: `/pai:setup verify`

### Checks Performed

| Check | Command | Expected |
|-------|---------|----------|
| Version file | `cat ~/.buddy/.pai-version` | Version string (e.g., `v4.0.3`) |
| Buddy directory | `test -d ~/.buddy` | Exists |
| MEMORY directory | `test -d ~/.buddy/MEMORY` | Exists |
| PAI-USER directory | `test -d ~/.buddy/PAI-USER` | Exists |
| Claude directory | `test -d ~/.claude` | Exists |
| MEMORY symlink | `readlink ~/.claude/MEMORY` | Points to `~/.buddy/MEMORY` |
| USER symlink | `readlink ~/.claude/PAI/USER` | Points to `~/.buddy/PAI-USER` |
| Identity files | `ls ~/.buddy/PAI-USER/*.md` | ABOUTME, AISTEERINGRULES, OPINIONS, DAIDENTITY, WRITINGSTYLE |

### Output

Reports pass/fail status for each check with actionable guidance for any failures.
