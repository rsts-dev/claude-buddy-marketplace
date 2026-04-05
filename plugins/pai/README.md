# PAI Setup Plugin

[< Back to Marketplace](../../README.md) | [Marketplace Docs](../../docs/README.md)

Install and configure [Daniel Miessler's Personal AI Infrastructure (PAI)](https://github.com/danielmiessler/Personal_AI_Infrastructure) with guided identity customization and persistent user data.

## What It Does

1. **Clones** the PAI repository and detects the latest release version
2. **Creates** `~/.buddy/` as a persistent user data store with MEMORY and PAI-USER folders
3. **Installs** the full PAI release to `~/.claude/`
4. **Symlinks** `~/.claude/MEMORY` and `~/.claude/PAI/USER` to `~/.buddy/` so user data persists across upgrades
5. **Guides** you through customizing identity files (ABOUTME, AI steering rules, opinions, DA identity, writing style)
6. **Upgrades** existing installations by merging new files without overwriting your customizations

## Prerequisites

- **git** — Required to clone the PAI repository
- **curl** — Required by the PAI installer
- **bun** — Installed automatically by the PAI installer if not present

## Usage

### Fresh Install

```
/pai:setup
```

or

```
/pai:setup install
```

### Upgrade Existing Installation

```
/pai:setup upgrade
```

### Customize Identity Files

```
/pai:setup customize
```

### Verify Installation

```
/pai:setup verify
```

## Documentation

- [Architecture](docs/architecture.md) -- File system layout, symlink strategy, design decisions
- [Workflows](docs/workflows.md) -- Install, upgrade, customize, verify workflow details

## Source Repository

[Personal_AI_Infrastructure](https://github.com/danielmiessler/Personal_AI_Infrastructure) by Daniel Miessler. Releases are versioned as `v{major}.{minor}.{patch}`.
