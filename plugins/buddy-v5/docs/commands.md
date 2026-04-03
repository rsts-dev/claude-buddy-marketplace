# Buddy v5 Commands Reference

All 7 commands are thin wrappers that route to their corresponding skill.

## Command List

| Command | Skill | Description |
|---------|-------|-------------|
| `/buddy:commit` | SourceControl | Create professional git commits |
| `/buddy:foundation` | Foundation | Create/update project foundation |
| `/buddy:spec` | Spec | Generate feature specifications |
| `/buddy:plan` | Plan | Generate implementation plans |
| `/buddy:tasks` | Tasks | Generate TDD-ordered task breakdowns |
| `/buddy:implement` | Implementation | Execute tasks with progress tracking |
| `/buddy:docs` | Docs | Generate technical documentation |

---

## /buddy:commit

**Usage**: `/buddy:commit [TICKET-REF] [--yes/-y | --interactive/-i]`

**Arguments**:
- `TICKET-REF` — Optional Jira (SDO-123) or GitHub (#10) reference
- `--yes` / `-y` — Auto-yes mode (no prompts)
- `--interactive` / `-i` — Interactive mode (explicit confirmation required)

**Example**:
```
/buddy:commit SDO-456 --yes
```

---

## /buddy:foundation

**Usage**: `/buddy:foundation [action] [arguments]`

**Auto-routing**:
- No arguments + no foundation exists → CreateFoundation (with domain detection)
- No arguments + foundation exists → UpdateFoundation
- `create domain` → CreateDomain wizard

**Examples**:
```
/buddy:foundation
/buddy:foundation add security review principle
/buddy:foundation create domain
```

---

## /buddy:spec

**Usage**: `/buddy:spec {feature-description}`

**Arguments**:
- Feature description in natural language

**Example**:
```
/buddy:spec user authentication with JWT tokens and password reset
```

**Output**: `specs/[YYYYMMDD-slug]/spec.md`

---

## /buddy:plan

**Usage**: `/buddy:plan [spec-identifier]`

**Arguments**:
- Optional spec folder identifier (if multiple specs exist)

**Example**:
```
/buddy:plan
/buddy:plan user-auth
```

**Output**: `specs/[YYYYMMDD-slug]/plan.md`

---

## /buddy:tasks

**Usage**: `/buddy:tasks [plan-identifier]`

**Arguments**:
- Optional plan folder identifier (if multiple plans exist)

**Example**:
```
/buddy:tasks
```

**Output**: `specs/[YYYYMMDD-slug]/tasks.md`

---

## /buddy:implement

**Usage**: `/buddy:implement [task-identifier]`

**Arguments**:
- Optional tasks folder identifier (if multiple exist)

**Example**:
```
/buddy:implement
```

**Behavior**: Executes tasks in TDD order, updates checkboxes in tasks.md, resumes from last checkpoint if interrupted.

---

## /buddy:docs

**Usage**: `/buddy:docs`

**Arguments**: None

**Example**:
```
/buddy:docs
```

**Output**: `docs/` directory with full technical documentation

---

## Workflow Sequence

The typical development workflow follows this sequence:

```
1. /buddy:foundation          # Set up project foundation (once per project)
2. /buddy:spec {description}  # Create feature specification
3. /buddy:plan                # Generate implementation plan
4. /buddy:tasks               # Break plan into TDD tasks
5. /buddy:implement           # Execute tasks (red-green-refactor)
6. /buddy:commit              # Commit with conventional message
7. /buddy:docs                # Generate/update documentation
```

Each step builds on the previous one's output. Steps 2-6 can be repeated for each feature.
