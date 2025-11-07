# Testing Guide for Claude Buddy Plugin

This guide helps you test the Claude Buddy plugin locally before publishing.

## Prerequisites

Before testing, ensure you have:
- ✅ Python ≥3.8 installed
- ✅ uv package manager installed
- ✅ Claude Code installed and updated

## Local Testing Setup

### 1. Add Test Marketplace

From the **parent directory** of `claude-buddy-test-marketplace`:

```bash
cd /Users/ogarcia/Workspaces/AI/rsts/public/claude-buddy

# Start Claude Code
claude
```

In Claude Code, run:
```
/plugin marketplace add ./claude-buddy-test-marketplace
```

### 2. Install Plugin

```
/plugin install claude-buddy@claude-buddy-test-marketplace
```

Select "Install now" when prompted.

### 3. Restart Claude Code

Close and reopen Claude Code to activate the plugin.

## Verification Checklist

### Commands Available

Run `/help` and verify all 8 commands appear:
- [ ] `/buddy:persona`
- [ ] `/buddy:foundation`
- [ ] `/buddy:spec`
- [ ] `/buddy:plan`
- [ ] `/buddy:tasks`
- [ ] `/buddy:implement`
- [ ] `/buddy:commit`
- [ ] `/buddy:docs`

### Test Command Invocation

```
# Test persona command
/buddy:persona architect - What are best practices for API design?

# Test foundation command
/buddy:foundation

# Test spec command
/buddy:spec Create a simple REST API endpoint for user data
```

### Verify Agents

Agents should be automatically invoked by commands. Check that:
- [ ] `/buddy:persona` invokes `persona-dispatcher` agent
- [ ] `/buddy:spec` invokes `spec-writer` agent
- [ ] `/buddy:plan` invokes `plan-writer` agent
- [ ] `/buddy:tasks` invokes `tasks-writer` agent
- [ ] `/buddy:implement` invokes `task-executor` agent
- [ ] `/buddy:commit` invokes `git-workflow` agent
- [ ] `/buddy:docs` invokes `docs-generator` agent
- [ ] `/buddy:foundation` invokes `foundation` agent

### Test Skills

Skills should auto-activate based on context:

**Persona Skills:**
```
/buddy:persona security - Review authentication code
# Should activate security persona skill
```

**Domain Skills:**
```
# In a JHipster project
/buddy:spec Create a new entity
# Should activate JHipster skill

# In a MuleSoft project
/buddy:spec Create a new API flow
# Should activate MuleSoft skill
```

### Test Hooks

**File Protection:**
```
# Try to create/edit a .env file
# Should be blocked by file-guard hook
```

**Command Validation:**
```
# Try a dangerous command (this is safe in testing)
# The hook should warn about dangerous commands
```

**Auto-Formatting:**
```
# Create or edit a .js or .py file
# Should auto-format after saving
```

## Testing Workflow

### Complete Feature Development

Test the full workflow:

```
# 1. Foundation
/buddy:foundation

# 2. Spec
/buddy:spec Build a user authentication API with JWT

# 3. Plan
/buddy:plan

# 4. Tasks
/buddy:tasks

# 5. Implement
/buddy:implement

# 6. Commit
/buddy:commit

# 7. Docs
/buddy:docs
```

Verify:
- [ ] Each command executes without errors
- [ ] Agents are invoked correctly
- [ ] Output is appropriate for each stage
- [ ] Files are created in expected locations

### Persona Testing

Test auto-activation:
```
/buddy:persona How should I design a scalable microservices architecture?
# Should activate: architect, backend

/buddy:persona Review this React component for accessibility
# Should activate: frontend, qa

/buddy:persona Optimize database query performance
# Should activate: performance, backend
```

Test manual selection:
```
/buddy:persona architect security - Review this authentication system
# Should activate: architect, security explicitly
```

## Iteration Testing

When making changes to the plugin:

```
# 1. Uninstall current version
/plugin uninstall claude-buddy@claude-buddy-test-marketplace

# 2. Make your changes to plugin files
# (edit files in claude-buddy-plugin/)

# 3. Reinstall
/plugin install claude-buddy@claude-buddy-test-marketplace

# 4. Restart Claude Code

# 5. Test your changes
```

## Troubleshooting Tests

### Commands Not Appearing

**Issue:** Commands don't show in `/help`

**Check:**
1. Plugin installed: `/plugin`
2. Marketplace added: `/plugin marketplace list`
3. Plugin enabled: Check status in `/plugin`

**Fix:**
```
/plugin disable claude-buddy@claude-buddy-test-marketplace
/plugin enable claude-buddy@claude-buddy-test-marketplace
```

### Hook Errors

**Issue:** Hooks fail with Python errors

**Check:**
```bash
# Verify Python
python --version

# Verify uv
uv --version

# Test hook manually
cd claude-buddy-plugin
uv run --no-project python hooks/file-guard.py
```

**Fix:**
- Install Python ≥3.8
- Install uv: `pip install uv`
- Check hook script permissions: `chmod +x hooks/*.py`

### Persona Not Loading

**Issue:** Persona context doesn't load

**Check:**
1. Skills directory exists: `ls claude-buddy-plugin/skills/personas/`
2. SKILL.md files present for each persona
3. Persona names spelled correctly

**Fix:**
- Verify skill file structure
- Check persona names in command
- Try explicit selection: `/buddy:persona architect backend - question`

## Test Results Documentation

Record your test results:

### Commands
- [ ] All 8 commands available in `/help`
- [ ] Commands invoke correctly
- [ ] Help text displays properly

### Agents
- [ ] All 8 agents can be invoked
- [ ] Agents execute successfully
- [ ] Agent outputs are appropriate

### Skills
- [ ] Persona skills activate (12 personas)
- [ ] Domain skills activate (mulesoft, jhipster, react)
- [ ] Generator skills work with commands

### Hooks
- [ ] File protection blocks sensitive files
- [ ] Command validation blocks dangerous commands
- [ ] Auto-formatting works on supported files
- [ ] Hook timeouts are enforced

### Integration
- [ ] Complete workflow executes end-to-end
- [ ] Multi-persona collaboration works
- [ ] Template system functions correctly

## Performance Testing

Monitor performance during testing:

- Command response time: < 2 seconds (expected)
- Agent execution: < 30 seconds per agent (expected)
- Hook execution: < 10 seconds for validation, < 30 seconds for formatting
- Memory usage: Monitor for leaks

## Security Testing

Verify security features:

- [ ] .env files protected from modification
- [ ] Credential files cannot be written
- [ ] Dangerous bash commands are blocked
- [ ] File paths are validated properly

## Next Steps After Testing

Once all tests pass:

1. **Document Issues**: Create GitHub issues for any bugs found
2. **Update README**: Add any missing documentation
3. **Prepare Release**: Version bump, changelog, release notes
4. **Create Public Marketplace**: Set up GitHub repository for distribution
5. **Announce**: Share with community

## Support

If you encounter issues during testing:
- Check the main README.md troubleshooting section
- Review hook logs for error details
- Verify all prerequisites are installed
- Test with a fresh Claude Code session

---

**Testing Version**: 3.0.0
**Last Updated**: 2025-11-07
