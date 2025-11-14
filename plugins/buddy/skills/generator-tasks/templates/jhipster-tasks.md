# Tasks: [FEATURE NAME]

**Branch**: `[###-feature-name]`
**Spec**: [link]
**Plan**: [link]
**Created**: [DATE]
**Status**: Draft
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md` and plan from `/specs/[###-feature-name]/plan.md`
**Prerequisites**: plan.md (required), research.md, jdl-model.jdl, api-contracts/, frontend-design.md, test-scenarios.md

## Execution Flow (main)
```
1. Load plan.md from feature directory
   → If not found: ERROR "No implementation plan found"
   → Extract: JHipster version, application type, frontend framework, database, authentication
2. Load optional design documents:
   → jdl-model.jdl: Extract entities → entity generation tasks
   → api-contracts/: Extract endpoints → REST controller customization tasks
   → frontend-design.md: Extract custom UI components → frontend tasks
   → test-scenarios.md: Extract test cases → test implementation tasks
3. Generate tasks by category:
   → Setup: JHipster project initialization, JDL import
   → Tests (Backend): Repository tests, service tests, REST controller tests
   → Tests (Frontend): Component tests, e2e tests
   → Core (Backend): Entity generation, service layer, custom business logic, REST endpoints
   → Core (Frontend): Entity CRUD UI, custom components, routing, state management
   → Integration: Security, database migrations, external integrations
   → Polish: Performance optimization, accessibility, documentation
4. Apply task rules:
   → Different entities/components = mark [P] for parallel
   → Same file = sequential (no [P])
   → Tests before implementation (TDD)
   → Backend before frontend (API contracts first)
5. Number tasks sequentially (T001, T002...)
6. Generate dependency graph
7. Create parallel execution examples
8. Validate task completeness:
   → All entities have tests?
   → All custom logic has tests?
   → All UI components have tests?
   → All endpoints implemented?
9. Return: SUCCESS (tasks ready for execution)
```

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different files/entities, no dependencies)
- Include exact file paths in descriptions
- Follow JHipster conventions

## Path Conventions
- **Entities**: `src/main/java/[package]/domain/[Entity].java`
- **Repositories**: `src/main/java/[package]/repository/[Entity]Repository.java`
- **Services**: `src/main/java/[package]/service/[Entity]Service.java`
- **REST Controllers**: `src/main/java/[package]/web/rest/[Entity]Resource.java`
- **Frontend Components**: `src/main/webapp/app/entities/[entity]/[component].tsx` (React) or `.component.ts` (Angular) or `.vue` (Vue)
- **Backend Tests**: `src/test/java/[package]/[layer]/[Entity][Layer]Test.java`
- **Frontend Tests**: `src/test/javascript/spec/app/entities/[entity]/[component].spec.ts`
- **JDL**: `[project-root]/[feature].jdl`

