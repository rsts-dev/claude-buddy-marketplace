---
description: Install or upgrade PAI (Personal AI Infrastructure) with guided identity customization and symlinked user data persistence
---

Read and execute the PAISetup skill at `skills/PAISetup/SKILL.md`.

The skill will auto-detect whether this is a fresh install or upgrade based on the existence of `~/.buddy/.pai-version`.

**User provided input**: $ARGUMENTS

Pass the user's arguments to the skill for workflow routing. If no arguments are provided, the skill will detect the appropriate workflow automatically.
