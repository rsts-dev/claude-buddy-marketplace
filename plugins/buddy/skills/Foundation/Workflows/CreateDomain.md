# CreateDomain Workflow

Interactive wizard that guides the user through creating a new technology domain. Generates all required domain files with intelligent defaults, storing the domain in the user's customization directory.

## Variables

```
USER_DOMAINS_DIR: ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/
BUILTIN_DOMAINS_DIR: skills/Foundation/Domains/
TEMPLATE_DIR: skills/Foundation/Domains/_domain-template/
DEFAULT_DOMAIN_DIR: skills/Foundation/Domains/default/
```

## Workflow

### Step 1: Gather Domain Identity

Use AskUserQuestion to collect the domain name and description:

```
Question: "What technology domain do you want to create?"
Provide:
  - Domain name (lowercase, no spaces — e.g., "springboot", "django", "flutter")
  - One-line description of the technology stack
```

Validate the domain name:
- Must be lowercase alphanumeric with hyphens only (e.g., `springboot`, `vue-nuxt`)
- Must NOT conflict with existing built-in domains. Check:
  ```bash
  ls -d skills/Foundation/Domains/*/ 2>/dev/null
  ls -d ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/*/ 2>/dev/null
  ```
- If conflict: Use AskUserQuestion to inform user of the conflict and ask for a different name:
  - Question: "The domain name '{name}' conflicts with an existing domain. Please choose a different name."
  - Allow free-text input via the "Other" option

### Step 2: Analyze Technology Stack

Use AskUserQuestion to gather technology details:

```
Question: "Tell me about the {domain-name} technology stack. I'll use this to generate detection rules, analysis steps, and templates."

I need to know:
1. **Runtime & language** — What language and runtime? (e.g., Python 3.11+, JDK 21+, Node 20+)
2. **Framework** — Primary framework? (e.g., Spring Boot, Django, Flutter)
3. **Build tools** — How is the project built? (e.g., Maven, pip, flutter CLI)
4. **Key config files** — What files identify this project type? (e.g., pom.xml with spring-boot-starter, manage.py, pubspec.yaml)
5. **Project structure** — What directories are characteristic? (e.g., src/main/java/, templates/, lib/)
6. **Test framework** — How are tests run? (e.g., JUnit, pytest, flutter test)
7. **Package manifest** — Where are dependencies declared? (e.g., pom.xml, requirements.txt, pubspec.yaml)
8. **Key dependency markers** — What dependency names identify this stack in the manifest? (e.g., "spring-boot-starter-web", "django", "flutter")

You can answer as many as you know — I'll fill in sensible defaults for the rest.
```

If the user provides minimal info (e.g., just "Spring Boot"), use your knowledge of the technology to fill in reasonable defaults for all fields. Present the filled-in details for confirmation before proceeding.

### Step 3: Generate profile.md

Using the gathered information, generate the domain profile:

```markdown
---
type_key: {domain-name}
priority: 50
description: {user-provided description}
---
# Domain: {Domain Name (Title Case)}

{Brief paragraph about the domain's purpose and scope}

## Dependencies
- **Runtime**: {from Step 2}
- **CLI Tools**: {from Step 2}
- **Build**: {from Step 2}

## Keywords
{generated from technology names, framework names, file extensions, common terms}

## Reference Materials
| File | Description | Load When |
|------|-------------|-----------|
{populated if user provides reference docs, otherwise empty with comment}

## Best Practices Summary
{3-5 best practices generated from knowledge of the technology stack}
```

Present to user for review before writing.

### Step 4: Generate detect.md

Using the config files, manifest markers, and directory patterns from Step 2, generate detection rules:

```markdown
# Detection Rules: {domain-name}

## File Patterns
Files whose presence indicates this domain:
{generated from key config files — highest-confidence markers first}

## Manifest Checks
Check dependency manifests for domain-specific entries:
{generated from package manifest + dependency markers}

## Directory Structure
Expected directory patterns:
{generated from characteristic directories}

## Scoring
- HIGH match: 90 points
- MEDIUM match: 30 points  
- LOW match: 10 points
- Activation threshold: 60 points
{include a note about which single file/check guarantees detection}
```

**Detection rule generation strategy:**
- Config files unique to this stack (e.g., `pubspec.yaml` for Flutter) → HIGH confidence
- Manifest with framework dependency (e.g., `pom.xml` contains `spring-boot-starter`) → HIGH confidence
- Common directory patterns → MEDIUM confidence
- Generic files that could belong to other stacks → LOW confidence
- Ensure at least one HIGH confidence rule exists (so a single definitive file triggers detection)

Present to user for review before writing.

### Step 5: Generate analyze.md

Generate the domain-specific analysis workflow:

