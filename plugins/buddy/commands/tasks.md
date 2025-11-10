---
description: Generate implementation tasks from an existing implementation plan and design documents.
---

Use the Task tool to launch the tasks-writer agent with the following prompt:

**Prompt for tasks-writer agent**:


**Skills that auto-activate**:
- tasks-generator skill: Task breakdown templates
- Persona skills: Based on task types (frontend, backend, qa, devops, etc.)
- Domain skills: Technology-specific task patterns

You are being invoked to generate implementation tasks from an existing implementation plan.

**User provided plan identifier (optional)**: $ARGUMENTS

**Instructions**:
- Scan the `specs/` directory for folders containing `plan.md` but missing `tasks.md`
- If user provided a plan identifier in arguments, use it to locate the specific plan folder
- If no plan identifier provided and multiple plans need tasks, list them and ask which one to process
- If no plans found requiring tasks, inform the user to create a plan first using `/buddy:plan`
- Read and analyze ALL documents in the feature folder thoroughly:
  - **Required**: Read `plan.md` to extract tech stack, libraries, deployment target, project structure
  - **Required**: Read `spec.md` to extract feature requirements, user stories, acceptance criteria
  - **Optional (if exists)**: Read `data-model.md` for entities
  - **Optional (if exists)**: Read `contracts/` directory for API endpoints
  - **Optional (if exists)**: Read `research.md` for technical decisions
  - **Optional (if exists)**: Read `quickstart.md` for test scenarios
  - **Optional (if exists)**: Read `api-specification.raml` for MuleSoft APIs
  - **Optional (if exists)**: Read `dataweave/mappings.md` for transformations
  - **Optional (if exists)**: Read `error-handlers.md` for error flows
  - **Optional (if exists)**: Read `policies.json` for security policies
  - **Optional (if exists)**: Read `munit/test-plan.md` for MUnit scenarios
  - **Optional (if exists)**: Read `jdl-model.jdl` for JHipster entities
  - **Optional (if exists)**: Read `frontend-design.md` for UI components
  - **Optional (if exists)**: Read `test-scenarios.md` for test cases
  - **Optional**: Read any other `.md` files in the folder for additional context
- Load the foundation document from `directive/foundation.md` to extract foundation type
**Skills that auto-activate**:
- tasks-generator skill: Task breakdown templates
- Domain skills: Technology-specific task patterns (react, jhipster, mulesoft)
- QA persona: Testing and validation guidance
- Generate comprehensive, ordered tasks following the template structure:
  - Number tasks sequentially (T001, T002, ...)
  - Mark parallel tasks with [P] flag
  - Include exact file paths in each task
  - Follow TDD ordering (tests before implementation)
  - Generate tasks by category (Setup, Tests, Core, Integration, Polish)
  - Create dependency graph and parallel execution examples
- Write the tasks to: `specs/[YYYYMMDD-three-word-slug]/tasks.md` (same folder as plan.md)
- Mark any unclear aspects with `[NEEDS CLARIFICATION: specific question]` markers
- After generating the initial tasks:
  - Extract ALL clarification questions from the tasks
  - Present them as a clear, numbered list that will be displayed to the user via the main Claude Code agent
  - Wait for user responses to the clarification questions
  - Update the tasks with the provided answers
  - Remove all clarification markers
  - Update status from "Draft" to "Ready for Review"
- Ensure the tasks are detailed enough for immediate execution
- Report completion with the tasks file path, total task count, category breakdown, and list of clarifications received (if any)
- **CRITICAL**: Format your response so clarification questions are clearly visible to the main agent for user prompting

Follow your core responsibilities and execution protocol as defined in your agent configuration.

**IMPORTANT**: Use the Task tool with subagent_type "tasks-writer" to launch this work.
