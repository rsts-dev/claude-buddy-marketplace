# Buddy v5 Domain System

The domain system provides technology-specific knowledge, templates, detection rules, and analysis workflows for different project types.

## Overview

Domains are auto-discovered from two locations:
1. **User domains** (higher priority): `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/`
2. **Built-in domains**: `skills/Foundation/Domains/`

## Built-in Domains

### default (priority: 0)
- **Type Key**: `default`
- **Detection**: Always matches (fallback with score 1)
- **Use Case**: Any project without a specific domain match
- **Reference Materials**: None (relies on codebase analysis)

### react (priority: 50)
- **Type Key**: `react`
- **Detection**: `package.json` with `"react"` dep (90 pts), `.jsx`/`.tsx` files (90 pts), `next.config.*` (90 pts)
- **Use Case**: React.js frontend applications (SPA, Next.js, React Native)
- **Reference Materials**: `react-js.md` (48KB — patterns, hooks, testing)
- **Dependencies**: Node 18+, npm/yarn/pnpm

### jhipster (priority: 70)
- **Type Key**: `jhipster`
- **Detection**: `.yo-rc.json` (90 pts), `pom.xml` with `tech.jhipster` (90 pts), `src/main/java/` + `src/main/webapp/app/` (90 pts)
- **Use Case**: JHipster full-stack (Angular + Spring Boot)
- **Reference Materials**: `jhipster.md` (60KB), `angular-js.md` (62KB), `angular-material.md` (64KB)
- **Dependencies**: JDK 17+, Node 18+, Maven/Gradle

### mulesoft (priority: 70)
- **Type Key**: `mulesoft`
- **Detection**: `mule-artifact.json` (90 pts), `*.dwl` files (90 pts), `pom.xml` with `mule-maven-plugin` (90 pts)
- **Use Case**: MuleSoft integration and API development
- **Reference Materials**: `dataweave.md` (55KB), `mule-sdk.md` (54KB), `mule-connector.md` (43KB), `mule-guidelines.md` (62KB), `anypoint-cli.md` (66KB), `docs-general.md` (54KB)
- **Dependencies**: Mule 4.x, Java 8+, Maven 3.6+

## Domain File Structure

Each domain requires these files:

```
{domain-name}/
  profile.md          # Identity, dependencies, keywords, reference index, best practices
  detect.md           # Detection rules with confidence scoring
  analyze.md          # Deep analysis workflow (executed by CreateFoundation)
  Templates/
    Spec.md           # Feature specification template
    Plan.md           # Implementation plan template
    Tasks.md          # Task breakdown template
    Docs.md           # Documentation template
  Reference/          # Large reference materials (loaded on-demand)
    README.md         # Index of reference files
```

### profile.md

Domain identity card with frontmatter:

```yaml
---
type_key: {domain-name}        # Used in Foundation Type field
priority: {0-100}               # Higher wins when tied
description: {one-line}
---
```

Contains: Dependencies, Keywords, Reference Materials table (with `Load When` column), Best Practices Summary.

### detect.md

Declarative detection rules evaluated by DetectDomain:

- **File Patterns**: Files whose presence indicates this domain (e.g., `.yo-rc.json`)
- **Manifest Checks**: Dependency manifest searches (e.g., `pom.xml` contains `spring-boot-starter`)
- **Directory Structure**: Expected directories (e.g., `src/main/java/`)
- **Scoring**: HIGH=90, MEDIUM=30, LOW=10; threshold=60

### analyze.md

Workflow fragment executed by CreateFoundation after detection. Produces:
- **Technology Stack** section for foundation.md
- **Domain Context** with discovered architecture
- **Domain-Specific Principles** to merge into Core Principles

### Templates/

Domain-specific templates for downstream skills. Each template customizes the generic structure with domain-relevant sections, terminology, and examples.

### Reference/

Large reference documentation files loaded on-demand. Each file is tagged in profile.md with `Load When` indicating which workflow phases should load it.

## Creating a Custom Domain

### Interactive Wizard (Recommended)

```
/buddy:foundation create domain
```

The wizard guides you through:
1. Domain name and description
2. Technology stack details (runtime, framework, config files, etc.)
3. Generates all required files with intelligent defaults
4. Stores in `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/`

### Manual Creation

1. Copy `skills/Foundation/Domains/_domain-template/` as a starting point
2. Customize all files for your technology
3. Place in either location (user or built-in)

## Detection Scoring Examples

**React project** (has `package.json` with `"react"` + `src/App.tsx`):
- `package.json` contains `"react"` → HIGH (90)
- `src/App.tsx` exists → HIGH (90)
- Total: 180 points → react domain selected

**JHipster project** (has `.yo-rc.json`):
- `.yo-rc.json` exists → HIGH (90)
- Total: 90 points → jhipster domain selected

**Generic Python project** (has `requirements.txt`):
- No domain matches threshold → default domain selected

## Reference Material Loading Strategy

Reference materials can be very large (60KB+). They are loaded on-demand:

1. **Never auto-loaded** at session start
2. **Phase-gated**: Each file tagged with `Load When` in profile.md
3. **Task-specific**: During Implementation, load only files relevant to current task
4. **Best Practices Summary** in profile.md provides enough for non-implementation phases

| Phase | What Loads |
|-------|------------|
| Foundation | Nothing (profile.md summary sufficient) |
| Spec | Files tagged `Load When: Spec` (usually none) |
| Plan | Files tagged `Load When: Plan` (architecture guides) |
| Tasks | Files tagged `Load When: Tasks` (usually none) |
| Implementation | Files tagged `Load When: Implementation` (code patterns) |
| Docs | Files tagged `Load When: Docs` (documentation patterns) |
