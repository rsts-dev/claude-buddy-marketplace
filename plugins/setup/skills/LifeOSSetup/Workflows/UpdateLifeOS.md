# UpdateLifeOS Workflow

Idempotent update of an existing LifeOS install after a version bump, by re-running the official update path. Non-destructive: the USER tree and populated files are preserved.

## Variables

```
CLAUDE_DIR: ~/.claude
INSTALL_DOC: https://ourlifeos.ai/install
INSTALL_SH: https://ourlifeos.ai/install.sh
VERSION_FILE: ~/.claude/LIFEOS/VERSION
```

## Instructions

- Additive, never clobbering. Re-overlay is idempotent; never overwrite the USER tree.
- Permission before mutation; `settings.json` is backed up before hooks are re-wired.

## Workflow

### Step 1: Confirm an existing install

```bash
test -f ~/.claude/LIFEOS/VERSION && cat ~/.claude/LIFEOS/VERSION || echo NOT_INSTALLED
```
If `NOT_INSTALLED`, report it and route to `Workflows/InstallLifeOS.md`. Then stop.

Record the current version as CURRENT_VERSION.

### Step 2: Re-run the official update path

1. Prefer the AI-native path: fetch `{INSTALL_DOC}` and follow its update flow (it re-overlays the system idempotently and skips anything already current).
2. Terminal shortcut alternative (Claude Code, macOS/Linux):
```bash
curl -fsSL https://ourlifeos.ai/install.sh | bash
```
Then continue the agentic `/LifeOS update` it hands off to.
3. Relay each mutation to the user for confirmation; confirm the `settings.json` backup.

### Step 3: Verify

```bash
cat ~/.claude/LIFEOS/VERSION
bun ~/.claude/LIFEOS/TOOLS/Doctor.ts
```
Record the new version as NEW_VERSION and relay the capability table.

## Report

```
## LifeOS Update Complete

**Before**: {CURRENT_VERSION}
**After**: {NEW_VERSION}

- System tree re-overlaid idempotently
- USER tree preserved (no user data touched)
- Capabilities: {live/broken/declined/stale summary}

### Next Steps
- If anything is broken, run `/setup:lifeos doctor` for the fix command.
- Restart your Claude Code session for changes to take effect.
```
