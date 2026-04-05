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
   → Identify: user interactions, component needs, state requirements, data flows
3. Determine feature scope (new page, component, hook, state change, integration)
   → If unclear: Mark with [NEEDS CLARIFICATION: scope]
4. For each unclear aspect:
   → Mark with [NEEDS CLARIFICATION: specific question]
5. Fill User Scenarios & Testing section
   → If no clear user flow: ERROR "Cannot determine user scenarios"
6. Generate Functional Requirements
   → Each requirement must be testable
   → Mark ambiguous requirements
7. Identify Component & State Architecture needs
8. Run Review Checklist
   → If any [NEEDS CLARIFICATION]: WARN "Spec has uncertainties"
   → If implementation details found: ERROR "Remove tech details"
9. Return: SUCCESS (spec ready for planning)
```

---

## Quick Guidelines
- Focus on WHAT users see and do, and WHY
- Avoid HOW to implement (no component names, hook implementations, state shapes)
- Written for product stakeholders and frontend developers
- Think in terms of: user interactions, visual states, data needs, error states

### Section Requirements
- **Mandatory sections**: Must be completed for every feature
- **Optional sections**: Include only when relevant
- When a section doesn't apply, remove it entirely

### For AI Generation
When creating this spec from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question]
2. **Don't guess**: If the prompt doesn't specify something, mark it
3. **Think like a user**: Every feature involves seeing, clicking, typing, or receiving feedback
4. **Common underspecified areas**:
   - Loading states and skeleton screens
   - Error states and recovery flows
   - Empty states
   - Responsive behavior (mobile vs desktop)
   - Accessibility requirements
   - Animation and transition expectations
   - Offline behavior
   - Form validation rules

---

## User Scenarios & Testing *(mandatory)*

### Primary Use Cases
[Describe how users interact with this feature — what they see, what they do, what feedback they receive]

### Visual States
[Describe the different states the UI can be in]
- **Loading**: [skeleton, spinner, progressive loading]
- **Empty**: [no data state]
- **Populated**: [normal data state]
- **Error**: [error display and recovery options]
- **Disabled**: [when interactions are unavailable]

### Acceptance Scenarios
1. **Given** [initial UI state], **When** [user action], **Then** [visual/data outcome]
2. **Given** [initial UI state], **When** [user action], **Then** [visual/data outcome]

### Edge Cases
- What happens when [data is loading]?
- How does the UI handle [API failure]?
- What occurs when [user navigates away mid-action]?
- How does it behave on [mobile viewport]?

---

## Requirements *(mandatory)*

### Functional Requirements

**User Interface**:
- **FR-001**: User MUST be able to [interaction]
- **FR-002**: System MUST display [information]
- **FR-003**: System MUST provide feedback when [action]

**Data & State**:
- **FR-004**: System MUST [data requirement]
- **FR-005**: System MUST persist [state requirement]
- **FR-006**: System MUST sync [synchronization need]

**Navigation**:
- **FR-007**: User MUST be able to navigate to [destination]
- **FR-008**: System MUST preserve [state during navigation]

### Accessibility Requirements *(mandatory for UI features)*
- **Keyboard Navigation**: [Tab order, keyboard shortcuts]
- **Screen Reader**: [ARIA labels, announcements]
- **Visual**: [Color contrast, focus indicators]
- **Motion**: [Reduced motion preferences]

### Responsive Design *(include if applicable)*
- **Mobile** (< 768px): [layout behavior]
- **Tablet** (768px - 1024px): [layout behavior]
- **Desktop** (> 1024px): [layout behavior]

### Performance *(include if applicable)*
- **Initial Load**: [target time]
- **Interaction Response**: [target time]
- **Bundle Impact**: [size constraints]

---

## Dependencies & Constraints *(mandatory)*

### Dependencies
- [Existing components, hooks, or services this depends on]

### Constraints
- [Browser support requirements]
- [Performance budgets]
- [Design system constraints]

### Assumptions
- [Assumptions about API availability, data shape, etc.]

---

## Review & Acceptance Checklist

### Content Quality
- [ ] No implementation details (component names, hooks, state shapes, CSS)
- [ ] Focused on user interactions and visual outcomes
- [ ] All mandatory sections completed
- [ ] Accessibility requirements addressed

### Requirement Completeness
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable and unambiguous
- [ ] All visual states documented (loading, empty, error, populated)
- [ ] Error scenarios and recovery flows specified
- [ ] Responsive behavior defined
- [ ] Scope is clearly bounded

---

## Execution Status
- [ ] User description parsed
- [ ] Key concepts extracted
- [ ] Scope determined
- [ ] Ambiguities marked
- [ ] User scenarios defined
- [ ] Visual states documented
- [ ] Requirements generated
- [ ] Review checklist passed
