---
description: "Spring Boot TDD-ordered task breakdown template"
---

# Task Breakdown: [FEATURE]

**Plan**: [link to plan.md]
**Created**: [DATE]
**Status**: Draft

## Task Format
- `T{NNN}` — Sequential task ID
- `[P]` — Parallel execution marker (independent files)
- Each task specifies exact file path(s) under `src/main/java` / `src/test/java`
- Tests MUST come before/with the code they cover (TDD)

---

## Phase 3.1 — Setup (data & migrations)

| ID | P | Task | File(s) |
|----|---|------|---------|
| T001 | | [Create JPA entity + repository] | `src/main/java/.../domain/...`, `.../repository/...` |
| T002 | [P] | [DB migration] | `src/main/resources/db/migration/...` |

---

## Phase 3.2 — Tests (TDD)

| ID | P | Task | File(s) |
|----|---|------|---------|
| T003 | [P] | [Service unit test for FR-001] | `src/test/java/.../service/..._Test.java` |
| T004 | [P] | [`@WebMvcTest` for the endpoint] | `src/test/java/.../web/..._Test.java` |

**Checkpoint**: tests written and FAILING (red)

---

## Phase 3.3 — Core (service + web)

| ID | P | Task | File(s) |
|----|---|------|---------|
| T005 | | [Implement `@Service` logic] | `src/main/java/.../service/...` |
| T006 | | [Implement `@RestController` + DTOs] | `src/main/java/.../web/...`, `.../dto/...` |

**Checkpoint**: tests PASSING (green)

---

## Phase 3.4 — Integration

| ID | P | Task | File(s) |
|----|---|------|---------|
| T007 | | [`@SpringBootTest` + Testcontainers] | `src/test/java/.../..._IT.java` |
| T008 | [P] | [Security config / `@ControllerAdvice`] | `src/main/java/.../config/...` |

---

## Phase 3.5 — Polish

| ID | P | Task | File(s) |
|----|---|------|---------|
| T009 | | [Actuator, edge cases, docs] | `src/main/resources/application.yml` |

---

## Dependencies Graph
```
T001 → T003 (entity before service tests)
T003 → T005 (tests before service impl)
T005 → T006 (service before controller)
T006 → T007 (endpoint before integration test)
```

## Validation Checklist
- [ ] Every requirement maps to task(s)
- [ ] Tests precede their implementation
- [ ] Parallel [P] tasks touch independent files
- [ ] Constructor injection; no entity leakage past services
- [ ] `mvn test` / `gradle test` green (incl. integration tests)
