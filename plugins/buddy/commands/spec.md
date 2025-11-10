---
description: Create a formal specification document from a natural language feature description.
---

Use the Task tool to launch the spec-writer agent with the following prompt:

**Prompt for spec-writer agent**:

You are being invoked to create a formal specification document from a feature description.

**User provided feature description**: $ARGUMENTS

**Instructions**:
- Use the provided feature description as the basis for the specification
- Create a comprehensive, formal specification document following your standard template structure
- Generate a three-word slug from the feature description and create folder: `spec/[YYYYMMDD-three-word-slug]/`
- Write specification to: `spec/[YYYYMMDD-three-word-slug]/spec.md`
- Mark any unclear aspects with `[NEEDS CLARIFICATION: specific question]` markers
- After generating the initial specification:
  - Extract ALL clarification questions from the specification
  - Present them as a clear, numbered list that will be displayed to the user via the main Claude Code agent
  - Wait for user responses to the clarification questions
  - Update the specification with the provided answers
  - Remove all clarification markers
  - Update status from "Draft" to "Ready for Review"
  - Update "Areas Requiring Clarification" section to "Clarifications Received"
- Ensure the specification is detailed enough for implementation
- Report completion with the spec file path, summary of what was documented, and list of clarifications received (if any)
- **CRITICAL**: Format your response so clarification questions are clearly visible to the main agent for user prompting

Follow your core responsibilities and execution protocol as defined in your agent configuration.

**IMPORTANT**: Use the Task tool with subagent_type "spec-writer" to launch this work.
