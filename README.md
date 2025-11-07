# Claude Buddy Marketplace

Official Claude Code plugin marketplace for Claude Buddy.

## Installation

### Add Marketplace

```bash
/plugin marketplace add rsts-dev/claude-buddy-marketplace
```

### Install Claude Buddy Plugin

```bash
/plugin install claude-buddy@claude-buddy-marketplace
```

### Restart Claude Code

Close and reopen Claude Code to activate the plugin.

## What is Claude Buddy?

Claude Buddy is an Enterprise-Ready AI Development Platform featuring:
- **12 specialized AI personas** - Expert perspectives from architecture to QA
- **Complete workflow automation** - spec → plan → tasks → implement → commit
- **Enterprise templates** - MuleSoft & JHipster production-ready frameworks
- **Safety-first design** - Multi-layer protection with Python-based hooks
- **Comprehensive documentation** - Automatic generation and maintenance

## Features

### 12 Expert Personas

**Technical Specialists:**
- Architect - Systems design & long-term architecture
- Frontend - UI/UX & accessibility
- Backend - APIs & reliability engineering
- Security - Threat modeling & vulnerabilities
- Performance - Optimization & bottleneck elimination

**Process Experts:**
- Analyzer - Root cause analysis
- QA - Testing & quality advocacy
- Refactorer - Code quality & technical debt
- DevOps - Infrastructure & deployment
- PO - Product requirements & strategy

**Knowledge Specialists:**
- Mentor - Knowledge transfer & education
- Scribe - Documentation & writing

### Workflow Commands

| Command | Purpose |
|---------|---------|
| `/buddy:persona` | Activate specialized personas |
| `/buddy:foundation` | Initialize project foundation |
| `/buddy:spec` | Create feature specifications |
| `/buddy:plan` | Generate implementation plans |
| `/buddy:tasks` | Break down plans into tasks |
| `/buddy:implement` | Execute tasks with TDD |
| `/buddy:commit` | Create professional git commits |
| `/buddy:docs` | Generate comprehensive documentation |

### Enterprise Templates

- **Default** - General-purpose development
- **MuleSoft** - API integration platform with RAML, DataWeave, MUnit
- **JHipster** - Full-stack web applications with Spring Boot & Angular/React/Vue

### Safety Features

- **File Protection** - Blocks modification of sensitive files (.env, credentials, keys)
- **Command Validation** - Prevents dangerous operations (rm -rf, sudo, format)
- **Auto-Formatting** - Automatic code formatting after edits

## Prerequisites

- **Python**: ≥3.8 ([Download](https://python.org))
- **uv**: Python package manager ([Install Guide](https://github.com/astral-sh/uv))
- **Claude Code**: Latest version

### Installing uv

**macOS/Linux:**
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**Windows:**
```powershell
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

**Via pip:**
```bash
pip install uv
```

## Quick Start

```bash
# 1. Add marketplace
/plugin marketplace add rsts-dev/claude-buddy-marketplace

# 2. Install plugin
/plugin install claude-buddy@claude-buddy-marketplace

# 3. Restart Claude Code

# 4. Test
/buddy:persona architect - What are REST API design best practices?
```

## Documentation

- [Plugin README](plugins/claude-buddy/README.md) - Complete plugin documentation
- [Testing Guide](plugins/claude-buddy/TESTING.md) - Local testing instructions
- [Website](https://claude-buddy.dev) - Official documentation and guides

## Usage Example

```bash
# Complete feature development workflow
/buddy:foundation
/buddy:spec Create a user authentication API with JWT
/buddy:plan
/buddy:tasks
/buddy:implement
/buddy:commit
/buddy:docs
```

## Support

- **GitHub Issues**: [Report bugs](https://github.com/rsts-dev/claude-buddy/issues)
- **Discussions**: [Ask questions](https://github.com/rsts-dev/claude-buddy/discussions)
- **Website**: [https://claude-buddy.dev](https://claude-buddy.dev)

## Contributing

We welcome contributions! See our [main repository](https://github.com/rsts-dev/claude-buddy) for contribution guidelines.

## License

MIT License - see [LICENSE](LICENSE)

Copyright (c) 2025 Claude Buddy Contributors

---

**Claude Buddy Marketplace v4.0.0** - Enterprise-Ready AI Development Platform
