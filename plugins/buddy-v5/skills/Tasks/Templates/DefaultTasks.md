---
description: "Generic TDD-ordered task breakdown template"
---

# Task Breakdown: [FEATURE]

**Plan**: [link to plan.md]
**Created**: [DATE]
**Status**: Draft

## Task Format
- `T{NNN}` — Sequential task ID
- `[P]` — Parallel execution marker (task can run alongside other [P] tasks)
- Each task specifies exact file path(s)
- Tests MUST come before implementation (TDD)

---

## Phase 3.1 — Setup

| ID | P | Task | File(s) |
|----|---|------|---------|
| T001 | | [Setup task description] | [file path] |

---

## Phase 3.2 — Tests (TDD)

| ID | P | Task | File(s) |
|----|---|------|---------|
| T002 | [P] | [Write test for requirement FR-001] | [test file path] |

**Checkpoint**: All tests written and FAILING (red phase)

---

## Phase 3.3 — Core Implementation

| ID | P | Task | File(s) |
|----|---|------|---------|
| T003 | [P] | [Implement to pass test T002] | [source file path] |

**Checkpoint**: All tests PASSING (green phase)

---

## Phase 3.4 — Integration

| ID | P | Task | File(s) |
|----|---|------|---------|
| T004 | | [Integration task] | [file path] |

---

## Phase 3.5 — Polish

| ID | P | Task | File(s) |
|----|---|------|---------|
| T005 | | [Edge case, performance, docs] | [file path] |

---

## Dependencies Graph
```
T001 → T002 (setup before tests)
T002 → T003 (tests before implementation)
T003 → T004 (core before integration)
```

## Validation Checklist
- [ ] All requirements from spec have corresponding tasks
- [ ] Tests come before their implementation tasks
- [ ] Parallel tasks [P] are truly independent
- [ ] Each task has exact file path(s)
- [ ] Task IDs are sequential
- [ ] Dependencies are documented
