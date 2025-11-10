---
name: plan-generator
description: Generate implementation plans from feature specifications. Use when user has a specification and needs a detailed implementation plan, or requests "plan", "implementation plan", "how to implement", or planning guidance. Auto-activates for planning phase after specifications are complete.
---

# Implementation Plan Generator Skill

This skill assists in generating detailed implementation plans from feature specifications, breaking down high-level requirements into actionable technical approaches with phases, dependencies, and risk assessments.

## When to Use This Skill

- User has completed a specification and needs an implementation plan
- Converting product requirements into technical implementation steps
- Planning the execution of a new feature or enhancement
- Breaking down complex features into manageable phases
- Identifying technical dependencies and risks before implementation

## Auto-Activation

This skill automatically activates when:
- Keywords: "plan", "implementation plan", "planning", "how to implement", "execution plan", "technical approach"
- User has spec document and requests planning
- Request to convert specification to implementation steps
- Planning phase of feature development

## How It Works

### 1. Foundation Detection
First, check if `directive/foundation.md` exists:
- If missing: Inform user to run `/buddy:foundation` first
- If exists: Load to understand project type (default, jhipster, mulesoft, etc.)

### 2. Specification Loading
Load the existing specification document:
- Check for spec file in `specs/[date-slug]/spec.md`
- Parse specification to understand requirements
- Extract functional requirements and acceptance criteria
- Identify key entities and system boundaries

### 3. Template Selection
Based on foundation type, load the appropriate template:
- **Default projects**: `templates/default-plan.md`
- **JHipster projects**: `templates/jhipster-plan.md`
- **MuleSoft projects**: `templates/mulesoft-plan.md`

### 4. Plan Generation
Transform specification into a detailed implementation plan:
- Analyze requirements and determine technical approach
- Break down into implementation phases
- Identify tasks for each phase
- Map dependencies between tasks and phases
- Assess technical risks and mitigation strategies
- Estimate complexity and effort
- Define testing strategy

### 5. Quality Assurance
- Verify all specification requirements are addressed
- Ensure tasks are specific and actionable
- Check dependencies are properly mapped
- Validate risk assessments are comprehensive
- Confirm plan aligns with project architecture

### 6. File Management
- Use same directory as specification
- Write plan to: `specs/[YYYYMMDD-slug]/plan.md`
- Link back to specification document
- Maintain consistent naming and structure

## Template Structure

All templates follow this general structure:

```markdown
# [FEATURE NAME] Implementation Plan

**Specification**: [Link to spec.md]
**Status**: Draft
**Estimated Complexity**: [Low/Medium/High]

## Technical Approach
### Architecture Overview
### Technology Stack
### Integration Points

## Implementation Phases
### Phase 1: Foundation
### Phase 2: Core Features
### Phase 3: Integration & Testing

## Task Breakdown
### Frontend Tasks
### Backend Tasks
### Integration Tasks
### Testing Tasks

## Dependencies & Sequencing
## Risk Assessment
## Testing Strategy
## Deployment Plan
```

### Default Template
General-purpose implementation plan template for most projects.
Located at: [templates/default-plan.md](templates/default-plan.md)

Includes:
- Modular architecture approach
- Component-based task breakdown
- Standard testing strategies
- Generic deployment considerations

### JHipster Template
Tailored for JHipster full-stack applications.
Located at: [templates/jhipster-plan.md](templates/jhipster-plan.md)

Includes:
- JDL entity modeling tasks
- Angular component development phases
- Spring Boot service implementation
- Database migration planning
- JHipster-specific testing approach

### MuleSoft Template
Optimized for MuleSoft integration projects.
Located at: [templates/mulesoft-plan.md](templates/mulesoft-plan.md)

Includes:
- DataWeave transformation development
- Mule flow design phases
- Connector configuration tasks
- Integration testing strategy
- Anypoint Platform deployment

## Best Practices

### DO:
- Break work into logical phases (foundation → core → integration)
- Identify dependencies explicitly
- Assess risks early and plan mitigation
- Include testing in every phase
- Estimate complexity realistically
- Consider deployment and rollback
- Link back to specification requirements

### DON'T:
- Create phases that are too large (keep phases < 2 weeks)
- Ignore dependencies between tasks
- Skip risk assessment
- Forget non-functional requirements
- Overlook testing and validation
- Plan implementation without understanding spec

## Key Planning Principles

### 1. Incremental Delivery
- Start with minimum viable functionality
- Build in testable increments
- Deliver value early
- Allow for feedback and adjustment

### 2. Dependency Management
- Identify blocking dependencies first
- Create clear task sequencing
- Parallelize independent work streams
- Plan for integration points

### 3. Risk-First Approach
- Surface technical unknowns early
- Prototype risky components first
- Build in contingency for uncertainties
- Plan alternative approaches

