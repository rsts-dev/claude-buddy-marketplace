# Feature Specification: [FEATURE NAME]

**Branch**: `[###-feature-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## Quick Guidelines
- Focus on WHAT users/admins need on the platform and WHY
- Avoid HOW to implement (no Apex code, LWC internals, or metadata XML here)
- Written for admins, developers, and stakeholders alike
- Every requirement must be testable and unambiguous

### For AI Generation
Mark ambiguities with `[NEEDS CLARIFICATION: specific question]`. Common underspecified areas on Salesforce:
- Profiles / permission sets and record-level sharing
- Declarative (Flow) vs. programmatic (Apex) automation choice
- Bulk/data-volume behavior and governor-limit exposure
- Field-level security, validation rules, and required fields
- Integration surface (Platform Events, external services, callouts)

---

## User Scenarios & Testing *(mandatory)*

### Primary Use Cases
[How admins/users interact with this feature in the org]

### Acceptance Scenarios
1. **Given** [org state / records], **When** [action], **Then** [expected outcome]
2. **Given** [user with permission set X], **When** [action], **Then** [expected outcome]

### Edge Cases
- What happens on a bulk operation (200+ records)?
- How does the system behave when the user lacks the permission set?
- What occurs at a governor limit (SOQL rows, DML, CPU)?

---

## Requirements *(mandatory)*

### Functional Requirements
- **FR-001**: System MUST [requirement]
- **FR-002**: System MUST [requirement]
- **FR-003**: System SHOULD [requirement]

### Data Model *(include if applicable)*
- **Objects**: [standard/custom objects and key fields]
- **Relationships**: [lookup / master-detail]
- **Validation**: [validation rules, required fields]
- **Sharing/Visibility**: [OWD, sharing rules, permission sets]

### Automation *(include if applicable)*
- **Declarative**: [Flows / validation rules]
- **Programmatic**: [Apex triggers / classes, only where Flow can't]
- **Async**: [Queueable / Batch / Platform Events]

### Integration Requirements *(include if applicable)*
- **External Systems**: [callouts, named credentials, MuleSoft]
- **Events**: [Platform Events / Change Data Capture]

---

## Dependencies & Constraints *(mandatory)*
- **Dependencies**: [existing objects, packages, permission sets]
- **Constraints**: [governor limits, license types, org edition]
- **Assumptions**: [assumptions made]

---

## Review & Acceptance Checklist
- [ ] No implementation details (no Apex/LWC/metadata)
- [ ] Focused on user/admin value
- [ ] All mandatory sections completed
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Permissions/sharing considered
- [ ] Bulk + governor-limit behavior considered
- [ ] Scope clearly bounded
