# UninstallLifeOS Workflow

Remove LifeOS from the harness non-destructively, by driving the official uninstall path. Restores the `settings.json` backup and never removes foreign files.

## Variables

```
CLAUDE_DIR: ~/.claude
INSTALL_DOC: https://ourlifeos.ai/install
VERSION_FILE: ~/.claude/LIFEOS/VERSION
```

## Instructions

- Confirm intent explicitly before any removal.
- Never `rm` a foreign file or a populated dir the installer did not create.
- Preserve the USER tree unless the user explicitly asks to delete their data.

## Workflow

### Step 1: Confirm an existing install

```bash
test -f ~/.claude/LIFEOS/VERSION && cat ~/.claude/LIFEOS/VERSION || echo NOT_INSTALLED
```
If `NOT_INSTALLED`, report there is nothing to uninstall. Then stop.

### Step 2: Confirm intent and scope

Use AskUserQuestion:

```
Question: "Remove LifeOS from this harness?"
Options:
- Remove LifeOS, keep my USER data — Unwire hooks/settings and remove the system tree; preserve ~/.claude/LIFEOS/USER.
- Remove everything including my USER data — Also delete the USER tree (irreversible).
- Cancel — Do nothing.
```

### Step 3: Run the official uninstall

1. Follow the official uninstall flow from `{INSTALL_DOC}` (or the LifeOS skill's `Workflows/Uninstall.md`).
2. It unwires the hooks/settings LifeOS added and restores the `settings.json` backup taken at install.
3. Remove the system tree per the chosen scope; keep the USER tree unless the user chose to delete it.

### Step 4: Verify removal

```bash
test -f ~/.claude/LIFEOS/VERSION && echo STILL_PRESENT || echo REMOVED
```

## Report

```
## LifeOS Uninstall Complete

- Hooks/settings unwired; settings.json restored from backup
- System tree removed
- USER data: {preserved | deleted per your choice}

Restart your Claude Code session to finish.
```
