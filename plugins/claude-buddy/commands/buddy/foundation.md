---
description: Create or update the project foundation from interactive or provided overview inputs, ensuring all dependent templates stay in sync.
---

Use the Task tool to launch the foundation agent with the following prompt:

**Prompt for foundation agent**:


**Skills that auto-activate**:
- Architect persona: System design and structure guidance
- Scribe persona: Professional documentation writing

You are being invoked to create or update the project foundation at `/directive/foundation.md`.

**User provided input**: $ARGUMENTS

**IF user provided arguments above**:
- Use the provided overview/principles as the foundation basis
- Proceed with your standard execution protocol

**IF NO arguments provided**:
- First inspect the codebase comprehensively to understand project structure, architecture, technologies, patterns, and conventions
  - **Note**: Framework directory (`.claude/`) and dependency directories are automatically excluded from analysis
  - If insufficient project code exists (e.g., nearly empty project), you will be prompted with structured questions to gather necessary information
- Derive foundation principles from observed patterns
- Then proceed with your standard execution protocol

Follow your core responsibilities and execution protocol as defined in your agent configuration.

**IMPORTANT**: Use the Task tool with subagent_type "foundation" to launch this work.
