# RunInterview Workflow

Life onboarding for LifeOS: capture who the principal is and where they are going, then seed the Pulse dashboard so it shows real data instead of empty scaffolding. This delegates to the LifeOS distribution's own interview — this workflow orchestrates and confirms it, it does not re-implement TELOS capture.

## Variables

```
CLAUDE_DIR: ~/.claude
USER_DIR: ~/.claude/LIFEOS/USER
VERSION_FILE: ~/.claude/LIFEOS/VERSION
```

## Instructions

- **Setup must have run first.** Hooks and integration land before any onboarding write.
- Ask one topic at a time; compile answers into the USER tree the installer scaffolded.
- Never overwrite an already-populated USER file without confirmation.

## Workflow

### Step 1: Confirm setup ran

1. Verify LifeOS is installed:
```bash
test -f ~/.claude/LIFEOS/VERSION || echo NOT_INSTALLED
```
2. If `NOT_INSTALLED`, report: "LifeOS is not installed yet. Run setup first." Then read and execute `Workflows/InstallLifeOS.md` and **stop this workflow**.

### Step 2: Name the DA and capture principal identity

1. Follow the LifeOS interview to:
   - Name the Digital Assistant (the principal's named AI) and set its identity.
   - Capture principal identity (background, role, focus, communication preferences).
2. Answers are written into the scaffolded USER tree (`DIGITAL_ASSISTANT/`, `PRINCIPAL/`).

### Step 3: TELOS — current state → ideal state

1. Capture the TELOS current state and ideal state (missions, goals, problems, strategies).
2. This is the core of LifeOS: every task becomes a current → ideal transition. Write into `USER/TELOS/`.

### Step 4: Pull in the user's sources

1. Ask the user for existing notes, configs, or exports to enrich context.
2. Import them additively into the USER tree — never clobber existing content.

### Step 5: Seed Pulse

1. Let the interview seed the Pulse dashboard from the captured state.
2. Confirm Pulse reflects real data:
```bash
bun ~/.claude/LIFEOS/TOOLS/Doctor.ts
```
Relay whether the dashboard capability is live.

## Report

```
## LifeOS Onboarding Complete

**DA name**: {captured}
**USER tree**: ~/.claude/LIFEOS/USER/ (populated)
**Pulse**: http://localhost:31337 (seeded)

### Captured
- Digital Assistant identity + principal identity
- TELOS current state → ideal state
- Imported sources: {list}

### Next Steps
1. Open Pulse to see your current vs ideal state.
2. Run `/setup:lifeos doctor` any time to check live capabilities.
```
