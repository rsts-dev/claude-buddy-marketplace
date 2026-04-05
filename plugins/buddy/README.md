# Claude Buddy v5 — PAI-Native Development Platform

PAI-native rewrite of Claude Buddy with 7 focused skills, extensible domain architecture, and integrated persona system covering the complete development lifecycle from specification to deployment.

## Prerequisites

- **PAI** must be installed via the [pai plugin](../pai/README.md)
- **git** for source control operations
- **gh** CLI for pull request creation (optional)

## Development Workflow

```
/buddy:foundation  ->  Project principles & governance (auto-detects domain)
        |
/buddy:spec        ->  Feature specification from description
        |
/buddy:plan        ->  Implementation plan from spec
        |
/buddy:tasks       ->  TDD-ordered task breakdown from plan
        |
/buddy:implement   ->  Execute tasks (red-green-refactor)
        |
/buddy:commit      ->  Professional git commit
        |
/buddy:docs        ->  Technical documentation
```

## Skills

| Skill | Command | Description |
|-------|---------|-------------|
| **SourceControl** | `/buddy:commit` | Git commits, branches, PRs with conventional commits |
| **Foundation** | `/buddy:foundation` | Create/update foundation with domain detection, personas, and governance |
| **Spec** | `/buddy:spec` | Generate feature specifications (domain-aware templates) |
| **Plan** | `/buddy:plan` | Generate implementation plans (domain-aware templates) |
| **Tasks** | `/buddy:tasks` | Generate TDD-ordered task breakdowns (domain-aware templates) |
| **Implementation** | `/buddy:implement` | Execute tasks with progress tracking and domain references |
| **Docs** | `/buddy:docs` | Generate technical documentation (domain-aware templates) |

## Domain System

Foundation auto-detects the project's technology stack and selects domain-specific templates, analysis workflows, and reference materials. Domains are self-contained and auto-discovered.

### Built-in Domains

| Domain | Type Key | Detection |
|--------|----------|-----------|
| **Default** | `default` | Fallback for any project type |
| **React** | `react` | `.jsx`/`.tsx` files, `package.json` with `react` |
| **JHipster** | `jhipster` | `.yo-rc.json`, Spring Boot + Angular |
| **MuleSoft** | `mulesoft` | `.dwl` files, `mule-artifact.json`, Mule Maven plugin |

### Creating Custom Domains

```
/buddy:foundation create domain
```

Interactive wizard generates all required files and stores them in:
```
~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/
```

### Domain Directory Structure

```
Domains/{domain-name}/
  profile.md          # Identity, dependencies, keywords, reference index
  detect.md           # Detection rules with confidence scoring
  analyze.md          # Deep analysis workflow fragment
  Templates/          # Spec.md, Plan.md, Tasks.md, Docs.md
  Reference/          # Large reference materials (loaded on-demand)
```

### Template Resolution Order

1. User domain template (`~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{type}/`)
2. Built-in domain template (`skills/Foundation/Domains/{type}/`)
3. Skill default template (fallback)

## Persona System

12 specialized personas provide expert perspectives during workflow execution. Personas are loaded on-demand based on workflow context.

| Persona | Role | Used By |
|---------|------|---------|
| **Architect** | Systems design, scalability, patterns | Plan |
| **Security** | Threat modeling, compliance, vulnerabilities | Plan, Implementation |
| **QA** | Testing strategy, quality gates, coverage | Tasks, Implementation |
| **Frontend** | UI/UX, accessibility, responsive design | Spec, Implementation |
| **Backend** | APIs, databases, microservices | Plan, Implementation |
| **DevOps** | CI/CD, infrastructure, deployment | Plan, Implementation |
| **Performance** | Optimization, profiling, bottlenecks | Plan, Implementation |
| **Refactorer** | Code quality, technical debt, clean code | Implementation |
| **Analyzer** | Root cause analysis, debugging, diagnostics | Implementation |
| **Mentor** | Knowledge transfer, explanations, tutorials | — (on request) |
| **Scribe** | Documentation, commit messages, changelogs | Commit, Docs |
| **PO** | Product requirements, user stories, acceptance criteria | Spec |

