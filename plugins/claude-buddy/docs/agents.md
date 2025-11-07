# Agent System

## Overview

Agents are specialized task executors in Claude Buddy that handle complex, multi-step workflows autonomously. Each agent is a Markdown file containing detailed prompts that guide the AI through specific development tasks like creating specifications, generating plans, executing implementations, and managing git workflows.

## Agent Architecture

### Core Concept

Agents are the execution layer of Claude Buddy:
- **Commands** parse user input and invoke agents
- **Agents** execute complex workflows and make decisions
- **Skills** provide context and expertise to agents
- **Hooks** validate and automate around agent actions

### Design Philosophy

1. **Single Responsibility**: Each agent handles one type of workflow
2. **Autonomous Execution**: Agents make decisions without constant user input
3. **Context-Aware**: Agents understand project state and adapt behavior
4. **Quality-Focused**: Agents validate their work before completion
5. **Composable**: Agents can invoke other agents when needed

## Agent Registry

Claude Buddy includes 8 specialized agents:

### 1. persona-dispatcher
**File**: `agents/persona-dispatcher.md`
**Model**: opus
**Purpose**: AI persona selection and activation

**Responsibilities**:
- Analyze user requests to determine expertise needs
- Score 12 available personas using multi-factor algorithm
- Select and activate most relevant personas (up to 3)
- Merge multiple persona perspectives into unified responses
- Apply collaboration patterns for multi-persona work

**Activation**: Invoked by `/buddy:persona` command

**Key Features**:
- **Smart Scoring**: Keyword matching (30%), context analysis (40%), file patterns (20%), history (10%)
- **Auto-Activation**: Intelligently selects personas based on request
- **Manual Override**: User can explicitly request specific personas
- **Validation Chains**: Activates required persona groups for validation tasks
- **Collaboration Patterns**: Applies defined patterns like "security_backend" or "architect_performance"

**Example Usage**:
```
User: /buddy:persona How should I secure this authentication endpoint?

Agent analyzes:
- Keywords: "secure", "authentication", "endpoint"
- Context: Security + backend domain
- Scores: security (0.92), backend (0.84)
- Activates: security + backend personas
- Response: Merged security threat modeling + backend reliability guidance
```

### 2. foundation
**File**: `agents/foundation.md`
**Model**: opus
**Purpose**: Project foundation initialization and management

**Responsibilities**:
- Create or update `directive/foundation.md`
- Analyze codebase to derive project principles
- Apply template-specific best practices from domain skills
- Version foundation documents using semantic versioning
- Propagate changes to dependent artifacts
- Generate sync impact reports

**Activation**: Invoked by `/buddy:foundation` command

**Key Features**:
- **Template-Aware**: Supports Default, MuleSoft, JHipster foundation types
- **Principle Derivation**: Analyzes codebase to extract 3-7 core principles
- **Semantic Versioning**: MAJOR.MINOR.PATCH based on change impact
- **Dependency Tracking**: Updates generator skills when foundation changes
- **Validation**: Pre-write checks ensure consistency and completeness

**Execution Protocol**:
1. Check if foundation exists (load or create)
2. Collect values for placeholders or derive from codebase
3. Fill template or create complete foundation document
4. Propagate changes to dependent artifacts
5. Generate sync impact report
6. Validate before writing
7. Write foundation file
8. Provide user summary with commit message

### 3. spec-writer
**File**: `agents/spec-writer.md`
**Model**: opus
**Purpose**: Feature specification creation

**Responsibilities**:
- Verify foundation document exists
- Transform feature descriptions into formal specifications
- Apply appropriate template (Default, MuleSoft, JHipster)
- Replace all placeholders with concrete details
- Mark unclear aspects for clarification
- Generate specifications in `specs/[YYYYMMDD-slug]/spec.md`

**Activation**: Invoked by `/buddy:spec` command

**Key Features**:
- **Foundation-First**: Requires valid foundation before proceeding
- **Skills Integration**: Auto-activates spec-generator, scribe, and domain skills
- **Clarification Cycle**: Identifies unknowns and asks user for input
- **Quality Assurance**: Validates completeness before finalizing
- **File Naming**: Uses date + three-word slug (e.g., `20251107-user-auth-api/`)

**Workflow**:
1. Verify `directive/foundation.md` exists
2. Extract feature description from user input
3. Load appropriate template based on foundation type
4. Fill template with feature details
5. Mark unclear sections with `[NEEDS CLARIFICATION: ...]`
6. Present clarification questions to user
7. Update spec with answers
8. Validate and write to specs directory

### 4. plan-writer
**File**: `agents/plan-writer.md`
**Model**: opus
**Purpose**: Implementation plan generation

