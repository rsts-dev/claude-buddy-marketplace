# Setup Guide

[< Back to Docs](README.md)

## Prerequisites

| Requirement | Purpose | Install |
|-------------|---------|---------|
| **Claude Code** | Runtime environment | `npm install -g @anthropic-ai/claude-code` |
| **git** | Repository cloning, source control | System package manager |
| **curl** | PAI installer bootstrap | Usually pre-installed |
| **Bun** | PAI runtime dependency | Auto-installed by PAI, or [bun.sh](https://bun.sh) |
| **gh CLI** | Pull request creation (optional) | [cli.github.com](https://cli.github.com) |

## Installation

### Step 1: Add the Marketplace

```
/plugin marketplace add rsts-dev/claude-buddy-marketplace
```

### Step 2: Install Plugins

```
/plugin install pai@claude-buddy-marketplace
/plugin install buddy@claude-buddy-marketplace
```

### Step 3: Restart Claude Code

Close and reopen your session. Plugins activate on start.

### Step 4: Set Up PAI

```
/pai:setup
```

See [PAI Workflows](../plugins/pai/docs/workflows.md) for what this does in detail.

### Step 5: Initialize Your Project

```
/buddy:foundation
```

See [Buddy Skills > Foundation](../plugins/buddy/docs/skills.md#foundation) for details on domain detection.

## Verifying Installation

```
/pai:setup verify
```

See [PAI Workflows > VerifyInstallation](../plugins/pai/docs/workflows.md#verifyinstallation) for the full checklist.

## Configuration

### Customizing Skills

Each buddy skill checks for preferences at:

```
~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/{SkillName}/PREFERENCES.md
```

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

```
/buddy:foundation create domain
```

See [Domain System > Creating Custom Domains](../plugins/buddy/docs/domains.md#creating-custom-domains) for the wizard walkthrough.

### Customizing PAI Identity

```
/pai:setup customize
```

See [PAI Workflows > CustomizeIdentity](../plugins/pai/docs/workflows.md#customizeidentity) for what each file covers.

## Development Workflow

```
/buddy:foundation          # Once per project
/buddy:spec {description}  # Define feature
/buddy:plan                # Create implementation plan
/buddy:tasks               # Generate TDD task breakdown
/buddy:implement           # Execute tasks (red-green-refactor)
/buddy:commit              # Commit with conventional message
/buddy:docs                # Generate documentation
```

See [Commands Reference](../plugins/buddy/docs/commands.md) for full usage and arguments.

## Upgrading

### Upgrade PAI

```
/pai:setup upgrade
```

See [PAI Workflows > UpgradePAI](../plugins/pai/docs/workflows.md#upgradepai).

### Upgrade Plugins

```
/plugin install buddy@claude-buddy-marketplace
/plugin install pai@claude-buddy-marketplace
```
