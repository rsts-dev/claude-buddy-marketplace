# MuleSoft API Implementation Plan: [API NAME]

**Branch**: `[###-api-name]`
**Spec**: [link]
**Created**: [DATE]
**Status**: Draft
**API Layer**: [System/Process/Experience] | **Deployment**: [CloudHub/RTF/Hybrid]
**Input**: API specification from `/specs/[###-api-name]/spec.md`

## Execution Flow (/buddy:plan command scope)
```
1. Load API spec from Input path
   → If not found: ERROR "No API spec at {path}"
2. Fill Technical Context (scan for NEEDS CLARIFICATION)
   → Detect API Layer (System/Process/Experience)
   → Determine deployment target and runtime version
   → Identify required connectors and policies
3. Fill the Foundation Check section based on the content of the foundation document
4. Evaluate Foundation Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Foundation Check
5. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
6. Execute Phase 1 → api-specification.raml (or .yaml for OAS), dataweave/, error-handlers.xml, munit/, policies.json, agent-specific template file
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
[Extract from API spec: primary capability + API-Led layer rationale + integration approach from research]

## Technical Context
**Mule Runtime Version**: [e.g., 4.6.x, 4.7.x or NEEDS CLARIFICATION]
**API Manager**: [Anypoint Platform version or NEEDS CLARIFICATION]
**DataWeave Version**: [e.g., 2.5.x, 2.6.x or NEEDS CLARIFICATION]
**Primary Connectors**: [e.g., Salesforce, Database, HTTP or NEEDS CLARIFICATION]
**Storage/Database**: [if applicable, e.g., MySQL Connector 1.2.x, MongoDB 6.x or N/A]
**Security Policies**: [e.g., OAuth 2.0, Client ID Enforcement, Rate Limiting or NEEDS CLARIFICATION]
**Testing Framework**: [e.g., MUnit 2.3.x, MUnit Coverage 2.x or NEEDS CLARIFICATION]
**Deployment Target**: [CloudHub 2.0/CloudHub 1.0/Runtime Fabric/Hybrid or NEEDS CLARIFICATION]
**API Layer**: [System/Process/Experience - determines reusability scope]
**Performance Goals**: [e.g., <500ms p95 latency, 1000 TPS or NEEDS CLARIFICATION]
**Constraints**: [e.g., <2 vCores, <100MB payload, sync-only or NEEDS CLARIFICATION]
**Scale/Scope**: [e.g., 100K requests/day, 10 endpoints, regional deployment or NEEDS CLARIFICATION]

## Foundation Check
*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

Based on `/directive/foundation.md` v1.0.0, verify compliance with:

### Principle 1: Modular Extensibility
- [ ] API components are designed as independent modules
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

### MuleSoft API-Led Principles
- [ ] API layer assignment is appropriate (System/Process/Experience)
- [ ] API is designed for reusability across consumers
- [ ] No business logic in System APIs (data access only)
- [ ] Process APIs orchestrate, not replicate System API logic
- [ ] Experience APIs don't contain business logic
- [ ] Security policies align with layer responsibilities

**Violations Requiring Justification**: [List any principle violations and provide rationale in Complexity Tracking section]

## Project Structure

### Documentation (this API)
```
specs/[###-api-name]/
├── plan.md                    # This file (/buddy:plan command output)
├── research.md                # Phase 0 output (/buddy:plan command)
├── api-specification.raml     # Phase 1 output (/buddy:plan command) - RAML or OAS
├── dataweave/                 # Phase 1 output (/buddy:plan command)
│   └── mappings.md           # DataWeave transformation designs
├── error-handlers.md          # Phase 1 output (/buddy:plan command)
├── policies.json              # Phase 1 output (/buddy:plan command)
├── munit/                     # Phase 1 output (/buddy:plan command)
│   └── test-plan.md          # MUnit test scenarios
└── tasks.md                   # Phase 2 output (/buddy:tasks command - NOT created by /buddy:plan)
```

### Source Code (MuleSoft project root)
```
[project-name]/
├── src/
│   ├── main/
│   │   ├── mule/
│   │   │   ├── implementation/        # Main flows
│   │   │   │   └── [api-name]-impl.xml
│   │   │   ├── interface/             # API interface flows
│   │   │   │   └── [api-name]-interface.xml
│   │   │   ├── error-handlers/        # Global error handling
│   │   │   │   └── global-error-handler.xml
│   │   │   └── global-config.xml      # Global configurations
│   │   └── resources/
│   │       ├── api/                   # API specifications
│   │       │   └── [api-name].raml
│   │       ├── dataweave/             # DataWeave scripts
│   │       │   └── transformations/
│   │       ├── properties/            # Environment configs
│   │       │   ├── local.yaml
│   │       │   ├── dev.yaml
│   │       │   └── prod.yaml
│   │       └── schemas/               # JSON/XML schemas
│   └── test/
│       └── munit/
│           ├── contract/              # API contract tests
│           ├── integration/           # Flow integration tests
│           └── unit/                  # Component unit tests
├── pom.xml                            # Maven configuration
└── mule-artifact.json                 # Mule artifact descriptor
```

**Structure Decision**: [Document the chosen MuleSoft project structure, API layer assignment, and module organization rationale]

## Phase 0: Outline & Research
1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each connector → version compatibility and best practices
   - For each security policy → configuration requirements
   - For each integration → API-Led layer boundaries

2. **Generate and dispatch research agents**:
   ```
   For each unknown in Technical Context:
     Task: "Research {unknown} for {API context}"
   For each MuleSoft connector:
     Task: "Find best practices and limitations for {connector} {version}"
   For each API-Led layer decision:
     Task: "Validate layer assignment against reusability requirements"
   For each security requirement:
     Task: "Research policy configuration for {requirement}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen - include API-Led principles]
   - Alternatives considered: [what else evaluated]
   - Connector/Policy Configuration: [specific settings]

**Output**: research.md with all NEEDS CLARIFICATION resolved

## Phase 1: Design & Contracts
*Prerequisites: research.md complete*

1. **Create API specification** from requirements → `api-specification.raml` (or OAS):
   - Define resources and methods per REST best practices
   - Specify request/response schemas (JSON/XML)
   - Document error responses (standard error format)
   - Include examples for all operations
   - Define data types in RAML library or OAS components
   - Version API appropriately (v1, v2, etc.)

2. **Design DataWeave transformations** from API contracts:
   - Input/output mapping specifications
   - Lookup/enrichment requirements
   - Validation logic
   - Standard format transformations (JSON↔XML, CSV, etc.)
   - Output to `dataweave/mappings.md`

3. **Design error handling strategy**:
   - Global error handler configuration
   - Layer-specific error transformations
   - Error response formats per API spec
   - Logging and monitoring requirements
   - Output to `error-handlers.md`

4. **Define security policies** from requirements:
   - Policy types (OAuth 2.0, Client ID, Rate Limiting, etc.)
   - Policy configuration parameters
   - SLA tiers if applicable
   - Custom policy requirements
   - Output to `policies.json`

5. **Generate MUnit test scenarios** from API spec:
   - Contract tests: Validate API spec compliance
   - Positive scenarios: Happy path per operation
   - Negative scenarios: Error handling validation
   - Connector mocking strategies
   - Coverage requirements (>80% line coverage)
   - Tests must fail initially (no implementation yet)
   - Output to `munit/test-plan.md`

6. **Update agent file incrementally** (O(1) operation):
   - Run `{SCRIPT}`
     **IMPORTANT**: Execute it exactly as specified above. Do not add or remove any arguments.
   - If exists: Add only NEW tech from current plan
   - Add MuleSoft connectors and their versions
   - Add DataWeave patterns identified
   - Preserve manual additions between markers
   - Update recent changes (keep last 3)
   - Keep under 150 lines for token efficiency
   - Output to repository root

**Output**: api-specification.raml, dataweave/mappings.md, error-handlers.md, policies.json, munit/test-plan.md, failing MUnit tests, agent-specific file

## Phase 2: Task Planning Approach
*This section describes what the /buddy:tasks command will do - DO NOT execute during /buddy:plan*

**Task Generation Strategy**:
- Load `.specify/templates/tasks-template.md` as base
- Generate tasks from Phase 1 design docs
- Each API operation → contract MUnit test task [P]
- Each DataWeave mapping → transformation script task [P]
- Each error scenario → error handler task [P]
- Each security policy → policy configuration task
- Implementation tasks to make MUnit tests pass

**Ordering Strategy**:
- TDD order: MUnit tests before flow implementation
- Dependency order:
  1. Global configs and error handlers
  2. API interface flows
  3. DataWeave transformations
  4. Implementation flows
  5. Connector configurations
  6. Policy deployment
- Mark [P] for parallel execution (independent flows/tests)

**Estimated Output**: 20-35 numbered, ordered tasks in tasks.md

**IMPORTANT**: This phase is executed by the /buddy:tasks command, NOT by /buddy:plan

## Phase 3+: Future Implementation
*These phases are beyond the scope of the /buddy:plan command*

**Phase 3**: Task execution (/buddy:tasks command creates tasks.md)
**Phase 4**: Implementation (execute tasks.md following foundational principles)
**Phase 5**: Validation
  - Run MUnit tests (>80% coverage)
  - API Manager policy enforcement tests
  - Performance testing (load/stress tests)
  - Deploy to test environment
  - Integration testing with consumers

## Complexity Tracking
*Fill ONLY if Foundation Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|--------------------------------------|
| [e.g., 4th layer API] | [specific need] | [why 3 layers insufficient] |
| [e.g., Custom connector] | [integration requirement] | [why standard connector insufficient] |
| [e.g., Synchronous process] | [latency requirement] | [why async pattern not viable] |

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
- [ ] API-Led layer assignment validated
- [ ] Security policies defined and approved

**MuleSoft Specific**:
- [ ] API specification reviewed and published to Exchange
- [ ] DataWeave transformations tested independently
- [ ] MUnit coverage >80% achieved
- [ ] Performance benchmarks met
- [ ] Security policies deployed to API Manager
- [ ] API published and consumers notified

---
*Based on Foundation v1.0.0 and MuleSoft API-Led Connectivity Principles - See `/directive/foundation.md` for complete principles and governance*
