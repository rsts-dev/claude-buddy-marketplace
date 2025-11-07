# Templates System

## Overview

Templates provide foundation-aware, project-type-specific starting points for specifications, plans, tasks, and documentation. They are embedded within generator skills and automatically selected based on the project's foundation type (Default, MuleSoft, JHipster), ensuring consistency and adherence to framework-specific best practices.

## Template Architecture

### Core Concept

Templates are structured Markdown files with:
- **Placeholders**: `[ALL_CAPS_IDENTIFIERS]` that agents fill with concrete values
- **Section Structure**: Consistent organization across template types
- **Execution Flow**: Optional workflow guidance embedded in comments
- **Validation Rules**: Built-in quality checks and requirements

### Design Philosophy

1. **Foundation-Driven**: Templates selected based on `directive/foundation.md`
2. **Consistency**: All specs/plans/tasks follow same structure within a project type
3. **Flexibility**: Optional sections for different feature types
4. **Quality-First**: Built-in validation and review checklists
5. **Progressive Disclosure**: Core structure visible, details filled by agents

## Template Types

Claude Buddy includes templates for 3 project types across 4 document generators:

### Project Types

**1. Default**
- **Purpose**: General-purpose development projects
- **Scope**: Language-agnostic, framework-agnostic
- **Use Cases**: Any project not using MuleSoft or JHipster
- **Foundation Indicator**: `**Foundation Type**: default` in foundation.md

**2. MuleSoft**
- **Purpose**: MuleSoft Anypoint Platform integration projects
- **Scope**: API-led connectivity, DataWeave, RAML, Mule flows
- **Use Cases**: MuleSoft APIs, integrations, data transformations
- **Foundation Indicator**: `**Foundation Type**: mulesoft` in foundation.md
- **Detection**: Presence of `mule-artifact.json`, `*.raml`, `*.dwl` files

**3. JHipster**
- **Purpose**: JHipster full-stack web applications
- **Scope**: Spring Boot backend, Angular/React frontend, entity modeling
- **Use Cases**: JHipster monoliths, microservices, gateways
- **Foundation Indicator**: `**Foundation Type**: jhipster` in foundation.md
- **Detection**: Presence of `.yo-rc.json`, `*.jdl` files

### Generator Templates

Each generator provides templates for all 3 project types:

**spec-generator**:
- `templates/default-spec.md` - General feature specifications
- `templates/mulesoft-spec.md` - MuleSoft API specifications
- `templates/jhipster-spec.md` - JHipster entity/feature specifications

**plan-generator**:
- `templates/default-plan.md` - General implementation plans
- `templates/mulesoft-plan.md` - MuleSoft integration plans
- `templates/jhipster-plan.md` - JHipster development plans

**tasks-generator**:
- `templates/default-tasks.md` - General task breakdowns
- `templates/mulesoft-tasks.md` - MuleSoft implementation tasks
- `templates/jhipster-tasks.md` - JHipster development tasks

**docs-generator**:
- `templates/default-readme.md` - General project README
- `templates/mulesoft-readme.md` - MuleSoft project README
- `templates/jhipster-readme.md` - JHipster project README

## Template Detection

### Detection Flow

```
User: /buddy:spec Create a user authentication API

Command: spec
  ↓
Check: directive/foundation.md exists?
  ↓
Read: **Foundation Type**: mulesoft
  ↓
Activate: mulesoft domain skill
  ↓
Activate: spec-generator skill
  ↓
Select: templates/mulesoft-spec.md
  ↓
Fill: Replace placeholders with API details
  ↓
Output: specs/20251107-user-auth-api/spec.md
```

### Detection Logic

**Step 1: Foundation Check**
```python
if not exists("directive/foundation.md"):
    error("Run /buddy:foundation first")
    exit()
```

**Step 2: Extract Foundation Type**
```python
foundation = read("directive/foundation.md")
foundation_type = extract_metadata(foundation, "Foundation Type")
# Result: "default", "mulesoft", or "jhipster"
```

**Step 3: Select Template**
```python
template_path = f"templates/{foundation_type}-spec.md"
template = load_skill_file(f"spec-generator/{template_path}")
```

**Step 4: Apply Template**
```python
spec = fill_template(template, feature_description)
write(f"specs/{date}-{slug}/spec.md", spec)
```

## Template Structure

### Common Elements

All templates share these structural elements:

