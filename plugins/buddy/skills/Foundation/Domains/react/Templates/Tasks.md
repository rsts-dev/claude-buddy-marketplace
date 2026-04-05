---
description: "React TDD-ordered task breakdown template"
---

# Task Breakdown: [FEATURE]

**Plan**: [link to plan.md]
**Created**: [DATE]
**Status**: Draft

## Task Format
- `T{NNN}` — Sequential task ID
- `[P]` — Parallel execution marker
- Each task specifies exact file path(s)
- Tests MUST come before component implementation (TDD)

---

## Phase 3.1 — Setup

| ID | P | Task | File(s) |
|----|---|------|---------|
| T001 | | Install dependencies (if any new packages needed) | `package.json` |
| T002 | | Create feature directory structure | `src/features/{feature}/` |

---

## Phase 3.2 — Tests (TDD)

| ID | P | Task | File(s) |
|----|---|------|---------|
| T003 | [P] | Write component render tests | `src/features/{feature}/__tests__/Component.test.tsx` |
| T004 | [P] | Write hook tests | `src/features/{feature}/__tests__/useHook.test.ts` |
| T005 | [P] | Write integration tests | `src/features/{feature}/__tests__/integration.test.tsx` |

**Checkpoint**: All tests written and FAILING (red phase)

---

## Phase 3.3 — Core Implementation

| ID | P | Task | File(s) |
|----|---|------|---------|
| T006 | [P] | Implement custom hooks | `src/features/{feature}/hooks/` |
| T007 | [P] | Implement components | `src/features/{feature}/components/` |
| T008 | | Implement state management | `src/features/{feature}/state/` |
| T009 | | Add styling | `src/features/{feature}/styles/` or component files |

**Checkpoint**: All tests PASSING (green phase)

---

## Phase 3.4 — Integration

| ID | P | Task | File(s) |
|----|---|------|---------|
| T010 | | Add route configuration | `src/routes/` or `src/App.tsx` |
| T011 | | Connect to API layer | `src/features/{feature}/api/` |
| T012 | | Add error boundaries | `src/features/{feature}/ErrorBoundary.tsx` |

---

## Phase 3.5 — Polish

| ID | P | Task | File(s) |
|----|---|------|---------|
| T013 | [P] | Add loading/skeleton states | Component files |
| T014 | [P] | Add responsive styles | Style files |
| T015 | | Accessibility audit and fixes | Component files |
| T016 | | Performance optimization (memo, lazy) | Component files |

---

## Dependencies Graph
```
T001 → T002 → T003,T004,T005 (setup → tests)
T003,T004,T005 → T006,T007 (tests → implementation)
T006,T007 → T008 → T009 (hooks → state → styling)
T009 → T010 → T011 → T012 (core → integration)
T012 → T013,T014 → T015 → T016 (integration → polish)
```

## Validation Checklist
- [ ] All spec requirements have corresponding tasks
- [ ] Component tests come before component implementation
- [ ] Hook tests come before hook implementation
- [ ] Parallel tasks [P] touch different files
- [ ] Accessibility tasks included
- [ ] Error boundary task included
- [ ] Loading/error states included
