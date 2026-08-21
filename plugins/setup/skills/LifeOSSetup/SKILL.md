---
name: LifeOSSetup
description: Install and onboard LifeOS — the Life Operating System, the evolution of PAI. Drives the official self-contained LifeOS installer end to end (setup, interview, doctor, update, uninstall) rather than re-implementing it. USE WHEN LifeOS setup, install LifeOS, setup LifeOS, lifeos setup, integrate LifeOS into my harness, lifeos interview, onboard me, run the interview, TELOS capture, lifeos doctor, check my install, what capabilities are live, update LifeOS, uninstall LifeOS, remove LifeOS, life operating system, evolution of PAI, danielmiessler LifeOS.
---

# LifeOSSetup

Install and onboard LifeOS by driving its **official, self-contained installer**. LifeOS is the evolution of PAI (Personal AI Infrastructure): the same system renamed and repackaged (upstream v6.0.0) into a single Claude Code skill whose agentic installer wires everything into `~/.claude/` with permission at each step. This plugin is a **thin wrapper** — it bootstraps and drives that official installer; it does not copy or re-implement the LifeOS payload (system prompt, hooks, Pulse, the 50+ nested skills).

## Overview

1. **Bootstraps** the official LifeOS installer (AI-native `INSTALL.md`, served at `ourlifeos.ai/install`, or the terminal shortcut for Claude Code on macOS/Linux).
2. **Detects** OS + harness and surfaces conflicts before any mutation.
3. **Installs** LifeOS additively into `~/.claude/` — permission before every change, `settings.json` backed up first.
4. **Onboards** via the LifeOS interview: name the DA, capture principal identity, TELOS current state → ideal state, pull in the user's sources, seed the Pulse dashboard.
5. **Maintains** the install afterward via doctor (capability check), update (idempotent re-overlay), and uninstall (non-destructive removal).

## How install works

Two entry points, both served from the LifeOS distribution's own single sources of truth:

- **Primary (AI-native):** hand `INSTALL.md` (or its link, `https://ourlifeos.ai/install`) to the harness and say "install this." The installer runs under `bun` on any OS, detects env + harness, and wires integration with permission.
- **Terminal shortcut (Claude Code, macOS/Linux):**
  ```bash
  curl -fsSL https://ourlifeos.ai/install.sh | bash
  ```
  This drops the LifeOS skill, then the agentic setup takes over.

Both paths are non-destructive and additive by design — see Hard rules.

## After Installation

```
~/.claude/                              # LifeOS integrated into your harness
├── CLAUDE.md                           # routing table (identity @-imports activated by setup)
├── LIFEOS/                             # the LifeOS system tree
│   ├── LIFEOS_SYSTEM_PROMPT.md         # the constitution
│   ├── ALGORITHM/  ATLAS/  PULSE/      # subsystems (Pulse dashboard on :31337)
│   ├── TOOLS/Doctor.ts                 # capability doctor
│   ├── DOCUMENTATION/                  # subsystem docs
│   └── USER/                           # YOUR scaffold — TELOS, PRINCIPAL, DIGITAL_ASSISTANT, ...
├── hooks/                              # LifeOS hooks (wired with permission)
└── settings.json                       # merged additively; backed up before change
```

Nothing personal ships in the distribution — the `USER/` tree starts blank and is populated by the interview.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **InstallLifeOS** | `setup`, "install LifeOS", "integrate into my harness", fresh install | `Workflows/InstallLifeOS.md` |
| **RunInterview** | `interview`, "onboard me", "run the interview", TELOS capture | `Workflows/RunInterview.md` |
| **Doctor** | `doctor`, "check my install", "what's broken", "what capabilities are live" | `Workflows/Doctor.md` |
| **UpdateLifeOS** | `update`, "update LifeOS", after a version bump | `Workflows/UpdateLifeOS.md` |
| **UninstallLifeOS** | `uninstall`, "remove LifeOS" | `Workflows/UninstallLifeOS.md` |

Default flow (`/setup:lifeos` with no verb or `setup`): **InstallLifeOS** runs first (system integration), then transitions into **RunInterview** (life onboarding). One continuous experience, two clearly-marked phases. Setup ALWAYS runs before the interview — hooks must be wired before onboarding writes anything.

## Auto-Detection

When invoked without an explicit verb:
1. Check whether LifeOS is installed: `test -f ~/.claude/LIFEOS/VERSION`
2. If **no** → route to `Workflows/InstallLifeOS.md` (fresh install → interview)
3. If **yes** → offer `Workflows/Doctor.md` (health check) or `Workflows/UpdateLifeOS.md` (update)

## Hard rules (carried from the upstream LifeOS installer)

- **Setup before interview, always.** Hooks/integration land before any onboarding write.
- **Additive, never clobbering.** Setup writes are guarded; never overwrite or `rm` a populated dir or a foreign file.
- **Permission before mutation.** The installer shows the exact change and backs up `settings.json` before wiring hooks. Nothing changes without an explicit yes.
- **Dev-tree refusal.** The installer refuses to run inside the LifeOS source repo. Never mutate an author's live system.
- **Honor `decline`.** A declined capability is a legitimate way to run LifeOS, not a defect to nag about.

## Prerequisites

- **bun** — the LifeOS installer + tools run under bun (not a shell).
- **git** — used by the bootstrap.
- **curl** — used by the terminal-shortcut bootstrap.

## Examples

**Example 1: Fresh install + onboarding**
```
User: "/setup:lifeos"
→ Detects no ~/.claude/LIFEOS/VERSION (fresh)
→ Runs InstallLifeOS: detect env, surface conflicts, wire hooks with permission, scaffold USER tree
→ Transitions into RunInterview: name the DA, capture TELOS current→ideal, pull in sources, seed Pulse
```

**Example 2: Health check**
```
User: "/setup:lifeos doctor"
→ Runs Doctor.ts, relays the live/broken/declined/stale capability table
→ Offers the exact fix command for anything broken; honors declined capabilities
```

**Example 3: Update after a version bump**
```
User: "/setup:lifeos update"
→ Idempotent re-overlay of the official update path; non-destructive; preserves the USER tree
```

## Relationship to the `pai` plugin

LifeOS *is* PAI renamed and evolved. Installing LifeOS via this `setup` plugin (`/setup:lifeos`) supersedes the `pai` plugin in this marketplace. The `pai` plugin remains installable for existing installs and the `buddy` plugin's dependency, but new users should prefer `/setup:lifeos`.

## Source Repository

- Repo: `https://github.com/danielmiessler/LifeOS`
- Install doc: `https://ourlifeos.ai/install`
- The distribution version (what a user means by "LifeOS 7.x") is the GitHub release tag — not any component `version:` field.