## Phase 3.1: Setup
- [ ] T001 Verify JHipster [version] is installed and configured
- [ ] T002 Import JDL model from specs/[###-feature]/jdl-model.jdl into project
- [ ] T003 Run JHipster entity generation: `jhipster jdl [feature].jdl`
- [ ] T004 [P] Review generated entities, repositories, services, REST controllers
- [ ] T005 [P] Review generated frontend components (list, detail, create/edit)
- [ ] T006 [P] Verify database schema created/updated (Liquibase changelogs)

## Phase 3.2: Backend Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These tests MUST be written and MUST FAIL before ANY custom implementation**

### Repository Tests (JPA/Spring Data)
- [ ] T007 [P] Repository test for [Entity1] in src/test/java/[package]/repository/[Entity1]RepositoryTest.java
- [ ] T008 [P] Repository test for [Entity2] in src/test/java/[package]/repository/[Entity2]RepositoryTest.java
- [ ] T009 [P] Test entity relationships (e.g., Customer-Order) in repository tests
- [ ] T010 [P] Test custom query methods if defined

### Service Tests (Business Logic)
- [ ] T011 [P] Service test for [Entity1]Service in src/test/java/[package]/service/[Entity1]ServiceTest.java
- [ ] T012 [P] Service test for [Entity2]Service in src/test/java/[package]/service/[Entity2]ServiceTest.java
- [ ] T013 [P] Test custom business logic methods
- [ ] T014 [P] Test validation rules and exception handling

### REST Controller Tests (Integration Tests)
- [ ] T015 [P] REST integration test for [Entity1]Resource in src/test/java/[package]/web/rest/[Entity1]ResourceIT.java
- [ ] T016 [P] REST integration test for [Entity2]Resource in src/test/java/[package]/web/rest/[Entity2]ResourceIT.java
- [ ] T017 [P] Test CRUD operations (GET, POST, PUT, DELETE)
- [ ] T018 [P] Test search and filtering endpoints
- [ ] T019 [P] Test error responses (400, 404, 500)
- [ ] T020 [P] Test authentication/authorization (if applicable)

## Phase 3.3: Backend Implementation (ONLY after tests are failing)

### Entity Customization
- [ ] T021 [P] Customize [Entity1] entity (add custom fields, validations) in src/main/java/[package]/domain/[Entity1].java
- [ ] T022 [P] Customize [Entity2] entity in src/main/java/[package]/domain/[Entity2].java
- [ ] T023 [P] Add JPA lifecycle callbacks (@PrePersist, @PreUpdate) if needed
- [ ] T024 [P] Add custom entity methods or computed properties

### Service Layer Customization
- [ ] T025 [P] Implement custom business logic in [Entity1]Service
- [ ] T026 [P] Implement custom business logic in [Entity2]Service
- [ ] T027 Add transaction management (@Transactional) where needed
- [ ] T028 Add business validation rules
- [ ] T029 Implement service-to-service calls if multiple entities interact
- [ ] T030 Add event publishing or listeners (if using events)

### REST Controller Customization
- [ ] T031 [P] Add custom endpoints to [Entity1]Resource
- [ ] T032 [P] Add custom endpoints to [Entity2]Resource
- [ ] T033 Add input validation (@Valid, custom validators)
- [ ] T034 Customize response formats (DTOs, projections)
- [ ] T035 Add pagination and sorting to custom endpoints
- [ ] T036 Implement search/filtering logic

## Phase 3.4: Frontend Tests (TDD) ⚠️ MUST COMPLETE BEFORE 3.5
**CRITICAL: These tests MUST be written and MUST FAIL before ANY custom frontend implementation**

### Component Unit Tests
- [ ] T037 [P] Component test for [Entity1] list in src/test/javascript/spec/app/entities/[entity1]/[entity1].component.spec.ts
- [ ] T038 [P] Component test for [Entity1] detail in src/test/javascript/spec/app/entities/[entity1]/[entity1]-detail.component.spec.ts
- [ ] T039 [P] Component test for [Entity1] create/edit in src/test/javascript/spec/app/entities/[entity1]/[entity1]-update.component.spec.ts
- [ ] T040 [P] Component test for [Entity2] components
- [ ] T041 [P] Test custom component logic (if beyond generated CRUD)
- [ ] T042 [P] Test form validation in create/edit components

### End-to-End Tests
- [ ] T043 [P] E2E test for [Entity1] CRUD flow in src/test/javascript/e2e/entities/[entity1]/[entity1].spec.ts
- [ ] T044 [P] E2E test for [Entity2] CRUD flow
- [ ] T045 E2E test for user journey (multi-step interaction across entities)
- [ ] T046 E2E test for authentication flow
- [ ] T047 E2E test for error scenarios (validation failures, network errors)

## Phase 3.5: Frontend Implementation (ONLY after tests are failing)

### Component Customization
- [ ] T048 [P] Customize [Entity1] list component (add custom columns, filters, sorting)
- [ ] T049 [P] Customize [Entity1] detail component (add custom fields, actions)
- [ ] T050 [P] Customize [Entity1] create/edit form (add validation, conditional fields)
- [ ] T051 [P] Customize [Entity2] components similarly
- [ ] T052 [P] Implement custom components per frontend-design.md
- [ ] T053 Add UI state management (if complex state beyond entity CRUD)

### Styling & UX
- [ ] T054 [P] Apply custom styles to [Entity1] components
- [ ] T055 [P] Add responsive design for mobile/tablet
- [ ] T056 [P] Implement loading indicators and error messages
- [ ] T057 [P] Add confirmation dialogs for delete operations
- [ ] T058 [P] Implement toast notifications for success/error feedback

### Navigation & Routing
- [ ] T059 Update navigation menu (add links to new entities/features)
- [ ] T060 Configure routing for custom pages
- [ ] T061 Add breadcrumbs for nested views
- [ ] T062 Implement access control (hide UI elements based on user roles)

## Phase 3.6: Integration

### Security
- [ ] T063 Configure authentication (JWT/OAuth 2.0/Session) in SecurityConfiguration.java
- [ ] T064 Define user roles and permissions in AuthoritiesConstants.java
- [ ] T065 [P] Apply @PreAuthorize annotations to REST endpoints
- [ ] T066 [P] Implement frontend route guards (authentication/authorization)
- [ ] T067 Test authentication flows (login, logout, token refresh)

### Database
- [ ] T068 Review and customize Liquibase changelogs in src/main/resources/config/liquibase/changelog/
- [ ] T069 Add database indexes for performance (if needed)
- [ ] T070 Configure database connection pool settings
- [ ] T071 Test database migrations (rollback, incremental updates)

### External Integrations
- [ ] T072 Implement external API client (if integrating with external service)
- [ ] T073 Configure API credentials in application.yml
- [ ] T074 Add retry logic and circuit breakers (if using Resilience4j)
- [ ] T075 Test integration with external service

### Logging & Monitoring
- [ ] T076 Add logging to custom business logic (SLF4J)
- [ ] T077 Configure log levels in application.yml
- [ ] T078 Add application metrics (if using Micrometer)
- [ ] T079 Configure health checks (Spring Boot Actuator)

## Phase 3.7: Polish

### Backend Polish
- [ ] T080 Run backend tests and ensure >80% code coverage
- [ ] T081 [P] Refactor service layer to remove duplication
- [ ] T082 [P] Add Javadoc comments to public methods
- [ ] T083 [P] Run static analysis (Checkstyle, PMD, SpotBugs)
- [ ] T084 Optimize database queries (avoid N+1 queries)
- [ ] T085 Add caching to frequently accessed data (if applicable)

### Frontend Polish
- [ ] T086 Run frontend tests and ensure >80% code coverage
- [ ] T087 [P] Refactor components to remove duplication
- [ ] T088 [P] Add accessibility attributes (ARIA labels, keyboard navigation)
- [ ] T089 [P] Optimize bundle size (lazy loading, code splitting)
- [ ] T090 [P] Test cross-browser compatibility
- [ ] T091 [P] Test responsive design on different screen sizes

### Documentation
- [ ] T092 [P] Update README.md with feature description
- [ ] T093 [P] Document API endpoints in OpenAPI/Swagger
- [ ] T094 [P] Create user documentation (if applicable)
- [ ] T095 [P] Document deployment procedures

### Build & Deployment
- [ ] T096 Run full build: `./mvnw clean verify` or `./gradlew clean build`
- [ ] T097 Fix any build warnings or errors
- [ ] T098 Test Docker build (if using Docker)
- [ ] T099 Test deployment to target environment (dev/staging)
- [ ] T100 Verify application health after deployment

## Dependencies

**Critical Path**:
- Setup (T001-T006) → Backend Tests (T007-T020) → Backend Implementation (T021-T036) → Frontend Tests (T037-T047) → Frontend Implementation (T048-T062)
- Tests MUST fail before implementation begins
- Backend complete before frontend implementation (API contracts established)
- Integration (T063-T079) after core implementation
- Polish (T080-T100) after all implementation complete

**Blocking Dependencies**:
- T002 (JDL import) blocks T003 (entity generation)
- T003 (entity generation) blocks T004-T006 (review generated code)
- T004-T006 (review) block T007-T020 (backend tests)
- T007-T020 (backend tests) block T021-T036 (backend implementation)
- T021-T036 (backend implementation) block T037-T047 (frontend tests - API contracts needed)
- T037-T047 (frontend tests) block T048-T062 (frontend implementation)
- T063-T079 (integration) require T036 (backend complete) and T062 (frontend complete)
- T080-T100 (polish) require all prior phases complete

**Parallel Opportunities**:
- Different entities can be tested/implemented in parallel
- Backend and frontend tests for same entity can run in parallel after backend implementation
- Documentation tasks can run in parallel
- Static analysis and code coverage can run in parallel

## Parallel Execution Examples

### Example 1: Repository Tests (T007-T010)
```bash
# Launch T007-T010 together (different entities):
Task: "Repository test for Customer in src/test/java/com/example/repository/CustomerRepositoryTest.java"
Task: "Repository test for Order in src/test/java/com/example/repository/OrderRepositoryTest.java"
Task: "Test Customer-Order relationship in CustomerRepositoryTest"
```

### Example 2: REST Controller Tests (T015-T016)
```bash
# Launch T015-T016 together (different entities):
Task: "REST integration test for CustomerResource in src/test/java/com/example/web/rest/CustomerResourceIT.java"
Task: "REST integration test for OrderResource in src/test/java/com/example/web/rest/OrderResourceIT.java"
```

### Example 3: Frontend Component Tests (T037-T040)
```bash
# Launch T037-T040 together (different entities):
Task: "Component test for Customer list in src/test/javascript/spec/app/entities/customer/customer.component.spec.ts"
Task: "Component test for Customer detail in src/test/javascript/spec/app/entities/customer/customer-detail.component.spec.ts"
Task: "Component test for Order list in src/test/javascript/spec/app/entities/order/order.component.spec.ts"
```

## Notes
- **[P] tasks** = different files/entities, no dependencies
- **Verify tests fail** before implementing (TDD validation)
- **Commit after each task** with meaningful messages
- **Run tests after each implementation** to ensure they pass
- **Use JHipster generators** whenever possible (don't manually create entities)
- **Follow JHipster conventions** (naming, structure, patterns)
- **Externalize configuration** (use application.yml for all config values)
- **Use DTOs for REST APIs** (avoid exposing entities directly)
- **Avoid**: Vague tasks, same file conflicts, missing error handling

## Task Generation Rules
*Applied during main() execution*

1. **From JDL Model**:
   - Each entity → repository test task [P]
   - Each entity → service test task [P]
   - Each entity → REST controller test task [P]
   - Each entity → backend implementation tasks
   - Each entity → frontend component test tasks [P]
   - Each entity → frontend implementation tasks

2. **From API Contracts**:
   - Each custom endpoint → REST controller test
   - Each custom endpoint → implementation task

3. **From Frontend Design**:
   - Each custom component → component test [P]
   - Each custom component → implementation task [P]
   - Each custom page → e2e test

4. **From Test Scenarios**:
   - Each user story → e2e test
   - Each edge case → unit/integration test

5. **Ordering**:
   - Setup → Backend Tests → Backend Implementation → Frontend Tests → Frontend Implementation → Integration → Polish
   - Dependencies block parallel execution
   - Always tests before corresponding implementation

## Validation Checklist
*GATE: Checked by main() before returning*

- [ ] All entities have repository tests
- [ ] All entities have service tests
- [ ] All entities have REST controller tests
- [ ] All custom business logic has tests
- [ ] All frontend components have tests
- [ ] All user journeys have e2e tests
- [ ] All tests come before their implementation
- [ ] Parallel tasks are truly independent (different files/entities)
- [ ] Each task specifies exact file path
- [ ] No task modifies same file as another [P] task
- [ ] JDL import completed before entity generation
- [ ] Backend implementation before frontend implementation
- [ ] Integration tasks after core implementation
- [ ] Polish tasks are last in sequence
