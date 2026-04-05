---
name: Docs
description: Generate comprehensive technical documentation from codebase analysis with foundation-specific templates, architecture diagrams, and API references. USE WHEN docs, documentation, technical docs, API documentation, generate docs, document codebase, create documentation.
---

# Docs

Generate comprehensive technical documentation by analyzing the codebase with foundation-specific templates.

## Customization

**Before executing, check for user customizations at:**
`~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/Docs/`

If this directory exists, load and apply any PREFERENCES.md configurations. If not, proceed with defaults.

## Prerequisites

1. PAI must be installed. Check `~/.buddy/.pai-version`.
2. Foundation must exist at `/directive/foundation.md`.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **GenerateDocs** | Any invocation | `Workflows/GenerateDocs.md` |

## Template Selection

Based on foundation type:
- **Default**: `Templates/DefaultDocs.md`
- **JHipster**: `Templates/JHipsterDocs.md`
- **MuleSoft**: `Templates/MuleSoftDocs.md`

## Output

Documentation is generated in the `docs/` directory with a navigation index at `docs/README.md`.

## Examples

**Example 1: Generate documentation**
```
User: "/buddy:docs"
-> Verifies foundation exists, extracts type
-> Analyzes codebase (structure, APIs, models, configs)
-> Loads DefaultDocs.md template
-> Generates: architecture.md, api-reference.md, setup.md, deployment.md
-> Creates docs/README.md as navigation index
```
