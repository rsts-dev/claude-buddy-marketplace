# JHipster Feature Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## Execution Flow (main)
```
1. Parse user description from Input
   → If empty: ERROR "No feature description provided"
2. Extract key concepts from description
   → Identify: user roles, UI interactions, backend operations, data entities, business rules
3. Determine feature scope (full-stack, frontend-only, backend-only, entity-focused)
   → If unclear: Mark with [NEEDS CLARIFICATION: scope]
4. For each unclear aspect:
   → Mark with [NEEDS CLARIFICATION: specific question]
5. Fill User Scenarios & Testing section
   → If no clear user flow: ERROR "Cannot determine user scenarios"
6. Generate Functional Requirements
   → Each requirement must be testable
   → Mark ambiguous requirements
7. Identify Key Entities and Relationships (JHipster JDL perspective)
8. Identify Frontend Requirements (components, pages, navigation)
9. Run Review Checklist
   → If any [NEEDS CLARIFICATION]: WARN "Spec has uncertainties"
   → If implementation details found: ERROR "Remove tech details"
10. Return: SUCCESS (spec ready for planning)
```

---

## ⚡ Quick Guidelines
- ✅ Focus on WHAT users need and WHY (both frontend and backend)
- ❌ Avoid HOW to implement (no Spring controllers, Angular components, database schemas)
- 👥 Written for product stakeholders and full-stack developers
- 🎯 JHipster perspective: Think entities, relationships, user interactions, APIs

### Section Requirements
- **Mandatory sections**: Must be completed for every feature
- **Optional sections**: Include only when relevant to the feature
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this spec from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something (e.g., "user management" without role details), mark it
3. **Think full-stack**: Every feature likely touches frontend, backend, and database
4. **Common underspecified areas**:
   - Entity relationships and cardinality
   - User authentication/authorization requirements
   - UI/UX interaction patterns
   - Validation rules (frontend and backend)
   - Data pagination and filtering needs
   - Internationalization requirements
   - Notification mechanisms
   - Integration with external systems

---

## User Scenarios & Testing *(mandatory)*

### Primary User Story
[Describe the main user journey from frontend to backend]

**Example**:
As a [user role], I want to [action on UI] so that [business outcome involving data/backend]

### Acceptance Scenarios
1. **Given** [user state and UI state], **When** [user interaction on frontend], **Then** [expected UI response and backend effect]
2. **Given** [initial data state], **When** [backend operation triggered by UI], **Then** [expected data change and UI update]

**Example**:
- **Given** authenticated admin user on customer list page, **When** clicking "Create Customer" button and submitting form, **Then** new customer appears in list and is persisted in database
- **Given** invalid email format in form, **When** attempting to submit, **Then** validation error shown on frontend before backend call

### Edge Cases
- What happens when [boundary condition, e.g., empty list, max pagination limit]?
- How does UI handle [error scenario, e.g., backend unavailable, validation failure]?
- What occurs when [concurrent scenario, e.g., two users editing same entity]?

---

## Requirements *(mandatory)*

### Functional Requirements

**Entity & Data Requirements**:
- **FR-001**: System MUST manage [entity name] with [key attributes]
- **FR-002**: [Entity A] MUST have [relationship type] relationship with [Entity B]
- **FR-003**: System MUST enforce [data validation rule, e.g., "email must be unique"]
- **FR-004**: System MUST support [data operation, e.g., "soft delete", "audit trail"]

**Backend API Requirements**:
- **FR-005**: Backend MUST provide API to [operation, e.g., "create customer"]
- **FR-006**: Backend MUST validate [business rule, e.g., "order total matches line items"]
- **FR-007**: Backend MUST [integration requirement, e.g., "send email notification on order creation"]

**Frontend UI Requirements**:
- **FR-008**: UI MUST display [data view, e.g., "paginated list of customers with search"]
- **FR-009**: UI MUST provide [interaction, e.g., "form to create/edit customer"]
- **FR-010**: UI MUST show [feedback, e.g., "success notification after save"]
- **FR-011**: UI MUST support [navigation, e.g., "breadcrumbs for nested views"]

**Authentication & Authorization Requirements** *(include if feature has security)*:
- **FR-012**: Feature MUST be accessible only to [user roles, e.g., "ADMIN, MANAGER"]
- **FR-013**: Users MUST [auth requirement, e.g., "be authenticated to access feature"]
- **FR-014**: UI MUST [authorization display, e.g., "hide admin actions from regular users"]

**Integration Requirements** *(include if feature integrates externally)*:
- **FR-015**: System MUST integrate with [external service, e.g., "payment gateway"]
- **FR-016**: System MUST [external data requirement, e.g., "fetch currency rates from API"]

