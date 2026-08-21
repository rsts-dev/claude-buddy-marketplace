# RunValidation Workflow

Run the project's validation commands and report results honestly.

## Variables

```
CLAUDE_MD: CLAUDE.md
FOUNDATION_PATH: /directive/foundation.md
ARGS: $ARGUMENTS   # optional: a single level (tests|lint|types|build)
```

## Instructions

- Report failures as failures. Never mark validation passed unless every requested level actually passed.
- Quote failing output verbatim and name the file/line where possible.

## Workflow

### Step 1: Discover commands

Read the "Build & validation commands" section of `CLAUDE.md` (fallback: `/directive/foundation.md` Technology Stack). Identify the real commands for: install (if needed), test, lint, type-check, build. If none are documented, infer from the manifest (`package.json` scripts, `Makefile`, `pom.xml`, etc.) and note the inference.

### Step 2: Run the levels

Run each level (or only the one named in `$ARGUMENTS`), capturing output:
```bash
[test command]
[lint command]
[type-check command]
[build command]
```
Stop-on-first-failure is optional; prefer running all and collecting results so the report is complete.

### Step 3: Report

Summarize per level with PASS/FAIL. For each FAIL, include the key error lines and the offending file. Suggest the next action (fix → re-validate, or `/sdlc:rca` if the failure reveals a systemic gap).

## Report

```
## Validation — {branch}

| Level | Result |
|-------|--------|
| tests | {PASS/FAIL} |
| lint | {PASS/FAIL} |
| types | {PASS/FAIL} |
| build | {PASS/FAIL} |

### Failures
{verbatim error excerpts + file:line}

Next: {fix & re-run `/sdlc:validate` | `/sdlc:review` if green}
```
