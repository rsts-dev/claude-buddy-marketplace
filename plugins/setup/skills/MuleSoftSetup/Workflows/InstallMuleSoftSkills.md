# InstallMuleSoftSkills Workflow

Install the official MuleSoft API-design skills by driving the upstream install. Thin wrapper — fetch the current instructions at run time, nothing vendored.

## Variables

```
UPSTREAM_REPO: https://github.com/mulesoft/mulesoft-dx
UPSTREAM_README: https://raw.githubusercontent.com/mulesoft/mulesoft-dx/master/README.md
SKILLS: api-spec-validator, api-doc-generator, api-schema-inferrer, jtbd-generator, jtbd-validator, review-pr, skill-quality-review, validate-imperative-format
ARGS: $ARGUMENTS
```

## Instructions

- Thin wrapper: read the upstream README for the current install target; do not assume a hardcoded marketplace slug.
- Permission before every mutation. Additive only.
- Degrade gracefully: if a prerequisite is missing, report and let the user choose to proceed.

## Workflow

### Step 1: Verify prerequisites

```bash
anypoint-cli-v4 --version 2>/dev/null || anypoint-cli --version 2>/dev/null || echo NO_ANYPOINT_CLI
node --version 2>/dev/null || echo NO_NODE
python3 --version 2>/dev/null || echo NO_PYTHON3
```
For each missing tool, report it and how to install (Anypoint CLI v4 + API Project plugin via npm; Node; Python 3). Ask whether to continue anyway.

### Step 2: Fetch the current upstream install instructions

Fetch `UPSTREAM_README` (WebFetch) and locate the install section. The MuleSoft docs publish these skills for install through a plugin marketplace (the README names the exact `/plugin marketplace add …` target — historically `machaval/api-spec-skills`). Use whatever the README currently specifies; do not hardcode.

### Step 3: Drive the official install (with permission)

1. Present the exact command the README specifies, e.g.:
   ```
   /plugin marketplace add <target-from-readme>
   ```
2. After the user confirms, run it, then install/enable the skills per the README.
3. If the user prefers a project-local install, follow the README's alternative (copy the `skills/` dir) instead.

### Step 4: Verify

Confirm the skills are discoverable (list available skills / check the marketplace was added). Note any of the 8 expected skills that are missing.

## Report

```
## MuleSoft Skills Installed

- Source: mulesoft/mulesoft-dx (via {marketplace target from README})
- Prerequisites: Anypoint CLI v4 {ok|missing}, Node {ok}, Python 3 {ok|missing}
- Skills available: {list / count of the 8}

### Next
- Use them alongside the buddy `mulesoft` domain (`/buddy:foundation` in a Mule project).
- Restart Claude Code if the new skills are not yet listed.
```
