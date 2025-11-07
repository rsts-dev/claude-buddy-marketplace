---
description: Create professional git commits with persona-enhanced analysis and intelligent commit message generation.
---

Use the Task tool to launch the git-workflow agent with the following prompt:

**Prompt for git-workflow agent**:

You are being invoked to handle git commit operations with persona-enhanced analysis and intelligent commit message generation.

**User provided arguments**: $ARGUMENTS

**Instructions**:
- Parse the user arguments to detect:
  - **Interaction mode**: `--yes`/`-y` (auto-yes), `--interactive`/`-i` (interactive), or no flags (default)
  - **Ticket reference**: Jira format (SDO-123, PROJ-456) or GitHub format (#10, #123)
  - **Persona overrides**: `--persona-scribe`, `--persona-security`, `--persona-frontend`, `--persona-backend`, `--persona-refactorer`
  - **Default persona**: If no persona override specified, activate Scribe persona by default

- Execute the complete commit workflow:
  1. Display current mode and active personas
  2. Verify git repository and check for changes
  3. Stage changes (with mode-aware prompts)
  4. Analyze changes using auto-activated persona skills from `.claude/skills/personas/`
  5. Auto-activate additional personas based on file patterns:
     - Security: .env, keys, auth files
     - Frontend: .tsx, .jsx, .vue, .css files
     - Backend: api/, services/, controllers/ files
     - Refactorer: code cleanup patterns
  6. Generate conventional commit message:
     - Prepend ticket reference if provided (e.g., "SDO-123: " or "#10: ")
     - Use format: `[TICKET-REF: ]<type>(<scope>): <description>`
     - Follow conventional commit standards (feat, fix, docs, etc.)
     - Use functional scopes (api, ui, auth) NOT tool names ("buddy")
     - **CRITICAL**: Generate clean commits with NO AI tool references
  7. Confirm commit with mode-aware prompt (Y/n/e for default, y/n/e for interactive, auto for --yes)
  8. Create commit with clean message
  9. Push to remote with mode-aware prompt
  10. Report status (commit hash, branch, push status, personas activated)

- **Clean Commit Rules** (ABSOLUTELY CRITICAL):
  - NEVER include "Generated with Claude Code"
  - NEVER include "Co-Authored-By: Claude"
  - NEVER include AI tool references or generation indicators
  - Generate professional, human-style commit messages only

**Configuration**: The git-workflow agent reads configuration from `.claude/hooks.json` (config section). See the git-workflow agent documentation for available configuration options.

- Handle errors gracefully:
  - Not in git repo: Inform user to initialize git
  - No changes: Inform user nothing to commit
  - Protected branch: Ask before committing or suggest feature branch
  - Push failures: Provide manual push instructions

- Report completion with:
  - Commit hash and message (with ticket reference if provided)
  - Branch name
  - Push status
  - Personas activated during analysis
  - Any warnings or issues

Follow your core responsibilities and execution protocol as defined in your agent configuration.

**IMPORTANT**: Use the Task tool with subagent_type "git-workflow" to launch this work.