```markdown
# Domain Analysis: {domain-name}

Executed by CreateFoundation after domain detection. Performs deep, domain-specific codebase analysis.

## Analysis Steps

### Step 1: Configuration Discovery
{Read and parse the domain's key config files}
{Extract framework version, settings, features enabled}

### Step 2: Architecture Assessment
{Scan for characteristic source patterns}
{Determine architectural style — e.g., monolith, microservices, layered}

### Step 3: Dependency Analysis
{Parse manifest file for dependencies}
{Catalog key libraries, frameworks, and tools}

### Step 4: Testing Infrastructure
{Find test files and determine testing patterns}

## Output

Append these sections to the foundation draft:

### Technology Stack
{Framework, language, build tool, test framework, deployment}

### Domain Context
{Architecture style, project patterns, conventions}

### Domain-Specific Principles
{3-5 principles derived from the technology's best practices}
```

Customize the bash commands and extraction logic based on the actual technology stack. Present to user for review.

### Step 6: Generate Templates

Generate all four downstream templates (Spec, Plan, Tasks, Docs) customized for this domain.

**Strategy:** Start from the `default` domain templates and customize:
1. Read each default template from `Domains/default/Templates/`
2. Adapt terminology, sections, and examples to the technology stack
3. Add domain-specific sections where the technology demands it

**Spec.md customization:**
- Adjust "Extract key concepts" step for domain-relevant concepts
- Add domain-specific scope categories (e.g., "new API endpoint, new entity, new widget")
- Add domain-relevant "Common underspecified areas"
- Add domain-specific requirement sections if needed

**Plan.md customization:**
- Add domain-specific technical context fields
- Customize implementation phases for the technology's workflow
- Add domain-specific testing strategy sections

**Tasks.md customization:**
- Customize phase examples with domain-relevant task patterns
- Adjust file path conventions for the technology

**Docs.md customization:**
- Customize documentation file list for the technology
- Add domain-relevant documentation sections

Present each template to the user for review. User can accept, modify, or skip individual templates (skipped templates fall back to default).

### Step 7: Reference Materials (Optional)

Use AskUserQuestion:
```
Question: "Do you have any reference documentation files to include with this domain?"

Reference materials are large .md files with code examples, patterns, and API references
that get loaded on-demand during implementation. Examples from other domains:
- react-js.md (48KB of React patterns and examples)
- dataweave.md (55KB of DataWeave transformation examples)

Options:
- Yes — I have files to add (provide file paths)
- No — skip for now (can add later to Reference/ directory)
```

If yes:
- Copy provided files into `Reference/`
- Generate a `Reference/README.md` index
- Update the `profile.md` Reference Materials table

If no:
- Create a minimal `Reference/README.md` noting that reference materials can be added later

### Step 8: Create EXTEND.yaml

Generate the SKILLCUSTOMIZATIONS manifest:

```yaml
# EXTEND.yaml - Foundation Domain Extension
---
skill: Foundation
extends:
  - Domains/{domain-name}/profile.md
  - Domains/{domain-name}/detect.md
  - Domains/{domain-name}/analyze.md
  - Domains/{domain-name}/Templates/Spec.md
  - Domains/{domain-name}/Templates/Plan.md
  - Domains/{domain-name}/Templates/Tasks.md
  - Domains/{domain-name}/Templates/Docs.md
merge_strategy: append
enabled: true
description: "Custom {Domain Name} domain for Foundation skill"
```

### Step 9: Write All Files

Create the directory structure and write all files:

```bash
mkdir -p ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/{Templates,Reference}
```

Write files:
1. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/profile.md`
2. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/detect.md`
3. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/analyze.md`
4. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/Templates/Spec.md`
5. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/Templates/Plan.md`
6. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/Templates/Tasks.md`
7. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/Templates/Docs.md`
8. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/Reference/README.md`
9. `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/EXTEND.yaml` (create or update — append new domain)

### Step 10: Report

```
## Domain Created: {Domain Name}

- Location: ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/
- Type Key: {domain-name}
- Files created:
  - profile.md — Domain identity and metadata
  - detect.md — {count} detection rules ({high} high, {medium} medium confidence)
  - analyze.md — {count}-step analysis workflow
  - Templates/ — Spec, Plan, Tasks, Docs (4 templates)
  - Reference/ — {count} reference files
  - EXTEND.yaml — Skill customization manifest

- Detection: This domain will be auto-detected when:
  {list top 2-3 detection rules in plain language}

- Next steps:
  - Run `/buddy:foundation` in a {domain-name} project to test detection
  - Add reference materials to Reference/ directory for richer implementation guidance
  - Edit any generated file to fine-tune for your needs
```
