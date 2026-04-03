---
name: PAISetup
description: Install, upgrade, and configure Daniel Miessler's Personal AI Infrastructure (PAI) memory system with guided identity customization. USE WHEN PAI setup, PAI install, install PAI, setup PAI, upgrade PAI, update PAI, personal AI infrastructure, memory system setup, identity files, PAI configuration, danielmiessler PAI, customize PAI identity, verify PAI installation.
---

# PAISetup

Install and configure PAI with persistent user data at `~/.buddy/` and symlinked into `~/.claude/` for seamless PAI integration.

## Overview

This skill automates the PAI installation process:

1. **Clones** the PAI repository and detects the latest release version
2. **Copies** MEMORY and PAI/USER files to `~/.buddy/` (persistent user data store)
3. **Installs** the full PAI release to `~/.claude/`
4. **Symlinks** `~/.claude/MEMORY` and `~/.claude/PAI/USER` to `~/.buddy/` so user data persists across upgrades
5. **Optionally customizes** identity files through guided questionnaires

## After Installation

```
~/.buddy/                              # Persistent user data (survives upgrades)
├── .pai-version                       # Installed PAI version
├── MEMORY/                            # Memory system
│   └── README.md
└── PAI-USER/                          # User identity & configuration
    ├── README.md
    ├── ABOUTME.md                     # Your background and goals
    ├── AISTEERINGRULES.md             # AI behavior rules
    ├── OPINIONS.md                    # Your perspectives
    ├── DAIDENTITY.md                  # Digital assistant identity
    ├── WRITINGSTYLE.md                # Writing preferences
    ├── TELOS/                         # Goals, beliefs, wisdom
    ├── BUSINESS/                      # Business context
    ├── PROJECTS/                      # Project registry
    └── ...                            # Other PAI USER directories

~/.claude/                             # PAI installation
├── MEMORY -> ~/.buddy/MEMORY          # Symlink to persistent data
├── PAI/
│   └── USER -> ~/.buddy/PAI-USER     # Symlink to persistent data
├── install.sh                         # PAI installer
├── PAI-Install/                       # Installer engine
└── ...                                # Full PAI installation
```

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **InstallPAI** | "install PAI", "setup PAI", fresh install (no `~/.buddy/.pai-version`) | `Workflows/InstallPAI.md` |
| **UpgradePAI** | "update PAI", "upgrade PAI", existing install detected | `Workflows/UpgradePAI.md` |
| **CustomizeIdentity** | "customize PAI", "setup identity", "configure identity files" | `Workflows/CustomizeIdentity.md` |
| **VerifyInstallation** | "verify PAI", "check PAI installation", "PAI status" | `Workflows/VerifyInstallation.md` |

## Auto-Detection

When invoked without explicit trigger:
1. Check if `~/.buddy/.pai-version` exists
2. If **no** -> route to `Workflows/InstallPAI.md` (fresh install)
3. If **yes** -> route to `Workflows/UpgradePAI.md` (upgrade)

## Examples

**Example 1: Fresh install**
```
User: "Install PAI"
-> Detects no existing installation
-> Clones PAI repo, finds latest version (e.g., v4.0.3)
-> Creates ~/.buddy/ with MEMORY and PAI-USER
-> Installs PAI to ~/.claude/ with symlinks
-> Runs PAI installer
-> Offers identity customization
```

**Example 2: Upgrade existing installation**
```
User: "Upgrade PAI"
-> Reads current version from ~/.buddy/.pai-version
-> Clones repo, finds latest version
-> Merges new files into ~/.buddy/ (preserves customizations)
-> Upgrades ~/.claude/ with re-created symlinks
-> Runs PAI installer + BuildCLAUDE.ts
```

**Example 3: Customize identity files**
```
User: "Customize my PAI identity"
-> Walks through ABOUTME.md, AISTEERINGRULES.md, OPINIONS.md, DAIDENTITY.md, WRITINGSTYLE.md
-> For each: asks relevant questions, compiles answers, writes to ~/.buddy/PAI-USER/
-> Optionally customizes subdirectories (TELOS, BUSINESS, PROJECTS)
```

## Prerequisites

- **git** - Required to clone the PAI repository
- **curl** - Required by the PAI installer bootstrap
- **bun** - Installed automatically by the PAI installer if not present

## Source Repository

`https://github.com/danielmiessler/Personal_AI_Infrastructure.git`

Releases are in the `Releases/` folder, versioned as `v{major}.{minor}.{patch}` (e.g., `v4.0.3`).
