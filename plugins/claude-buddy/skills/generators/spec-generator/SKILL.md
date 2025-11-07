---
name: spec-generator
description: Generate feature specifications from natural language descriptions. Use when user requests a specification, mentions "spec", "specification", or needs to document feature requirements before implementation. Auto-activates for specification creation tasks.
---

# Specification Generator Skill

This skill assists in generating comprehensive feature specifications from natural language descriptions, following project-specific templates and best practices.

## When to Use This Skill

- User provides a feature description and needs a formal specification
- Creating product requirements documents (PRDs)
- Documenting feature requirements before implementation
- Converting user stories into detailed specifications
- Planning new features or enhancements

## Auto-Activation

This skill automatically activates when:
- Keywords: "spec", "specification", "feature spec", "requirements", "document feature"
- User describes a feature that needs formal documentation
- Request to create specification before implementation
- Planning phase of feature development

## How It Works

### 1. Foundation Detection
First, check if `directive/foundation.md` exists:
- If missing: Inform user to run `/buddy:foundation` first
- If exists: Load to understand project type (default, jhipster, mulesoft, etc.)

### 2. Template Selection
Based on foundation type, load the appropriate template:
- **Default projects**: `templates/default-spec.md`
- **JHipster projects**: `templates/jhipster-spec.md`
- **MuleSoft projects**: `templates/mulesoft-spec.md`

### 3. Specification Generation
Transform user's feature description into a complete specification:
- Replace all template placeholders with concrete details
- Mark unclear aspects with `[NEEDS CLARIFICATION: question]`
- Maintain professional, clear, unambiguous language
- Include all required sections from the template

### 4. Clarification Cycle
- Scan for `[NEEDS CLARIFICATION: ...]` markers
- If found: Present questions to user and wait for answers
- Update specification with answers and remove markers
- If no clarifications: Proceed to quality assurance

### 5. File Management
- Generate three-word slug from feature description
- Get date in YYYYMMDD format
- Create directory: `specs/[YYYYMMDD-slug]/`
- Write specification to: `specs/[YYYYMMDD-slug]/spec.md`

## Template Structure

All templates follow this general structure:

```markdown
# [FEATURE NAME] Specification

**Feature Branch**: `[###-feature-name]`
**Created**: [DATE]
**Status**: Draft

## User Scenarios & Testing
### Primary User Story
### Acceptance Scenarios
### Edge Cases

## Requirements
### Functional Requirements
### Key Entities (if applicable)

## Review & Acceptance Checklist
```

### Default Template
General-purpose specification template for most projects.
Located at: [templates/default-spec.md](templates/default-spec.md)

### JHipster Template
Tailored for JHipster full-stack applications with entity modeling.
Located at: [templates/jhipster-spec.md](templates/jhipster-spec.md)

Includes:
- JDL (JHipster Domain Language) entity definitions
- Angular component specifications
- Spring Boot API requirements
- Database schema considerations

### MuleSoft Template
Optimized for MuleSoft integration and API projects.
Located at: [templates/mulesoft-spec.md](templates/mulesoft-spec.md)

Includes:
- API endpoint specifications
- DataWeave transformation requirements
- Integration patterns
- Error handling requirements

## Best Practices

### DO:
- Focus on WHAT users need and WHY
- Write for business stakeholders, not just developers
- Make requirements testable and unambiguous
- Mark any uncertainties explicitly
- Use clear, jargon-free language
- Include concrete acceptance criteria

### DON'T:
- Include HOW to implement (no tech stack, APIs, code structure)
- Make assumptions without marking them for clarification
- Leave vague or untestable requirements
- Guess at user intentions
- Include implementation details

## Common Underspecified Areas

Always check these and mark for clarification if not provided:
1. **User types and permissions**: Who can do what?
2. **Data retention/deletion policies**: How long to keep data?
3. **Performance targets and scale**: How fast? How many users?
4. **Error handling behaviors**: What happens when things fail?
5. **Integration requirements**: What systems need to connect?
6. **Security/compliance needs**: Any regulatory requirements?

## Example Usage

**User Input**:
> "I need a user authentication system with JWT tokens, password reset functionality, and role-based access control"

**Spec Generator Process**:
1. Detects foundation type: default
2. Loads default-spec.md template
3. Identifies key requirements:
   - User registration and login
   - JWT token management
   - Password reset flow
   - Role-based authorization
4. Marks clarifications:
   - `[NEEDS CLARIFICATION: Which roles are needed? (Admin, User, Guest?)]`
   - `[NEEDS CLARIFICATION: Password reset via email or SMS?]`
   - `[NEEDS CLARIFICATION: Token expiration time?]`
5. Generates spec at: `specs/20251029-user-authentication/spec.md`
6. Presents clarification questions to user

## Integration with Other Skills

This skill works well with:
- **persona-scribe**: For professional writing and documentation
- **persona-architect**: For architectural considerations
- **persona-security**: For security requirements
- **persona-po**: For product requirements perspective

## Output Format

```markdown
# User Authentication System

**Feature Branch**: `feature/user-authentication`
**Created**: 2025-10-29
**Status**: Draft
**Input**: User description: "user authentication system with JWT..."

## User Scenarios & Testing

### Primary User Story
As a user, I want to securely log into the application so that I can access my personalized content and features.

### Acceptance Scenarios
1. **Given** a new user, **When** they register with valid credentials, **Then** their account is created and they receive a confirmation
2. **Given** a registered user, **When** they login with correct credentials, **Then** they receive a JWT token and access to the application
3. **Given** a user who forgot their password, **When** they request a password reset, **Then** they receive reset instructions [NEEDS CLARIFICATION: via email or SMS?]

...
```

## Resources

- See [templates/](templates/) for all available specification templates
- Each template includes inline guidance and placeholders
- Templates are foundation-specific and follow established project patterns
