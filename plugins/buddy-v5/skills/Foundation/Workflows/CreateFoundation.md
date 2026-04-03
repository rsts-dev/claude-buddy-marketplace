# CreateFoundation Workflow

Create a project foundation from scratch by analyzing the codebase, detecting the technology domain, and collecting user input.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
BUILTIN_DOMAINS_DIR: skills/Foundation/Domains/
USER_DOMAINS_DIR: ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/
```

## Workflow

### Step 1: Codebase Analysis

Analyze the project comprehensively to understand:

```bash
# Project structure (exclude .claude/, node_modules/, examples/)
find . -type f -not -path './.git/*' -not -path './.claude/*' -not -path './node_modules/*' -not -path './examples/*' -not -path './target/*' -not -path './build/*' | head -100

# Package files
cat package.json 2>/dev/null || cat pom.xml 2>/dev/null || cat build.gradle 2>/dev/null

# README
cat README.md 2>/dev/null
```

Extract:
- Project structure and architecture
- Key technologies and frameworks
- Main components and relationships
- Coding patterns and conventions
- Testing strategies and tools
- Build and deployment configurations

If insufficient project code exists (nearly empty project), fall back to structured questions via AskUserQuestion.

### Step 2: Detect Domain

Execute the `Workflows/DetectDomain.md` workflow to automatically identify the project's technology domain.

This scans all domains in `Domains/`, evaluates their detection rules against the project, and returns the best matching domain type key.

If detection is ambiguous or the user disagrees with the result, use AskUserQuestion to confirm:
```
Question: "Domain detection found '{detected_type}'. Is this correct?"
Options:
- Yes — proceed with {detected_type}
- No, this is a {list available domains} project
- No, use the default (generic) domain
```

### Step 3: Domain-Specific Analysis

Read and execute the selected domain's `analyze.md` workflow fragment at:
```
Domains/{detected_type}/analyze.md
```

This performs deep, domain-specific codebase analysis and produces:
- Technology Stack details
- Domain Context (architecture, patterns)
- Domain-Specific Principles to merge into Core Principles

Also read the domain's `profile.md` to extract:
- Dependencies (runtime, CLI tools, build requirements)
- Best Practices Summary
- Reference Materials index

### Step 4: Derive Principles

From the codebase analysis (Step 1), domain analysis (Step 3), and domain best practices, derive 3-7 core principles. Each principle needs:
- Succinct, declarative name
- Non-negotiable rules (use MUST/SHALL for requirements, SHOULD for recommendations)
- Explicit rationale
- Compliance verification criteria

Merge domain-specific principles from the `analyze.md` output with project-wide principles. Domain principles take precedence for technology-specific concerns.

### Step 5: Draft Foundation

Create the foundation document with these sections:

```markdown
# [PROJECT_NAME] Foundation

**Version**: 1.0.0
**Ratification Date**: [today YYYY-MM-DD]
**Last Amended**: [today YYYY-MM-DD]
**Foundation Type**: [detected domain type_key]

## Purpose
[Project mission and objectives]

## Technology Stack
[From domain analysis output — framework, build tool, test framework, etc.]

## Core Principles

### Principle 1: [Name]
**Requirements**: [Non-negotiable rules]
**Rationale**: [Why this matters]
**Compliance Verification**: [How to check]

[... additional principles ...]

## Domain Context
[From domain analysis — architecture, patterns, conventions discovered]

## Governance

### Amendment Procedure
[Who can propose, approval process]

### Versioning Policy
- MAJOR (X.0.0): Backward-incompatible changes
- MINOR (x.Y.0): New principles, expanded sections
- PATCH (x.y.Z): Clarifications, wording improvements

### Compliance Reviews
[Review expectations and frequency]

## Dependent Artifacts
[List of files that depend on this foundation]

## Domain References
[From domain profile.md — available reference materials and when to load them]

## Foundation Metadata
**Foundation Type**: [type_key]
**Domain**: [domain name from profile.md]
**Created By**: [user/analysis]
**Detection Score**: [score from DetectDomain]
```

### Step 6: Write Foundation

1. Create directory if needed:
```bash
mkdir -p directive
```

2. Write to `/directive/foundation.md`

### Step 7: Report

```
## Foundation Created

- Path: /directive/foundation.md
- Version: 1.0.0
- Foundation Type: {type_key}
- Domain: {domain name}
- Detection Score: {score}
- Principles: {count} core principles
- Reference Materials: {count} files available in Domains/{type_key}/Reference/
- Suggested commit: docs: create project foundation v1.0.0 ({type_key} domain)
```