**Responsibilities**:
- Read specification from specs directory
- Create comprehensive implementation plan
- Define tech stack, architecture, and project structure
- Plan testing strategy and deployment approach
- Break down into phases with clear dependencies
- Generate plans in `specs/[YYYYMMDD-slug]/plan.md`

**Activation**: Invoked by `/buddy:plan` command

**Key Features**:
- **Spec-Driven**: Reads from latest or specified spec document
- **Architecture Planning**: Defines system design and component interactions
- **Tech Stack Selection**: Chooses appropriate technologies and frameworks
- **Phase Definition**: Creates structured implementation phases
- **Dependency Mapping**: Identifies and documents dependencies

**Plan Structure**:
- Overview and objectives
- Tech stack and tools
- Architecture and design
- Project structure
- Development phases
- Testing strategy
- Deployment approach
- Success criteria

### 5. tasks-writer
**File**: `agents/tasks-writer.md`
**Model**: opus
**Purpose**: Task breakdown and prioritization

**Responsibilities**:
- Read implementation plan from specs directory
- Break down plan into actionable tasks
- Organize tasks into TDD phases (Setup, Tests, Core, Integration, Polish)
- Assign task IDs and estimate effort
- Identify parallel execution opportunities [P]
- Document dependencies between tasks
- Generate tasks in `specs/[YYYYMMDD-slug]/tasks.md`

**Activation**: Invoked by `/buddy:tasks` command

**Key Features**:
- **TDD-First**: Ensures tests are written before implementation
- **Parallel Marking**: Identifies tasks that can run concurrently [P]
- **Dependency Graph**: Maps task relationships and execution order
- **Effort Estimation**: Provides time estimates for each task
- **Phase Organization**: Groups tasks by development phase

**Task Phases**:
1. **Phase 3.1: Setup** - Project initialization, dependencies, configuration
2. **Phase 3.2: Tests First (TDD)** - Write failing tests before implementation
3. **Phase 3.3: Core Implementation** - Implement features to pass tests
4. **Phase 3.4: Integration** - Connect components and services
5. **Phase 3.5: Polish** - Edge cases, performance, refactoring, docs

### 6. task-executor
**File**: `agents/task-executor.md`
**Model**: sonnet
**Purpose**: Task execution with TDD approach

**Responsibilities**:
- Read task breakdown from specs directory
- Execute tasks in proper phase order
- Follow TDD workflow (red-green-refactor)
- Respect dependencies and parallel markers
- Update progress in real-time
- Validate at phase checkpoints
- Generate completion reports

**Activation**: Invoked by `/buddy:implement` command

**Key Features**:
- **Comprehensive Analysis**: Reads spec, plan, tasks, and all supporting documents
- **TDD Compliance**: Tests MUST be written and failing before implementation
- **Progress Tracking**: Updates tasks.md after each completed task
- **Error Recovery**: Handles failures gracefully with clear reporting
- **Checkpoint Validation**: Verifies phase completion before proceeding

**Execution Rules**:
- Sequential tasks: Execute in exact order
- Parallel tasks [P]: Can run together (different files, no dependencies)
- TDD compliance: Tests first, then implementation
- File coordination: Tasks on same file run sequentially
- Dependency respect: Never skip dependencies
- Validation: Verify each task before next

### 7. git-workflow
**File**: `agents/git-workflow.md`
**Model**: sonnet
**Purpose**: Professional git commit creation

**Responsibilities**:
- Analyze git status and diff
- Review changes comprehensively
- Generate professional commit messages
- Follow conventional commit format
- Respect project commit standards
- Create commits without AI attribution (per project requirements)

**Activation**: Invoked by `/buddy:commit` command

**Key Features**:
- **Change Analysis**: Reviews all staged and unstaged changes
- **Conventional Commits**: Follows type(scope): description format
- **Semantic Grouping**: Groups related changes logically
- **No AI Attribution**: Respects project requirement for no Claude references
- **Validation**: Checks branch protection and commit policies

**Commit Message Format**:
```
type(scope): brief description

Detailed explanation of changes and their purpose.

Breaking changes or important notes if applicable.
```

**Types**: feat, fix, docs, style, refactor, perf, test, build, ci, chore

### 8. docs-generator
**File**: `agents/docs-generator.md`
**Model**: opus
**Purpose**: Comprehensive documentation generation

**Responsibilities**:
- Analyze project structure and code
- Generate or update README files
- Create API documentation
- Write architecture documentation
- Update user guides and tutorials
- Ensure documentation completeness

**Activation**: Invoked by `/buddy:docs` command

