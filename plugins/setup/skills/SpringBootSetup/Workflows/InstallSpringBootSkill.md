# InstallSpringBootSkill Workflow

Install Julien Dubois' Dr JSkill Spring Boot generator by driving its upstream install. Thin wrapper — fetch the current instructions at run time, nothing vendored.

## Variables

```
UPSTREAM_REPO: https://github.com/jdubois/dr-jskill
UPSTREAM_README: https://raw.githubusercontent.com/jdubois/dr-jskill/main/README.md
SKILLS_DIR: ~/.claude/skills
TARGET: ~/.claude/skills/dr-jskill
ARGS: $ARGUMENTS
```

## Instructions

- Thin wrapper: read the upstream README/SKILL.md for the current install path (skills-dir location may vary).
- Permission before every mutation. Additive only — do not overwrite an existing `dr-jskill` without confirmation.
- Degrade gracefully: a missing runtime (Java 25 / Docker) does not block installing the skill; report and continue.

## Workflow

### Step 1: Verify prerequisites

```bash
java -version 2>&1 | head -1 || echo NO_JAVA
node --version 2>/dev/null || echo NO_NODE
docker info >/dev/null 2>&1 && echo DOCKER_OK || echo NO_DOCKER
```
Report each: Java 25, Node 24.x/npm 11.x, Docker running. For any missing, say how to install and ask whether to continue (the skill can still be installed).

### Step 2: Fetch the current upstream install instructions

Fetch `UPSTREAM_README` (WebFetch). It documents cloning the single-skill repo into a skills directory that Claude Code discovers. Use whatever the README currently specifies for the path.

### Step 3: Drive the official install (with permission)

1. Check for an existing install:
```bash
test -d ~/.claude/skills/dr-jskill && echo EXISTS
```
If it exists, offer to update (`git -C ~/.claude/skills/dr-jskill pull`) instead of re-cloning.
2. Present the clone command; after confirmation:
```bash
mkdir -p ~/.claude/skills
git clone https://github.com/jdubois/dr-jskill ~/.claude/skills/dr-jskill
```
(Use the exact target the README specifies if different.)

### Step 4: Verify

```bash
test -f ~/.claude/skills/dr-jskill/SKILL.md && echo SKILL_PRESENT || echo MISSING
```
Confirm the skill is discoverable.

## Report

```
## Dr JSkill (Spring Boot) Installed

- Source: jdubois/dr-jskill
- Location: ~/.claude/skills/dr-jskill (SKILL.md {present|missing})
- Prerequisites: Java 25 {ok|missing}, Node 24.x {ok|missing}, Docker {running|not running}

### Next
- Ask the skill to generate a Spring Boot project.
- Restart Claude Code if the skill is not yet listed.
```
