# MuleSoft API Implementation Tasks: [API NAME]

**Branch**: `[###-api-name]`
**Spec**: [link]
**Plan**: [link]
**Created**: [DATE]
**Status**: Draft
**Input**: API specification from `/specs/[###-api-name]/spec.md` and plan from `/specs/[###-api-name]/plan.md`
**Prerequisites**: plan.md (required), research.md, api-specification.raml, dataweave/mappings.md, munit/test-plan.md

## Execution Flow (main)
```
1. Load plan.md from API directory
   → If not found: ERROR "No implementation plan found"
   → Extract: Mule runtime version, connectors, DataWeave patterns, deployment target
2. Load required design documents:
   → api-specification.raml: Extract resources/operations → MUnit contract tests
   → dataweave/mappings.md: Extract transformations → DataWeave script tasks
   → munit/test-plan.md: Extract scenarios → MUnit test tasks
   → error-handlers.md: Extract error flows → error handler tasks
   → policies.json: Extract policies → API Manager tasks
3. Generate tasks by category:
   → Setup: Project init, RAML/OAS, global configs, properties
   → Tests: MUnit contract tests, integration tests (MUST come first)
   → Core: API interface flows, DataWeave transformations
   → Implementation: Business logic flows, connector configurations
   → Integration: Error handlers, logging, monitoring
   → Polish: Unit tests, performance tests, documentation, policies
4. Apply task rules:
   → Different flows/files = mark [P] for parallel
   → Same flow = sequential (no [P])
   → MUnit tests before flow implementation (TDD)
   → Interface flows before implementation flows
5. Number tasks sequentially (T001, T002...)
6. Generate dependency graph
7. Create parallel execution examples
8. Validate task completeness:
   → All API operations have MUnit contract tests?
   → All transformations have DataWeave scripts?
   → All flows have corresponding tests?
   → Error handlers cover all scenarios?
9. Return: SUCCESS (tasks ready for execution)
```

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different files/flows, no dependencies)
- Include exact file paths in descriptions
- Follow MuleSoft naming conventions

## Path Conventions
**MuleSoft Standard Structure**:
- **API Specs**: `src/main/resources/api/[api-name].raml`
- **Flows**: `src/main/mule/implementation/`, `src/main/mule/interface/`
- **DataWeave**: `src/main/resources/dataweave/transformations/`
- **Global Configs**: `src/main/mule/global-config.xml`
- **Error Handlers**: `src/main/mule/error-handlers/`
- **Properties**: `src/main/resources/properties/[env].yaml`
- **MUnit Tests**: `src/test/munit/contract/`, `src/test/munit/integration/`, `src/test/munit/unit/`

## Phase 3.1: Setup
- [ ] T001 Create MuleSoft project structure per implementation plan
- [ ] T002 Initialize Mule [version] project with Maven dependencies in pom.xml
- [ ] T003 [P] Create RAML/OAS API specification in src/main/resources/api/[api-name].raml
- [ ] T004 [P] Create global configuration file in src/main/mule/global-config.xml
- [ ] T005 [P] Create environment property files in src/main/resources/properties/ (local.yaml, dev.yaml, prod.yaml)
- [ ] T006 [P] Configure mule-artifact.json with secure properties and exported resources

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These MUnit tests MUST be written and MUST FAIL before ANY flow implementation**

### Contract Tests (API Specification Validation)
- [ ] T007 [P] MUnit contract test GET /[resource] in src/test/munit/contract/get-[resource]-test.xml
- [ ] T008 [P] MUnit contract test POST /[resource] in src/test/munit/contract/post-[resource]-test.xml
- [ ] T009 [P] MUnit contract test PUT /[resource]/{id} in src/test/munit/contract/put-[resource]-test.xml
- [ ] T010 [P] MUnit contract test DELETE /[resource]/{id} in src/test/munit/contract/delete-[resource]-test.xml

### Integration Tests (End-to-End Flow Validation)
- [ ] T011 [P] MUnit integration test for [business scenario] in src/test/munit/integration/[scenario]-test.xml
- [ ] T012 [P] MUnit integration test for [error scenario] in src/test/munit/integration/[error-scenario]-test.xml
- [ ] T013 [P] MUnit integration test for [data transformation] in src/test/munit/integration/[transformation]-test.xml

