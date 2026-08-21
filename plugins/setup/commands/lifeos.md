---
description: Install and onboard LifeOS (the Life Operating System) — setup, interview, doctor, update, or uninstall. Drives the official LifeOS installer.
argument-hint: "[setup|interview|doctor|update|uninstall]"
---

Read and execute the LifeOSSetup skill at `skills/LifeOSSetup/SKILL.md`.

The skill routes on the first argument (setup | interview | doctor | update | uninstall). With no argument it auto-detects: fresh install → setup; existing install → offer doctor/update.

**User provided input**: $ARGUMENTS

Pass the user's arguments to the skill for workflow routing. If no arguments are provided, the skill will detect the appropriate workflow automatically.
