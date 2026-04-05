# Setup Guide

## Prerequisites

| Requirement | Purpose | Install |
|-------------|---------|---------|
| **Claude Code** | Runtime environment | `npm install -g @anthropic-ai/claude-code` |
| **git** | Repository cloning, source control | System package manager |
| **curl** | PAI installer bootstrap | Usually pre-installed |
| **Bun** | PAI runtime dependency | Auto-installed by PAI installer, or [bun.sh](https://bun.sh) |
| **gh CLI** | Pull request creation (optional) | [cli.github.com](https://cli.github.com) |

## Installation

### Step 1: Add the Marketplace

Inside Claude Code:

```
/plugin marketplace add rsts-dev/claude-buddy-marketplace
```

This registers the marketplace so Claude Code can discover its plugins.

### Step 2: Install Plugins

```
# PAI infrastructure (required by buddy)
/plugin install pai@claude-buddy-marketplace

# Core development platform
/plugin install buddy@claude-buddy-marketplace
```

### Step 3: Restart Claude Code

Close and reopen your Claude Code session. Plugins activate on session start.

### Step 4: Set Up PAI

```
/pai:setup
```

This will:
1. Clone the PAI repository and detect the latest release
2. Create `~/.buddy/` for persistent user data
3. Install PAI to `~/.claude/`
4. Create symlinks so user data survives upgrades
5. Optionally walk you through identity customization

### Step 5: Initialize Your Project

Navigate to your project directory and run:

```
/buddy:foundation
```

This analyzes your codebase, auto-detects the technology domain (React, JHipster, MuleSoft, or generic), and creates `/directive/foundation.md` with project principles and governance rules.

## Verifying Installation

### Check PAI

```
/pai:setup verify
```

Validates:
- `~/.buddy/` directory structure
- `~/.claude/` PAI installation
- Symlinks between them
- Version file at `~/.buddy/.pai-version`

### Check Buddy

After running `/buddy:foundation`, verify:
- `/directive/foundation.md` exists in your project
- The foundation contains your detected domain type
- Slash commands respond: try `/buddy:spec test feature`

## Configuration

### Customizing Skills

Each skill checks for user preferences at:

```
~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/{SkillName}/PREFERENCES.md
```

Available customization points:

| Skill | Customizes |
|-------|------------|
| `SourceControl/` | Commit templates, branch naming, protected branches |
| `Foundation/` | Principle templates, governance rules, custom domains |
| `Spec/` | Specification format, domain-specific requirements |
| `Plan/` | Planning style, phase definitions |
| `Tasks/` | Task granularity, parallel execution preferences |
| `Implementation/` | Execution preferences, checkpoint behavior |
| `Docs/` | Documentation style, sections to include/exclude |

### Adding Custom Domains

If your project uses a technology not covered by the built-in domains:

```
/buddy:foundation create domain
```

The interactive wizard generates detection rules, analysis workflows, and templates for your technology stack. Custom domains are stored in:

```
~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/
```

### Customizing PAI Identity

```
/pai:setup customize
```

Walks you through configuring:
- **ABOUTME.md** — Your background, role, and goals
- **AISTEERINGRULES.md** — AI behavioral rules
- **OPINIONS.md** — Your perspectives and preferences
- **DAIDENTITY.md** — Digital assistant identity and voice
- **WRITINGSTYLE.md** — Writing preferences and tone

## Development Workflow

The typical workflow after setup:

```
/buddy:foundation          # Once per project
/buddy:spec {description}  # Define feature
/buddy:plan                # Create implementation plan
/buddy:tasks               # Generate TDD task breakdown
/buddy:implement           # Execute tasks (red-green-refactor)
/buddy:commit              # Commit with conventional message
/buddy:docs                # Generate documentation
```

Each step builds on the previous step's output. Steps 2-6 repeat for each feature.

## Upgrading

### Upgrade PAI

```
/pai:setup upgrade
```

Merges new PAI files without overwriting your customizations in `~/.buddy/`.

### Upgrade Plugins

```
/plugin install buddy@claude-buddy-marketplace
/plugin install pai@claude-buddy-marketplace
```

Reinstalling fetches the latest version from the marketplace repository.