## Phase 3.3: Core Implementation (ONLY after tests are failing)

### API Interface Flows (HTTP Listeners)
- [ ] T014 [P] API interface flow for GET /[resource] in src/main/mule/interface/[api-name]-interface.xml
- [ ] T015 [P] API interface flow for POST /[resource] in src/main/mule/interface/[api-name]-interface.xml
- [ ] T016 [P] API interface flow for PUT /[resource]/{id} in src/main/mule/interface/[api-name]-interface.xml
- [ ] T017 [P] API interface flow for DELETE /[resource]/{id} in src/main/mule/interface/[api-name]-interface.xml

### DataWeave Transformations
- [ ] T018 [P] DataWeave request mapping in src/main/resources/dataweave/transformations/request-to-[target].dwl
- [ ] T019 [P] DataWeave response mapping in src/main/resources/dataweave/transformations/[source]-to-response.dwl
- [ ] T020 [P] DataWeave error mapping in src/main/resources/dataweave/transformations/error-to-standard-format.dwl

### Implementation Flows (Business Logic)
- [ ] T021 [P] Implementation flow for [business operation] in src/main/mule/implementation/[api-name]-impl.xml
- [ ] T022 Implementation flow for [connector operation] in src/main/mule/implementation/[api-name]-impl.xml
- [ ] T023 Validation logic for input data in src/main/mule/implementation/[api-name]-impl.xml
- [ ] T024 Enrichment logic for response data in src/main/mule/implementation/[api-name]-impl.xml

## Phase 3.4: Integration

### Connectors & External Systems
- [ ] T025 Configure [connector name] connector in src/main/mule/global-config.xml
- [ ] T026 [P] Create connector operation flow for [system operation] in src/main/mule/implementation/[connector]-operations.xml
- [ ] T027 Add connector authentication configuration in src/main/resources/properties/[env].yaml
- [ ] T028 [P] Mock connector responses in src/test/munit/[connector]-mocks.xml

### Error Handling
- [ ] T029 Create global error handler in src/main/mule/error-handlers/global-error-handler.xml
- [ ] T030 [P] Create specific error handler for [error type] in src/main/mule/error-handlers/[api-name]-error-handler.xml
- [ ] T031 Add error logging and monitoring in error handlers
- [ ] T032 Create error response DataWeave transformation

### Logging & Monitoring
- [ ] T033 Add request/response logging in API interface flows
- [ ] T034 Configure correlation ID propagation across flows
- [ ] T035 Add custom business event logging for [business operation]

## Phase 3.5: Polish

### Unit Tests (Component-Level Validation)
- [ ] T036 [P] MUnit unit test for DataWeave transformation in src/test/munit/unit/[transformation]-test.xml
- [ ] T037 [P] MUnit unit test for validation logic in src/test/munit/unit/validation-test.xml
- [ ] T038 [P] MUnit unit test for error handler in src/test/munit/unit/error-handler-test.xml

### Performance & Quality
- [ ] T039 Run MUnit tests with coverage report (target >80%)
- [ ] T040 Performance test with load testing tool (validate <500ms p95)
- [ ] T041 Remove code duplication in flows
- [ ] T042 Optimize DataWeave scripts for performance
- [ ] T043 Validate flow complexity and refactor if needed

### Documentation
- [ ] T044 [P] Update API documentation in RAML/OAS with examples
- [ ] T045 [P] Create README.md with deployment instructions
- [ ] T046 [P] Document connector configuration in docs/connectors.md
- [ ] T047 [P] Create runbook for operational procedures

### API Manager & Policies
- [ ] T048 Publish API specification to Anypoint Exchange
- [ ] T049 Configure API in API Manager with SLA tiers
- [ ] T050 Apply OAuth 2.0 security policy in API Manager
- [ ] T051 Apply Rate Limiting policy in API Manager
- [ ] T052 [P] Apply additional policies per requirements (CORS, IP Whitelist, etc.)
- [ ] T053 Test API with applied policies

## Dependencies