*Example of marking unclear requirements:*
- **FR-017**: System MUST authenticate users via [NEEDS CLARIFICATION: auth method not specified - JWT, OAuth2, session-based?]
- **FR-018**: Customer entity MUST have relationship with Order entity [NEEDS CLARIFICATION: one-to-many or many-to-many?]
- **FR-019**: UI MUST support [NEEDS CLARIFICATION: responsive design for mobile? specific breakpoints?]

### Key Entities & Relationships *(mandatory if feature involves data)*

**Entities** (from JDL perspective, without implementation details):
- **[Entity 1]**: [Brief description, key attributes without types]
  - Example: **Customer**: Represents system users who place orders (name, email, phone, address, status)
- **[Entity 2]**: [Brief description, key attributes]
  - Example: **Order**: Customer purchase transaction (order date, total amount, status, line items)

**Relationships**:
- **[Entity A]** [relationship type] **[Entity B]**
  - Example: **Customer** one-to-many **Order** (one customer can have multiple orders)
  - Example: **Order** many-to-many **Product** (orders contain multiple products, products appear in multiple orders)

**Business Rules**:
- [Validation or constraint rule]
  - Example: Email must be unique across all customers
  - Example: Order total must equal sum of line item totals

---

## Frontend Requirements *(mandatory)*

### Pages/Views
List the main UI pages or views this feature requires:
- **[Page Name]**: [Purpose and key elements]
  - Example: **Customer List Page**: Displays paginated table of customers with search, filter, and create button
  - Example: **Customer Detail Page**: Shows customer information with edit capability and list of related orders

### Components/Interactions
Key UI components and user interactions:
- **[Component/Interaction]**: [Description]
  - Example: **Customer Form**: Create/edit form with validation (name, email, phone, address fields)
  - Example: **Search & Filter**: Text search across name/email, dropdown filter by status
  - Example: **Confirmation Dialog**: "Are you sure?" prompt before delete operations

### Navigation
How users navigate through the feature:
- [Navigation flow]
  - Example: Dashboard → Customer List → Customer Detail → Edit Customer → Save → Customer Detail
  - Example: Order List → Create Order → Select Customer → Add Products → Submit → Order Confirmation

### UI Validation
Frontend validation rules (separate from backend validation):
- [Validation rule]
  - Example: Email field must match email pattern before form submission
  - Example: Required fields must be filled before enabling submit button
  - Example: Date fields must be valid dates and not in the past

---

## Non-Functional Requirements *(include if applicable)*

### Performance
- **Latency**: [Response time targets, e.g., "API calls <500ms", "UI interaction <100ms"]
- **Throughput**: [Volume targets, e.g., "support 1000 concurrent users"]
- **Data Volume**: [Scalability needs, e.g., "handle 1M customer records"]

### Usability
- **Responsiveness**: [Mobile/tablet support requirements]
- **Accessibility**: [WCAG compliance level, keyboard navigation]
- **Internationalization**: [Language support, e.g., "English and Spanish"]

### Security
- **Data Protection**: [PII handling, encryption requirements]
- **Input Validation**: [XSS prevention, SQL injection protection]
- **Rate Limiting**: [API throttling requirements]

### Compatibility
- **Browsers**: [Supported browsers and versions]
- **Devices**: [Desktop, mobile, tablet requirements]

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### Content Quality
- [ ] No implementation details (Spring controllers, Angular components, database schemas, JPA annotations)
- [ ] Focused on user value and business needs
- [ ] Written for product stakeholders and full-stack developers
- [ ] All mandatory sections completed
- [ ] Full-stack perspective (frontend, backend, data) addressed

### Requirement Completeness
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable and unambiguous
- [ ] Entity relationships are clearly defined
- [ ] Frontend UI requirements are specific
- [ ] Backend API requirements are specific
- [ ] Success criteria are measurable
- [ ] Scope is clearly bounded
- [ ] Dependencies and assumptions identified

### JHipster Readiness
- [ ] Entities can be modeled in JDL (JHipster Domain Language)
- [ ] Relationships follow JHipster patterns (one-to-many, many-to-one, many-to-many, one-to-one)
- [ ] Authentication/authorization requirements align with JHipster security model
- [ ] UI requirements feasible with chosen frontend framework (Angular/React/Vue)

---

## Execution Status
*Updated by main() during processing*

- [ ] User description parsed
- [ ] Key concepts extracted
- [ ] Feature scope determined
- [ ] Ambiguities marked
- [ ] User scenarios defined
- [ ] Functional requirements generated
- [ ] Entities and relationships identified
- [ ] Frontend requirements defined
- [ ] Review checklist passed

---