**Key Features**:
- **Project Analysis**: Scans codebase to understand structure
- **Multi-Format**: Generates various documentation types
- **Scribe Integration**: Leverages scribe persona for professional writing
- **Template-Aware**: Adapts to project type (Default, MuleSoft, JHipster)
- **Update Mode**: Intelligently updates existing docs

**Documentation Types**:
- README.md: Project overview, installation, usage
- API docs: Endpoint documentation, examples
- Architecture docs: System design, component diagrams
- User guides: Feature documentation, tutorials
- Developer docs: Contributing guidelines, setup

## Agent File Format

Agents are Markdown files with YAML frontmatter:

```markdown
---
name: agent-name
description: Detailed description of when and how to invoke this agent.

Include examples showing invocation patterns:

<example>
Context: User scenario description
user: "User input example"
assistant: "Agent invocation pattern"
<Task tool invocation to agent-name agent>
</example>

model: opus | sonnet | haiku
color: blue | purple | cyan | green
---

# Agent Prompt Content

You are an expert [role] specializing in [domain]. Your role is to [purpose].

## Core Responsibilities

1. **Responsibility 1**: Description
2. **Responsibility 2**: Description
...

## Execution Protocol

### Phase 1: [Phase Name]
- Step-by-step instructions
- Decision points
- Validation requirements

### Phase 2: [Phase Name]
...

## Decision-Making Framework

- **When X happens**: Do Y
- **When unclear**: Request clarification
...

## Output Standards

- Format requirements
- Quality criteria
- Validation rules

## Error Handling

- How to handle specific errors
- Recovery procedures
- User communication
```

### Frontmatter Fields

**name** (required): Agent identifier matching filename
- Example: `name: spec-writer` for `spec-writer.md`

**description** (required): Detailed description with invocation examples
- Include `<example>` blocks showing when to invoke
- Provide context, user input, and agent invocation pattern

**model** (required): AI model to use
- `opus`: Complex reasoning, high quality (slower, more expensive)
- `sonnet`: Balanced performance and quality (recommended default)
- `haiku`: Fast execution, simple tasks (faster, less expensive)

**color** (optional): Visual identifier in UI
- Options: blue, purple, cyan, green, yellow, red

### Content Structure

**Role Definition**: Who the agent is and what domain expertise it has

**Core Responsibilities**: Numbered list of primary duties

**Execution Protocol**: Step-by-step workflow phases

**Decision-Making Framework**: Conditional logic and choices

**Output Standards**: Format and quality requirements

**Error Handling**: How to handle failures and edge cases

## Agent Invocation Patterns

### Pattern 1: Direct Invocation from Command

Commands invoke agents directly:

```markdown
---
description: Create feature specifications
---

You are being invoked through `/buddy:spec` command.

Extract the feature description from user input.
Invoke the spec-writer agent with the feature description.
```

### Pattern 2: Chain Invocation

Agents can invoke other agents in workflow:

```
spec-writer → creates spec.md
     ↓
plan-writer → reads spec.md, creates plan.md
     ↓
tasks-writer → reads plan.md, creates tasks.md
     ↓
task-executor → reads tasks.md, implements feature
```

### Pattern 3: Conditional Invocation

Agents invoke based on conditions:

```markdown
If foundation.md doesn't exist:
  Inform user: "Run /buddy:foundation first"

If multiple task documents found:
  Ask user: "Which tasks to execute?"

If clarifications needed:
  Present questions to user
  Wait for responses
  Continue with answers
```

## Agent Design Patterns

### Pattern 1: Foundation-First

Many agents require `directive/foundation.md`:

```markdown
## Phase 0: Foundation Verification
Check if `directive/foundation.md` exists:
- If missing: Stop and inform user
- If exists: Load and extract foundation type
- Use foundation type to select template
```

**Used by**: spec-writer, plan-writer, tasks-writer, task-executor

### Pattern 2: File Chain Processing

Agents read outputs from previous stages:

```markdown
## Phase 1: Document Discovery
Scan specs/ directory for folders with tasks.md:
- If none found: Inform user to run /buddy:tasks
- If one found: Proceed with those tasks
- If multiple: Ask user which to use
```

**Used by**: plan-writer, tasks-writer, task-executor

### Pattern 3: Clarification Cycle

Agents identify unknowns and ask users:

```markdown
## Phase 4: Clarification Cycle
After generating initial output:
- Scan for [NEEDS CLARIFICATION: ...] markers
- If found: Extract questions and present to user
- Wait for responses
- Update output with answers
- Remove markers and proceed
```

**Used by**: spec-writer, plan-writer

### Pattern 4: Progress Tracking

