# MuleSoft API Specification: [API NAME]

**Branch**: `[###-api-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## Execution Flow (main)
```
1. Parse user description from Input
   → If empty: ERROR "No API description provided"
2. Extract key concepts from description
   → Identify: consumers, operations, data flows, constraints
3. Determine API Layer (System/Process/Experience)
   → If unclear: Mark with [NEEDS CLARIFICATION: layer assignment rationale]
4. For each unclear aspect:
   → Mark with [NEEDS CLARIFICATION: specific question]
5. Fill Consumer Scenarios & Testing section
   → If no clear consumer flow: ERROR "Cannot determine consumer scenarios"
6. Generate Functional Requirements
   → Each requirement must be testable
   → Mark ambiguous requirements
7. Identify API Contract Elements (resources, operations, data models)
8. Run Review Checklist
   → If any [NEEDS CLARIFICATION]: WARN "Spec has uncertainties"
   → If implementation details found: ERROR "Remove tech details"
9. Return: SUCCESS (spec ready for planning)
```

---

## ⚡ Quick Guidelines
- ✅ Focus on WHAT the API provides and WHY consumers need it
- ❌ Avoid HOW to implement (no connectors, DataWeave, flows, XML)
- 👥 Written for API consumers and business stakeholders, not MuleSoft developers

### Section Requirements
- **Mandatory sections**: Must be completed for every API
- **Optional sections**: Include only when relevant to the API
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this spec from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something (e.g., "customer API" without operations), mark it
3. **Think like an API consumer**: Every vague requirement should fail the "testable and unambiguous" checklist item
4. **Common underspecified areas**:
   - API layer assignment rationale
   - Consumer authentication methods
   - Data transformation scope
   - Rate limiting and SLA requirements
   - Error response formats
   - Pagination requirements
   - Versioning strategy
   - Backward compatibility needs

---

## API Layer Classification *(mandatory)*

**Assigned Layer**: [System API / Process API / Experience API]

**Rationale**: [Explain why this API belongs in this layer]
- System API: Direct integration with a backend system/database, providing data access with no business logic
- Process API: Orchestrates multiple System APIs, applies business logic, composes data
- Experience API: Tailored for specific consumer channels (mobile, web, partner), optimized for consumption

**Reusability Scope**: [Who will consume this API? Single channel or multiple consumers?]

---

## Consumer Scenarios & Testing *(mandatory)*

### Primary Consumer Use Cases
[Describe how API consumers will use this API]

**Example**:
- Mobile app needs to retrieve customer profile with order history
- Partner portal needs to submit orders and check status
- Internal dashboard needs to display real-time metrics

### API Operation Flows
1. **Given** [consumer state], **When** [API call with parameters], **Then** [expected response]
2. **Given** [consumer state], **When** [API call with parameters], **Then** [expected response]

**Example**:
- **Given** authenticated user, **When** GET /customers/{id}, **Then** return customer profile with 200 status
- **Given** invalid customer ID, **When** GET /customers/{id}, **Then** return error response with 404 status

### Edge Cases
- What happens when [boundary condition, e.g., pagination limit exceeded]?
- How does API handle [error scenario, e.g., downstream system unavailable]?
- What occurs when [data scenario, e.g., customer has no orders]?

---

## Requirements *(mandatory)*

### Functional Requirements

**API Operations**:
- **FR-001**: API MUST provide [operation, e.g., "retrieve customer by ID"]
- **FR-002**: API MUST support [operation, e.g., "create new customer"]
- **FR-003**: API MUST allow [operation, e.g., "update customer status"]
- **FR-004**: API MUST enable [operation, e.g., "search customers by criteria"]

**Data Requirements**:
- **FR-005**: API MUST return [data elements, e.g., "customer name, email, phone, address"]
- **FR-006**: API MUST accept [input data, e.g., "customer registration data"]
- **FR-007**: API MUST validate [data rules, e.g., "email format, phone number format"]
- **FR-008**: API MUST transform [data mapping, e.g., "internal codes to display labels"]

**Behavior Requirements**:
- **FR-009**: API MUST [behavior, e.g., "respond within 500ms for 95% of requests"]
- **FR-010**: API MUST [constraint, e.g., "support pagination with max 100 records per page"]
- **FR-011**: API MUST [error handling, e.g., "return standard error format for all failures"]

*Example of marking unclear requirements:*
- **FR-012**: API MUST authenticate consumers via [NEEDS CLARIFICATION: auth method not specified - API key, OAuth 2.0, Basic Auth?]
- **FR-013**: API MUST integrate with [NEEDS CLARIFICATION: backend system not specified - Salesforce, SAP, database?]
- **FR-014**: API MUST support [NEEDS CLARIFICATION: data format not specified - JSON, XML, both?]

### Security & Policy Requirements *(include if API has security needs)*
- **Authentication**: [How consumers authenticate, e.g., OAuth 2.0, API key]
- **Authorization**: [What permissions consumers need, e.g., read-only, full access]
- **Rate Limiting**: [Request limits per consumer, e.g., 1000 requests/hour]
- **Data Privacy**: [PII handling, masking requirements]
- **Compliance**: [Industry standards, e.g., HIPAA, PCI-DSS]

### Performance & Scale Requirements *(include if API has performance needs)*
- **Latency**: [Response time targets, e.g., p95 < 500ms]
- **Throughput**: [Request volume, e.g., 1000 TPS]
- **Availability**: [Uptime requirements, e.g., 99.9%]
- **Payload Size**: [Max request/response size]
- **Concurrent Consumers**: [Expected load]

### API Contract Elements *(mandatory)*

**Resources**: [RESTful resources the API exposes]
- `/customers` - Customer collection
- `/customers/{id}` - Individual customer
- `/orders` - Order collection
- `/orders/{id}` - Individual order

**Operations**: [HTTP methods and their purpose]
- GET /customers - Retrieve customer list
- POST /customers - Create new customer
- GET /customers/{id} - Retrieve customer by ID
- PUT /customers/{id} - Update customer
- DELETE /customers/{id} - Delete customer

**Request Data Models**: [Key input data structures without implementation]
- **Customer**: [name, email, phone, address, preferences]
- **Order**: [customer ID, items, total, shipping address]

**Response Data Models**: [Key output data structures]
- **Customer**: [id, name, email, status, created date, order count]
- **Order**: [id, customer info, items, status, tracking]

**Error Responses**: [Standard error format]
- Error code, message, timestamp, correlation ID

### Integration Requirements *(include if API integrates with external systems)*
- **Upstream Systems**: [Systems this API calls, e.g., Salesforce CRM, MySQL database]
- **Downstream Consumers**: [Who will call this API, e.g., mobile app, web portal]
- **Data Sources**: [Where data originates]
- **Data Synchronization**: [Real-time vs batch, caching requirements]

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### Content Quality
- [ ] No implementation details (connectors, DataWeave, flows, Mule configs)
- [ ] Focused on API consumer needs and business value
- [ ] Written for non-technical stakeholders and API consumers
- [ ] All mandatory sections completed
- [ ] API layer assignment is clear and justified

### Requirement Completeness
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable and unambiguous
- [ ] API operations are clearly defined
- [ ] Request/response data models are specified
- [ ] Error scenarios are documented
- [ ] Security requirements are defined
- [ ] Performance targets are measurable
- [ ] Scope is clearly bounded
- [ ] Dependencies and assumptions identified

### API-Led Principles
- [ ] API layer (System/Process/Experience) is appropriate
- [ ] Reusability scope is defined
- [ ] Consumer use cases are clear
- [ ] API follows RESTful design principles (if REST)
- [ ] Versioning strategy is considered

---

## Execution Status
*Updated by main() during processing*

- [ ] User description parsed
- [ ] Key concepts extracted
- [ ] API layer determined
- [ ] Ambiguities marked
- [ ] Consumer scenarios defined
- [ ] Requirements generated
- [ ] API contract elements defined
- [ ] Review checklist passed

---
