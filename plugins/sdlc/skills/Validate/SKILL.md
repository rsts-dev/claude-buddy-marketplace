---
name: Validate
description: The Validate step of R-PIV. Run the project's real tests, linting, type-checking, and build using the commands recorded in CLAUDE.md / the foundation, then report pass/fail with actionable output. Never claim success without evidence. USE WHEN sdlc validate, validate, run tests, run lint, type check, run the build, check it works, validation.
---

# Validate

Close the loop: run the checks and report what actually happened. Validation is the human gate before review and commit — claims of "done" mean nothing without the command output behind them.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/Validate/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

1. **buddy** + **LifeOS** installed (`test -f ~/.claude/LIFEOS/VERSION`).
2. `CLAUDE.md` and/or `/directive/foundation.md` present (they list the validation commands). Run `/sdlc:init` if missing.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **RunValidation** | Any `/sdlc:validate` invocation | `Workflows/RunValidation.md` |

## Output

A pass/fail validation report (to the conversation), with the failing output quoted verbatim.

## Examples

```
User: "/sdlc:validate"
→ Reads validation commands from CLAUDE.md (test/lint/types/build)
→ Runs each; captures output
→ Reports PASS/FAIL per level; on failure, quotes the error and names the file
```
