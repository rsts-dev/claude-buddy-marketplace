---
name: tasks-generator
description: Generate granular task breakdowns from implementation plans. Use when user has a plan and needs executable tasks, or requests "tasks", "task breakdown", "todo list", "implementation tasks", or actionable work items. Auto-activates for task generation phase after plans are complete.
---

# Tasks Generator Skill

This skill assists in generating granular, executable task lists from implementation plans, breaking down high-level phases into specific, actionable work items with priorities, estimates, and clear acceptance criteria.

## When to Use This Skill

- User has completed an implementation plan and needs a task breakdown
- Converting technical approach into actionable work items
- Creating a development backlog from a plan
- Breaking down implementation phases into granular tasks
- Generating a todo list for feature implementation

## Auto-Activation

This skill automatically activates when:
- Keywords: "tasks", "task breakdown", "todo list", "implementation tasks", "work items", "actionable steps"
- User has plan document and requests task breakdown
- Request to convert plan to specific tasks
- Task generation phase of feature development

## How It Works

### 1. Foundation Detection
First, check if `directive/foundation.md` exists:
- If missing: Inform user to run `/buddy:foundation` first
- If exists: Load to understand project type (default, jhipster, mulesoft, etc.)

### 2. Plan Loading
Load the existing implementation plan document:
- Check for plan file in `specs/[date-slug]/plan.md`
- Parse plan to understand phases and approach
- Extract technical tasks from each phase
- Identify dependencies and sequencing

### 3. Template Selection
Based on foundation type, load the appropriate template:
- **Default projects**: `templates/default-tasks.md`
- **JHipster projects**: `templates/jhipster-tasks.md`
- **MuleSoft projects**: `templates/mulesoft-tasks.md`

### 4. Task Generation
Transform implementation plan into granular tasks:
- Break down each phase into specific tasks
- Make tasks small and focused (2-8 hours ideal)
- Add clear acceptance criteria per task
- Assign priorities based on dependencies
- Estimate complexity/effort per task
- Order tasks by dependencies
- Group related tasks
- Include testing tasks explicitly

### 5. Quality Assurance
- Verify all plan phases are covered
- Ensure tasks are specific and actionable
- Check dependencies are properly ordered
- Validate estimates are realistic
- Confirm acceptance criteria are clear
- Ensure no task is too large (split if needed)

### 6. File Management
- Use same directory as plan and specification
- Write tasks to: `specs/[YYYYMMDD-slug]/tasks.md`
- Link back to plan and specification
- Maintain consistent naming and structure

## Template Structure

All templates follow this general structure:

```markdown
# [FEATURE NAME] - Implementation Tasks

**Plan**: [Link to plan.md]
**Specification**: [Link to spec.md]
**Status**: Not Started
**Total Tasks**: [Count]
**Estimated Total**: [Hours/Days]

## Task Breakdown

### Phase 1: [Phase Name]
#### Task 1.1: [Task Name]
- **Priority**: High/Medium/Low
- **Estimate**: [Time]
- **Dependencies**: [Task IDs]
- **Acceptance Criteria**:
  - [ ] Criterion 1
  - [ ] Criterion 2

### Testing Tasks
### Documentation Tasks
```

### Default Template
General-purpose task breakdown template for most projects.
Located at: [templates/default-tasks.md](templates/default-tasks.md)

Includes:
- Generic task structure
- Component-based organization
- Standard testing tasks
- Documentation requirements

### JHipster Template
Tailored for JHipster full-stack development.
Located at: [templates/jhipster-tasks.md](templates/jhipster-tasks.md)

Includes:
- Entity generation tasks
- Angular component tasks
- Spring Boot service tasks
- Database migration tasks
- JHipster-specific testing

### MuleSoft Template
Optimized for MuleSoft integration development.
Located at: [templates/mulesoft-tasks.md](templates/mulesoft-tasks.md)

Includes:
- DataWeave transformation tasks
- Mule flow configuration tasks
- Connector setup tasks
- Integration testing tasks
- Anypoint deployment tasks

## Best Practices

### Task Characteristics (SMART)
- **Specific**: Clear, unambiguous description
- **Measurable**: Definite completion criteria
- **Achievable**: Can be done in 2-8 hours
- **Relevant**: Contributes to feature goal
- **Time-bound**: Has time estimate

### DO:
- Make tasks small and focused
- Include clear acceptance criteria
- Order by dependencies
- Estimate realistically
- Include testing tasks explicitly
- Add documentation tasks
- Link related tasks
- Mark blocking dependencies

### DON'T:
- Create vague tasks ("implement feature")
- Make tasks too large (>8 hours)
- Forget to include testing
- Ignore dependencies
- Skip acceptance criteria
- Overlook edge cases
- Forget documentation

## Task Granularity Guidelines

### Too Large (Split It)
❌ "Implement user authentication system"
- This is a phase, not a task

