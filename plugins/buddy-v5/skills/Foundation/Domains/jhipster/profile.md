---
type_key: jhipster
priority: 70
description: JHipster full-stack application development with Angular frontend and Spring Boot backend
---
# Domain: JHipster

Full-stack application development using JHipster, combining Angular frontend, Spring Boot backend, JPA/Hibernate data access, and enterprise patterns. Supports monolith, microservices, and gateway architectures.

## Dependencies
- **Runtime**: JDK 17+ (or 21+), Node 18+
- **CLI Tools**: JHipster CLI, Angular CLI, Maven/Gradle wrapper
- **Build**: Maven 3.8+ or Gradle 8+, npm/yarn

## Keywords
JHipster, jhipster, Angular, Spring Boot, entity, gateway, JDL, JPA, Hibernate, Liquibase, microservices, monolith, Spring Security, Angular Material, NgRx, yo-rc

## Reference Materials
| File | Description | Load When |
|------|-------------|-----------|
| Reference/jhipster.md | Core JHipster patterns, entity management, JDL, microservices | Plan, Implementation |
| Reference/angular-js.md | Angular framework integration and component patterns | Plan, Implementation |
| Reference/angular-material.md | Angular Material UI components and theming | Implementation |

## Best Practices Summary
- Use JDL for entity modeling; version control .yo-rc.json and JDL files
- Follow JHipster conventions: customize templates only when necessary
- Test thoroughly using generated test scaffolding (JUnit + Angular tests)
- Use Spring profiles for environment configuration
- Implement pagination and lazy loading for all list views
