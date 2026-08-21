---
type_key: springboot
priority: 60
description: Plain Spring Boot backend development with Spring MVC/WebFlux, Spring Data, and Spring Security
---
# Domain: Spring Boot

Backend development with Spring Boot: REST APIs, microservices, and services using Spring MVC or reactive WebFlux, Spring Data (JPA/R2DBC), Spring Security, and Actuator. For plain Spring Boot projects — not JHipster-scaffolded apps (use the `jhipster` domain for those).

## Dependencies
- **Runtime**: JDK 17+ (21 recommended)
- **CLI Tools**: Maven (`mvnw`) or Gradle (`gradlew`)
- **Build**: Maven 3.8+ or Gradle 8+

## Keywords
Spring Boot, Spring, Spring MVC, WebFlux, reactive, Spring Data JPA, R2DBC, Spring Security, Actuator, REST, RestController, microservice, Maven, Gradle, Hibernate, JPA, entity, repository, service, DTO, Bean Validation, JUnit 5, Testcontainers, application.yml, @SpringBootApplication

## Reference Materials
| File | Description | Load When |
|------|-------------|-----------|
| Reference/README.md | Index + the Dr JSkill generator installed via `/setup:springboot` | Plan, Implementation |

## Best Practices Summary
- Use constructor injection (no field injection); keep beans stateless
- Layer the app: Controller → Service → Repository; keep controllers thin
- Expose DTOs at the API boundary; don't leak JPA entities out of the service layer
- Validate input with Bean Validation (`@Valid`, constraints); handle errors via `@ControllerAdvice`
- Externalize config with profiles (`application-{profile}.yml`); never hardcode secrets
- Scope transactions at the service layer (`@Transactional`); avoid open-session-in-view surprises
- Test with JUnit 5 + slice tests (`@WebMvcTest`, `@DataJpaTest`) and integration tests (`@SpringBootTest` + Testcontainers)
- Expose health/metrics via Actuator

## Official Skills

The **Dr JSkill** Spring Boot project generator ([`jdubois/dr-jskill`](https://github.com/jdubois/dr-jskill) — Julien Dubois' Spring Boot 4.x generator: web apps, PostgreSQL, Docker, optional Vue/React/Angular frontends) installs via **`/setup:springboot`** (from the `setup` plugin). This domain provides the foundation/templates; Dr JSkill provides scaffolding.