### Good Granularity
✅ "Create User model with email and password fields"
✅ "Implement bcrypt password hashing utility"
✅ "Add POST /api/auth/register endpoint with validation"
✅ "Write unit tests for password hashing"

### Too Small (Combine)
⚠️ "Add import statement for bcrypt"
- This is part of a larger task

## Priority Assignment

### High Priority
- Foundation tasks (blocking others)
- Core functionality required for MVP
- Tasks with many dependents
- Security-critical implementations

### Medium Priority
- Feature enhancements
- Non-blocking integrations
- Performance optimizations
- UI improvements

### Low Priority
- Nice-to-have features
- Code cleanup/refactoring
- Documentation polishing
- Optional validations

## Example Usage

**Input**:
> "Generate tasks from the implementation plan in specs/20251029-user-authentication/plan.md"

**Tasks Generator Process**:
1. Detects foundation type: default
2. Loads plan from specified path
3. Analyzes plan phases:
   - Phase 1: Foundation (database, user model)
   - Phase 2: Authentication endpoints
   - Phase 3: JWT management
   - Phase 4: Password reset
   - Phase 5: Authorization
   - Phase 6: Testing
4. Loads default-tasks.md template
5. Generates granular tasks:

   **Phase 1 Tasks** (5 tasks):
   - 1.1: Design and create database schema
   - 1.2: Implement User entity/model
   - 1.3: Add model validation rules
   - 1.4: Create password hashing utilities
   - 1.5: Write unit tests for User model

   **Phase 2 Tasks** (8 tasks):
   - 2.1: Create registration endpoint
   - 2.2: Add email/password validation
   - 2.3: Implement duplicate email check
   - 2.4: Create login endpoint
   - 2.5: Add credentials verification
   - 2.6: Implement rate limiting
   - 2.7: Write API tests for registration
   - 2.8: Write API tests for login

   (continued for all phases...)

6. Orders tasks by dependencies
7. Assigns priorities
8. Adds estimates
9. Writes tasks to: `specs/20251029-user-authentication/tasks.md`

## Integration with Other Skills

This skill works well with:
- **plan-generator**: Converts plans into tasks (sequential workflow)
- **spec-generator**: References original requirements
- **persona-architect**: For architectural task guidance
- **persona-backend**: For backend task details
- **persona-frontend**: For frontend task details
- **persona-qa**: For testing task creation
- **persona-devops**: For deployment task planning

## Workflow Integration

```
spec.md (requirements)
    ↓
plan.md (implementation approach)
    ↓
[tasks-generator] ← You are here
    ↓
tasks.md (granular tasks)
    ↓
[Implementation] (execute tasks)
    ↓
docs.md (documentation)
```

## Output Format

