---
description: "Spring Boot implementation plan template"
---

# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]`
**Spec**: [link]
**Created**: [DATE]
**Status**: Draft
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

---

## Technical Context *(mandatory)*

### Project Stack
- **Spring Boot**: [version]
- **Java**: [version]
- **Web**: [Spring MVC / WebFlux]
- **Data**: [Spring Data JPA / R2DBC] ([database])
- **Build**: [Maven / Gradle]
- **Test**: JUnit 5 [+ Testcontainers]

### Existing Patterns
[Layering, base classes, error-handling advice, DTO/mapper conventions to follow]

### Dependencies
[New starters/libraries required, with justification]

---

## Foundation Check *(mandatory)*

| Principle | Status | Notes |
|-----------|--------|-------|
| Constructor injection | Compliant / Needs Justification | [details] |
| Controller→Service→Repository layering | Compliant / Needs Justification | [details] |
| DTOs at the boundary (no entity leakage) | Compliant / Needs Justification | [details] |
| Bean Validation + central error handling | Compliant / Needs Justification | [details] |
| Transactions at service layer | Compliant / Needs Justification | [details] |

---

## Implementation Phases *(mandatory)*

### Phase 0: Research *(if needed)*
- [Unknowns: library choice, migration strategy, reactive vs blocking]

### Phase 1: Data & Contracts
- [JPA entities + repositories; DB migration (Flyway/Liquibase)]
- [DTOs + request/response contracts]

### Phase 2: Service Layer
- [Business logic in `@Service`; transaction boundaries]
- [TDD: service unit tests first]

### Phase 3: Web Layer
- [`@RestController` endpoints; validation; `@ControllerAdvice` error mapping]
- [`@WebMvcTest` slice tests]

### Phase 4: Integration & Polish
- [Security config; Actuator; `@SpringBootTest` + Testcontainers; edge cases; docs]

---

## Testing Strategy *(mandatory)*
- **Unit**: services, mappers (Mockito)
- **Slice**: `@WebMvcTest` (controllers), `@DataJpaTest` (repositories)
- **Integration**: `@SpringBootTest` with Testcontainers for real DB
- **Contract**: request/response + status codes per endpoint

---

## Complexity Tracking
- New code: ~[estimate] (controllers, services, entities, DTOs)
- Test code: ~[estimate]
- Migrations: [count]

---

## Execution Status
- [ ] Spec loaded and understood
- [ ] Data model + contracts designed
- [ ] Foundation check passed
- [ ] Web/service layering planned
- [ ] Testing strategy planned