Agents maintain real-time progress:

```markdown
## Progress Tracking
After completing each task:
- Update tasks.md using Edit tool
- Change checkbox from [ ] to [X]
- Report progress to user
- Continue with next task
```

**Used by**: task-executor

### Pattern 5: Quality Validation

Agents validate before finalizing:

```markdown
## Pre-Write Validation
Before writing output:
- ✓ No unexplained placeholders remain
- ✓ All required sections present
- ✓ Formatting adheres to standards
- ✓ Content meets quality criteria
```

**Used by**: All agents

## Skills Integration

Agents leverage Claude Code Skills for context:

### Auto-Activation

Skills activate automatically when agents run:

```markdown
**Skills Integration**: Leverage Claude Code Skills:
- The spec-generator skill provides templates automatically
- Domain skills (react, jhipster, mulesoft) provide tech context
- Persona skills (scribe, architect) provide expertise
- Skills activate based on foundation type and keywords
```

### Domain-Specific Context

Foundation type determines which domain skills activate:

- **MuleSoft foundation** → mulesoft domain skill activates
- **JHipster foundation** → jhipster domain skill activates
- **React project** → react domain skill activates

### Persona Collaboration

Multiple personas can contribute expertise:

- **spec-writer** → scribe persona (writing), architect persona (design)
- **plan-writer** → architect persona (design), backend persona (APIs)
- **task-executor** → relevant personas based on task type

## Error Handling

### Missing Dependencies

```markdown
If foundation.md cannot be loaded:
  Inform user: "The foundation document is missing.
  Please run `/buddy:foundation` to create it."
  Stop execution.
```

### Invalid Input

```markdown
If feature description is insufficient:
  Request specific additional information needed.
  Example: "Please provide the API endpoints and data models."
```

### Execution Failures

```markdown
If task fails during execution:
  - HALT execution immediately
  - Report error with full context
  - Show which task failed
  - Provide error message and stack trace
  - Suggest debugging steps
  - Ask user how to proceed
```

### Validation Failures

```markdown
If checkpoint validation fails:
  - Report which checkpoint failed
  - List incomplete tasks
  - Suggest corrective actions
  - Don't proceed to next phase
```

## Agent Communication

### User Reporting

Agents provide clear progress updates:

```
✓ Foundation verified: MuleSoft v2.0.0
✓ Specification loaded: user-authentication-api
✓ Template selected: mulesoft-plan.md
→ Generating implementation plan...
✓ Plan created: specs/20251107-user-auth-api/plan.md
```

### Status Updates

```
Phase 3.2: Tests First (TDD)
→ [T005] Write contract tests for authentication endpoint
  Files: tests/api/auth.test.js
  Status: Completed (2 min)

Progress: 5/23 tasks completed (22%)
Current phase: Tests First
```

### Error Messages

```
❌ Task execution failed: T012 - Implement JWT validation

Error: Module 'jsonwebtoken' not found

Suggested fix:
1. Install dependency: npm install jsonwebtoken
2. Add to package.json dependencies
3. Retry task execution

Would you like me to:
- Install the dependency automatically
- Skip this task and continue
- Halt execution for manual fix
```

## Agent Performance

### Model Selection Strategy

**Opus (claude-opus-4)**:
- Complex reasoning tasks
- Multi-step decision making
- High-quality output requirements
- Used by: persona-dispatcher, foundation, spec-writer, plan-writer, docs-generator

**Sonnet (claude-sonnet-4.5)**:
- Balanced performance and quality
- Moderate complexity tasks
- Good default choice
- Used by: task-executor, git-workflow

**Haiku (claude-haiku-4.5)**:
- Fast execution
- Simple, well-defined tasks
- Cost optimization
- Not currently used (can be specified in agents as needed)

### Execution Time

Typical agent execution times:

- **persona-dispatcher**: 10-30 seconds (analysis + scoring)
- **foundation**: 1-3 minutes (codebase analysis + generation)
- **spec-writer**: 2-5 minutes (template filling + clarification)
- **plan-writer**: 3-7 minutes (comprehensive planning)
- **tasks-writer**: 2-4 minutes (task breakdown)
- **task-executor**: 10-60 minutes (depends on task count)
- **git-workflow**: 30-60 seconds (commit analysis + message)
- **docs-generator**: 5-15 minutes (project analysis + docs)

## Creating New Agents

### Step 1: Define Purpose

```markdown
Agent: code-reviewer
Purpose: Analyze code for quality issues, security vulnerabilities, and improvement opportunities
Model: sonnet (balanced quality and performance)
Invocation: /buddy:review command
```

### Step 2: Create Agent File

