# Claude Buddy Marketplace

<p align="center">
  <a href="https://buddy.rsts.dev/">
    <img src="https://buddy.rsts.dev/_astro/cb-image-light.CY6C2M94.jpg" alt="Claude Buddy" width="200" />
  </a>
</p>

<p align="center">
  <a href="https://buddy.rsts.dev/" target="_blank">buddy.rsts.dev</a>
</p>

Official Claude Code plugin marketplace for Claude Buddy and PAI.

## Plugins

| Plugin | Command Prefix | Description |
|--------|---------------|-------------|
| **[setup](plugins/setup/)** | `setup:*` | Thin-wrapper installers — LifeOS (`/setup:lifeos`), MuleSoft skills, Salesforce skills, Spring Boot (Dr JSkill) |
| **[buddy](plugins/buddy/)** | `buddy:*` | Development workflow platform with domains, personas, and TDD (requires LifeOS via `setup`) |
| **[sdlc](plugins/sdlc/)** | `sdlc:*` | Tactical AI-native SDLC (R-PIV) — complement to buddy; Jira/Confluence/GitHub (requires `buddy`) |
| **[pai](plugins/pai/)** | `pai:*` | _(Deprecated — superseded by LifeOS, installed via `setup`)_ Personal AI Infrastructure |

## Installation

### Add Marketplace

```bash
/plugin marketplace add rsts-dev/claude-buddy-marketplace
```

### Install Plugins

```bash
# Setup plugin — thin-wrapper installers for LifeOS, MuleSoft/Salesforce skills, Spring Boot
/plugin install setup@claude-buddy-marketplace

# Core development platform (requires LifeOS, installed via setup)
/plugin install buddy@claude-buddy-marketplace

# Tactical AI-native SDLC — R-PIV loop, Jira/Confluence/GitHub (complement to buddy)
/plugin install sdlc@claude-buddy-marketplace

# PAI infrastructure (deprecated — superseded by LifeOS; kept for legacy installs)
/plugin install pai@claude-buddy-marketplace
```

Then use the `setup` plugin to install tools with their official installers:

```bash
/setup:lifeos        # LifeOS — the Life Operating System
/setup:mulesoft      # MuleSoft API-design skills (Anypoint)
/setup:salesforce    # Salesforce agent skills (Agentforce, DX)
/setup:springboot    # Dr JSkill — Spring Boot 4.x generator
```

### Restart Claude Code

Close and reopen Claude Code to activate plugins.

## What is Claude Buddy?

Claude Buddy is a LifeOS-native development workflow platform featuring:
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
- **Bun**: Required by LifeOS ([Install](https://bun.sh))
- **git**: For source control operations
- **gh** CLI: For pull request creation (used by `sdlc:commit`/`sdlc:review`)
- **MCP servers** (optional): Atlassian (Jira/Confluence) and GitHub for the `sdlc` plugin

## Quick Start

```bash
# 1. Add marketplace
/plugin marketplace add rsts-dev/claude-buddy-marketplace

# 2. Install plugins
/plugin install setup@claude-buddy-marketplace
/plugin install buddy@claude-buddy-marketplace
/plugin install sdlc@claude-buddy-marketplace

# 3. Restart Claude Code

# 4. Set up LifeOS
/setup:lifeos

# 5. Initialize the project + AI layer (delegates to buddy Foundation, adds CLAUDE.md)
/sdlc:init

# 6. Run the R-PIV loop on a ticket
/sdlc:prime ABC-123
/sdlc:plan ABC-123
/sdlc:implement abc-123-slug
/sdlc:validate
/sdlc:review
/sdlc:commit ABC-123
```

Prefer buddy's document-centric flow instead? Use `/buddy:foundation` → `/buddy:spec` → `/buddy:plan` → `/buddy:tasks` → `/buddy:implement` → `/buddy:commit` → `/buddy:docs`.

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

### Setup Plugin

- [Setup README](plugins/setup/README.md) — Thin-wrapper installers: LifeOS, MuleSoft, Salesforce, Spring Boot
- [Architecture](plugins/setup/docs/architecture.md) | [Workflows](plugins/setup/docs/workflows.md)

### SDLC Plugin

- [SDLC README](plugins/sdlc/README.md) — Tactical AI-native R-PIV loop (complement to buddy)
- [Architecture](plugins/sdlc/docs/architecture.md) | [Workflows](plugins/sdlc/docs/workflows.md) | [Integrations](plugins/sdlc/docs/integrations.md)

### PAI Plugin _(deprecated — superseded by LifeOS, via `setup`)_

- [PAI README](plugins/pai/README.md) — Overview
- [Architecture](plugins/pai/docs/architecture.md) | [Workflows](plugins/pai/docs/workflows.md)

### External

- [Website](https://buddy.rsts.dev) — Official documentation

## Support

- **GitHub Issues**: [Report bugs](https://github.com/rsts-dev/claude-buddy-marketplace/issues)
- **Website**: [https://buddy.rsts.dev](https://buddy.rsts.dev)

## License

MIT License - see [LICENSE](LICENSE)

Copyright (c) 2025 Claude Buddy Contributors