**Critical Path**:
- Setup (T001-T006) → Tests (T007-T013) → Implementation (T014-T024)
- Tests MUST fail before implementation begins
- Interface flows (T014-T017) before implementation flows (T021-T024)
- DataWeave scripts (T018-T020) before flows that use them
- Global config (T004) before connector config (T025)
- Error handlers (T029-T032) before polish phase
- Implementation complete before API Manager policies (T048-T053)

**Blocking Dependencies**:
- T003 (API spec) blocks T007-T010 (contract tests)
- T004 (global config) blocks T025 (connector config)
- T007-T013 (all tests) block T014-T024 (implementation)
- T014-T017 (interface flows) block T021-T024 (implementation flows)
- T018-T020 (DataWeave) required by T014-T024 (flows using transformations)
- T025 (connector config) blocks T026 (connector operations)
- T029-T030 (error handlers) block T031-T032 (error logging)
- T039 (coverage) validates T007-T038 (all tests)
- T048 (Exchange publish) blocks T049-T053 (API Manager tasks)

## Parallel Execution Examples

### Example 1: Property Files (T005)
```bash
# Launch T005 sub-tasks together:
Task: "Create local.yaml in src/main/resources/properties/"
Task: "Create dev.yaml in src/main/resources/properties/"
Task: "Create prod.yaml in src/main/resources/properties/"
```

### Example 2: Contract Tests (T007-T010)
```bash
# Launch T007-T010 together:
Task: "MUnit contract test GET /customers in src/test/munit/contract/get-customers-test.xml"
Task: "MUnit contract test POST /customers in src/test/munit/contract/post-customers-test.xml"
Task: "MUnit contract test PUT /customers/{id} in src/test/munit/contract/put-customer-test.xml"
Task: "MUnit contract test DELETE /customers/{id} in src/test/munit/contract/delete-customer-test.xml"
```

### Example 3: DataWeave Transformations (T018-T020)
```bash
# Launch T018-T020 together:
Task: "DataWeave request mapping in src/main/resources/dataweave/transformations/request-to-salesforce.dwl"
Task: "DataWeave response mapping in src/main/resources/dataweave/transformations/salesforce-to-response.dwl"
Task: "DataWeave error mapping in src/main/resources/dataweave/transformations/error-to-standard-format.dwl"
```

## Notes
- **[P] tasks** = different files/flows, no dependencies
- **Verify MUnit tests fail** before implementing flows (TDD validation)
- **Commit after each task** with meaningful messages
- **Run MUnit tests** after each implementation task
- **Use MUnit test recorder** to accelerate test creation
- **Mock external systems** in MUnit tests (use Spy, Mock processors)
- **Follow DataWeave best practices** (avoid side effects, use functions)
- **Externalize all configuration** (no hardcoded values in flows)
- **Use flow-ref** for reusability across operations
- **Avoid**: Vague tasks, same file conflicts, missing error handling

## Task Generation Rules
*Applied during main() execution*

1. **From API Specification**:
   - Each resource + method → contract MUnit test task [P]
   - Each operation → interface flow task [P]
   - Each operation → implementation flow task

2. **From DataWeave Mappings**:
   - Each transformation → DataWeave script task [P]
   - Each transformation → unit test task [P]

3. **From MUnit Test Plan**:
   - Each test scenario → MUnit test task [P]
   - Each error scenario → error handler task

4. **From Connectors**:
   - Each connector → configuration task
   - Each connector operation → flow task
   - Each connector → mock task [P]

5. **From Policies**:
   - Each policy → API Manager configuration task
   - Related policies can be applied in parallel [P]

6. **Ordering**:
   - Setup → MUnit Tests → Interface Flows → DataWeave → Implementation → Error Handlers → Polish → Policies
   - Dependencies block parallel execution
   - Always MUnit tests before corresponding flow implementation

## Validation Checklist
*GATE: Checked by main() before returning*

- [ ] All API operations have corresponding MUnit contract tests
- [ ] All DataWeave transformations have unit tests
- [ ] All flows have corresponding MUnit integration tests
- [ ] All tests come before their implementation
- [ ] Parallel tasks are truly independent (different files/flows)
- [ ] Each task specifies exact file path
- [ ] No task modifies same file as another [P] task
- [ ] Global config created before connector configs
- [ ] Error handlers created before polish phase
- [ ] API Manager tasks after implementation is complete
- [ ] MUnit coverage task is last in test sequence
