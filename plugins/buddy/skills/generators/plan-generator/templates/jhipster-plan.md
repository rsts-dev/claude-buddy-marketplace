---
description: "JHipster implementation plan template for full-stack web applications and microservices"
---

# JHipster Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]`
**Spec**: [link]
**Created**: [DATE]
**Status**: Draft
**Application Type**: [Monolith/Microservices/Gateway] | **Stack**: [Reactive/Imperative]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

## Execution Flow (/buddy:plan command scope)
```
1. Load feature spec from Input path
   → If not found: ERROR "No feature spec at {path}"
2. Fill Technical Context (scan for NEEDS CLARIFICATION)
   → Detect Application Type (monolith, microservices, gateway)
   → Determine stack choices (frontend framework, database, authentication)
   → Identify JHipster generator options
3. Fill the Foundation Check section based on the content of the foundation document
4. Evaluate Foundation Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Foundation Check
5. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
6. Execute Phase 1 → jdl-model.jdl, api-contracts/, frontend-design.md, test-scenarios.md, agent-specific template file
7. Re-evaluate Foundation Check section
   → If new violations: Refactor design, return to Phase 1
   → Update Progress Tracking: Post-Design Foundation Check
8. Plan Phase 2 → Describe task generation approach (DO NOT create tasks.md)
9. STOP - Ready for /buddy:tasks command
```

**IMPORTANT**: The /buddy:plan command STOPS at step 8. Phases 2-4 are executed by other commands:
- Phase 2: /buddy:tasks command creates tasks.md
- Phase 3-4: Implementation execution (manual or via tools)

## Summary
[Extract from feature spec: primary requirement + technical approach from research]

