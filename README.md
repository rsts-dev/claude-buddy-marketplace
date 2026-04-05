# Claude Buddy Marketplace

<p align="center">
  <img src="https://claude-buddy.dev/_astro/cb-image-light.CY6C2M94.jpg" alt="Claude Buddy" width="200" />
</p>

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

See [Commands Reference](plugins/buddy/docs/commands.md) for full usage and arguments.

## Domain System

Foundation auto-detects the project's technology stack (React, JHipster, MuleSoft, or generic default) and selects domain-specific templates. Custom domains can be created via `/buddy:foundation create domain`.

See [Domain System](plugins/buddy/docs/domains.md) for detection rules, scoring, and custom domain creation.

## Persona System

12 specialist personas (Architect, Security, QA, Frontend, Backend, DevOps, Performance, Refactorer, Analyzer, Scribe, PO, Mentor) provide expert perspectives loaded contextually during workflow execution.

See [Persona System](plugins/buddy/docs/personas.md) for the full directory and workflow mapping.

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

> **[Full Documentation Index](docs/README.md)** — Start here for comprehensive docs.

### Marketplace

- [Architecture](docs/architecture.md) — Plugin model, dependency graph, data flow
- [Setup Guide](docs/setup.md) — Prerequisites, installation, configuration
- [API & Extension Points](docs/api-reference.md) — Plugin schema, template format
- [Troubleshooting](docs/troubleshooting.md) — Common issues, debugging, FAQ

### Buddy Plugin

- [Buddy README](plugins/buddy/README.md) — Overview and quick reference
- [Architecture](plugins/buddy/docs/architecture.md) — System design, layers, diagrams
- [Skills](plugins/buddy/docs/skills.md) | [Commands](plugins/buddy/docs/commands.md) | [Domains](plugins/buddy/docs/domains.md) | [Personas](plugins/buddy/docs/personas.md)

### PAI Plugin

- [PAI README](plugins/pai/README.md) — Overview
- [Architecture](plugins/pai/docs/architecture.md) | [Workflows](plugins/pai/docs/workflows.md)

### External

- [Website](https://claude-buddy.dev) — Official documentation

## Support

- **GitHub Issues**: [Report bugs](https://github.com/rsts-dev/claude-buddy-marketplace/issues)
- **Website**: [https://claude-buddy.dev](https://claude-buddy.dev)

## License

MIT License - see [LICENSE](LICENSE)

Copyright (c) 2025 Claude Buddy Contributors
