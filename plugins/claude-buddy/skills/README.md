# Claude Buddy Skills

This directory contains Claude Code Skills that provide specialized capabilities for development tasks. Skills are automatically discovered and activated by Claude based on context, keywords, and file patterns.

## Skills Organization

### 📁 Personas (`personas/`)
Specialized AI personas that provide expert perspectives on different aspects of development:

- **scribe** - Professional writer and documentation specialist
- **architect** - Systems design and long-term architecture specialist
- **security** - Threat modeler and vulnerability specialist
- **frontend** - UI/UX specialist and accessibility advocate
- **backend** - Reliability engineer and API specialist
- **performance** - Optimization specialist and bottleneck elimination expert
- **analyzer** - Root cause specialist and systematic investigator
- **qa** - Quality advocate and testing specialist
- **refactorer** - Code quality specialist and technical debt manager
- **devops** - Infrastructure specialist and deployment expert
- **mentor** - Knowledge transfer specialist and educator
- **po** - Product requirement specialist and strategic planner

**Auto-Activation**: Personas activate based on keywords, file patterns, and task context. Multiple personas can collaborate on complex tasks.

### 📁 Domains (`domains/`)
Technology-specific knowledge and best practices:

- **react** - React.js development patterns and best practices
- **jhipster** - JHipster full-stack application development
- **mulesoft** - MuleSoft integration, DataWeave, and Anypoint Platform

**Auto-Activation**: Domain skills activate when working with specific technologies (file patterns, package dependencies, keywords).

### 📁 Generators (`generators/`)
Document generation capabilities using foundation-aware templates:

- **spec-generator** - Generate feature specifications from descriptions
- **plan-generator** - Create implementation plans from specifications
- **tasks-generator** - Generate task breakdowns from plans
- **docs-generator** - Create comprehensive technical documentation

**Auto-Activation**: Generator skills activate when creating specifications, plans, tasks, or documentation.

## How Skills Work

### Progressive Disclosure
Skills use a two-tier system:
1. **SKILL.md** - Core guidance loaded when skill activates
2. **Supporting files** - Detailed examples, templates, and references loaded only when needed

This minimizes token usage while providing comprehensive capabilities.

### Auto-Activation
Skills automatically activate based on:
- **Keywords**: Specific terms in user requests (e.g., "security", "dataweave", "refactor")
- **File Patterns**: File types being worked on (e.g., `.jsx`, `.dwl`, `.md`)
- **Context**: Project structure, configuration files, dependencies
- **Task Type**: Nature of the work (writing docs, designing architecture, etc.)

### Composition
Multiple skills can activate together for complex tasks:
- **architect + performance**: System design with performance budgets
- **security + backend**: Secure server-side development
- **frontend + qa**: User-focused development with testing
- **scribe + mentor**: Educational content creation

## Skill Structure

Each skill follows this pattern:

```
skill-name/
├── SKILL.md              # Core skill definition (required)
├── supporting-doc.md     # Additional documentation (optional)
├── templates/            # Templates for generation (optional)
│   ├── default.md
│   ├── variant-1.md
│   └── variant-2.md
└── examples/             # Code examples (optional)
    └── example.md
```

### SKILL.md Format
```yaml
---
name: skill-name
description: Brief description of what the skill does and when to use it. Include keywords for auto-activation.
allowed-tools: Read, Grep, Glob, Edit, Write  # Optional: Restrict tool access
---

# Skill Name

Core skill content here...

## When to Use

## Auto-Activation

## Key Concepts

## Examples

## Resources
- See [supporting-doc.md](supporting-doc.md) for details
```

## Skills Benefits

### ✅ Advantages
1. **Auto-Discovery**: Skills activate automatically without explicit loading
2. **Token Efficiency**: Progressive disclosure loads only what's needed (30-70% savings)
3. **Better Composition**: Multiple skills work together naturally
4. **Standard Pattern**: Uses Claude Code's native skill system
5. **Simpler Agents**: Less boilerplate, more focused logic

### 📊 Token Savings Example

