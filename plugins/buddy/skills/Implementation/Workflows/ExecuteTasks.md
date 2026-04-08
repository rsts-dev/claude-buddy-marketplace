# ExecuteTasks Workflow

Execute implementation tasks from a tasks document following TDD workflow with progress tracking.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
SPECS_DIR: specs/
BUILTIN_DOMAINS_DIR: skills/Foundation/Domains/
USER_DOMAINS_DIR: ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/
PERSONAS_DIR: skills/Foundation/Personas/
```

## Workflow

### Step 1: Verify Prerequisites

1. Check foundation exists.
2. Load foundation, extract type.

### Step 2: Discover Tasks

1. Scan `specs/` for folders containing `tasks.md`
2. If none: "No tasks found. Run `/buddy:tasks` first." Exit.
3. If one: proceed
4. If multiple: Use AskUserQuestion to let user select which task set to execute — list each folder as an option
5. If user provided identifier: locate matching folder

### Step 3: Load ALL Design Documents

Read ALL documents in the spec folder:
- `tasks.md` — task phases, IDs, descriptions, file paths, [P] markers, dependencies
- `plan.md` — tech stack, architecture, testing strategy
- `spec.md` — requirements, user stories, acceptance criteria
- All optional documents (data-model, contracts, research, etc.)

### Step 3.5: Load Domain References

Load domain-specific reference materials for implementation guidance. Check user domains first, then built-in:
1. Try reading `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{foundation-type}/profile.md`
2. If not found, try `skills/Foundation/Domains/{foundation-type}/profile.md`
3. Check the **Reference Materials** table for files tagged with `Load When: Implementation`
4. Load matching reference files based on task context:
   - For tasks involving specific technologies, load the most relevant reference
   - Avoid loading all references at once — load per-task or per-phase as needed
5. If domain directory not found in either location: skip (proceed without domain references)

### Step 3.6: Load Personas (context-dependent)

Load personas based on the current task's context. Select per-phase:

- **Phase 3.1 (Setup)**: Load `devops` persona for project structure and dependency decisions
- **Phase 3.2 (Tests)**: Load `qa` persona for test design quality
- **Phase 3.3 (Core)**: Load persona matching task domain:
  - UI/component tasks → `frontend` persona
  - API/service tasks → `backend` persona
  - Architecture tasks → `architect` persona
- **Phase 3.4 (Integration)**: Load `backend` + `security` personas
- **Phase 3.5 (Polish)**: Load `performance` + `refactorer` personas

Load from: `skills/Foundation/Personas/{persona-name}/persona.md`

Only load the most relevant 1-2 personas per phase to avoid context bloat. The persona provides decision frameworks, anti-patterns to avoid, and quality criteria specific to the task type.

### Step 4: Parse Tasks

- Extract task phases and order
- Build dependency graph
- Identify parallel [P] vs sequential tasks
- Identify current progress (check for already-completed `[X]` tasks)
- Resume from where last left off if partially completed

### Step 5: Phase-by-Phase Execution

**Phase 3.1 — Setup**
- Create project structure and directories
- Initialize dependencies
- Configure build tools
- **Checkpoint**: Verify all setup complete before proceeding

**Phase 3.2 — Tests (TDD) -- CRITICAL**
- Write contract tests and integration tests
- Tests MUST FAIL initially (red phase)
- Parallel tasks [P] can run together
- **Checkpoint**: All tests written and failing

**Phase 3.3 — Core Implementation**
- ONLY after tests are failing
- Implement models, services, business logic, API endpoints
- Tests should start PASSING (green phase)
- **Checkpoint**: Core complete, tests passing

**Phase 3.4 — Integration**
- Connect services, middleware, external integrations
- **Checkpoint**: Integration complete

**Phase 3.5 — Polish**
- Edge case tests, performance, documentation
- **Checkpoint**: All tasks complete

### Step 6: Task Execution Rules

- **Sequential tasks**: Execute in exact order
- **Parallel tasks [P]**: Can execute together (different files, no dependencies)
- **TDD**: Tests MUST be written and failing before implementation
- **Same-file tasks**: Always sequential
- **Progress tracking**: Update `tasks.md` after EVERY task:
  - Change `- [ ] T001` to `- [X] T001`
  - Use Edit tool to update checkboxes

### Step 7: Error Handling

- **Sequential task failure**: HALT immediately, report error, suggest fix, use AskUserQuestion to ask how to proceed with options: "Fix and retry", "Skip this task", "Abort implementation"
- **Parallel task [P] failure**: Continue other parallel tasks, collect all failures, report together
- **Test failures in Phase 3.2**: Expected (TDD red) — continue
- **Test failures after Phase 3.3**: Unexpected — investigate, report, halt
- **Checkpoint failure**: Report incomplete tasks, suggest corrective actions

### Step 8: Completion Validation

Before declaring success:
- All task checkboxes marked [X]
- All tests passing
- All files created as specified
- Features match specification
- Code follows plan architecture

### Step 9: Update Status

Change tasks.md status from "Draft"/"Ready for Review" to "Completed" with today's date.

### Step 10: Report

```
## Implementation Complete

- Tasks executed: {completed}/{total}
- Files created/modified: {count}
- Test coverage: {description}
- Phases: All 5 phases complete
- Status: tasks.md updated to Completed
- Next: Run `/buddy:commit` to commit changes
```
