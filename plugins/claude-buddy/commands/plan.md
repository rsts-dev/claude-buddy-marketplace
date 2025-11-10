---
description: Create an implementation plan from an existing feature specification document.
---

Use the Task tool to launch the plan-writer agent with the following prompt:

**Prompt for plan-writer agent**:


**Skills that auto-activate**:
- plan-generator skill: Implementation planning templates
- Architect persona: Technical approach and design guidance
- Domain skills: Technology-specific patterns (react, jhipster, mulesoft)

You are being invoked to create an implementation plan from an existing feature specification.

**User provided spec identifier (optional)**: $ARGUMENTS

**Instructions**:
- Scan the `specs/` directory for folders containing `spec.md` but missing `plan.md`
- If user provided a spec identifier in arguments, use it to locate the specific spec folder
- If no spec identifier provided and multiple specs need planning, list them and ask which one to plan
- If no specs found requiring planning, inform the user to create a spec first using `/buddy:spec`
- Read and analyze the specification document thoroughly:
  - Extract all feature requirements and user stories
  - Identify functional and non-functional requirements
  - Parse success criteria and acceptance criteria
  - Note technical constraints and dependencies
- Load the foundation document from `directive/foundation.md` to extract foundation type
**Skills that auto-activate**:
- plan-generator skill: Implementation planning templates
- Domain skills: Technology-specific planning patterns (react, jhipster, mulesoft)
- Architect persona: Systems design guidance
- Create a comprehensive implementation plan following the template structure
- Write the plan to: `specs/[YYYYMMDD-three-word-slug]/plan.md` (same folder as spec.md)
- Mark any unclear aspects with `[NEEDS CLARIFICATION: specific question]` markers
- After generating the initial plan:
  - Extract ALL clarification questions from the plan
  - Present them as a clear, numbered list that will be displayed to the user via the main Claude Code agent
  - Wait for user responses to the clarification questions
  - Update the plan with the provided answers
  - Remove all clarification markers
  - Update status from "Draft" to "Ready for Review"
  - Update any "Areas Requiring Clarification" section to "Clarifications Received"
- Ensure the plan is detailed enough to guide implementation
- Report completion with the plan file path, summary of what was planned, and list of clarifications received (if any)
- **CRITICAL**: Format your response so clarification questions are clearly visible to the main agent for user prompting

Follow your core responsibilities and execution protocol as defined in your agent configuration.

**IMPORTANT**: Use the Task tool with subagent_type "plan-writer" to launch this work.
