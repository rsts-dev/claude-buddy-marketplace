# Command System

## Overview

Commands are the user-facing interface of Claude Buddy. They are implemented as slash commands in Claude Code and serve as entry points that parse user input and invoke appropriate agents.

## Command Architecture

### File Structure
```
commands/
└── buddy/
    ├── persona.md
    ├── foundation.md
    ├── spec.md
    ├── plan.md
    ├── tasks.md
    ├── implement.md
    ├── commit.md
    └── docs.md
```

### Command File Format

Each command is a Markdown file with YAML frontmatter:

```markdown
---
description: Short description of what the command does
---

Command implementation content here.
The AI receives this content when the command is invoked.
```

## Command Registry

### 1. `/buddy:persona` - Persona Activation
**File**: `commands/buddy/persona.md`
**Purpose**: Activate specialized AI personas based on context
**Usage**:
- Auto-activation: `/buddy:persona How should I design this API?`
- Manual selection: `/buddy:persona architect security - Review this code`

**Implementation**:
1. Parse user input to extract request and persona names
2. Determine mode (auto-activation vs manual selection)
3. Invoke `persona-dispatcher` agent with parsed data
4. Return agent response with activated personas

**Parameters**:
- `[persona-names]` (optional) - Space-separated persona names before dash
- `[request]` (required) - User's question or task

### 2. `/buddy:foundation` - Project Foundation
**File**: `commands/buddy/foundation.md`
**Purpose**: Initialize project foundation and structure
**Usage**: `/buddy:foundation`

**Implementation**:
1. Detect project type (default, MuleSoft, JHipster)
2. Invoke `foundation` agent
3. Create directory structure and foundational files
4. Set up configuration files

**Parameters**: None (auto-detects project context)

### 3. `/buddy:spec` - Feature Specification
**File**: `commands/buddy/spec.md`
**Purpose**: Create detailed feature specifications
**Usage**: `/buddy:spec Create a user authentication API with JWT`

**Implementation**:
1. Extract feature description from user input
2. Invoke `spec-writer` agent with feature description
3. Generate spec file in `specs/` directory
4. Apply auto-formatting via post-tool hook

**Parameters**:
- `[feature-description]` (required) - What to build

### 4. `/buddy:plan` - Implementation Plan
**File**: `commands/buddy/plan.md`
**Purpose**: Generate implementation plans from specifications
**Usage**: `/buddy:plan`

**Implementation**:
1. Read latest spec from `specs/` directory (or prompt for spec)
2. Invoke `plan-writer` agent with spec content
3. Generate plan file in `plans/` directory
4. Include architecture, components, and dependencies

**Parameters**: None (reads from specs/)

### 5. `/buddy:tasks` - Task Breakdown
**File**: `commands/buddy/tasks.md`
**Purpose**: Break down plans into actionable tasks
**Usage**: `/buddy:tasks`

**Implementation**:
1. Read latest plan from `plans/` directory
2. Invoke `tasks-writer` agent with plan content
3. Generate task list in `tasks/` directory
4. Prioritize and estimate tasks

**Parameters**: None (reads from plans/)

### 6. `/buddy:implement` - Task Execution
**File**: `commands/buddy/implement.md`
**Purpose**: Execute tasks using TDD approach
**Usage**: `/buddy:implement`

**Implementation**:
1. Read task list from `tasks/` directory
2. Invoke `task-executor` agent with task details
3. Implement tasks one by one (TDD: test, implement, refactor)
4. Mark tasks as complete

**Parameters**: None (reads from tasks/)

### 7. `/buddy:commit` - Git Commit
**File**: `commands/buddy/commit.md`
**Purpose**: Create professional git commits
**Usage**: `/buddy:commit`

**Implementation**:
1. Run `git status` and `git diff` to see changes
2. Invoke `git-workflow` agent with change summary
3. Generate commit message (no AI attribution per requirements)
4. Create commit with professional message

**Parameters**: None (uses git state)