**Skills System**:
```markdown
<!-- Automatic activation -->
- scribe persona: Auto-activates for documentation tasks
- mulesoft domain: Auto-activates for .dwl files
- spec-generator: Auto-activates when creating specs
- Supporting files: Loaded only when referenced
```
Token Usage: ~3,000 tokens (core skills), ~5,000 more if supporting files needed

**Savings**: 30-70% token reduction compared to loading all content upfront

## Using Skills

### As a User
Skills activate automatically - just work naturally:
- "Create a spec for user authentication" → spec-generator + scribe activate
- "Review this DataWeave code" → mulesoft domain activates
- "Optimize this API" → backend + performance personas activate

### As an Agent Developer
Skills are available when your agent needs them:

**Option 1: Rely on Auto-Activation** (Recommended)
```markdown
# Your agent prompt
When the user describes a feature, I will automatically have access to:
- Relevant persona perspectives (scribe, architect, etc.)
- Domain-specific knowledge (if working with React, MuleSoft, etc.)
- Generator capabilities (for creating specs, plans, docs)

I don't need to manually load files - skills activate based on context.
```

**Option 2: Explicit Skill Reference**
```markdown
# Your agent prompt
For specification generation:
1. Refer to the spec-generator skill for templates
2. Let persona skills provide writing/architecture guidance
3. Domain skills will provide technology-specific context
```

## Testing Skills

### Verify Skill Availability
Ask Claude:
```
What skills are available?
```

### Test Persona Activation
```
I need help with security vulnerabilities in my authentication code
```
Expected: security persona activates

### Test Domain Activation
```
Help me write a DataWeave transformation
```
Expected: mulesoft domain skill activates

### Test Generator Activation
```
Create a specification for a user management API
```
Expected: spec-generator + scribe activate

## Troubleshooting

### Skill Not Activating
1. **Check description**: Does it include relevant keywords?
2. **Verify file location**: Is SKILL.md in the correct directory?
3. **Check YAML syntax**: Is frontmatter valid?
4. **Review activation criteria**: Are keywords/patterns appropriate?

### Skills Conflicting
1. **Refine descriptions**: Make activation criteria more specific
2. **Use allowed-tools**: Restrict scope per skill
3. **Adjust keywords**: Remove overlapping terms

### Supporting Files Not Loading
1. **Check references**: Are links in SKILL.md correct?
2. **Verify paths**: Are supporting files in the skill directory?
3. **Use relative paths**: Link with `[text](file.md)` not absolute paths

## Best Practices

### Creating New Skills
1. **Focus**: One skill = one capability
2. **Clear Description**: Include activation keywords
3. **Progressive Disclosure**: Core guidance in SKILL.md, details in supporting files
4. **Examples**: Provide concrete examples
5. **Testing**: Verify auto-activation works as expected

### Maintaining Skills
1. **Version Documentation**: Note changes in skill content
2. **Keep Focused**: Don't let skills become too broad
3. **Update Activation Criteria**: Adjust keywords as needed
4. **Test Composition**: Ensure skills work well together
5. **Monitor Usage**: Track which skills activate most

### Performance Optimization
1. **Keep SKILL.md Concise**: Core concepts only
2. **Use Supporting Files**: For detailed examples and documentation
3. **Avoid Duplication**: Don't repeat info across skills
4. **Progressive Loading**: Reference files, don't inline them

## Contributing

To add a new skill:

1. Create directory: `.claude/skills/<category>/<skill-name>/`
2. Create SKILL.md with proper frontmatter
3. Add supporting files as needed
4. Test auto-activation
5. Document in this README
6. Commit to version control

## Future Enhancements

Planned improvements:
- [ ] Skill composition patterns documentation
- [ ] More domain skills (Python, Go, Kubernetes, etc.)
- [ ] Additional generator templates
- [ ] Skill performance metrics
- [ ] Automated skill testing framework
- [ ] Skill marketplace/sharing capabilities

## Resources

- [Claude Code Skills Documentation](https://docs.claude.com/en/docs/claude-code/claude-code-skills)
- [Agent Skills Overview](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/overview)
- [Skills Best Practices](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/best-practices)

---

**Migration Date**: 2025-10-29
**Total Skills**: 27 (12 personas + 3 domains + 4 generators + supporting structure)
**Token Savings**: 30-70% compared to manual loading