```markdown
# User Authentication System - Implementation Tasks

**Plan**: [plan.md](plan.md)
**Specification**: [spec.md](spec.md)
**Status**: Not Started
**Total Tasks**: 42
**Estimated Total**: 3-4 weeks

## Progress Tracker
- [ ] Phase 1: Foundation (5 tasks)
- [ ] Phase 2: Authentication Endpoints (8 tasks)
- [ ] Phase 3: JWT Management (6 tasks)
- [ ] Phase 4: Password Reset (7 tasks)
- [ ] Phase 5: Authorization (8 tasks)
- [ ] Phase 6: Testing & Security (8 tasks)

---

## Phase 1: Foundation

### Task 1.1: Design and Create Database Schema
- **Priority**: High
- **Estimate**: 2 hours
- **Dependencies**: None
- **Acceptance Criteria**:
  - [ ] Users table created with columns: id, email, password_hash, role, created_at, updated_at
  - [ ] Email column has unique constraint
  - [ ] Appropriate indexes created (email, created_at)
  - [ ] Migration script tested in development
  - [ ] Schema documented in README

### Task 1.2: Implement User Entity/Model
- **Priority**: High
- **Estimate**: 3 hours
- **Dependencies**: 1.1
- **Acceptance Criteria**:
  - [ ] User class/model created with all fields
  - [ ] Proper data types defined
  - [ ] Model methods for common operations (create, find, update)
  - [ ] ORM/database mapping configured
  - [ ] Model exports properly for use in other modules

### Task 1.3: Add User Model Validation Rules
- **Priority**: High
- **Estimate**: 2 hours
- **Dependencies**: 1.2
- **Acceptance Criteria**:
  - [ ] Email format validation implemented
  - [ ] Password strength requirements enforced (min 8 chars, special chars, etc.)
  - [ ] Required field validation in place
  - [ ] Validation error messages are clear and user-friendly
  - [ ] Edge cases handled (null, undefined, empty strings)

### Task 1.4: Create Password Hashing Utilities
- **Priority**: High
- **Estimate**: 2 hours
- **Dependencies**: None
- **Acceptance Criteria**:
  - [ ] bcrypt library integrated
  - [ ] hashPassword() function implemented with salt rounds = 10
  - [ ] comparePassword() function implemented
  - [ ] Utility functions handle errors gracefully
  - [ ] Constants defined for salt rounds

### Task 1.5: Write Unit Tests for User Model
- **Priority**: High
- **Estimate**: 3 hours
- **Dependencies**: 1.2, 1.3, 1.4
- **Acceptance Criteria**:
  - [ ] Test user creation with valid data
  - [ ] Test validation failures for invalid email
  - [ ] Test validation failures for weak passwords
  - [ ] Test password hashing integration
  - [ ] Test model methods (find, update)
  - [ ] All tests pass
  - [ ] Code coverage > 80%

---

## Phase 2: Authentication Endpoints

### Task 2.1: Create Registration Endpoint (POST /api/auth/register)
- **Priority**: High
- **Estimate**: 4 hours
- **Dependencies**: 1.2, 1.3, 1.4
- **Acceptance Criteria**:
  - [ ] Endpoint accepts email and password in request body
  - [ ] Input validation implemented
  - [ ] Password is hashed before storage
  - [ ] User record created in database
  - [ ] Success response returns user info (without password)
  - [ ] Error responses for invalid input
  - [ ] Error response for duplicate email

...

---

## Testing Tasks

### Task T.1: Integration Tests for Auth Flow
- **Priority**: High
- **Estimate**: 4 hours
- **Dependencies**: All Phase 2 tasks
- **Acceptance Criteria**:
  - [ ] End-to-end test: Register → Login → Access protected route
  - [ ] Test with valid and invalid credentials
  - [ ] Test token expiration handling
  - [ ] Test concurrent login sessions
  - [ ] All integration tests pass

### Task T.2: Security Testing
- **Priority**: High
- **Estimate**: 3 hours
- **Dependencies**: All implementation tasks
- **Acceptance Criteria**:
  - [ ] SQL injection testing on auth endpoints
  - [ ] XSS testing on user inputs
  - [ ] Brute force protection verified
  - [ ] Token security validated
  - [ ] No sensitive data in logs or responses
  - [ ] Security audit checklist completed

---

## Documentation Tasks

### Task D.1: API Documentation
- **Priority**: Medium
- **Estimate**: 2 hours
- **Dependencies**: All API tasks
- **Acceptance Criteria**:
  - [ ] All endpoints documented with request/response examples
  - [ ] Authentication flow diagram created
  - [ ] Error codes documented
  - [ ] Rate limiting explained
  - [ ] Postman collection created

### Task D.2: Developer Setup Guide
- **Priority**: Medium
- **Estimate**: 1 hour
- **Dependencies**: None
- **Acceptance Criteria**:
  - [ ] Environment variables documented
  - [ ] Database setup steps explained
  - [ ] Local testing instructions provided
  - [ ] Common issues and solutions listed
```

## Task Statuses

Track progress with these statuses:
- **Not Started**: Task not begun
- **In Progress**: Currently being worked on
- **Blocked**: Waiting on dependency
- **In Review**: Code review pending
- **Testing**: QA validation in progress
- **Done**: Completed and merged

## Estimation Techniques

### Story Points (Relative Sizing)
- 1 point: < 2 hours, trivial
- 2 points: 2-4 hours, straightforward
- 3 points: 4-8 hours, moderate complexity
- 5 points: 8-16 hours, complex (consider splitting)
- 8+ points: Too large, must split

### T-Shirt Sizing
- XS: < 2 hours
- S: 2-4 hours
- M: 4-8 hours
- L: 8-16 hours (split recommended)
- XL: > 16 hours (must split)

## Common Task Patterns

### Backend API Task
```
- Implement [METHOD] [ENDPOINT] endpoint
- Priority: High/Medium/Low
- Estimate: 3-4 hours
- Acceptance Criteria:
  - [ ] Endpoint accepts correct parameters
  - [ ] Input validation implemented
  - [ ] Business logic executed correctly
  - [ ] Proper error handling
  - [ ] Unit tests written (>80% coverage)
  - [ ] API documentation updated
```

### Frontend Component Task
```
- Create [ComponentName] component
- Priority: High/Medium/Low
- Estimate: 4-6 hours
- Acceptance Criteria:
  - [ ] Component renders correctly
  - [ ] Props and state managed properly
  - [ ] Event handlers implemented
  - [ ] Responsive design
  - [ ] Accessibility (WCAG AA)
  - [ ] Unit tests written
  - [ ] Storybook story created
```

### Database Migration Task
```
- Create migration for [change description]
- Priority: High
- Estimate: 2-3 hours
- Acceptance Criteria:
  - [ ] Migration script created
  - [ ] Rollback script created
  - [ ] Tested in development environment
  - [ ] No data loss in rollback
  - [ ] Migration documented
```

## Resources

- See [templates/](templates/) for all available task templates
- Each template is foundation-specific and includes domain patterns
- Templates provide task structures and acceptance criteria examples
- Link to plan and specification documents for full context
