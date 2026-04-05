# API & Extension Points

[< Back to Docs](README.md)

Reference for the schemas, formats, and extension mechanisms in the Claude Buddy Marketplace.

For domain-specific formats, see:
- [Domain System](../plugins/buddy/docs/domains.md) -- detection rules, templates, references
- [Persona System](../plugins/buddy/docs/personas.md) -- persona definition format

## Plugin JSON Schema

### Marketplace Manifest

**File**: `.claude-plugin/marketplace.json`

```json
{
  "name": "string (required) — marketplace name",
  "owner": {
    "name": "string — organization or author name",
    "email": "string — contact email",
    "url": "string — homepage URL"
  },
  "description": "string — marketplace description",
  "homepage": "string — marketplace website",
  "repository": "string — git repository URL",
  "plugins": [
    {
      "name": "string (required) — plugin name",
      "source": "string (required) — relative path to plugin directory"
    }
  ]
}
```

### Plugin Manifest

**File**: `plugins/{name}/.claude-plugin/plugin.json`

```json
{
  "name": "string (required) — unique plugin identifier",
  "version": "string (required) — semver version",
  "description": "string (required) — plugin description",
  "author": {
    "name": "string",
    "url": "string"
  },
  "license": "string — SPDX license identifier",
  "homepage": "string — plugin website",
  "repository": "string — git repository URL",
  "keywords": ["string — searchable tags"]
}
```

## Command Format

**File**: `plugins/{name}/commands/{command}.md`

Commands are thin markdown wrappers that route to skills:

```markdown
---
description: One-line description of what this command does
---

Read and execute the {SkillName} skill at `skills/{SkillName}/SKILL.md`.

**User provided input**: $ARGUMENTS
```

`$ARGUMENTS` is replaced with the user's command arguments at runtime.

## Skill Definition Format

**File**: `plugins/{name}/skills/{SkillName}/SKILL.md`

```markdown
---
name: SkillName
description: Detailed description including trigger keywords. USE WHEN keyword1, keyword2, ...
---

# SkillName

Brief description of the skill.

## Customization

Check for user customizations at:
`~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/{SkillName}/`

## Prerequisites

1. List of requirements

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **WorkflowName** | When to trigger | `Workflows/WorkflowName.md` |

## Template Selection

Based on foundation type:
- **Default**: `Templates/DefaultSkillName.md`
- **Domain**: `Templates/DomainSkillName.md`

## Output

Description of what the skill produces.

## Examples

Example invocations and expected behavior.
```

## Workflow Format

**File**: `plugins/{name}/skills/{SkillName}/Workflows/{WorkflowName}.md`

Workflows are step-by-step execution plans:

```markdown
# WorkflowName Workflow

Description of what this workflow does.

## Variables

```
VARIABLE_NAME: value
```

## Workflow

### Step 1: Step Name

1. Action description
2. Command to execute:
```bash
command here
```
3. Decision point: use AskUserQuestion if needed

### Step 2: Next Step

...

## Report

Summary template shown to user on completion.
```

## Template Format

**File**: `plugins/{name}/skills/{SkillName}/Templates/Default{SkillName}.md`

Templates define the output structure for generated artifacts:

```markdown
---
description: "Template description"
---

# Template: [PROJECT NAME]

## Required Sections

### section-name.md
- What this section must contain
- Structure expectations
- Required elements

## Guidelines
- Documentation standards
- Style requirements
```

## Domain Definition Format

### profile.md

```markdown
---
type_key: domain-name
priority: 0-100
description: One-line description
---

# Domain Name

## Overview
Description of the technology domain.

## Dependencies
- Runtime requirements
- Build tool requirements

## Keywords
domain, specific, technology, terms

## Reference Materials

| File | Size | Load When | Description |
|------|------|-----------|-------------|
| `reference.md` | 50KB | Implementation | What it contains |

## Best Practices Summary
Key practices for this domain (loaded instead of full references for non-implementation phases).
```

### detect.md

```markdown
# Domain Detection Rules

## File Patterns

### HIGH Confidence (90 points)
- `specific-config-file.json` — Definitive marker for this technology

### MEDIUM Confidence (30 points)
- `src/common-pattern/` — Common but not definitive

### LOW Confidence (10 points)
- `*.ext` — Weak indicator

## Manifest Checks

### HIGH Confidence (90 points)
- `package.json` contains `"framework-name"` — Direct dependency

## Directory Structure

### HIGH Confidence (90 points)
- `src/main/` + `src/test/` — Standard project layout

## Scoring
- Threshold: 60 points minimum to match
- Multiple matches are additive
- Highest-scoring domain wins
```

### analyze.md

```markdown
# Domain Analysis Workflow

## Technology Stack Discovery

Commands to run for stack analysis:
```bash
# Example: read configuration files
cat package.json | grep -E "(dependencies|scripts)"
```

## Output Format

Produce three sections for foundation.md:

### Technology Stack
- Framework version and configuration
- Build tools and package management
- Testing frameworks

### Domain Context
- Architecture pattern discovered
- Key directories and their roles
- Configuration approach

### Domain-Specific Principles
- Principle 1: Description
- Principle 2: Description
```

## Persona Definition Format

**File**: `plugins/buddy/skills/Foundation/Personas/{name}/persona.md`

```markdown
---
name: persona-{name}
description: Description with activation triggers
allowed-tools: Read, Grep, Glob, Edit, Write
---

# {Name} Persona

## Identity & Expertise
- **Role**: Description
- **Priority Hierarchy**: First -> second -> third -> fourth
- **Specializations**: Areas of expertise

## Core Principles

### 1. Principle Name
Description of principle and how it applies.

## Auto-Activation Triggers

### High Confidence Triggers (95%+)
- Keywords and file patterns

### Medium Confidence Triggers (80-94%)
- Secondary indicators

## Collaboration Patterns

### Primary Collaborations
- **With {Other} Persona**: How they work together

## Response Patterns

### When Activated for {Task Type}
1. Step-by-step approach

## Command Specializations

### /buddy:{command}
- How this persona enhances the command
```

## Extension Points Summary

| What | How | Location |
|------|-----|----------|
| Add a plugin | Create plugin directory with manifest | `plugins/{name}/` |
| Add a command | Create markdown wrapper | `plugins/{name}/commands/{cmd}.md` |
| Add a skill | Create SKILL.md + Workflows/ | `plugins/{name}/skills/{Skill}/` |
| Add a domain | Use wizard or copy template | `~/.buddy/.../Domains/{name}/` or `Foundation/Domains/{name}/` |
| Customize a skill | Create PREFERENCES.md | `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/{Skill}/` |
| Add a persona | Create persona.md | `Foundation/Personas/{name}/persona.md` |
| Add reference material | Add to domain Reference/ | `Domains/{name}/Reference/{file}.md` |
