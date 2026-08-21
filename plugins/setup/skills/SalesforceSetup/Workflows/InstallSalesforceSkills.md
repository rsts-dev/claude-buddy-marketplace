# InstallSalesforceSkills Workflow

Install the official Salesforce agent skills by driving the upstream install. Thin wrapper — fetch the current instructions at run time, nothing vendored.

## Variables

```
UPSTREAM_REPO: https://github.com/forcedotcom/sf-skills
UPSTREAM_README: https://raw.githubusercontent.com/forcedotcom/sf-skills/main/README.md
MARKETPLACE: forcedotcom/sf-skills
PLUGIN: salesforce-development
ARGS: $ARGUMENTS
```

## Instructions

- Thin wrapper: read the upstream README for the current install method (marketplace add vs `npx skills add`).
- Permission before every mutation. Additive only.
- Upstream stability warning: skills may be renamed/restructured/removed between releases — surface this to the user.

## Workflow

### Step 1: Verify prerequisites

```bash
sf --version 2>/dev/null || echo NO_SF_CLI
node --version 2>/dev/null || echo NO_NODE
```
If the Salesforce CLI is missing, report how to install it (`npm install -g @salesforce/cli`) and ask whether to continue.

### Step 2: Fetch the current upstream install instructions

Fetch `UPSTREAM_README` (WebFetch). It documents two paths:
- Claude Code / other tools: `/plugin marketplace add forcedotcom/sf-skills` then install the `salesforce-development` plugin, **or** `npx skills add forcedotcom/sf-skills`.
- Agentforce Vibes: skills auto-install.
Use whatever the README currently specifies.

### Step 3: Drive the official install (with permission)

1. Ask the user which path they prefer (marketplace plugin vs `npx skills add`).
2. Present the exact command; after confirmation, run it:
   ```
   /plugin marketplace add forcedotcom/sf-skills
   ```
   then install the `salesforce-development` plugin — or `npx skills add forcedotcom/sf-skills`.

### Step 4: Verify

Confirm the skills are discoverable (marketplace added / plugin installed / skills listed). Note the upstream stability caveat.

## Report

```
## Salesforce Skills Installed

- Source: forcedotcom/sf-skills (marketplace `salesforce`, plugin `salesforce-development`)
- Method: {marketplace plugin | npx skills add}
- Prerequisites: Salesforce CLI {ok|missing}, Node {ok}
- Skills available: {agentforce-*, dx-code-analyzer-*, dx-org-manage, automation-flow-generate, ...}

### Next
- Use them alongside the buddy `salesforce` domain (`/buddy:foundation` in an sfdx project).
- Note: upstream may rename/remove skills between releases.
- Restart Claude Code if the new skills are not yet listed.
```
