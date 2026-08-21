---
description: Install the official Salesforce agent skills (Agentforce, DX Code Analyzer, org management, …) from forcedotcom/sf-skills. Salesforce CLI prerequisite.
---

Read and execute the SalesforceSetup skill at `skills/SalesforceSetup/SKILL.md`.

**User provided input**: $ARGUMENTS

The skill fetches the upstream install instructions at run time and drives the official install (`/plugin marketplace add forcedotcom/sf-skills` or `npx skills add`) with permission. Nothing is vendored.
