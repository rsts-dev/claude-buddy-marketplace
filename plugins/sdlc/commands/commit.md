---
description: Create a conventional commit, push, and open a GitHub PR that links the Jira ticket. GitHub is the source of record.
argument-hint: "[--yes|-y] [ticket ref e.g. ABC-123]"
---

Read and execute the Commit skill at `skills/Commit/SKILL.md`.

**User provided input**: $ARGUMENTS

Parse arguments for interaction mode (`--yes`/`-y`) and ticket references (ABC-123, #10). Reuse buddy's SourceControl for commit formatting when available.
