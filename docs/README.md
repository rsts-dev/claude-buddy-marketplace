# Claude Buddy Marketplace Documentation

Comprehensive technical documentation for the Claude Buddy Marketplace and its plugins.

## Table of Contents

### Marketplace

- [Architecture](architecture.md) — System design, plugin model, data flow
- [Setup Guide](setup.md) — Installation, prerequisites, quick start
- [Deployment](deployment.md) — Publishing, distribution, versioning

### Buddy Plugin

- [Buddy Overview](buddy-overview.md) — Skills, domains, personas, workflow lifecycle
- [Buddy Skills Reference](buddy-skills.md) — All 7 skills with workflows, templates, personas
- [Buddy Domain System](buddy-domains.md) — Detection, templates, references, custom domains
- [Buddy Persona System](buddy-personas.md) — 12 specialists, activation, collaboration

### PAI Plugin

- [PAI Overview](pai-overview.md) — Installation, upgrade, identity customization
- [PAI Workflows](pai-workflows.md) — Install, upgrade, customize, verify workflows

### Reference

- [Troubleshooting](troubleshooting.md) — Common issues, debugging, FAQ
- [API & Extension Points](api-reference.md) — Plugin JSON schema, template format, domain creation

## Quick Start

```bash
# 1. Add marketplace to Claude Code
/plugin marketplace add rsts-dev/claude-buddy-marketplace

# 2. Install both plugins
/plugin install pai@claude-buddy-marketplace
/plugin install buddy@claude-buddy-marketplace

# 3. Restart Claude Code

# 4. Set up PAI infrastructure
/pai:setup

# 5. Initialize your project
/buddy:foundation

# 6. Start the development workflow
/buddy:spec Create a user authentication API with JWT
/buddy:plan
/buddy:tasks
/buddy:implement
/buddy:commit
/buddy:docs
```
