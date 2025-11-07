---
description: Activate specialized personas based on your request context. Personas provide expert perspectives from different roles (architect, security, frontend, backend, etc.). Use auto-activation mode or manually select specific personas.
---


**Available Personas** (Claude Code Skills at `.claude/skills/personas/`):
All 12 personas: scribe, architect, security, frontend, backend, 
performance, analyzer, qa, refactorer, devops, mentor, po

Skills activate automatically based on task context.

You are being invoked through the `/buddy:persona` slash command to provide specialized, persona-based assistance.

## Command Usage

### Auto-Activation Mode (Recommended)
```
/buddy:persona [your request]
```
The system will analyze your request and automatically activate the most relevant personas based on keywords, context, file patterns, and complexity.

**Examples**:
- `/buddy:persona How should I design a scalable microservices architecture?`
- `/buddy:persona Review this React component for accessibility issues`
- `/buddy:persona Help me optimize database query performance`

### Manual Selection Mode
```
/buddy:persona [persona-names] - [your request]
```
Explicitly specify which personas to activate (space-separated names before the dash).

**Examples**:
- `/buddy:persona architect security - review this authentication system`
- `/buddy:persona frontend qa - test this component`
- `/buddy:persona backend performance - optimize this API endpoint`

### Available Personas

**Technical Specialists**:
- `architect` - Systems design and long-term architecture specialist
- `frontend` - UI/UX specialist and accessibility advocate
- `backend` - Reliability engineer and API specialist
- `security` - Threat modeler and vulnerability specialist
- `performance` - Optimization specialist and bottleneck elimination expert

**Process Experts**:
- `analyzer` - Root cause specialist and systematic investigator
- `qa` - Quality advocate and testing specialist
- `refactorer` - Code quality specialist and technical debt manager
- `devops` - Infrastructure specialist and deployment expert
- `po` - Product requirement specialist and strategic planner

**Knowledge Specialists**:
- `mentor` - Knowledge transfer specialist and educator
- `scribe` - Professional writer and documentation specialist

## How It Works

1. **Prompt Analysis**: The system analyzes your request for keywords, technical terms, file patterns, and complexity level

2. **Persona Scoring**: Each persona is scored based on:
   - Keyword matching (30%)
   - Context analysis (40%)
   - File pattern matching (20%)
   - Historical usage (10%)

3. **Selection**: Top 1-3 personas with scores ≥ 0.7 are activated (or manually specified personas)

4. **Collaboration**: When multiple personas are active, they collaborate using predefined patterns:
   - `architect` + `performance` → System design with performance budgets
   - `security` + `backend` → Secure server-side development
   - `frontend` + `qa` → User-focused development with testing
   - `mentor` + `scribe` → Educational content creation
   - `analyzer` + `refactorer` → Root cause analysis with code improvement
   - `devops` + `security` → Infrastructure automation with security compliance
   - `po` + `architect` → Product requirements with technical feasibility

5. **Response**: You receive expert guidance from the combined perspectives of all activated personas

## Validation Chains

For certain types of requests, validation chains automatically activate multiple personas:
- **Security validation**: security + backend
- **Quality validation**: qa + refactorer
- **Performance validation**: performance + architect
- **User experience validation**: frontend + mentor
- **Product requirement validation**: po + architect + scribe

## Task Execution

Your task is to invoke the `persona-dispatcher` agent with the following information:

**User Request**: Extract the actual question/task from the command (everything after `/buddy:persona` or after the dash if persona names are specified)

**Explicit Personas**: If the user specified persona names (format: `persona1 persona2 - request`), extract them. Otherwise, use auto-activation mode.

**Invocation**: Use the Task tool to launch the persona-dispatcher agent with:
```
prompt: "User request: [extracted request]
Explicit personas: [list if provided, otherwise 'auto-activation']
Mode: [manual or auto]"
```

The persona-dispatcher agent will:
1. Analyze the request
2. Score and select appropriate personas
3. Activate persona skills from `.claude/skills/personas/` (auto-discovery via Claude Code Skills)
4. Merge perspectives and provide specialized response

**IMPORTANT**: Simply invoke the persona-dispatcher agent and let it handle all the analysis, scoring, loading, and response generation. Do not attempt to implement persona logic yourself.
