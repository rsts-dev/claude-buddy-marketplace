# PAI Setup Plugin

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
/pai:pai-setup
```

or

```
/pai:pai-setup install
```

### Upgrade Existing Installation

```
/pai:pai-setup upgrade
```

### Customize Identity Files

```
/pai:pai-setup customize
```

### Verify Installation

```
/pai:pai-setup verify
```

## Architecture

```
~/.buddy/                              # Persistent (survives upgrades)
├── .pai-version
├── MEMORY/
└── PAI-USER/
    ├── ABOUTME.md
    ├── AISTEERINGRULES.md
    ├── OPINIONS.md
    ├── DAIDENTITY.md
    ├── WRITINGSTYLE.md
    └── {subdirectories}/

~/.claude/                             # PAI installation
├── MEMORY -> ~/.buddy/MEMORY          # Symlink
├── PAI/USER -> ~/.buddy/PAI-USER      # Symlink
└── {full PAI release}
```

## Plugin Structure

```
plugins/pai/
├── .claude-plugin/plugin.json
├── commands/pai-setup.md
├── skills/PAISetup/
│   ├── SKILL.md
│   └── Workflows/
│       ├── InstallPAI.md
│       ├── UpgradePAI.md
│       ├── CustomizeIdentity.md
│       ├── CustomizeAboutMe.md
│       ├── CustomizeAISteeringRules.md
│       ├── CustomizeOpinions.md
│       ├── CustomizeDAIdentity.md
│       ├── CustomizeWritingStyle.md
│       ├── CustomizeSubdirectories.md
│       └── VerifyInstallation.md
└── README.md
```

## Source Repository

[Personal_AI_Infrastructure](https://github.com/danielmiessler/Personal_AI_Infrastructure) by Daniel Miessler

Releases are in the `Releases/` folder, versioned as `v{major}.{minor}.{patch}`.
