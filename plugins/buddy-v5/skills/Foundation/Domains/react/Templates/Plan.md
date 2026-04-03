---
description: "React implementation plan template for frontend applications"
---

# React Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]`
**Spec**: [link]
**Created**: [DATE]
**Status**: Draft
**App Type**: [SPA/Next.js SSR/Next.js SSG] | **State**: [Context/Redux/Zustand/Other]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

## Execution Flow (/buddy:plan command scope)
```
1. Load feature spec from Input path
   → If not found: ERROR "No feature spec at {path}"
2. Fill Technical Context
   → Detect React version, build tool, state management
   → Identify existing component patterns and hooks
3. Fill the Foundation Check section based on foundation document
4. Evaluate Foundation Check
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
5. Define component architecture and state design
6. Plan implementation phases with TDD approach
7. Identify performance and accessibility considerations
8. Re-evaluate Foundation Check
   → If still violations: ERROR with justifications
9. Return: SUCCESS (plan ready for task breakdown)
```

---

## Technical Context *(mandatory)*

### React Stack
- **React Version**: [detected]
- **Build Tool**: [vite/CRA/Next.js/webpack]
- **Language**: [JavaScript/TypeScript]
- **State Management**: [Context/Redux/Zustand/Jotai]
- **Routing**: [react-router/next-router/tanstack]
- **Styling**: [CSS Modules/Tailwind/styled-components/Emotion]
- **Testing**: [Jest/Vitest + React Testing Library]

### Existing Patterns
[Document existing component patterns, hook patterns, state patterns in the codebase]

### New Dependencies
[Any new packages needed, with bundle size impact assessment]

---

## Foundation Check *(mandatory)*

| Principle | Status | Notes |
|-----------|--------|-------|
| [Principle 1] | Compliant / Needs Justification | [details] |

---

## Component & State Architecture *(mandatory)*

### Component Tree
[High-level component hierarchy for this feature]

### State Design
- **Local State**: [component-level state needs]
- **Shared State**: [state shared between components]
- **Server State**: [data fetched from APIs]
- **URL State**: [state reflected in URL/routing]

### Data Flow
[How data moves through the component tree]

---

## Implementation Phases *(mandatory)*

### Phase 0: Research *(if needed)*
**Deliverable**: `research.md`
- [Technical unknowns, library evaluation]

### Phase 1: Design
**Deliverables**: Component design, API contracts
- Component hierarchy and props design
- State management design
- API integration design
- Accessibility plan

### Phase 2: Implementation (TDD)
**Deliverables**: Components + tests
- Tests first (React Testing Library)
- Components and hooks
- State management integration
- Styling and responsive layout

### Phase 3: Integration & Polish
**Deliverables**: Working feature
- Route integration
- Error boundary setup
- Loading and error states
- Performance optimization (memoization, code splitting)
- Accessibility audit

---

## Testing Strategy *(mandatory)*

### Component Tests
- [What to test with React Testing Library]
- [User interaction testing]
- [Accessibility testing with jest-axe]

### Integration Tests
- [Component integration scenarios]
- [State management integration]

### Visual Tests *(if applicable)*
- [Snapshot tests or visual regression]

---

## Performance Considerations *(include if applicable)*

- **Bundle Impact**: [estimated size addition]
- **Render Performance**: [memoization needs]
- **Code Splitting**: [lazy loading opportunities]
- **Image Optimization**: [if applicable]

---

## Execution Status
- [ ] Spec loaded and understood
- [ ] Technical context documented
- [ ] Foundation check passed
- [ ] Component architecture designed
- [ ] Phases defined
- [ ] Testing strategy planned