**1. Metadata Header**
```markdown
# [DOCUMENT TYPE]: [FEATURE NAME]

**Branch**: `[###-feature-slug]`
**Created**: [DATE]
**Status**: Draft | Ready for Review | Approved
**Input**: User description: "$ARGUMENTS"
```

**2. Execution Flow (Optional)**
```markdown
## Execution Flow (main)
```
1. Parse user input
2. Extract key concepts
3. Fill sections with details
4. Mark unclear aspects with [NEEDS CLARIFICATION: ...]
5. Validate completeness
6. Return result
```
```

**3. Content Sections**
```markdown
## Section 1: Overview
...

## Section 2: Requirements
...

## Section 3: Technical Details
...
```

**4. Review Checklist**
```markdown
## Review Checklist
- [ ] All placeholders replaced
- [ ] Requirements are testable
- [ ] Success criteria defined
- [ ] Assumptions documented
```

**5. Metadata Footer**
```markdown
---
**Version**: 1.0.0
**Last Updated**: [DATE]
**Template**: [foundation-type]-[document-type]
```

### Placeholder Format

Templates use `[ALL_CAPS_IDENTIFIER]` for values to be filled:

**Common Placeholders**:
- `[FEATURE_NAME]` - Feature being specified/planned/implemented
- `[DATE]` - Today's date in ISO format (YYYY-MM-DD)
- `[BRANCH_NAME]` - Git branch name for this feature
- `[API_NAME]` - API name (MuleSoft templates)
- `[ENTITY_NAME]` - Entity name (JHipster templates)
- `[TECH_STACK]` - Technologies and frameworks used
- `[REQUIREMENTS]` - Functional and non-functional requirements

**Clarification Markers**:
- `[NEEDS CLARIFICATION: specific question]` - Signals unclear aspect
- Agents scan for these markers after filling template
- Questions extracted and presented to user
- Markers removed once clarified

## Template Application in Agents

### spec-writer Agent

**Template Selection**:
1. Verify `directive/foundation.md` exists
2. Extract foundation type from metadata
3. Activate spec-generator skill (provides templates)
4. Select appropriate template: `{foundation-type}-spec.md`
5. Fill template with feature description details

**Filling Process**:
```markdown
## Phase 3: Specification Generation

Transform feature description into complete specification:
- Replace all template placeholders with concrete details
- Maintain professional, clear language
- Include all required sections
- Mark unclear aspects with [NEEDS CLARIFICATION: ...]
- Ensure technical accuracy and feasibility
```

**Output**: `specs/[YYYYMMDD-slug]/spec.md`

### plan-writer Agent

**Template Selection**:
1. Read specification from specs directory
2. Extract foundation type from spec metadata or foundation.md
3. Activate plan-generator skill
4. Select appropriate template: `{foundation-type}-plan.md`
5. Fill template with architectural and implementation details

**Filling Process**:
```markdown
## Phase 2: Plan Generation

Create comprehensive implementation plan:
- Replace placeholders with tech stack, architecture decisions
- Define project structure and component organization
- Plan testing strategy and deployment approach
- Break down into phases with dependencies
- Include performance and security considerations
```

**Output**: `specs/[YYYYMMDD-slug]/plan.md`

### tasks-writer Agent

**Template Selection**:
1. Read plan from specs directory
2. Extract foundation type from plan metadata or foundation.md
3. Activate tasks-generator skill
4. Select appropriate template: `{foundation-type}-tasks.md`
5. Fill template with actionable tasks

**Filling Process**:
```markdown
## Phase 2: Task Breakdown

Break down plan into actionable tasks:
- Replace placeholders with specific task descriptions
- Organize into TDD phases (Setup, Tests, Core, Integration, Polish)
- Assign task IDs and effort estimates
- Mark parallel execution opportunities [P]
- Document dependencies between tasks
```

**Output**: `specs/[YYYYMMDD-slug]/tasks.md`

### docs-generator Agent

**Template Selection**:
1. Analyze project structure and codebase
2. Extract foundation type from foundation.md
3. Activate docs-generator skill
4. Select appropriate template: `{foundation-type}-readme.md`
5. Fill template with project-specific documentation

**Filling Process**:
```markdown
## Phase 2: Documentation Generation

Generate comprehensive project documentation:
- Replace placeholders with project details
- Analyze code for API endpoints, components, features
- Include installation, usage, and deployment instructions
- Add architecture diagrams and component descriptions
- Document testing and development workflows
```

**Output**: `README.md`, `docs/api.md`, `docs/architecture.md`, etc.

## Template Examples

### Default Spec Template

```markdown
# Feature Specification: [FEATURE_NAME]

**Branch**: `[###-feature-slug]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## Overview

### Purpose
[High-level description of what this feature does and why it's needed]

### Scope
**In Scope**:
- [Item 1]
- [Item 2]

**Out of Scope**:
- [Item 1]
- [Item 2]

## Functional Requirements

### Requirement 1: [REQUIREMENT_NAME]
**Description**: [Clear, concise description]
**Acceptance Criteria**:
- [ ] [Testable criterion 1]
- [ ] [Testable criterion 2]

### Requirement 2: [REQUIREMENT_NAME]
...

## Non-Functional Requirements

### Performance
- [Metric]: [Target value]
- [Metric]: [Target value]

### Security
- [Requirement 1]
- [Requirement 2]

## User Stories

### User Story 1
**As a** [user type]
**I want** [goal]
**So that** [benefit]

**Acceptance Criteria**:
- [ ] [Criterion 1]
- [ ] [Criterion 2]

## Success Criteria

- [ ] [Measurable success criterion 1]
- [ ] [Measurable success criterion 2]

## Assumptions

- [Assumption 1]
- [Assumption 2]

## Dependencies

- [Dependency 1]
- [Dependency 2]

## Review Checklist

- [ ] All requirements are clear and testable
- [ ] Success criteria are measurable
- [ ] Dependencies identified
- [ ] Security considerations addressed
- [ ] Performance targets defined

---

**Version**: 1.0.0
**Last Updated**: [DATE]
**Template**: default-spec
```

### MuleSoft Spec Template

```markdown
# MuleSoft API Specification: [API_NAME]

**Branch**: `[###-api-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## Execution Flow (main)
```
1. Parse user description from Input
2. Extract key concepts: consumers, operations, data flows
3. Determine API Layer (System/Process/Experience)
4. Mark unclear aspects with [NEEDS CLARIFICATION: ...]
5. Fill Consumer Scenarios section
6. Generate Functional Requirements (testable)
7. Identify API Contract Elements
8. Run Review Checklist
9. Return SUCCESS or ERROR
```

## API Overview

### API Name
[API_NAME]

### API Layer
- [ ] System API (backend system integration)
- [ ] Process API (orchestration and composition)
- [ ] Experience API (channel-specific)

**Rationale**: [Why this layer assignment]

### Purpose
[What this API does and why it exists]

### Consumers
- [Consumer 1]: [How they use the API]
- [Consumer 2]: [How they use the API]

## Consumer Scenarios & Testing

### Scenario 1: [SCENARIO_NAME]
**Actor**: [Consumer type]
**Trigger**: [What initiates this scenario]
**Flow**:
1. [Step 1]
2. [Step 2]
3. [Expected outcome]

**Test Cases**:
- [ ] Happy path: [Expected result]
- [ ] Error case: [Expected error handling]

## Functional Requirements

### FR-1: [REQUIREMENT_NAME]
**Description**: [Clear requirement]
**RAML Operation**: `[METHOD] /[resource]`
**Input**: [Request structure]
**Output**: [Response structure]
**Validation**: [Rules and constraints]

## API Contract

### Resources

#### /[resource-name]
**Operations**:
- `GET /[resource]` - [Description]
- `POST /[resource]` - [Description]
- `PUT /[resource]/{id}` - [Description]
- `DELETE /[resource]/{id}` - [Description]

### Data Models

#### [ModelName]
```yaml
[ModelName]:
  type: object
  properties:
    [field1]:
      type: string
      description: [Description]
    [field2]:
      type: integer
      description: [Description]
```

### Error Responses

| HTTP Code | Error Code | Description |
|-----------|------------|-------------|
| 400 | INVALID_REQUEST | [Description] |
| 404 | NOT_FOUND | [Description] |
| 500 | INTERNAL_ERROR | [Description] |

## Non-Functional Requirements

### Performance
- Response time: < [TARGET] ms (95th percentile)
- Throughput: [TARGET] requests/second

### Security
- Authentication: [Method]
- Authorization: [Policies]
- Data encryption: [Requirements]

### Reliability
- Availability: [TARGET]%
- Error rate: < [TARGET]%

## Dependencies

### External Systems
- [System 1]: [Purpose, endpoint, auth]
- [System 2]: [Purpose, endpoint, auth]

### Shared Resources
- [Resource 1]: [Location, format]
- [Resource 2]: [Location, format]

## Assumptions

- [Assumption 1]
- [Assumption 2]

## Areas Requiring Clarification

[If any [NEEDS CLARIFICATION: ...] markers exist, list them here]

## Review Checklist

- [ ] API layer assignment is appropriate
- [ ] All consumer scenarios are testable
- [ ] RAML operations are complete
- [ ] Data models are defined
- [ ] Error handling is comprehensive
- [ ] Security requirements specified
- [ ] Performance targets are measurable
- [ ] No implementation details included

---

**Version**: 1.0.0
**Last Updated**: [DATE]
**Template**: mulesoft-spec
```

### JHipster Spec Template

```markdown
# JHipster Feature Specification: [FEATURE_NAME]

**Branch**: `[###-feature-slug]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## Overview

### Feature Type
- [ ] New Entity
- [ ] Entity Relationship
- [ ] Service Layer
- [ ] REST API
- [ ] Frontend Component
- [ ] Authentication/Authorization
- [ ] Configuration

### Purpose
[What this feature does and why]

## Entity Definitions (if applicable)

### Entity: [EntityName]

**JDL Definition**:
```jdl
entity [EntityName] {
  [fieldName] [fieldType] [constraints]
}
```

**Fields**:
| Field | Type | Constraints | Description |
|-------|------|-------------|-------------|
| [field1] | String | required, maxlength(100) | [Description] |
| [field2] | Integer | min(0), max(999) | [Description] |

**Relationships**:
```jdl
relationship [OneToMany | ManyToOne | OneToOne | ManyToMany] {
  [EntityA]{[fieldName]} to [EntityB]{[fieldName]}
}
```

## API Endpoints

### REST Resources

#### [EntityName] Resource

**Base Path**: `/api/[entity-name]s`

**Endpoints**:
- `GET /api/[entity-name]s` - List all entities (paginated)
- `GET /api/[entity-name]s/{id}` - Get entity by ID
- `POST /api/[entity-name]s` - Create new entity
- `PUT /api/[entity-name]s/{id}` - Update entity
- `DELETE /api/[entity-name]s/{id}` - Delete entity

## Frontend Components

### Component: [ComponentName]

**Type**: [Page | Dialog | Widget]
**Route**: `/[route-path]`
**Purpose**: [What the component does]

**Features**:
- [Feature 1]
- [Feature 2]

**User Interactions**:
- [Action 1]: [Behavior]
- [Action 2]: [Behavior]

## Functional Requirements

### FR-1: [REQUIREMENT_NAME]
**Description**: [Clear requirement]
**User Story**: As a [user], I want [goal] so that [benefit]
**Acceptance Criteria**:
- [ ] [Testable criterion 1]
- [ ] [Testable criterion 2]

## Non-Functional Requirements

### Performance
- Entity list loading: < [TARGET] ms
- Form submission: < [TARGET] ms

### Security
- Authentication: [JWT | OAuth2 | Session]
- Authorization: [Roles and permissions]
- Data validation: [Client and server-side]

### Usability
- Responsive design: Desktop, tablet, mobile
- Accessibility: WCAG 2.1 Level AA
- Internationalization: [Languages]

## Technical Considerations

### Backend (Spring Boot)
- Service layer: [Services needed]
- Repository layer: [Custom queries]
- DTOs: [Data transfer objects]
- Mappers: [Entity-DTO mappings]

### Frontend (Angular/React)
- Services: [API services]
- Components: [UI components]
- State management: [NgRx | Redux]
- Routing: [Routes]

### Database
- Schema changes: [Liquibase/Flyway changesets]
- Indexes: [Required indexes]
- Constraints: [Unique, foreign keys]

## Testing Requirements

### Backend Tests
- Unit tests: Service and repository layers
- Integration tests: REST API endpoints
- E2E tests: User workflows

### Frontend Tests
- Unit tests: Services and utilities
- Component tests: UI components
- E2E tests: User journeys

## Dependencies

- [Dependency 1]: [Version, purpose]
- [Dependency 2]: [Version, purpose]

## Assumptions

- [Assumption 1]
- [Assumption 2]

## Review Checklist

- [ ] Entity definitions are complete
- [ ] Relationships are correct
- [ ] API endpoints are RESTful
- [ ] Frontend components are specified
- [ ] Security requirements defined
- [ ] Testing strategy is comprehensive
- [ ] JHipster conventions followed

---

**Version**: 1.0.0
**Last Updated**: [DATE]
**Template**: jhipster-spec
```

## Creating Custom Templates

### Step 1: Identify Need

```
Project Type: Kubernetes-native applications
Framework: Helm, Operator SDK
Template Need: k8s-spec.md, k8s-plan.md, k8s-tasks.md
```

### Step 2: Create Foundation Type

Update `foundation` agent to support new type:

```markdown
## Foundation Types Supported

- **default**: General-purpose development
- **mulesoft**: MuleSoft Anypoint Platform
- **jhipster**: JHipster full-stack applications
- **kubernetes**: Kubernetes-native applications (NEW)
```

### Step 3: Create Template Files

```bash
# Create templates in generator skills
mkdir -p skills/generators/spec-generator/templates
touch skills/generators/spec-generator/templates/kubernetes-spec.md

mkdir -p skills/generators/plan-generator/templates
touch skills/generators/plan-generator/templates/kubernetes-plan.md

mkdir -p skills/generators/tasks-generator/templates
touch skills/generators/tasks-generator/templates/kubernetes-tasks.md
```

### Step 4: Write Template Content

```markdown
# Kubernetes Specification: [FEATURE_NAME]

**Branch**: `[###-feature-slug]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## Resource Overview

### Resource Type
- [ ] Deployment
- [ ] StatefulSet
- [ ] Service
- [ ] Ingress
- [ ] ConfigMap
- [ ] Secret
- [ ] Custom Resource

### Purpose
[What this Kubernetes resource provides]

## Resource Specification

### [ResourceType]: [ResourceName]

**Namespace**: `[NAMESPACE]`
**Labels**:
- `app`: [APP_NAME]
- `version`: [VERSION]
- `environment`: [ENV]

**Manifest**:
```yaml
apiVersion: [API_VERSION]
kind: [KIND]
metadata:
  name: [NAME]
  namespace: [NAMESPACE]
spec:
  # [SPEC_DETAILS]
```

## Functional Requirements

### FR-1: [REQUIREMENT_NAME]
**Description**: [Clear requirement]
**Manifest Section**: [spec.containers | spec.volumes | etc.]
**Configuration**: [How to configure]
**Validation**: [How to verify]

## Non-Functional Requirements

### Scalability
- Min replicas: [MIN]
- Max replicas: [MAX]
- HPA metrics: [CPU | Memory | Custom]

### Reliability
- Health checks: Liveness, readiness probes
- Rolling update strategy: [MAX_SURGE], [MAX_UNAVAILABLE]
- PodDisruptionBudget: [MIN_AVAILABLE]

### Security
- SecurityContext: [USER_ID], [CAPABILITIES]
- Network policies: [INGRESS], [EGRESS]
- Secrets management: [METHOD]

## Dependencies

### External Services
- [Service 1]: [Endpoint, port, protocol]
- [Service 2]: [Endpoint, port, protocol]

### ConfigMaps/Secrets
- [ConfigMap 1]: [Keys, values]
- [Secret 1]: [Keys, mount paths]

## Review Checklist

- [ ] Resource type is appropriate
- [ ] Labels follow conventions
- [ ] Health checks defined
- [ ] Security context specified
- [ ] Resource limits set
- [ ] Monitoring configured

---

**Version**: 1.0.0
**Last Updated**: [DATE]
**Template**: kubernetes-spec
```

### Step 5: Create Domain Skill

Create `skills/domains/kubernetes/SKILL.md`:

```markdown
---
name: kubernetes
description: Kubernetes-native application development specialist. Use when working with Kubernetes, Helm, operators, or cloud-native architectures. Activates for k8s manifests, deployments, and container orchestration tasks.
---

# Kubernetes Domain Skill

Expertise in Kubernetes-native application development, Helm charts, operators, and cloud-native patterns.

## Core Principles

### 1. Declarative Configuration
Define desired state, let Kubernetes reconcile.

### 2. Immutability
Containers and pods are immutable, replace don't modify.

### 3. Observability
Health checks, logging, metrics, tracing built-in.

## Auto-Activation Triggers

### High Confidence Triggers
- Keywords: "kubernetes", "k8s", "helm", "operator", "deployment"
- File patterns: `*.yaml` (k8s manifests), `Chart.yaml`, `values.yaml`

## Specializations

### Kubernetes Resources
- Deployments, StatefulSets, DaemonSets
- Services, Ingress, NetworkPolicy
- ConfigMaps, Secrets, PersistentVolumeClaims

### Helm Charts
- Chart structure and templates
- Values files and overrides
- Dependencies and subcharts

### Operators
- Custom Resource Definitions (CRDs)
- Controller patterns
- Reconciliation loops

## Resources
- See [k8s-patterns.md](k8s-patterns.md) for examples
```

### Step 6: Update Generator Skills

Update spec-generator/SKILL.md:

```markdown
### 2. Template Selection
Based on foundation type, load the appropriate template:
- **Default projects**: `templates/default-spec.md`
- **JHipster projects**: `templates/jhipster-spec.md`
- **MuleSoft projects**: `templates/mulesoft-spec.md`
- **Kubernetes projects**: `templates/kubernetes-spec.md` (NEW)
```

### Step 7: Test Template

```bash
# Create foundation with kubernetes type
/buddy:foundation

# Select kubernetes as foundation type
# Verify domain skill activates

# Create spec using new template
/buddy:spec Create a microservice deployment for user API

# Verify:
# - kubernetes-spec.md template used
# - Kubernetes-specific sections present
# - Domain skill guidance applied
```

## Template Best Practices

### Template Design

1. **Clear Structure**: Logical section organization
2. **Complete Placeholders**: Every variable marked clearly
3. **Validation Built-In**: Review checklists in every template
4. **Execution Guidance**: Optional flow comments for complex templates
5. **Clarification Support**: `[NEEDS CLARIFICATION: ...]` markers

### Placeholder Conventions

1. **ALL_CAPS**: Use consistent naming
2. **Descriptive**: `[API_NAME]` not `[NAME]`
3. **Grouped**: Related placeholders near each other
4. **Optional Markers**: `[OPTIONAL: ...]` for optional sections
5. **Validation Markers**: `[NEEDS CLARIFICATION: ...]` for unknowns

### Section Organization

1. **Top-Down**: Overview before details
2. **Consistent Order**: Same sections across templates
3. **Required vs Optional**: Mark optional sections clearly
4. **Cross-References**: Link related sections
5. **Checklists Last**: Review checklist at end

### Quality Assurance

1. **Testability**: Every requirement must be testable
2. **Completeness**: No missing sections
3. **Consistency**: Terminology and formatting uniform
4. **Accuracy**: Technical details correct
5. **Readability**: Clear, professional language

## Troubleshooting

### Wrong Template Selected

**Symptom**: Agent uses incorrect template for project type

**Causes**:
- Foundation type incorrect in foundation.md
- Template detection logic error
- Foundation.md doesn't exist

**Solution**:
1. Verify foundation.md exists
2. Check `**Foundation Type**` metadata field
3. Run `/buddy:foundation` to recreate if needed
4. Verify foundation type matches project

### Placeholders Not Filled

**Symptom**: Template has remaining `[PLACEHOLDERS]`

**Causes**:
- Agent didn't complete filling phase
- Information missing from user input
- Agent marked as `[NEEDS CLARIFICATION: ...]`

**Solution**:
1. Check for `[NEEDS CLARIFICATION: ...]` markers
2. Provide missing information to agent
3. Verify agent completed validation phase
4. Re-run agent with complete information

### Template Structure Broken

**Symptom**: Generated document has malformed structure

**Causes**:
- Template file syntax error
- Agent modified structure incorrectly
- Markdown formatting issues

**Solution**:
1. Validate template markdown syntax
2. Check template file for errors
3. Review agent filling logic
4. Test with minimal inputs

### Custom Template Not Used

**Symptom**: Custom template not selected

**Causes**:
- Foundation type doesn't match
- Template file not in correct location
- Generator skill not updated

**Solution**:
1. Verify template in `skills/generators/{generator}/templates/`
2. Check filename matches `{foundation-type}-{doc-type}.md`
3. Update generator skill to reference new template
4. Verify foundation type detection

## See Also

- [agents.md](agents.md) - Agents that use templates
- [skills.md](skills.md) - Generator skills providing templates
- [architecture.md](architecture.md) - Template system in architecture
- [commands.md](commands.md) - Commands triggering template usage

---

**Version**: 4.0.0
**Last Updated**: 2025-11-07