## Technical Context
**JHipster Version**: [e.g., 8.x, 7.x or NEEDS CLARIFICATION]
**Application Type**: [Monolith/Microservices/Gateway or NEEDS CLARIFICATION]
**Backend Framework**: [Spring Boot/Micronaut/Quarkus/Node.js/.NET or NEEDS CLARIFICATION]
**Backend Language**: [Java/Kotlin/TypeScript/C# or NEEDS CLARIFICATION]
**Frontend Framework**: [Angular/React/Vue/No frontend or NEEDS CLARIFICATION]
**Database Type**: [SQL (PostgreSQL/MySQL/MariaDB)/MongoDB/Cassandra/Neo4j or NEEDS CLARIFICATION]
**Cache**: [Ehcache/Hazelcast/Infinispan/Redis/Memcached or N/A]
**Build Tool**: [Maven/Gradle or NEEDS CLARIFICATION]
**Authentication**: [JWT/OAuth 2.0/Session or NEEDS CLARIFICATION]
**Testing Frameworks**: [JUnit/Jest/Karma/Protractor/Cypress/Playwright or NEEDS CLARIFICATION]
**Reactive**: [Yes (WebFlux)/No (Spring MVC) or NEEDS CLARIFICATION]
**Internationalization**: [Languages supported or N/A]
**Performance Goals**: [e.g., <200ms API response, 60 fps UI or NEEDS CLARIFICATION]
**Constraints**: [e.g., <1GB memory, offline-capable, specific browser support or NEEDS CLARIFICATION]
**Scale/Scope**: [e.g., 10k users, 100k records, 20 entities or NEEDS CLARIFICATION]

## Foundation Check
*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

Based on `/directive/foundation.md` v1.0.0, verify compliance with:

### Principle 1: Modular Extensibility
- [ ] Feature components are designed as independent modules
- [ ] New functionality extends without modifying core framework
- [ ] Templates and configurations are properly isolated

### Principle 2: Safety-First Automation
- [ ] All automated operations include validation steps
- [ ] Destructive operations are explicitly protected
- [ ] Error handling prevents unintended consequences

### Principle 3: Contextual Intelligence
- [ ] Design leverages foundation document principles
- [ ] Context from previous phases propagates forward
- [ ] Templates maintain consistency with project patterns

### Principle 4: Developer Experience Excellence
- [ ] Clear documentation for all new components
- [ ] Error messages provide actionable guidance
- [ ] Progressive disclosure of advanced features

### Principle 5: Transparent Collaboration
- [ ] Changes maintain clear attribution trails
- [ ] Automated operations are logged appropriately
- [ ] Human review points are explicitly defined

**Violations Requiring Justification**: [List any principle violations and provide rationale in Complexity Tracking section]

## Project Structure

### Documentation (this feature)
```
specs/[###-feature]/
├── plan.md              # This file (/buddy:plan command output)
├── research.md          # Phase 0 output (/buddy:plan command)
├── jdl-model.jdl        # Phase 1 output (/buddy:plan command) - JHipster Domain Language
├── api-contracts/       # Phase 1 output (/buddy:plan command) - OpenAPI/REST specs
├── frontend-design.md   # Phase 1 output (/buddy:plan command) - UI mockups/wireframes
├── test-scenarios.md    # Phase 1 output (/buddy:plan command) - Test cases
└── tasks.md             # Phase 2 output (/buddy:tasks command - NOT created by /buddy:plan)
```

### Source Code (JHipster project root)
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real paths. The delivered plan must not include Option labels.
-->
```
# [REMOVE IF UNUSED] Option 1: Monolithic Application
src/
├── main/
│   ├── java/[package]/
│   │   ├── domain/          # JPA entities
│   │   ├── repository/      # Spring Data repositories
│   │   ├── service/         # Business logic
│   │   ├── web/rest/        # REST controllers
│   │   ├── config/          # Spring configuration
│   │   └── security/        # Security configuration
│   ├── resources/
│   │   ├── config/          # Application configuration
│   │   └── i18n/            # Internationalization files
│   └── webapp/
│       ├── app/             # Frontend application
│       │   ├── entities/    # Entity management components
│       │   ├── shared/      # Shared components
│       │   └── core/        # Core services
│       └── content/         # Static assets (CSS, images)
└── test/
    ├── java/[package]/
    │   ├── domain/          # Entity tests
    │   ├── service/         # Service tests
    │   ├── web/rest/        # Controller integration tests
    │   └── IntegrationTest.java
    └── javascript/
        └── spec/            # Frontend unit tests

# [REMOVE IF UNUSED] Option 2: Microservices Architecture
[microservice-name]/
├── src/main/java/[package]/
│   ├── domain/              # JPA entities
│   ├── repository/          # Spring Data repositories
│   ├── service/             # Business logic
│   ├── web/rest/            # REST controllers
│   ├── client/              # Feign clients for other microservices
│   └── config/              # Service-specific configuration
└── src/test/java/[package]/
    ├── service/
    └── web/rest/

[gateway]/
├── src/main/webapp/
│   └── app/                 # Frontend (aggregates all microservices)
└── src/main/resources/
    └── config/
        └── application.yml  # Gateway routing configuration

# [REMOVE IF UNUSED] Option 3: Gateway + Microservices (when "gateway" + services detected)
gateway/
├── src/main/webapp/app/     # Unified frontend
└── src/main/resources/config/

service-a/
└── src/main/                # Backend only, no frontend

service-b/
└── src/main/                # Backend only, no frontend
```

**Structure Decision**: [Document the selected structure and reference the real
directories captured above. Specify monolith vs microservices rationale.]

## Phase 0: Outline & Research
1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each technology choice → best practices task
   - For each JHipster option → configuration research

2. **Generate and dispatch research agents**:
   ```
   For each unknown in Technical Context:
     Task: "Research {unknown} for {feature context}"
   For each JHipster generator option:
     Task: "Find best practices for {option} in JHipster {version}"
   For each entity relationship:
     Task: "Research JDL patterns for {relationship type}"
   For each integration requirement:
     Task: "Research JHipster integration patterns for {external system}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]
   - JHipster Configuration: [generator options, JDL modeling decisions]

**Output**: research.md with all NEEDS CLARIFICATION resolved

## Phase 1: Design & Contracts
*Prerequisites: research.md complete*

1. **Create JDL model** from feature spec → `jdl-model.jdl`:
   - Define entities with fields and field types
   - Specify relationships (OneToMany, ManyToOne, ManyToMany, OneToOne)
   - Add validation rules (@required, @min, @max, @pattern, etc.)
   - Configure pagination, filtering, service layer
   - Include entity options (dto, service, pagination)
   - Example:
     ```
     entity Customer {
       name String required maxlength(100)
       email String required pattern(/^[^@\s]+@[^@\s]+\.[^@\s]+$/)
       phone String
     }

     entity Order {
       orderDate Instant required
       totalAmount BigDecimal required min(0)
       status OrderStatus required
     }

     enum OrderStatus {
       PENDING, CONFIRMED, SHIPPED, DELIVERED, CANCELLED
     }

     relationship OneToMany {
       Customer{orders} to Order{customer required}
     }

     paginate Customer, Order with pagination
     service Customer, Order with serviceClass
     dto Customer, Order with mapstruct
     ```

2. **Generate API contracts** from functional requirements:
   - For each REST endpoint → OpenAPI specification
   - Document request/response schemas
   - Include error response formats
   - Output to `/api-contracts/[entity]-api.yaml`

3. **Design frontend components** from UI requirements:
   - List pages (entity list views with search/filter/pagination)
   - Detail pages (entity detail with CRUD operations)
   - Forms (create/edit with validation)
   - Custom components (if beyond generated CRUD)
   - Navigation flow
   - Output to `frontend-design.md`

4. **Generate test scenarios** from user stories:
   - Backend tests:
     - Repository tests (JPA operations)
     - Service tests (business logic)
     - REST controller tests (integration tests with MockMvc/WebTestClient)
   - Frontend tests:
     - Component tests (Jest/Jasmine)
     - End-to-end tests (Cypress/Playwright)
   - Each user story → test scenario
   - Output to `test-scenarios.md`

5. **Update agent file incrementally** (O(1) operation):
   - Run `{SCRIPT}`
     **IMPORTANT**: Execute it exactly as specified above. Do not add or remove any arguments.
   - If exists: Add only NEW tech from current plan
   - Preserve manual additions between markers
   - Update recent changes (keep last 3)
   - Keep under 150 lines for token efficiency
   - Output to repository root

**Output**: jdl-model.jdl, /api-contracts/*, frontend-design.md, test-scenarios.md (with failing tests), agent-specific file

## Phase 2: Task Planning Approach
*This section describes what the /buddy:tasks command will do - DO NOT execute during /buddy:plan*

**Task Generation Strategy**:
- Load `.specify/templates/tasks-template.md` as base
- Generate tasks from Phase 1 design docs
- JDL model → entity generation tasks
- Each entity → backend tests (repository, service, REST)
- Each entity → frontend tests (component, e2e)
- Custom business logic → service implementation tasks
- Custom UI components → frontend component tasks

**Ordering Strategy**:
- JHipster setup → JDL entity generation → Backend tests → Backend implementation → Frontend tests → Frontend implementation
- TDD order: Tests before implementation
- Dependency order: Entities before services before controllers before UI
- Mark [P] for parallel execution (independent entities/components)

**Estimated Output**: 30-40 numbered, ordered tasks in tasks.md

**IMPORTANT**: This phase is executed by the /buddy:tasks command, NOT by /buddy:plan

## Phase 3+: Future Implementation
*These phases are beyond the scope of the /buddy:plan command*

**Phase 3**: Task execution (/buddy:tasks command creates tasks.md)
**Phase 4**: Implementation (execute tasks.md following foundational principles)
**Phase 5**: Validation
  - Run backend tests (JUnit, Spring tests)
  - Run frontend tests (Jest/Karma, Cypress/Playwright)
  - Manual testing against test scenarios
  - Performance validation (<200ms API response)
  - Security validation (authentication/authorization)
  - Build and package application

## Complexity Tracking
*Fill ONLY if Foundation Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., Custom authentication] | [specific need] | [why JWT/OAuth insufficient] |
| [e.g., Additional microservice] | [scalability requirement] | [why monolith insufficient] |

## Progress Tracking
*This checklist is updated during execution flow*

**Phase Status**:
- [ ] Phase 0: Research complete (/buddy:plan command)
- [ ] Phase 1: Design complete (/buddy:plan command)
- [ ] Phase 2: Task planning complete (/buddy:plan command - describe approach only)
- [ ] Phase 3: Tasks generated (/buddy:tasks command)
- [ ] Phase 4: Implementation complete
- [ ] Phase 5: Validation passed

**Gate Status**:
- [ ] Initial Foundation Check: PASS
- [ ] Post-Design Foundation Check: PASS
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Complexity deviations documented

**JHipster Specific**:
- [ ] JDL model validated (no syntax errors)
- [ ] Entities generated successfully
- [ ] Backend tests written and passing
- [ ] Frontend tests written and passing
- [ ] Custom business logic implemented
- [ ] UI components styled and responsive
- [ ] Application builds without errors

---
*Based on Foundation v1.0.0 - See `/directive/foundation.md` for complete principles and governance*
