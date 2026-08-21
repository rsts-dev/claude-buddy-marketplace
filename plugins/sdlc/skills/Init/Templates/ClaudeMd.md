# [PROJECT NAME]

> AI layer for this repo. Keep this file under 300 lines — it loads into every agent session.
> Every rule below traces to real code (file:line). Task-specific detail lives in `.claude/context/`.

## What this is
[One-line description of the project and its purpose.]

## Naming conventions
- [Convention] — e.g. `src/features/<feature>/` vertical slices (`src/features/auth/`)
- [Convention] — cite a representative file:line

## Core patterns
- [Pattern] — how X is done here, with `path/to/example.ext:NN`
- [Pattern] — data access / error handling / DI, cited

## Build & validation commands
```bash
# install
[cmd]
# test
[cmd]
# lint
[cmd]
# type-check
[cmd]
# build
[cmd]
```

## On-demand context
Load these only when the task calls for it:

| Topic | Load when | File |
|-------|-----------|------|
| Architecture | designing/moving modules | `.claude/context/architecture.md` |
| Testing | writing/adjusting tests | `.claude/context/testing.md` |
| Auth | touching auth/permissions | `.claude/context/auth.md` |
| [Risky area] | [when] | `.claude/context/[topic].md` |

## Hard rules
- [General constraint that applies to basically every task]
- [e.g. Never commit secrets; all new code has tests; follow the vertical-slice layout]

## Gotchas
- [Legacy/foot-gun that bites repeatedly, cited to file:line]
