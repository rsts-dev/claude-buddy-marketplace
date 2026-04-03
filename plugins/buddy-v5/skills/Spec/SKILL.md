---
name: Spec
description: Generate feature specifications from natural language descriptions with foundation-aware template selection and clarification cycles. USE WHEN spec, specification, feature spec, requirements, document feature, create spec, write spec, PRD, product requirements.
---

# Spec

Transform feature descriptions into formal specifications using foundation-aware templates.

## Customization

**Before executing, check for user customizations at:**
`~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/Spec/`

If this directory exists, load and apply any PREFERENCES.md configurations. If not, proceed with defaults.

## Prerequisites

1. PAI must be installed. Check `~/.buddy/.pai-version`.
2. Foundation must exist at `/directive/foundation.md`. If missing, inform user: "Run `/buddy:foundation` first."

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **GenerateSpec** | Any invocation with feature description | `Workflows/GenerateSpec.md` |

## Template Selection

Based on foundation type extracted from `/directive/foundation.md`:
- **Default**: `Templates/DefaultSpec.md`
- **JHipster**: `Templates/JHipsterSpec.md`
- **MuleSoft**: `Templates/MuleSoftSpec.md`

## Output

Specifications are written to: `specs/[YYYYMMDD-slug]/spec.md`

## Examples

**Example 1: Generate specification**
```
User: "/buddy:spec user authentication with JWT tokens and password reset"
-> Loads foundation, detects type (default)
-> Loads DefaultSpec.md template
-> Generates specification with requirements, user stories, acceptance criteria
-> Marks unclear areas: [NEEDS CLARIFICATION: Which roles needed?]
-> Writes to specs/20260402-user-authentication/spec.md
```
