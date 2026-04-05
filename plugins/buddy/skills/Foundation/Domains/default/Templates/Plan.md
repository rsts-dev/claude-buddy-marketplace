---
description: "Generic implementation plan template for any technology stack"
---

# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]`
**Spec**: [link]
**Created**: [DATE]
**Status**: Draft
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

## Execution Flow (/buddy:plan command scope)
```
1. Load feature spec from Input path
   → If not found: ERROR "No feature spec at {path}"
2. Fill Technical Context
   → Detect project stack, frameworks, tools
   → Identify existing patterns to follow
3. Fill the Foundation Check section based on foundation document
4. Evaluate Foundation Check
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
5. Define implementation phases with deliverables
6. Identify research needs and technical unknowns
7. Plan testing strategy
8. Re-evaluate Foundation Check
   → If still violations: ERROR with justifications
9. Return: SUCCESS (plan ready for task breakdown)
```

---

## Technical Context *(mandatory)*

### Project Stack
- **Language**: [detected]
- **Framework**: [detected]
- **Build Tool**: [detected]
- **Test Framework**: [detected]

### Existing Patterns
[Document existing patterns in the codebase that this implementation should follow]

### Dependencies
[New dependencies required, with justification]

---

## Foundation Check *(mandatory)*

[For each foundation principle, document compliance]

| Principle | Status | Notes |
|-----------|--------|-------|
| [Principle 1] | Compliant / Needs Justification | [details] |

---

## Implementation Phases *(mandatory)*

### Phase 0: Research *(if needed)*
**Deliverable**: `research.md`
- [Technical unknowns to investigate]
- [Proof-of-concept requirements]

### Phase 1: Design
**Deliverables**: Design documents
- [Data model design]
- [API contract design]
- [Component/module design]

### Phase 2: Implementation
**Deliverables**: Source code + tests
- [Implementation order based on dependencies]
- [TDD approach: tests first, then implementation]

### Phase 3: Integration & Polish
**Deliverables**: Working feature
- [Integration testing]
- [Edge case handling]
- [Documentation updates]

---

## Testing Strategy *(mandatory)*

### Test Levels
- **Unit Tests**: [what to test at unit level]
- **Integration Tests**: [what to test at integration level]
- **End-to-End Tests**: [what to test end-to-end, if applicable]

### Test Data
- [Test data requirements and setup]

---

## Risk Assessment *(include if applicable)*

| Risk | Impact | Mitigation |
|------|--------|------------|
| [risk] | High/Medium/Low | [mitigation strategy] |

---

## Complexity Tracking

### Lines of Code Estimate
- New code: ~[estimate]
- Modified code: ~[estimate]
- Test code: ~[estimate]

### Foundation Deviations
[Document any deviations from foundation principles with justification]

---

## Execution Status
- [ ] Spec loaded and understood
- [ ] Technical context documented
- [ ] Foundation check passed
- [ ] Phases defined
- [ ] Testing strategy planned
- [ ] Risks assessed
