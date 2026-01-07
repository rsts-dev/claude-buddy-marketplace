# Claude Buddy Plugin

> Enterprise-Ready AI Development Platform for Claude Code

Transform your development workflow with Claude Buddy - a comprehensive Claude Code plugin featuring 12 specialized personas, enterprise templates for MuleSoft & JHipster, and complete workflow automation from specification to deployment.

## Features

- **12 Expert Personas** - Specialized AI perspectives from architecture to QA
- **Enterprise Templates** - Production-ready frameworks for MuleSoft & JHipster
- **Workflow Automation** - Complete development lifecycle management
- **Safety-First Design** - Multi-layer protection with Python-based hooks
- **Comprehensive Commands** - 8 slash commands for complete workflow coverage

### Development Workflow

```
/buddy:spec → /buddy:plan → /buddy:tasks → /buddy:implement → /buddy:commit
  Create       Generate      Break down     Execute with      Professional
  specification implementation task list      TDD approach      commits
```

## Prerequisites

### System Requirements

**Required:**
- **Claude Code**: Latest version
- **Python**: ≥3.8 ([Download](https://python.org))
- **uv**: Python package manager ([Install Guide](#installing-uv))

### Installing uv

The plugin uses `uv` for hook execution. Install it using one of these methods:

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

**Verify Installation:**
```bash
python --version  # Should show ≥3.8
uv --version     # Should show uv version
```

## Installation

### Via Claude Code Plugin System

**1. Add the Claude Buddy marketplace:**
```bash
/plugin marketplace add rsts-dev/claude-buddy-marketplace
```

**2. Install the plugin:**
```bash
/plugin install buddy@claude-buddy-marketplace
```

**3. Restart Claude Code**

The plugin will be automatically activated on next session.

### Verify Installation

```bash
# Check that commands are available
/help

# You should see all buddy: commands:
# /buddy:persona, /buddy:commit, /buddy:docs, etc.

# Test a command
/buddy:foundation
```

## Commands

Claude Buddy provides 8 powerful slash commands:

| Command | Description | Usage |
|---------|-------------|-------|
| **`/buddy:persona`** | Activate specialized personas | `/buddy:persona Review authentication for security issues` |
| **`/buddy:foundation`** | Initialize project foundation | `/buddy:foundation` |
| **`/buddy:spec`** | Create feature specifications | `/buddy:spec Build REST API for user management` |
| **`/buddy:plan`** | Generate implementation plans | `/buddy:plan` |
| **`/buddy:tasks`** | Break down plans into tasks | `/buddy:tasks` |
| **`/buddy:implement`** | Execute tasks with TDD | `/buddy:implement` |
| **`/buddy:commit`** | Create professional git commits | `/buddy:commit` |
| **`/buddy:docs`** | Generate comprehensive documentation | `/buddy:docs` |

## Personas

Claude Buddy includes 12 specialized AI personas that provide expert perspectives:

### Technical Specialists
- **Architect** (🏛️) - Systems design & long-term architecture
- **Frontend** (🎨) - UI/UX & accessibility
- **Backend** (⚙️) - APIs & reliability engineering
- **Security** (🛡️) - Threat modeling & vulnerabilities
- **Performance** (⚡) - Optimization & bottleneck elimination

### Process Experts
- **Analyzer** (🔍) - Root cause analysis
- **QA** (✅) - Testing & quality advocacy
- **Refactorer** (🔧) - Code quality & technical debt
- **DevOps** (🚀) - Infrastructure & deployment
- **PO** (📋) - Product requirements & strategy

### Knowledge Specialists
- **Mentor** (👨‍🏫) - Knowledge transfer & education
- **Scribe** (✍️) - Documentation & writing

### Using Personas

**Auto-Activation Mode (Recommended):**
```bash
/buddy:persona Review this authentication system for security issues
# → Automatically activates Security + Backend personas
```

**Manual Selection:**
```bash
/buddy:persona frontend qa - Test this component for accessibility
# → Explicitly activates Frontend + QA personas
```

**Collaboration Patterns:**
- `architect + performance` → System design with performance budgets
- `security + backend` → Secure server-side development
- `frontend + qa` → User-focused development with testing
- `mentor + scribe` → Educational content creation

## Safety Features

Claude Buddy implements defense-in-depth protection through the **Damage Control** security skill:

### Path Protection (Three Levels)
- **zeroAccessPaths**: Complete block - no read, write, edit, or delete
  - Protects: `.env`, `~/.ssh/`, `*.pem`, `~/.aws/`, credentials, keys
- **readOnlyPaths**: Read allowed, modifications blocked
  - Protects: `/etc/`, `*.lock`, `node_modules/`, build artifacts
- **noDeletePaths**: All operations except delete
  - Protects: `~/.claude/`, `LICENSE`, `README.md`, `.git/`

### Command Pattern Blocking
- Blocks dangerous bash commands via regex patterns
- Categories: destructive file ops, git operations, cloud CLI, database CLI
- Examples: `rm -rf`, `git reset --hard`, `aws s3 rm --recursive`
- **Ask patterns**: Some operations trigger confirmation dialog instead of blocking

### Git Safety
- `git push --force` blocked (use `--force-with-lease`)
- `git reset --hard` blocked
- `git stash drop` requires confirmation
- Branch deletion operations require confirmation

### Installation
```bash
/buddy:install-damage-control-system
```

### Configuration
All patterns configured via `patterns.yaml` (single source of truth). See [hooks documentation](docs/hooks.md) for details.

## Enterprise Templates

### MuleSoft API Platform
- RAML specifications
- DataWeave transformations
- MUnit test suites
- CloudHub deployment
- Error handling flows

### JHipster Full-Stack
- Spring Boot backend
- Angular/React/Vue frontend
- Microservices architecture
- JWT/OAuth2 authentication
- Docker & Kubernetes

### Default Template
- General-purpose development
- Language-agnostic
- Flexible workflows


## Usage Examples

### Complete Feature Development

```bash
# 1. Initialize project foundation
/buddy:foundation

# 2. Create a specification
/buddy:spec Build a REST API for user management with CRUD operations,
authentication, and role-based access control

# 3. Generate implementation plan
/buddy:plan

# 4. Create task breakdown
/buddy:tasks

# 5. Execute implementation (TDD approach)
/buddy:implement

# 6. Commit changes
/buddy:commit

# 7. Generate documentation
/buddy:docs
```

### Get Expert Review

```bash
# Security review
/buddy:persona security backend - Review this authentication implementation

# Architecture guidance
/buddy:persona architect - How should I structure this microservices platform?

# Performance optimization
/buddy:persona performance - Optimize this database query
```

### Quick Tasks

```bash
# Professional git commit
/buddy:commit

# Generate project documentation
/buddy:docs

# Get architectural guidance
/buddy:persona architect - Best practices for API versioning?
```

## Troubleshooting

### Commands Not Available

**Issue:** `/buddy:*` commands don't appear in `/help`

**Solution:**
1. Verify plugin is installed: `/plugin`
2. Check marketplace is added: `/plugin marketplace list`
3. Restart Claude Code
4. Reinstall if needed: `/plugin uninstall buddy@claude-buddy-marketplace` then `/plugin install buddy@claude-buddy-marketplace`

### Hook Execution Errors

**Issue:** Hooks fail with Python or uv errors

**Solution:**
1. Verify Python is installed: `python --version` (should be ≥3.8)
2. Verify uv is installed: `uv --version`
3. Add Python/uv to PATH if needed
4. Check hook permissions: `chmod +x hooks/*.py`

### Personas Not Activating

**Issue:** Persona commands don't load specialized context

**Solution:**
1. Check that Skills are in `skills/persona-*/` directories (flat hyphenated structure)
2. Verify SKILL.md files exist for each persona
3. Try explicit persona selection: `/buddy:persona architect backend - your question`
4. Check Claude Code version (latest required)

## Support

- **GitHub Issues**: [Report bugs](https://github.com/rsts-dev/claude-buddy/issues)
- **Discussions**: [Ask questions](https://github.com/rsts-dev/claude-buddy/discussions)
- **Website**: [https://claude-buddy.dev](https://claude-buddy.dev)

## License

MIT License - see LICENSE file for details.

Copyright (c) 2025 Claude Buddy Contributors

---

**Claude Buddy Plugin v5.0.0** - Enterprise-Ready AI Development Platform
