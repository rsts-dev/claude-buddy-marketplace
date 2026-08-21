---
name: SpringBootSetup
description: Install Julien Dubois' Dr JSkill — a Spring Boot 4.x project generator skill — by driving its upstream install (clone into your skills directory). Thin wrapper, nothing vendored. Generates Java 25 + Spring Boot + PostgreSQL + Docker projects, optionally with Vue/React/Angular frontends. USE WHEN setup spring boot, install dr jskill, spring boot generator, java project skill, julien dubois skill, /setup:springboot.
---

# SpringBootSetup

Install the **Dr JSkill** Spring Boot generator by driving its **upstream install**, the same thin-wrapper way `/setup:lifeos` drives the LifeOS installer. Nothing is vendored — the skill fetches the upstream repo's current install instructions at run time and drives them with permission.

## What gets installed

[`jdubois/dr-jskill`](https://github.com/jdubois/dr-jskill) — Julien Dubois' single-skill repo that generates Java + Spring Boot 4.x projects following his best practices: web apps, full-stack systems with PostgreSQL, REST APIs, Docker, optionally paired with Vue.js / React / Angular / vanilla JS frontends.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/SpringBootSetup/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

- **Java 25**
- **Node.js 24.x / npm 11.x** (frontend generation)
- **Docker** (running)
- Optional: JDTLS for semantic Java navigation

If a prerequisite is missing, report it and let the user decide whether to proceed — the skill can still be installed even if a runtime is absent.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **InstallSpringBootSkill** | Any `/setup:springboot` invocation | `Workflows/InstallSpringBootSkill.md` |

## Hard rules

- **Thin wrapper.** Fetch the upstream README/SKILL.md at run time and follow its install; do not vendor the skill.
- **Permission before mutation.** The clone into the skills directory runs only after the user confirms.
- **Additive.** Never overwrite an existing `dr-jskill` install without confirmation.

## Source

- Repo: `https://github.com/jdubois/dr-jskill` (single-skill repo; `SKILL.md` at root + bundled Node scripts)
- Read the upstream README at run time for the current install path.

## Examples

```
User: "/setup:springboot"
→ Checks Java 25, Node 24.x/npm 11.x, Docker
→ Fetches the dr-jskill README for the current install command
→ Clones it into the skills dir (e.g. ~/.claude/skills/dr-jskill) with permission
→ Verifies SKILL.md is discoverable; reports
```
