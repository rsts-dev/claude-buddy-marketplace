# Claude Buddy Marketplace Documentation

[< Back to Marketplace README](../README.md)

## Marketplace Docs

General documentation covering the marketplace as a whole:

- [Architecture](architecture.md) — Marketplace plugin model, dependency graph, data flow
- [Setup Guide](setup.md) — Prerequisites, installation, configuration
- [Deployment](deployment.md) — Publishing, versioning, contributing new plugins
- [API & Extension Points](api-reference.md) — Plugin JSON schema, template format, domain creation
- [Troubleshooting](troubleshooting.md) — Common issues, debugging, FAQ

## Plugin Documentation

Detailed documentation lives inside each plugin's `docs/` folder:

### Buddy Plugin

> [Plugin README](../plugins/buddy/README.md) | [Full Docs](../plugins/buddy/docs/)

- [Architecture](../plugins/buddy/docs/architecture.md) — System design, layers, mermaid diagrams
- [Skills Reference](../plugins/buddy/docs/skills.md) — All 7 skills with workflows and personas
- [Commands Reference](../plugins/buddy/docs/commands.md) — Usage, arguments, examples for all commands
- [Domain System](../plugins/buddy/docs/domains.md) — Detection, templates, references, custom domains
- [Persona System](../plugins/buddy/docs/personas.md) — 12 specialists, activation mapping, format

### PAI Plugin

> [Plugin README](../plugins/pai/README.md) | [Full Docs](../plugins/pai/docs/)

- [Architecture](../plugins/pai/docs/architecture.md) — File system layout, symlink strategy, design
- [Workflows](../plugins/pai/docs/workflows.md) — Install, upgrade, customize, verify workflows

## Quick Start

```bash
# 1. Add marketplace
/plugin marketplace add rsts-dev/claude-buddy-marketplace

# 2. Install plugins
/plugin install pai@claude-buddy-marketplace
/plugin install buddy@claude-buddy-marketplace

# 3. Restart Claude Code, then:
/pai:setup              # Set up PAI infrastructure
/buddy:foundation       # Initialize project foundation
/buddy:spec {feature}   # Start building
```

For the full setup walkthrough, see the [Setup Guide](setup.md).
