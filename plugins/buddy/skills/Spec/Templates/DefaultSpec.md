# Feature Specification: [FEATURE NAME]

**Branch**: `[###-feature-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## Execution Flow (main)
```
1. Parse user description from Input
   → If empty: ERROR "No feature description provided"
2. Extract key concepts from description
   → Identify: actors, actions, data, constraints, outcomes
3. Determine feature scope
   → If unclear: Mark with [NEEDS CLARIFICATION: scope definition]
4. For each unclear aspect:
   → Mark with [NEEDS CLARIFICATION: specific question]
5. Fill User Scenarios & Testing section
   → If no clear user flow: ERROR "Cannot determine user scenarios"
6. Generate Functional Requirements
   → Each requirement must be testable
   → Mark ambiguous requirements
7. Run Review Checklist
   → If any [NEEDS CLARIFICATION]: WARN "Spec has uncertainties"
   → If implementation details found: ERROR "Remove tech details"
8. Return: SUCCESS (spec ready for planning)
```

---

## Quick Guidelines
- Focus on WHAT users need and WHY
- Avoid HOW to implement (no code, frameworks, libraries, database schemas)
- Written for stakeholders and developers alike
- Every requirement must be testable and unambiguous

### Section Requirements
- **Mandatory sections**: Must be completed for every feature
- **Optional sections**: Include only when relevant to the feature
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this spec from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question] for any assumption
2. **Don't guess**: If the prompt doesn't specify something, mark it
3. **Common underspecified areas**:
   - User roles and permissions
   - Error handling behavior
   - Data validation rules
   - Performance requirements
   - Edge cases and boundary conditions

---

## User Scenarios & Testing *(mandatory)*

### Primary Use Cases
[Describe how users will interact with this feature]

### Acceptance Scenarios
1. **Given** [initial state], **When** [action], **Then** [expected outcome]
2. **Given** [initial state], **When** [action], **Then** [expected outcome]

### Edge Cases
- What happens when [boundary condition]?
- How does the system handle [error scenario]?
- What occurs when [unexpected input]?

---

## Requirements *(mandatory)*

### Functional Requirements
- **FR-001**: System MUST [requirement]
- **FR-002**: System MUST [requirement]
- **FR-003**: System SHOULD [requirement]

### Non-Functional Requirements *(include if applicable)*
- **Performance**: [Response time, throughput targets]
- **Security**: [Authentication, authorization, data protection]
- **Scalability**: [Load expectations, growth projections]
- **Accessibility**: [Standards compliance, assistive technology support]

### Data Requirements *(include if applicable)*
- **Entities**: [Key data objects and their attributes]
- **Relationships**: [How entities relate to each other]
- **Validation**: [Data integrity rules]
- **Storage**: [Persistence requirements]

### Integration Requirements *(include if applicable)*
- **External Systems**: [APIs, services, databases to integrate with]
- **Events**: [Events produced or consumed]
- **Data Flow**: [How data moves between systems]

---

## Dependencies & Constraints *(mandatory)*

### Dependencies
- [Existing features, services, or systems this depends on]

### Constraints
- [Technical, business, or regulatory constraints]

### Assumptions
- [Assumptions made during specification]

---

## Review & Acceptance Checklist

### Content Quality
- [ ] No implementation details (code, frameworks, database schemas)
- [ ] Focused on user needs and business value
- [ ] Written for both technical and non-technical stakeholders
- [ ] All mandatory sections completed

### Requirement Completeness
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable and unambiguous
- [ ] Edge cases and error scenarios documented
- [ ] Security requirements considered
- [ ] Performance targets are measurable (if applicable)
- [ ] Scope is clearly bounded
- [ ] Dependencies and assumptions identified

---

## Execution Status
*Updated during processing*

- [ ] User description parsed
- [ ] Key concepts extracted
- [ ] Scope determined
- [ ] Ambiguities marked
- [ ] User scenarios defined
- [ ] Requirements generated
- [ ] Review checklist passed
