---
name: MuleSoftSetup
description: Install the official MuleSoft API-design skills by driving their upstream install — a thin wrapper, nothing vendored. The skills (api-spec-validator, api-doc-generator, api-schema-inferrer, jtbd-generator, jtbd-validator, review-pr, skill-quality-review, validate-imperative-format) come from mulesoft/mulesoft-dx and are published for install via a plugin marketplace. USE WHEN setup mulesoft skills, install mulesoft skills, mulesoft dx skills, anypoint api skills, api spec validator, jtbd skills, /setup:mulesoft.
---

# MuleSoftSetup

Install MuleSoft's official API-design skill collection by driving the **upstream install**, the same thin-wrapper way `/setup:lifeos` drives the LifeOS installer. This skill does not copy or vendor the MuleSoft skills — it fetches the upstream repo's current install instructions at run time and drives them with permission, so the install never drifts from upstream.

## What gets installed

The MuleSoft API-design skills from [`mulesoft/mulesoft-dx`](https://github.com/mulesoft/mulesoft-dx/tree/master/skills):

- **api-spec-validator** — validate OpenAPI specs against agent-friendly best practices (Anypoint CLI under the hood)
- **api-doc-generator**, **api-schema-inferrer** — generate docs / infer schemas
- **jtbd-generator**, **jtbd-validator** — Jobs-To-Be-Done driven API design
- **review-pr**, **skill-quality-review**, **validate-imperative-format** — review + quality helpers

These support an API-spec-first, JTBD-driven workflow that complements the `buddy` `mulesoft` domain.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/MuleSoftSetup/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

- **Anypoint CLI v4** with the API Project plugin (the validation skills call it under the hood)
- **Node.js + npm** (for the CLI)
- **Python 3** (some skill scripts)

If a prerequisite is missing, report it and let the user decide whether to proceed or install it first — do not block silently.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **InstallMuleSoftSkills** | Any `/setup:mulesoft` invocation | `Workflows/InstallMuleSoftSkills.md` |

## Hard rules

- **Thin wrapper.** Fetch the upstream install instructions at run time; do not hardcode a stale command or vendor the skills.
- **Permission before mutation.** `/plugin marketplace add` and any install run only after the user says yes.
- **Additive.** Never remove existing skills or marketplaces.

## Source

- Repo: `https://github.com/mulesoft/mulesoft-dx` (skills under `skills/`)
- The upstream README is the source of truth for the exact `/plugin marketplace add …` target — read it at run time.

## Examples

```
User: "/setup:mulesoft"
→ Checks Anypoint CLI v4 (+ API Project plugin), Node, Python 3
→ Fetches the mulesoft-dx README for the current install command
→ Drives `/plugin marketplace add …` with permission
→ Verifies the 8 skills are available; reports
```