### 8. `/buddy:docs` - Documentation Generation
**File**: `commands/buddy/docs.md`
**Purpose**: Generate comprehensive project documentation
**Usage**: `/buddy:docs`

**Implementation**:
1. Analyze project structure and code
2. Invoke `docs-generator` agent
3. Generate README, API docs, architecture docs
4. Update existing docs if present

**Parameters**: None (analyzes project)

### 9. `/buddy:install-damage-control-system` - Security Hooks Deployment
**File**: `commands/buddy/install-damage-control-system.md`
**Purpose**: Deploy the Damage Control security system
**Usage**: `/buddy:install-damage-control-system`

**Implementation**:
1. Activate the damage-control skill
2. Read and execute the installation workflow from cookbook
3. Choose installation level (global, project, or project personal)
4. Copy hooks and patterns.yaml to target location
5. Configure settings.json with hook entries

**Parameters**: None (interactive workflow)

**See Also**: [hooks.md](hooks.md) for Damage Control documentation

## Command Lifecycle

### 1. Command Registration
When plugin loads:
1. Claude Code scans `commands/buddy/` directory
2. Registers each `.md` file as a slash command
3. Command name derived from filename (e.g., `spec.md` → `/buddy:spec`)
4. Description from frontmatter shown in `/help`

### 2. Command Invocation
When user types `/buddy:spec Create an API`:
1. Claude Code matches command pattern
2. Loads `commands/buddy/spec.md` content
3. Injects content into AI context
4. Passes user input after command name
5. AI processes command logic

### 3. Agent Invocation
Commands invoke agents via Task tool:
```markdown
Use the Task tool to launch the spec-writer agent with:
- Feature description: [extracted from user input]
- Project context: [detected project type]
```

### 4. Response Handling
After agent completes:
1. Agent returns result to command
2. Command formats response for user
3. Hooks may execute (e.g., auto-formatting)
4. User receives final output

## Command Design Patterns

### Pattern 1: Direct Agent Invocation
Simplest pattern - command directly invokes agent:
```markdown
---
description: Do something useful
---

Extract [parameter] from user input.
Invoke the [agent-name] agent with [parameter].
```

**Used by**: `persona`, `foundation`, `spec`

### Pattern 2: File Chain Pattern
Read from previous workflow stage:
```markdown
---
description: Process previous output
---

Read latest file from [previous-stage/] directory.
Invoke [agent-name] agent with file content.
```

**Used by**: `plan`, `tasks`, `implement`

### Pattern 3: Analysis Pattern
Analyze project state before acting:
```markdown
---
description: Analyze and act
---

Run [analysis commands] to gather context.
Invoke [agent-name] agent with analysis results.
```

**Used by**: `commit`, `docs`

## Error Handling

### Missing Input
**Problem**: User doesn't provide required parameters
**Solution**: Command prompts for missing information
```markdown
If feature description is missing:
Ask user: "What feature would you like to specify?"
```

### Invalid Context
**Problem**: Command requires previous stage (e.g., plan needs spec)
**Solution**: Check for prerequisites and guide user
```markdown
If no spec file exists:
Inform user: "No specification found. Run /buddy:spec first."
```

### Agent Failure
**Problem**: Agent encounters error or times out
**Solution**: Catch errors and provide recovery options
```markdown
If agent fails:
Inform user of error.
Suggest: "Try again or use /buddy:help for guidance."
```

## Best Practices

### Command Design
1. **Single Responsibility**: Each command does one thing well
2. **Clear Description**: Frontmatter description explains purpose
3. **User-Friendly**: Anticipate common usage patterns
4. **Error Tolerant**: Handle missing inputs gracefully

### Parameter Parsing
1. **Flexible Format**: Accept natural language inputs
2. **Optional Flags**: Support both required and optional params
3. **Validation**: Check parameters before invoking agents
4. **Feedback**: Confirm parsed parameters with user

### Agent Coordination
1. **Explicit Invocation**: Clearly state which agent to invoke
2. **Context Passing**: Provide all necessary context to agent
3. **Result Handling**: Format agent output appropriately
4. **Timeout Handling**: Set reasonable timeouts for long tasks