Personas live in `skills/Foundation/Personas/{name}/persona.md` and are activated contextually by workflows.

## Customization

Each skill checks for user customizations at:
```
~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/{SkillName}/PREFERENCES.md
```

Available customization points:
- `SourceControl/` — commit templates, branch naming, protected branches
- `Foundation/` — principle templates, governance rules, custom domains
- `Spec/` — specification preferences, domain-specific requirements
- `Plan/` — planning style, phase definitions
- `Tasks/` — task granularity, parallel execution preferences
- `Implementation/` — execution preferences, checkpoint behavior
- `Docs/` — documentation style, sections to include/exclude

## Migration from v4

| v4 | v5 | Notes |
|----|----|-------|
| 8 commands + 8 agents + 20 skills | 7 commands + 7 skills | Consolidated architecture |
| `/buddy:commit` | `/buddy:commit` | Same functionality |
| `/buddy:foundation` | `/buddy:foundation` | Enhanced: domain detection, CreateDomain wizard |
| `/buddy:spec` | `/buddy:spec` | Merged command + agent + generator |
| `/buddy:plan` | `/buddy:plan` | Merged command + agent + generator |
| `/buddy:tasks` | `/buddy:tasks` | Merged command + agent + generator |
| `/buddy:implement` | `/buddy:implement` | Merged command + agent |
| `/buddy:docs` | `/buddy:docs` | Merged command + agent + generator |
| `/buddy:persona` | Integrated | Personas auto-activate in workflows |
| 12 persona skills | `Foundation/Personas/` | Migrated as loadable persona definitions |
| 3 domain skills | `Foundation/Domains/` | Migrated with detection, analysis, templates, references |
| damage-control | Separate plugin | Unchanged |

## Plugin Structure

```
plugins/buddy/
├── .claude-plugin/plugin.json
├── README.md
├── commands/                              # 7 thin command wrappers
├── docs/                                  # Plugin documentation
│   ├── skills.md
│   ├── commands.md
│   ├── architecture.md
│   └── domains.md
└── skills/
    ├── SourceControl/                     # Git workflow
    │   ├── SKILL.md
    │   └── Workflows/ (3)                 # Commit, CreateBranch, CreatePR
    ├── Foundation/                        # Project foundation + domains + personas
    │   ├── SKILL.md
    │   ├── Workflows/ (4)                 # CreateFoundation, UpdateFoundation, DetectDomain, CreateDomain
    │   ├── Domains/                       # Extensible domain definitions
    │   │   ├── _domain-template/          # Skeleton for new domains
    │   │   ├── default/                   # Generic fallback (8 files)
    │   │   ├── react/                     # React.js (10 files)
    │   │   ├── jhipster/                  # JHipster full-stack (11 files)
    │   │   └── mulesoft/                  # MuleSoft integration (14 files)
    │   └── Personas/                      # Specialist personas (12)
    │       ├── architect/
    │       ├── security/
    │       ├── qa/
    │       ├── frontend/
    │       ├── backend/
    │       ├── devops/
    │       ├── performance/
    │       ├── refactorer/
    │       ├── analyzer/
    │       ├── mentor/
    │       ├── scribe/
    │       └── po/
    ├── Spec/                              # Specifications
    │   ├── SKILL.md
    │   ├── Templates/ (1 fallback)
    │   └── Workflows/ (1)
    ├── Plan/                              # Implementation plans
    │   ├── SKILL.md
    │   ├── Templates/ (1 fallback)
    │   └── Workflows/ (1)
    ├── Tasks/                             # Task breakdowns
    │   ├── SKILL.md
    │   ├── Templates/ (1 fallback)
    │   └── Workflows/ (1)
    ├── Implementation/                    # Task execution
    │   ├── SKILL.md
    │   └── Workflows/ (1)
    └── Docs/                              # Documentation
        ├── SKILL.md
        ├── Templates/ (1 fallback)
        └── Workflows/ (1)
```