### 4. Test-Driven Planning
- Define test strategy per phase
- Include unit, integration, and e2e tests
- Plan for test data and environments
- Consider test automation

## Example Usage

**Input**:
> "Create an implementation plan for the user authentication specification in specs/20251029-user-authentication/spec.md"

**Plan Generator Process**:
1. Detects foundation type: default
2. Loads specification from specified path
3. Analyzes requirements:
   - User registration
   - JWT authentication
   - Password reset
   - Role-based authorization
4. Loads default-plan.md template
5. Generates implementation plan with:
   - **Phase 1**: Database schema and user model
   - **Phase 2**: Authentication endpoints (register, login)
   - **Phase 3**: JWT token management
   - **Phase 4**: Password reset flow
   - **Phase 5**: Role-based authorization
   - **Phase 6**: Integration and security testing
6. Identifies dependencies:
   - User model → Authentication endpoints
   - JWT tokens → Authorization
   - All phases → Security testing
7. Assesses risks:
   - Token security and expiration
   - Password storage (bcrypt)
   - Rate limiting for login attempts
8. Writes plan to: `specs/20251029-user-authentication/plan.md`

## Integration with Other Skills

This skill works well with:
- **spec-generator**: Converts specifications into plans (sequential workflow)
- **tasks-generator**: Breaks plans into granular tasks (next step)
- **persona-architect**: For architectural guidance
- **persona-backend**: For API and service design
- **persona-frontend**: For UI implementation approach
- **persona-security**: For security considerations
- **persona-qa**: For testing strategy

## Workflow Integration

```
spec.md (requirements)
    ↓
[plan-generator] ← You are here
    ↓
plan.md (implementation approach)
    ↓
[tasks-generator]
    ↓
tasks.md (granular tasks)
    ↓
[Implementation]
    ↓
[docs-generator]
    ↓
docs.md (technical documentation)
```

## Output Format

```markdown
# User Authentication System - Implementation Plan

**Specification**: [spec.md](spec.md)
**Status**: Draft
**Estimated Complexity**: Medium
**Estimated Duration**: 3-4 weeks

## Technical Approach

### Architecture Overview
- Stateless JWT-based authentication
- bcrypt for password hashing
- Role-based access control (RBAC)
- Email-based password reset

### Technology Stack
- Backend: Node.js + Express
- Authentication: JWT (jsonwebtoken library)
- Password Hashing: bcrypt
- Email: SendGrid/NodeMailer
- Database: PostgreSQL

### Integration Points
- User service integration
- Email service integration
- Frontend login/register components

## Implementation Phases

### Phase 1: Foundation (Week 1)
**Objective**: Set up database schema and user model

**Tasks**:
1. Design user table schema (id, email, password_hash, role, created_at, etc.)
2. Create database migrations
3. Implement User model with validation
4. Set up password hashing utilities (bcrypt)

**Deliverable**: User model with database persistence

**Dependencies**: None (starting point)

### Phase 2: Authentication Endpoints (Week 1-2)
**Objective**: Implement registration and login

**Tasks**:
1. Create POST /api/auth/register endpoint
2. Implement input validation (email format, password strength)
3. Create POST /api/auth/login endpoint
4. Generate JWT tokens on successful login
5. Implement token verification middleware
6. Add rate limiting for auth endpoints

**Deliverable**: Working registration and login API

**Dependencies**: Phase 1 (User model)

...

## Risk Assessment

### High Risk
- **Token Security**: JWT secret exposure
  - Mitigation: Use environment variables, rotate secrets periodically

### Medium Risk
- **Password Storage**: Weak hashing
  - Mitigation: Use bcrypt with sufficient rounds (10+)

...
```

## Common Planning Patterns

### For Microservices
- Phase 1: Service structure and API contracts
- Phase 2: Core business logic
- Phase 3: Inter-service communication
- Phase 4: Service discovery and resilience

### For Frontend Features
- Phase 1: Component structure and routing
- Phase 2: State management
- Phase 3: API integration
- Phase 4: UI polish and accessibility

### For Data Migrations
- Phase 1: Migration script development
- Phase 2: Test environment validation
- Phase 3: Rollback procedure
- Phase 4: Production execution plan

## Estimation Guidelines

### Complexity Factors
- **Low**: Single component, well-understood tech, few dependencies
- **Medium**: Multiple components, some unknowns, moderate integration
- **High**: Complex architecture, new technology, many integration points

### Time Estimation
Consider:
- Development time
- Testing time
- Code review and iteration
- Documentation
- Deployment and validation

Add buffer for:
- Unknowns and learning curve
- Integration challenges
- Bug fixes and refinement

## Resources

- See [templates/](templates/) for all available plan templates
- Each template is foundation-specific and includes domain patterns
- Templates provide phase structures and task breakdowns
- Link to specification documents for full context