### User Experience
1. **Progress Updates**: Show status during long operations
2. **Confirmation**: Ask before destructive operations
3. **Helpful Errors**: Provide actionable error messages
4. **Documentation**: Reference help docs when appropriate

## Creating New Commands

### Step 1: Define Command Purpose
```markdown
Command: /buddy:analyze
Purpose: Analyze codebase for issues
Agent: code-analyzer
```

### Step 2: Create Command File
```bash
touch commands/buddy/analyze.md
```

### Step 3: Write Command Implementation
```markdown
---
description: Analyze codebase for issues and improvements
---

You are being invoked through `/buddy:analyze` command.

## Your Task
1. Extract analysis scope from user input (specific files or entire project)
2. Invoke the code-analyzer agent with the scope
3. Present analysis results in structured format

## Usage Examples
- `/buddy:analyze` - Analyze entire project
- `/buddy:analyze src/api/` - Analyze specific directory
- `/buddy:analyze --security` - Focus on security issues

## Parameters
- [scope] (optional) - Files or directories to analyze
- [--flag] (optional) - Analysis focus (security, performance, quality)

## Implementation
Parse the user's input to extract scope and flags.
Invoke the code-analyzer agent with:
- Scope: [extracted scope or "entire project"]
- Focus: [extracted flag or "general"]
```

### Step 4: Test Command
```bash
# Restart Claude Code
claude

# Test command
/buddy:analyze src/

# Verify:
# - Command appears in /help
# - Invokes correct agent
# - Handles errors gracefully
```

### Step 5: Add Documentation
Update user-facing README with command description and examples.

## Command Testing

### Unit Testing
Test command parsing logic:
```python
# Pseudo-test
def test_spec_command_parsing():
    input = "/buddy:spec Create an API"
    result = parse_spec_command(input)
    assert result.feature == "Create an API"
```

### Integration Testing
Test command → agent → result flow:
1. Invoke command with test input
2. Verify agent receives correct parameters
3. Check agent returns expected result
4. Validate hooks execute properly

### User Acceptance Testing
Real-world scenarios:
1. Complete workflow (spec → plan → tasks → implement)
2. Error recovery (missing files, invalid input)
3. Edge cases (empty project, large codebase)

## Command Performance

### Latency Targets
- Command parsing: < 100ms
- Agent invocation: < 500ms overhead
- Total response time: Depends on agent complexity

### Optimization Strategies
1. **Lazy Loading**: Load command content only when invoked
2. **Caching**: Cache parsed parameters when safe
3. **Parallel Execution**: Run independent operations concurrently
4. **Model Selection**: Use `haiku` for simple tasks, `opus` for complex reasoning

## Troubleshooting

### Command Not Found
**Symptom**: `/buddy:mycommand` not recognized
**Causes**:
- File not in `commands/buddy/` directory
- Missing `.md` extension
- Plugin not loaded

**Solution**:
1. Verify file location: `ls commands/buddy/`
2. Restart Claude Code
3. Check `/help` for command list

### Command Not Invoking Agent
**Symptom**: Command runs but agent doesn't execute
**Causes**:
- Agent name misspelled
- Agent file missing
- Task tool not used correctly

**Solution**:
1. Verify agent name matches file: `ls agents/`
2. Check Task tool syntax in command
3. Review Claude Code logs

### Command Timeout
**Symptom**: Command hangs or times out
**Causes**:
- Agent takes too long
- Infinite loop in agent logic
- Network issues

**Solution**:
1. Set explicit timeout in Task tool
2. Review agent implementation
3. Use simpler model (`haiku`) for faster response

## See Also

- [agents.md](agents.md) - Agent system documentation
- [hooks.md](hooks.md) - Hook execution and validation
- [skills.md](skills.md) - Skills activation in commands
- [Architecture Overview](architecture.md) - System design

---

**Version**: 4.0.2
**Last Updated**: 2026-01-06
