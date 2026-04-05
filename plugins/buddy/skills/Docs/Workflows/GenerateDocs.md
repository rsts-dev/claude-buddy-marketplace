# GenerateDocs Workflow

Generate comprehensive technical documentation from codebase analysis.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
DOCS_DIR: docs/
BUILTIN_DOMAINS_DIR: skills/Foundation/Domains/
USER_DOMAINS_DIR: ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/
PERSONAS_DIR: skills/Foundation/Personas/
```

## Workflow

### Step 1: Verify Prerequisites

1. Check foundation exists. If missing: guide to `/buddy:foundation`.
2. Load foundation, extract type.

### Step 2: Check Existing Docs

```bash
test -d docs/
```

If `docs/` exists, use AskUserQuestion:
```
Question: "Documentation directory already exists. How to proceed?"
Options:
- Overwrite — Regenerate all documentation
- Merge — Add missing docs, keep existing
- Cancel — Stop
```

### Step 3: Select Template

Resolve the template dynamically using the foundation type. Check user domains first (higher priority), then built-in:

1. **Try user domain template**: Read `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{foundation-type}/Templates/Docs.md`
2. **Try built-in domain template**: Read `skills/Foundation/Domains/{foundation-type}/Templates/Docs.md`
3. **Fallback**: If neither found, read `Templates/DefaultDocs.md`

### Step 4: Load Domain References (if applicable)

If a domain was matched in Step 3, load its profile from the same location (user or built-in):
1. Read `{matched-domain-path}/profile.md`
2. Check the **Reference Materials** table for files tagged with `Load When: Docs`
3. Load any matching reference files for documentation structure guidance

### Step 4.5: Load Persona

Load the **Scribe** persona for professional documentation quality:
1. Read `skills/Foundation/Personas/scribe/persona.md`
2. Apply the scribe's documentation principles: clarity, structure, audience awareness
3. Use the scribe's style guide for consistent, professional technical writing

### Step 5: Analyze Codebase

Execute analysis to understand the project:

```bash
# Project structure
find . -type f -not -path './.git/*' -not -path './node_modules/*' -not -path './.claude/*' | head -200

# Technology stack
cat package.json 2>/dev/null
cat pom.xml 2>/dev/null
cat build.gradle 2>/dev/null

# Configuration files
ls -la *.config.* .env* docker* 2>/dev/null

# Source code structure
find src/ -type f 2>/dev/null | head -100

# API specifications
find . -name "*.raml" -o -name "*.yaml" -o -name "*.openapi.*" 2>/dev/null
```

Extract:
- Architecture and component structure
- API endpoints and schemas
- Configuration patterns
- Testing patterns
- Deployment configurations

### Step 6: Generate Documentation

Create `docs/` directory and generate files following the template:

**Typical output files:**
- `docs/architecture.md` — System overview, component diagram (mermaid), data flow, tech stack
- `docs/api-reference.md` — API specifications, endpoints, schemas, examples
- `docs/setup.md` — Development environment setup, prerequisites, configuration
- `docs/deployment.md` — Deployment procedures, environments, monitoring
- `docs/troubleshooting.md` — Common issues, debugging, FAQ

Include:
- Mermaid diagrams for architecture visualization
- Real code examples from the codebase
- Working examples (curl commands, configuration snippets)
- Actual file paths from the project

### Step 7: Create Navigation Index

Write `docs/README.md`:

```markdown
# Project Documentation

## Table of Contents

- [Architecture](architecture.md) — System design, components, data flow
- [API Reference](api-reference.md) — Endpoints, schemas, examples
- [Developer Setup](setup.md) — Getting started, prerequisites
- [Deployment](deployment.md) — Deploy procedures, monitoring
- [Troubleshooting](troubleshooting.md) — Common issues, FAQ

## Quick Start
[Brief getting-started guide]
```

### Step 8: Quality Assurance

Verify:
- All markdown files well-formed
- Mermaid diagrams render correctly
- Internal links resolve
- Code examples syntactically correct
- File paths reference actual project files

### Step 9: Report

```
## Documentation Generated

- Path: docs/
- Files created: {list}
- Foundation type: {type}
- Domain: {foundation-type}
- Template: {domain template path or fallback}
- Navigation: docs/README.md
```
