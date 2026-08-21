# Doctor Workflow

Check the health of a LifeOS install and relay the capability table. This is the one tool-backed route — `Doctor.ts` is self-describing: it prints the capability states and the exact fix command for anything broken.

## Variables

```
CLAUDE_DIR: ~/.claude
DOCTOR: ~/.claude/LIFEOS/TOOLS/Doctor.ts
VERSION_FILE: ~/.claude/LIFEOS/VERSION
```

## Instructions

- Do not attempt to diagnose by hand — run the tool and relay its output.
- Honor `decline`: a declined capability is a legitimate way to run LifeOS, never a defect to nag about.

## Workflow

### Step 1: Confirm LifeOS is installed

```bash
test -f ~/.claude/LIFEOS/VERSION && cat ~/.claude/LIFEOS/VERSION || echo NOT_INSTALLED
```
If `NOT_INSTALLED`, report it and offer `Workflows/InstallLifeOS.md`. Then stop.

### Step 2: Run the doctor

```bash
bun ~/.claude/LIFEOS/TOOLS/Doctor.ts
```

If `Doctor.ts` is not present at that path (older layout), report the path is missing and suggest `/setup:lifeos update`.

### Step 3: Relay the capability table

1. Present the four capability states verbatim: **live / broken / declined / stale**.
2. For anything **broken**, offer the exact fix command `Doctor.ts` prints.
3. For anything **declined**, note it as an intentional choice — do not nag.
4. For anything **stale**, suggest `/setup:lifeos update`.

## Report

```
## LifeOS Doctor

**Version**: {from ~/.claude/LIFEOS/VERSION}

{capability table relayed from Doctor.ts}

### Suggested Fixes
- {broken capability}: run `{fix command from Doctor.ts}`
- {stale capability}: run `/setup:lifeos update`

Declined capabilities are left as-is by design.
```
