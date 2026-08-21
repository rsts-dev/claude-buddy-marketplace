# Setup Plugin

[< Back to Marketplace](../../README.md) | [Marketplace Docs](../../docs/README.md)

A multi-target **setup** plugin. Each command is a **thin wrapper** that drives the *official* upstream installer for a tool — it never vendors or re-implements anything, so installs stay current with upstream and mutate only with your permission.

| Command | Installs | Upstream | Prerequisites |
|---------|----------|----------|---------------|
| `/setup:lifeos` | LifeOS — the Life Operating System (evolution of PAI) | [danielmiessler/LifeOS](https://github.com/danielmiessler/LifeOS) | bun, git, curl |
| `/setup:mulesoft` | MuleSoft API-design skills (api-spec-validator, jtbd-*, …) | [mulesoft/mulesoft-dx](https://github.com/mulesoft/mulesoft-dx/tree/master/skills) | Anypoint CLI v4, Node, Python 3 |
| `/setup:salesforce` | Salesforce agent skills (Agentforce, DX Code Analyzer, org mgmt) | [forcedotcom/sf-skills](https://github.com/forcedotcom/sf-skills) | Salesforce CLI (`sf`), Node |
| `/setup:springboot` | Dr JSkill — Spring Boot 4.x project generator | [jdubois/dr-jskill](https://github.com/jdubois/dr-jskill) | Java 25, Node 24.x, Docker |

## Usage

### LifeOS (the Life Operating System)

```
/setup:lifeos                 # install + onboard (interview)
/setup:lifeos doctor          # check what's live
/setup:lifeos update          # idempotent re-overlay
```
Drives the official LifeOS installer end to end (setup/interview/doctor/update/uninstall).

### MuleSoft skills

```
/setup:mulesoft
```
Fetches the `mulesoft-dx` install instructions at run time and drives the official `/plugin marketplace add …`. Installs the 8 API-design skills. Pairs with the buddy `mulesoft` domain.

### Salesforce skills

```
/setup:salesforce
```
Drives `/plugin marketplace add forcedotcom/sf-skills` (or `npx skills add forcedotcom/sf-skills`) and installs the `salesforce-development` plugin (~41 skills). Pairs with the buddy `salesforce` domain. Upstream warns skills may change between releases.

### Spring Boot (Dr JSkill)

```
/setup:springboot
```
Clones Julien Dubois' `dr-jskill` into your skills directory (e.g. `~/.claude/skills/dr-jskill`). Generates Java 25 + Spring Boot 4.x + PostgreSQL + Docker projects, optionally with Vue/React/Angular frontends.

## Why thin wrappers

Each target fetches its upstream repo's *current* install instructions at run time and drives them with permission. Nothing is vendored, so:
- installs never drift from upstream,
- you see and approve every mutation (`/plugin marketplace add`, `git clone`, …),
- prerequisites are checked and reported, and missing ones don't block silently.

## LifeOS detail

LifeOS is the evolution of PAI, shipped as one self-contained skill. `/setup:lifeos` bootstraps and drives its official installer (AI-native `INSTALL.md` at `ourlifeos.ai/install`, or the `curl … install.sh` shortcut), scaffolds the USER tree, wires hooks with permission, and runs the interview. Installing LifeOS this way supersedes the deprecated `pai` plugin.

## Documentation

- [Architecture](docs/architecture.md) — the four setup targets, thin-wrapper model
- [Workflows](docs/workflows.md) — per-target detail

## Sources

LifeOS by Daniel Miessler; MuleSoft skills by MuleSoft (`mulesoft/mulesoft-dx`); Salesforce skills by Salesforce (`forcedotcom/sf-skills`); Dr JSkill by Julien Dubois (`jdubois/dr-jskill`). Distribution versions are the upstream release tags, not this plugin's `version`.
