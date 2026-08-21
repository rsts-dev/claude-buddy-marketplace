# Claude Buddy v5 — LifeOS-Native Development Platform

[< Back to Marketplace](../../README.md) | [Marketplace Docs](../../docs/README.md)

LifeOS-native rewrite of Claude Buddy with 7 focused skills, extensible domain architecture, and integrated persona system covering the complete development lifecycle from specification to deployment.

## Prerequisites

- **LifeOS** must be installed via the [setup plugin](../setup/README.md) — run `/setup:lifeos`
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

Foundation auto-detects the project's technology stack (React, JHipster, MuleSoft, or generic default) and selects domain-specific templates, analysis workflows, and reference materials.

Custom domains can be created via `/buddy:foundation create domain`.

See [Domain System docs](docs/domains.md) for detection rules, scoring, template resolution, and custom domain creation.

## Persona System

12 specialized personas provide expert perspectives during workflow execution, loaded on-demand based on workflow context.

See [Persona System docs](docs/personas.md) for the full directory, workflow mapping, and definition format.

## Customization

Each skill checks for user customizations at `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/{SkillName}/PREFERENCES.md`.

See [Setup Guide > Configuration](../../docs/setup.md#configuration) for available customization points.

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

## Documentation

- [Architecture](docs/architecture.md) -- System design, layers, data flow diagrams
- [Skills Reference](docs/skills.md) -- All 7 skills with workflows and persona loading
- [Commands Reference](docs/commands.md) -- Usage, arguments, examples for all commands
- [Domain System](docs/domains.md) -- Detection, templates, references, custom domains
- [Persona System](docs/personas.md) -- 12 specialists, activation mapping, definition format
