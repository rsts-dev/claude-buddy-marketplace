---
name: Tasks
description: Generate granular task breakdowns from implementation plans with TDD ordering, parallel task marking, and sequential numbering. USE WHEN tasks, task breakdown, todo list, implementation tasks, work items, actionable steps, generate tasks.
---

# Tasks

Break implementation plans into executable, TDD-ordered tasks with parallel marking and dependency tracking.

## Customization

**Before executing, check for user customizations at:**
`~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/Tasks/`

If this directory exists, load and apply any PREFERENCES.md configurations. If not, proceed with defaults.

## Prerequisites

1. PAI must be installed. Check `~/.buddy/.pai-version`.
2. Foundation must exist at `/directive/foundation.md`.
3. A plan must exist in `specs/` directory.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **GenerateTasks** | Any invocation | `Workflows/GenerateTasks.md` |

## Template Selection

Based on foundation type:
- **Default**: `Templates/DefaultTasks.md`
- **JHipster**: `Templates/JHipsterTasks.md`
- **MuleSoft**: `Templates/MuleSoftTasks.md`

## Plan Discovery

Scans `specs/` for folders with `plan.md` but no `tasks.md`. If multiple found, asks user.

## Task Format

- Sequential numbering: T001, T002, T003...
- Parallel marker: `[P]` for tasks on different files with no dependencies
- TDD order: Tests come before implementation
- Phases: Setup, Tests, Core, Integration, Polish
- Each task includes exact file path

## Output

Tasks are written to: `specs/[YYYYMMDD-slug]/tasks.md`

## Examples

**Example 1: Generate tasks**
```
User: "/buddy:tasks"
-> Discovers specs/20260402-user-authentication/plan.md (no tasks.md)
-> Reads plan.md, spec.md, and all design documents
-> Generates TDD-ordered tasks: T001-T045
-> Marks parallel tasks with [P]
-> Writes to specs/20260402-user-authentication/tasks.md
```
