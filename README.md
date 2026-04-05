# Claude Buddy Marketplace

Official Claude Code plugin marketplace for Claude Buddy and PAI.

## Plugins

| Plugin | Command Prefix | Description |
|--------|---------------|-------------|
| **[buddy](plugins/buddy/)** | `buddy:*` | Development workflow platform with domains, personas, and TDD |
| **[pai](plugins/pai/)** | `pai:*` | Install and configure Personal AI Infrastructure |

## Installation

### Add Marketplace

```bash
/plugin marketplace add rsts-dev/claude-buddy-marketplace
```

### Install Plugins

```bash
# Core development platform
/plugin install buddy@claude-buddy-marketplace

# PAI infrastructure (required by buddy)
/plugin install pai@claude-buddy-marketplace
```

### Restart Claude Code

Close and reopen Claude Code to activate plugins.

## What is Claude Buddy?

Claude Buddy is a PAI-native development workflow platform featuring:
- **Extensible domain system** — Auto-detects project type (React, JHipster, MuleSoft, or custom)
- **12 specialist personas** — Expert perspectives loaded contextually during workflows
- **Complete workflow automation** — spec, plan, tasks, implement, commit, docs
- **Domain-aware templates** — Technology-specific templates for specs, plans, tasks, and docs
- **TDD-first execution** — Tests before implementation with parallel task support
- **Custom domain creation** — Interactive wizard for adding new technology domains

## Workflow Commands

| Command | Purpose |
|---------|---------|
| `/buddy:foundation` | Initialize project foundation with domain auto-detection |
| `/buddy:spec` | Create feature specifications |
| `/buddy:plan` | Generate implementation plans |
| `/buddy:tasks` | Break down plans into TDD-ordered tasks |
| `/buddy:implement` | Execute tasks (red-green-refactor) |
| `/buddy:commit` | Create professional git commits |
| `/buddy:docs` | Generate comprehensive documentation |

## Domain System

Foundation auto-detects the project's technology stack and selects domain-specific templates.

### Built-in Domains

| Domain | Detected By |
|--------|-------------|
| **React** | `package.json` with `react`, `.jsx`/`.tsx` files |
| **JHipster** | `.yo-rc.json`, Spring Boot + Angular |
| **MuleSoft** | `.dwl` files, `mule-artifact.json` |
| **Default** | Fallback for any project type |

### Custom Domains

```bash
/buddy:foundation create domain
```

Interactive wizard guides you through creating detection rules, analysis workflows, and templates for any technology stack.

## Persona System

12 specialist personas provide expert perspectives during workflow execution:

| Persona | Expertise | Used During |
|---------|-----------|-------------|
| **Architect** | Systems design, scalability | Plan |
| **Security** | Threat modeling, compliance | Plan, Implementation |
| **QA** | Testing strategy, quality gates | Tasks, Implementation |
| **Frontend** | UI/UX, accessibility | Spec, Implementation |
| **Backend** | APIs, databases, microservices | Plan, Implementation |
| **DevOps** | CI/CD, infrastructure | Implementation |
| **Performance** | Optimization, profiling | Plan, Implementation |
| **Refactorer** | Code quality, technical debt | Implementation |
| **Analyzer** | Root cause analysis, debugging | Implementation |
| **Scribe** | Documentation, commit messages | Commit, Docs |
| **PO** | Requirements, user stories | Spec |
| **Mentor** | Knowledge transfer | On request |

## Prerequisites

- **Claude Code**: Latest version
- **Bun**: Required by PAI ([Install](https://bun.sh))
- **git**: For source control operations
- **gh** CLI: For pull request creation (optional)

## Quick Start

```bash
# 1. Add marketplace
/plugin marketplace add rsts-dev/claude-buddy-marketplace

# 2. Install plugins
/plugin install pai@claude-buddy-marketplace
/plugin install buddy@claude-buddy-marketplace

# 3. Restart Claude Code

# 4. Set up PAI
/pai:setup

# 5. Initialize project foundation
/buddy:foundation

# 6. Start building
/buddy:spec Create a user authentication API with JWT
/buddy:plan
/buddy:tasks
/buddy:implement
/buddy:commit
/buddy:docs
```

## Documentation

- [Buddy Plugin](plugins/buddy/README.md) — Skills, domains, personas, workflows
- [Buddy Architecture](plugins/buddy/docs/architecture.md) — System design and data flow
- [Domain System](plugins/buddy/docs/domains.md) — Detection, templates, references
- [PAI Plugin](plugins/pai/README.md) — Installation and configuration
- [Website](https://claude-buddy.dev) — Official documentation

## Support

- **GitHub Issues**: [Report bugs](https://github.com/rsts-dev/claude-buddy-marketplace/issues)
- **Website**: [https://claude-buddy.dev](https://claude-buddy.dev)

## License

MIT License - see [LICENSE](LICENSE)

Copyright (c) 2025 Claude Buddy Contributors
