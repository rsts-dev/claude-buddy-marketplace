---
description: Execute implementation tasks from an existing tasks document following TDD and dependency order.
---

Use the Task tool to launch the task-executor agent with the following prompt:

**Prompt for task-executor agent**:

You are being invoked to execute implementation tasks from an existing tasks document.

**User provided task identifier (optional)**: $ARGUMENTS

**Instructions**:
- Scan the `specs/` directory for folders containing `tasks.md`
- If user provided a task identifier in arguments, use it to locate the specific tasks folder
- If no task identifier provided and multiple tasks exist, list them and ask which one to execute
- If no tasks found, inform the user to create tasks first using `/buddy:tasks`
- Read and analyze ALL documents in the feature folder thoroughly:
  - **REQUIRED**: Read `tasks.md` for the complete task list and execution plan
  - **REQUIRED**: Read `plan.md` for tech stack, architecture, and file structure
  - **REQUIRED**: Read `spec.md` for feature requirements and acceptance criteria
  - **OPTIONAL (if exists)**: Read `data-model.md` for entities and relationships
  - **OPTIONAL (if exists)**: Read `contracts/` directory for API specifications and test requirements
  - **OPTIONAL (if exists)**: Read `research.md` for technical decisions and constraints
  - **OPTIONAL (if exists)**: Read `quickstart.md` for integration scenarios
  - **OPTIONAL (if exists)**: Read `api-specification.raml` for MuleSoft APIs
  - **OPTIONAL (if exists)**: Read `dataweave/mappings.md` for transformations
  - **OPTIONAL (if exists)**: Read `error-handlers.md` for error flows
  - **OPTIONAL (if exists)**: Read `policies.json` for security policies
  - **OPTIONAL (if exists)**: Read `munit/test-plan.md` for MUnit scenarios
  - **OPTIONAL (if exists)**: Read `jdl-model.jdl` for JHipster entities
  - **OPTIONAL (if exists)**: Read `frontend-design.md` for UI components
  - **OPTIONAL (if exists)**: Read `test-scenarios.md` for test cases
  - **OPTIONAL**: Read any other `.md` files in the folder for additional context
- Load the foundation document from `directive/foundation.md` to understand project principles
- Parse tasks.md structure and extract:
  - **Task phases**: Setup, Tests, Core, Integration, Polish
  - **Task dependencies**: Sequential vs parallel execution rules
  - **Task details**: ID, description, file paths, parallel markers [P]
  - **Execution flow**: Order and dependency requirements
- Execute implementation following the task plan:
  - **Phase-by-phase execution**: Complete each phase before moving to the next
  - **Respect dependencies**: Run sequential tasks in order, parallel tasks [P] can run together
  - **Follow TDD approach**: Execute test tasks before their corresponding implementation tasks
  - **File-based coordination**: Tasks affecting the same files must run sequentially
  - **Validation checkpoints**: Verify each phase completion before proceeding
- Implementation execution rules:
  - **Setup first**: Initialize project structure, dependencies, configuration
  - **Tests before code**: Write tests for contracts, entities, and integration scenarios (TDD)
  - **Core development**: Implement models, services, CLI commands, endpoints
  - **Integration work**: Database connections, middleware, logging, external services
  - **Polish and validation**: Unit tests, performance optimization, documentation
- Progress tracking and error handling:
  - Report progress after each completed task
  - **CRITICAL**: Update tasks.md after each task by changing `- [ ]` to `- [X]`
  - Halt execution if any non-parallel task fails
  - For parallel tasks [P], continue with successful tasks, report failed ones
  - Provide clear error messages with context for debugging
  - Suggest next steps if implementation cannot proceed
- Completion validation:
  - Verify all required tasks are completed (all checkboxes marked [X])
  - Check that implemented features match the original specification
  - Validate that tests pass and coverage meets requirements
  - Confirm the implementation follows the technical plan
  - Update tasks.md status from "Draft" or "Ready for Review" to "Completed"
  - Report final status with summary of completed work, total tasks, and any failures

Follow your core responsibilities and execution protocol as defined in your agent configuration.

**IMPORTANT**: Use the Task tool with subagent_type "task-executor" to launch this work.
