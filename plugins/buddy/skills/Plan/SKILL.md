---
name: Plan
description: Generate implementation plans from feature specifications with foundation-aware template selection, dependency analysis, and phased execution strategy. USE WHEN plan, implementation plan, how to implement, execution plan, technical approach, planning, create plan.
---

# Plan

Convert specifications into detailed implementation plans with phased execution, dependency analysis, and risk assessment.

## Customization

**Before executing, check for user customizations at:**
`~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/Plan/`

If this directory exists, load and apply any PREFERENCES.md configurations. If not, proceed with defaults.

## Prerequisites

1. PAI must be installed. Check `~/.buddy/.pai-version`.
2. Foundation must exist at `/directive/foundation.md`.
3. A specification must exist in `specs/` directory.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **GeneratePlan** | Any invocation | `Workflows/GeneratePlan.md` |

## Template Selection

Based on foundation type:
- **Default**: `Templates/DefaultPlan.md`
- **JHipster**: `Templates/JHipsterPlan.md`
- **MuleSoft**: `Templates/MuleSoftPlan.md`

## Spec Discovery

Scans `specs/` for folders with `spec.md` but no `plan.md`. If multiple found, asks user which to plan.

## Output

Plans are written to: `specs/[YYYYMMDD-slug]/plan.md`

## Examples

**Example 1: Plan from spec**
```
User: "/buddy:plan"
-> Discovers specs/20260402-user-authentication/spec.md (no plan.md)
-> Loads spec, analyzes requirements
-> Loads DefaultPlan.md template
-> Generates plan with phases, dependencies, testing strategy
-> Writes to specs/20260402-user-authentication/plan.md
```
