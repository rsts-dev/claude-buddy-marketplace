---
description: "Spring Boot documentation template"
---

# Documentation Template: [PROJECT NAME]

## Required Documentation Files

### architecture.md
- Service overview and purpose
- Component diagram (Controller/Service/Repository, mermaid)
- Data model (entities + relationships)
- Technology stack (Spring Boot version, MVC/WebFlux, data access)
- Key design decisions

### api-reference.md
- Endpoints (method, path, purpose)
- Request/response DTOs and validation
- Status codes and error shape
- Authentication requirements
- `curl` / example requests

### setup.md
- Prerequisites (JDK, Maven/Gradle, Docker for Testcontainers)
- Configuration (`application.yml`, profiles, env vars)
- Run locally: `./mvnw spring-boot:run` / `./gradlew bootRun`
- Run tests: `./mvnw test` / `./gradlew test`

### deployment.md *(if applicable)*
- Build artifact (`bootJar` / repackaged jar) and container image
- Environment/profile configuration
- Health checks (Actuator) and monitoring
- Rollback procedures

### troubleshooting.md
- Common startup/config errors
- Datasource / migration issues
- FAQ

## Documentation Guidelines
- Include a mermaid diagram for the layered architecture and data model
- Reference actual package/class paths under `src/main/java`
- Use real endpoint + config examples from the repo
- Keep docs in sync with the API contract
