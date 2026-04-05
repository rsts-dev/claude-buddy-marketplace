---
name: Implementation
description: Execute implementation tasks from task documents following TDD workflow, phase-by-phase execution, and real-time progress tracking. USE WHEN implement, execute tasks, run tasks, start implementation, build feature, execute implementation, code the feature.
---

# Implementation

Execute tasks from `tasks.md` following TDD workflow with phase-by-phase execution, progress tracking, and completion validation.

## Customization

**Before executing, check for user customizations at:**
`~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/Implementation/`

If this directory exists, load and apply any PREFERENCES.md configurations. If not, proceed with defaults.

## Prerequisites

1. PAI must be installed. Check `~/.buddy/.pai-version`.
2. Foundation must exist at `/directive/foundation.md`.
3. Tasks must exist in `specs/` directory.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **ExecuteTasks** | Any invocation | `Workflows/ExecuteTasks.md` |

## Task Discovery

Scans `specs/` for folders containing `tasks.md`. If multiple found, asks user which to execute.

## Execution Model

- **Phase-by-phase**: Setup -> Tests (TDD) -> Core -> Integration -> Polish
- **TDD**: Tests MUST fail first (red), then pass after implementation (green)
- **Progress**: Updates checkboxes in `tasks.md` after each completed task
- **Errors**: Halts on sequential task failure; continues on parallel `[P]` failure

## Output

Updates `tasks.md` in-place with completion checkboxes. Changes status to "Completed" when done.

## Examples

**Example 1: Execute implementation**
```
User: "/buddy:implement"
-> Discovers specs/20260402-user-authentication/tasks.md
-> Reads all design documents (spec, plan, tasks, data-model, etc.)
-> Executes Phase 3.1 Setup tasks
-> Executes Phase 3.2 Tests (expects failures - TDD red)
-> Executes Phase 3.3 Core (tests should pass - TDD green)
-> Executes Phase 3.4 Integration, Phase 3.5 Polish
-> Updates tasks.md checkboxes throughout
-> Reports completion summary
```
