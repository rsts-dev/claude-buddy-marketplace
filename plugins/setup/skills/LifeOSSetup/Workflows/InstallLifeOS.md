# InstallLifeOS Workflow

Fresh installation of LifeOS by driving the **official self-contained installer**, then transitioning into onboarding. This workflow does not copy or re-implement the LifeOS payload — it bootstraps the upstream installer and lets it do the work, with permission at every mutation.

## Variables

```
LIFEOS_REPO: https://github.com/danielmiessler/LifeOS
INSTALL_DOC: https://ourlifeos.ai/install
INSTALL_SH: https://ourlifeos.ai/install.sh
CLAUDE_DIR: ~/.claude
VERSION_FILE: ~/.claude/LIFEOS/VERSION
```

## Instructions

- Use AskUserQuestion at each decision point.
- Permission before mutation: the upstream installer shows the exact change and backs up `settings.json`; do not bypass it.
- Additive, never clobbering. Never overwrite a populated dir or a foreign file.
- Handle errors gracefully with clear messages.

## Workflow

### Phase A: Prerequisites & Detection

#### Step 1: Check Prerequisites

1. Verify `bun` is available:
```bash
which bun
```
If not found, report: "bun is required (the LifeOS installer runs under bun). Install from https://bun.sh and retry." The upstream installer can bootstrap bun on some paths, but confirm with the user before proceeding.

2. Verify `git` and `curl` are available:
```bash
which git curl
```
If missing, report which one and how to install it.

#### Step 2: Check for Existing Installation

1. Check whether LifeOS is already installed:
```bash
test -f ~/.claude/LIFEOS/VERSION && cat ~/.claude/LIFEOS/VERSION
```

2. **If the version file exists**: this is not a fresh install. Report: "Existing LifeOS installation detected (version X)." Then offer `Workflows/Doctor.md` (health check) or `Workflows/UpdateLifeOS.md` (update) and **stop this workflow**.

3. **If no version file**: continue with fresh install.

#### Step 3: Dev-tree Refusal

1. Confirm you are NOT inside the LifeOS source repo (an author's live system):
```bash
git -C . remote -v 2>/dev/null | grep -i 'danielmiessler/LifeOS' && echo DEV_TREE
```
If `DEV_TREE` is printed, refuse to install here and report why. Never mutate the author's source tree.

### Phase B: Choose Install Path

#### Step 4: Pick the entry point

Use AskUserQuestion:

```
Question: "How would you like to install LifeOS?"
Options:
- AI-native (recommended) — Fetch the official INSTALL.md and follow it step by step, wiring integration for this harness with permission at each change.
- Terminal shortcut — Run the official one-liner (Claude Code on macOS/Linux only).
```

### Phase C: Run the Official Installer

#### Step 5a: AI-native path

1. Fetch the official install doc (read-only): `{INSTALL_DOC}` (or `{LIFEOS_REPO}` `LifeOS/LifeOS/INSTALL.md`).
2. Follow its capability gate and steps exactly. It drives the install Tools under `bun`, detects OS + harness, and wires integration per-harness.
3. At each mutation the installer describes, relay it to the user and get an explicit yes before it runs. Confirm `settings.json` is backed up before hooks are wired.

#### Step 5b: Terminal shortcut path

1. Inform the user this drops the LifeOS skill, then the agentic setup takes over:
```bash
curl -fsSL https://ourlifeos.ai/install.sh | bash
```
2. After it completes, continue the agentic setup (`/LifeOS setup`) it hands off to.

### Phase D: Verify

#### Step 6: Confirm the install

1. Verify the system tree landed:
```bash
test -f ~/.claude/LIFEOS/VERSION && cat ~/.claude/LIFEOS/VERSION
```
2. Run the capability doctor (see `Workflows/Doctor.md`):
```bash
bun ~/.claude/LIFEOS/TOOLS/Doctor.ts
```
Relay the capability table. If anything is broken, offer the fix command it prints.

### Phase E: Onboard

#### Step 7: Transition into the interview

1. Setup is logistics; the interview is meaning. Now that hooks are wired, read and execute `Workflows/RunInterview.md` to name the DA, capture TELOS current → ideal state, pull in the user's sources, and seed Pulse.

## Report

Present the installation summary:

```
## LifeOS Installation Complete

**Version**: {installed version from ~/.claude/LIFEOS/VERSION}
**Location**: ~/.claude/LIFEOS/
**Dashboard**: Pulse on http://localhost:31337

### What Was Installed
- LifeOS system tree at ~/.claude/LIFEOS/ (constitution, Algorithm, Atlas, Pulse, tools, docs)
- Hooks wired into your harness (with your permission; settings.json backed up)
- A blank USER scaffold ready for onboarding

### Next Steps
1. Onboarding continues now via the interview (naming your DA, capturing TELOS).
2. Run `/setup:lifeos doctor` any time to check what's live.
3. Restart your Claude Code session for all changes to take effect.
```
