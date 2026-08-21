---
description: Decompose an epic/PRD into PIV-sized vertical-slice stories with a dependency graph, publish the breakdown to Confluence, and create the missing Jira stories.
argument-hint: "[jira-epic-key | confluence-page-id | path/to/prd.md]"
---

Read and execute the Spec skill at `skills/Spec/SKILL.md`.

**User provided input**: $ARGUMENTS

Parse arguments for a Jira epic key, a Confluence page id, or a local PRD path. The PRD/epic is the source of truth; slice it into independently executable stories.
