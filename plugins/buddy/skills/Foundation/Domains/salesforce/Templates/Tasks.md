---
description: "Salesforce (SFDX) TDD-ordered task breakdown template"
---

# Task Breakdown: [FEATURE]

**Plan**: [link to plan.md]
**Created**: [DATE]
**Status**: Draft

## Task Format
- `T{NNN}` — Sequential task ID
- `[P]` — Parallel execution marker (independent metadata)
- Each task specifies exact file path(s) under `force-app/main/default/`
- Apex tests MUST come before/with the Apex they cover (TDD)

---

## Phase 3.1 — Setup (data model & security)

| ID | P | Task | File(s) |
|----|---|------|---------|
| T001 | | [Create custom object/fields] | `force-app/main/default/objects/...` |
| T002 | [P] | [Permission set / FLS] | `force-app/main/default/permissionsets/...` |

---

## Phase 3.2 — Tests (TDD)

| ID | P | Task | File(s) |
|----|---|------|---------|
| T003 | [P] | [Apex test for FR-001] | `force-app/main/default/classes/..._Test.cls` |

**Checkpoint**: Apex tests written and FAILING (red)

---

## Phase 3.3 — Core (automation & logic)

| ID | P | Task | File(s) |
|----|---|------|---------|
| T004 | | [Flow for declarative rule] | `force-app/main/default/flows/...` |
| T005 | [P] | [Apex trigger handler / service] | `force-app/main/default/classes/...` |

**Checkpoint**: Apex tests PASSING (green), coverage ≥75%

---

## Phase 3.4 — UI

| ID | P | Task | File(s) |
|----|---|------|---------|
| T006 | [P] | [LWC component + Jest test] | `force-app/main/default/lwc/...` |

---

## Phase 3.5 — Integration & Polish

| ID | P | Task | File(s) |
|----|---|------|---------|
| T007 | | [Callout / Platform Event; deploy check] | `force-app/main/default/...` |

---

## Dependencies Graph
```
T001 → T003 (object before its Apex tests)
T003 → T005 (tests before Apex implementation)
T005 → T006 (logic before UI wiring)
```

## Validation Checklist
- [ ] Every requirement maps to task(s)
- [ ] Apex tests precede Apex implementation
- [ ] Parallel [P] tasks touch independent metadata
- [ ] Bulk-safe (no SOQL/DML in loops)
- [ ] Apex coverage ≥75%
- [ ] `sf project deploy` succeeds against a scratch org
