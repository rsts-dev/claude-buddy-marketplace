# GenerateSpec Workflow

Generate a formal feature specification from a natural language description.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
SPECS_DIR: specs/
FEATURE_DESCRIPTION: User-provided feature description from $ARGUMENTS
BUILTIN_DOMAINS_DIR: skills/Foundation/Domains/
USER_DOMAINS_DIR: ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/
PERSONAS_DIR: skills/Foundation/Personas/
```

## Workflow

### Step 1: Verify Prerequisites

1. Check foundation exists:
```bash
test -f directive/foundation.md
```
If missing: "Foundation is required. Run `/buddy:foundation` first." Exit.

2. Load foundation and extract type (the `Foundation Type` field value).

### Step 2: Select Template

Resolve the template dynamically using the foundation type. Check user domains first (higher priority), then built-in:

1. **Try user domain template**: Read `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{foundation-type}/Templates/Spec.md`
2. **Try built-in domain template**: Read `skills/Foundation/Domains/{foundation-type}/Templates/Spec.md`
3. **Fallback**: If neither found, read `Templates/DefaultSpec.md`

### Step 3: Load Domain References (if applicable)

If a domain was matched in Step 2, load its profile from the same location (user or built-in):
1. Read `{matched-domain-path}/profile.md`
2. Check the **Reference Materials** table for files tagged with `Load When: Spec`
3. Load any matching reference files for additional context

### Step 3.5: Load Persona

Load the **PO (Product Owner)** persona to enhance requirement analysis:
1. Read `skills/Foundation/Personas/po/persona.md`
2. Apply the persona's requirement perspective: user stories, acceptance criteria, stakeholder focus
3. Use the persona's decision framework to evaluate requirement completeness

### Step 4: Generate Specification

Apply the PO persona perspective while transforming the feature description into a complete specification:
- Replace all template placeholders with concrete details
- Maintain professional, clear, unambiguous language
- Include all required sections from the template
- Consider edge cases, error handling, non-functional requirements
- Align with foundation principles
- Mark unclear aspects with `[NEEDS CLARIFICATION: specific question]`

### Step 5: Clarification Cycle

1. Scan for `[NEEDS CLARIFICATION: ...]` markers
2. If found:
   - Compile into numbered question list
   - Use AskUserQuestion to present each clarification question to the user with relevant options where applicable
   - Update specification with answers, remove markers
   - Update status: Draft -> Ready for Review
3. If none: proceed to Step 6

### Step 6: Quality Assurance

Verify:
- All template sections present and filled
- All `[NEEDS CLARIFICATION]` markers resolved
- Consistency across sections
- Technical accuracy and feasibility
- Alignment with foundation principles

### Step 7: File Management

1. Generate three-word slug from feature description
2. Get today's date (YYYYMMDD)
3. Create directory:
```bash
mkdir -p specs/[YYYYMMDD-slug]
```
4. Write to: `specs/[YYYYMMDD-slug]/spec.md`

### Step 8: Report

```
## Specification Created

- Path: specs/{YYYYMMDD-slug}/spec.md
- Status: {Draft|Ready for Review}
- Domain: {foundation-type}
- Template: {domain template path or fallback}
- Clarifications: {count asked/answered}
- Next: Run `/buddy:plan` to create an implementation plan
```