```bash
touch agents/code-reviewer.md
```

### Step 3: Write Agent Prompt

```markdown
---
name: code-reviewer
description: Use this agent when the user needs code review with quality analysis, security checks, and improvement suggestions.

<example>
Context: User has completed feature implementation
user: "Review my authentication code for security issues"
assistant: "Let me use the code-reviewer agent to analyze your authentication implementation."
<Task tool invocation to code-reviewer agent>
</example>

model: sonnet
color: purple
---

You are an expert code reviewer specializing in quality assurance, security analysis, and best practices enforcement.

## Core Responsibilities

1. **Code Analysis**: Scan code for quality issues, bugs, and anti-patterns
2. **Security Review**: Identify vulnerabilities and security risks
3. **Best Practices**: Ensure adherence to coding standards
4. **Improvement Suggestions**: Provide actionable recommendations

## Execution Protocol

### Phase 1: Code Discovery
- Identify files to review (user-specified or git diff)
- Read and parse source code
- Understand code context and purpose

### Phase 2: Analysis
- Run quality checks (complexity, duplication, etc.)
- Perform security analysis (OWASP top 10)
- Verify best practices adherence
- Check foundation principles alignment

### Phase 3: Reporting
- Generate structured review report
- Prioritize issues by severity
- Provide code examples and fixes
- Suggest refactoring opportunities

## Decision-Making Framework

- **When security issue found**: Flag as critical
- **When foundation principle violated**: Reference specific principle
- **When improvement is optional**: Mark as suggestion

## Output Standards

- Structured report with severity levels
- Code snippets showing issues
- Specific fix recommendations
- References to best practices

## Error Handling

- If no code to review: Request file paths
- If file unreadable: Report error and skip
- If analysis tool fails: Continue with manual review
```

### Step 4: Create Command

```markdown
---
description: Review code for quality and security
---

You are being invoked through `/buddy:review` command.

Extract the code scope from user input (files or directories).
Invoke the code-reviewer agent with the scope.
```

### Step 5: Test Agent

```bash
# Restart Claude Code
claude

# Test command
/buddy:review src/api/auth.js

# Verify:
# - Agent activates correctly
# - Analysis is comprehensive
# - Report is actionable
# - Errors handled gracefully
```

## Best Practices

### Agent Design

1. **Single Responsibility**: Each agent does one thing well
2. **Clear Protocol**: Step-by-step execution phases
3. **Decision Framework**: Explicit conditional logic
4. **Error Handling**: Comprehensive failure scenarios
5. **Quality Validation**: Pre-write checks

### Prompt Engineering

1. **Role Definition**: Clear identity and expertise
2. **Structured Phases**: Numbered execution steps
3. **Examples**: Show invocation patterns in frontmatter
4. **Explicit Instructions**: Use MUST, SHOULD, MAY
5. **Validation Rules**: Define quality criteria

### User Experience

1. **Progress Updates**: Show what's happening
2. **Clear Errors**: Actionable error messages
3. **Helpful Guidance**: Suggest next steps
4. **Confirmation**: Ask before destructive operations

### Performance

1. **Model Selection**: Match model to task complexity
2. **Lazy Loading**: Don't load unnecessary context
3. **Caching**: Reuse analysis when possible
4. **Parallel Execution**: Run independent tasks together

## Troubleshooting

### Agent Not Activating

**Symptom**: Command runs but agent doesn't execute

**Causes**:
- Agent name mismatch between frontmatter and invocation
- Agent file not in `agents/` directory
- Syntax error in agent markdown

**Solution**:
1. Verify agent name in frontmatter matches file
2. Check file location: `ls agents/`
3. Validate markdown syntax
4. Review Claude Code logs

### Agent Timeout

**Symptom**: Agent hangs or times out

**Causes**:
- Task too complex for model
- Infinite loop in agent logic
- External dependency failure

**Solution**:
1. Switch to simpler model (opus → sonnet)
2. Review agent logic for loops
3. Add explicit timeout handling
4. Break into smaller agents

### Agent Output Invalid

**Symptom**: Agent produces incorrect or incomplete output

**Causes**:
- Unclear instructions in agent prompt
- Missing validation checks
- Incorrect assumptions about project state

**Solution**:
1. Review agent prompt for clarity
2. Add pre-write validation phase
3. Test with various project types
4. Add explicit error handling

## See Also

- [commands.md](commands.md) - Command system invoking agents
- [skills.md](skills.md) - Skills providing context to agents
- [hooks.md](hooks.md) - Hooks validating agent actions
- [Architecture Overview](architecture.md) - System design

---

**Version**: 4.0.0
**Last Updated**: 2025-11-07
