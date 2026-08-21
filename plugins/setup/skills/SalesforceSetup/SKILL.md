---
name: SalesforceSetup
description: Install the official Salesforce agent skills by driving their upstream install — a thin wrapper, nothing vendored. The skills come from forcedotcom/sf-skills (a "salesforce" marketplace with the salesforce-development plugin, ~41 skills: Agentforce, DX Code Analyzer, org management, Flow automation). USE WHEN setup salesforce skills, install salesforce skills, sf skills, agentforce skills, salesforce development plugin, dx code analyzer, /setup:salesforce.
---

# SalesforceSetup

Install Salesforce's official agent-skills collection by driving the **upstream install**, the same thin-wrapper way `/setup:lifeos` drives the LifeOS installer. Nothing is vendored — the skill fetches the upstream repo's current install instructions at run time and drives them with permission.

## What gets installed

The `salesforce-development` plugin from [`forcedotcom/sf-skills`](https://github.com/forcedotcom/sf-skills) (a marketplace named `salesforce`, ~41 skills), including:

- **agentforce-generate / -observe / -test** — build, monitor, and security-test Agentforce agents
- **dx-code-analyzer-run / -configure / -custom-rule-create** — code analysis
- **dx-org-manage** — scratch-org / org lifecycle
- **automation-flow-generate** — Flow automation

These complement the `buddy` `salesforce` domain.

## Customization

Before executing, check `~/.claude/LIFEOS/USER/CUSTOMIZATIONS/SKILLS/SalesforceSetup/PREFERENCES.md`. If present, load and apply it; otherwise use defaults.

## Prerequisites

- **Salesforce CLI (`sf`)** — required by most skills
- **Node.js + npm** — for `npx skills add` / CLI tooling

If a prerequisite is missing, report it and let the user decide whether to proceed.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **InstallSalesforceSkills** | Any `/setup:salesforce` invocation | `Workflows/InstallSalesforceSkills.md` |

## Hard rules

- **Thin wrapper.** Fetch the upstream install at run time; do not vendor the skills. Upstream warns skills may be renamed/removed between releases.
- **Permission before mutation.** `/plugin marketplace add` / `npx skills add` run only after the user confirms.
- **Additive.** Never remove existing skills or marketplaces.

## Source

- Repo: `https://github.com/forcedotcom/sf-skills` (marketplace `salesforce`, plugin `salesforce-development`)
- Read the upstream README at run time for the current install command.

## Examples

```
User: "/setup:salesforce"
→ Checks Salesforce CLI (`sf`) + Node
→ Fetches the sf-skills README for the current install command
→ Drives `/plugin marketplace add forcedotcom/sf-skills` (+ install salesforce-development) or `npx skills add forcedotcom/sf-skills`, with permission
→ Verifies the skills are available; reports
```
