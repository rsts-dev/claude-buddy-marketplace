---
name: Foundation
description: Create and maintain the project foundation document at /directive/foundation.md with automatic domain detection, codebase analysis, semantic versioning, and consistency propagation. USE WHEN foundation, project foundation, create foundation, update foundation, project principles, governance, foundation document, amend foundation.
---

# Foundation

Maintain the authoritative project foundation document. Automatically detects the project's technology domain, creates from codebase analysis or user input, updates with semantic versioning, and propagates changes to dependent artifacts.

## Customization

**Before executing, check for user customizations at:**
`~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/Foundation/`

If this directory exists, load and apply any PREFERENCES.md configurations. If not, proceed with defaults.

## Prerequisites

PAI must be installed. Check `~/.buddy/.pai-version`. If missing, inform user: "PAI is required. Run `/pai:pai-setup` to install."

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **CreateFoundation** | No `/directive/foundation.md` exists | `Workflows/CreateFoundation.md` |
| **UpdateFoundation** | Foundation exists, user wants changes | `Workflows/UpdateFoundation.md` |
| **CreateDomain** | User wants to create a new domain | `Workflows/CreateDomain.md` |
| **DetectDomain** | Called by CreateFoundation during setup | `Workflows/DetectDomain.md` |

## Auto-Detection

1. Check if user input contains "create domain", "new domain", or "add domain"
   - If **yes** -> route to `Workflows/CreateDomain.md`
2. Check if `/directive/foundation.md` exists
   - If **no** -> route to `Workflows/CreateFoundation.md`
     - CreateFoundation automatically detects the project domain via `DetectDomain.md`
     - Delegates to the domain's `analyze.md` for deep analysis
   - If **yes** -> route to `Workflows/UpdateFoundation.md`

## Domain Architecture

Technology-specific knowledge lives in `Domains/`, where each subdirectory is a self-contained domain definition. Domains are **auto-discovered** — no registration needed.

### Available Domains

| Domain | Type Key | Description |
|--------|----------|-------------|
| `default` | `default` | Generic fallback for any project type |
| `react` | `react` | React.js frontend applications |
| `jhipster` | `jhipster` | JHipster full-stack (Angular + Spring Boot) |
| `mulesoft` | `mulesoft` | MuleSoft integration and API development |

### Domain Directory Structure

```
Domains/{domain-name}/
  profile.md          # Identity: type key, priority, dependencies, keywords, reference index
  detect.md           # Detection rules with confidence scoring
  analyze.md          # Deep analysis workflow fragment
  Templates/          # Domain-specific templates for downstream skills
    Spec.md           # Specification template
    Plan.md           # Implementation plan template
    Tasks.md          # Task breakdown template
    Docs.md           # Documentation template
  Reference/          # Large reference materials (loaded on-demand)
    README.md         # Index of reference files
    *.md              # Domain-specific reference documentation
```

### Adding a New Domain

**Interactive wizard (recommended):**
```
/buddy:foundation create domain
```
The CreateDomain workflow guides you through creating all required files interactively, with intelligent defaults and technology-aware generation. Domains created this way are stored in your user customization directory:
```
~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/
```

**Manual creation:**
1. Create a directory under `Domains/` or `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/`
2. Add the required files: `profile.md`, `detect.md`, `analyze.md`
3. Add templates in `Templates/`: `Spec.md`, `Plan.md`, `Tasks.md`, `Docs.md`
4. Optionally add reference materials in `Reference/`
5. Use `Domains/_domain-template/` as a starting point

No changes to Foundation, DetectDomain, or any downstream skill workflows are needed. The new domain is automatically discovered and available.

### Domain Search Order

DetectDomain scans domains from two locations:
1. **User domains**: `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/` (takes precedence)
2. **Built-in domains**: `skills/Foundation/Domains/`

User domains can override built-in domains by using the same `type_key`.

### Template Resolution

Downstream skills (Spec, Plan, Tasks, Docs) resolve templates dynamically:
1. **Try**: `skills/Foundation/Domains/{foundation-type}/Templates/{Skill}.md`
2. **Fallback**: The skill's own `Templates/DefaultSpec.md` (etc.)

### Reference Material Loading

Domain reference materials are large and loaded on-demand. Each domain's `profile.md` includes a Reference Materials table with a `Load When` column indicating which workflow phases should load each file.

## Examples

**Example 1: Initialize foundation (auto-detect React project)**
```
User: "/buddy:foundation"
-> No foundation exists
-> DetectDomain scans Domains/, finds package.json with "react" -> score 90
-> Selects react domain
-> Executes Domains/react/analyze.md for deep analysis
-> Derives 5 core principles (including React-specific)
-> Creates /directive/foundation.md with Foundation Type: react
```

**Example 2: Initialize foundation (auto-detect MuleSoft project)**
```
User: "/buddy:foundation"
-> No foundation exists
-> DetectDomain finds mule-artifact.json -> score 90
-> Selects mulesoft domain
-> Executes Domains/mulesoft/analyze.md
-> Creates /directive/foundation.md with Foundation Type: mulesoft
```

**Example 3: Create a new domain**
```
User: "/buddy:foundation create domain"
-> Asks for domain name and description
-> Gathers technology stack details (runtime, framework, config files, etc.)
-> Generates profile.md, detect.md, analyze.md with intelligent defaults
-> Generates 4 customized templates (Spec, Plan, Tasks, Docs)
-> Writes to ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{name}/
-> Domain immediately available for detection
```

## Persona System

12 specialized personas provide expert perspectives during workflow execution. Personas are loaded on-demand by downstream workflows based on task context.

### Available Personas

| Persona | Type Key | Expertise |
|---------|----------|-----------|
| `architect` | Systems design | Architecture patterns, scalability, dependency management |
| `security` | Threat modeling | Vulnerability assessment, compliance, secure coding |
| `qa` | Quality assurance | Test strategy, quality gates, coverage analysis |
| `frontend` | UI/UX specialist | Accessibility, responsive design, component patterns |
| `backend` | API specialist | Database optimization, microservices, authentication |
| `devops` | Infrastructure | CI/CD, containerization, monitoring, deployment |
| `performance` | Optimization | Profiling, bottleneck analysis, performance budgets |
| `refactorer` | Code quality | Technical debt, clean code, design patterns |
| `analyzer` | Investigation | Root cause analysis, debugging, diagnostics |
| `mentor` | Education | Knowledge transfer, explanations, tutorials |
| `scribe` | Documentation | Writing, commit messages, changelogs, style |
| `po` | Product owner | Requirements, user stories, acceptance criteria |

### Persona Directory Structure

```
Personas/{persona-name}/
  persona.md          # Full persona definition with identity, principles, and frameworks
```

### How Personas Are Used

Downstream workflows load relevant personas to enhance their output:
- **Spec generation** loads `po` for requirement perspective
- **Plan generation** loads `architect` for design decisions
- **Task generation** loads `qa` for testing strategy
- **Implementation** loads context-dependent personas (e.g., `frontend` for UI tasks)
- **Commit** loads `scribe` for message quality
- **Docs** loads `scribe` for writing quality

### Loading a Persona

Workflows load personas by reading:
```
skills/Foundation/Personas/{persona-name}/persona.md
```

The persona definition provides identity, core principles, decision frameworks, auto-activation triggers, collaboration patterns, and response patterns that guide the workflow's output.

**Example 4: Add a principle**
```
User: "/buddy:foundation add security review principle"
-> Foundation exists
-> Adds new security principle
-> Bumps version (MINOR: new principle)
-> Propagates changes to dependent artifacts
```
