# Domain Analysis: jhipster

Executed by CreateFoundation after JHipster domain detection. Performs deep analysis of the JHipster project configuration, entities, and architecture.

## Analysis Steps

### Step 1: JHipster Configuration
Read and parse JHipster project configuration:
```bash
cat .yo-rc.json 2>/dev/null
```
Extract:
- Application type (monolith, microservice, gateway)
- Authentication type (jwt, oauth2, session)
- Database type (sql, mongodb, cassandra, no)
- Production database (postgresql, mysql, mariadb, oracle, mssql)
- Dev database (h2-disk, h2-memory, postgresql, mysql)
- Build tool (maven, gradle)
- Frontend framework (angular, react, vue, no)
- Server port
- Package name
- JHipster version
- Enable Swagger/OpenAPI
- Reactive mode (true/false)

### Step 2: Entity Discovery
```bash
# JDL files
find . -name "*.jdl" -maxdepth 2 2>/dev/null

# Entity classes
find src/main/java -name "*.java" -path "*/domain/*" 2>/dev/null | head -30

# Entity configuration files
ls .jhipster/*.json 2>/dev/null

# Liquibase changelogs
ls src/main/resources/config/liquibase/changelog/*.xml 2>/dev/null | head -20
```
Catalog: entities, relationships, enumerations, pagination strategies

### Step 3: Frontend Architecture
```bash
# Angular modules
find src/main/webapp/app -name "*.module.ts" 2>/dev/null | head -20

# Angular components
find src/main/webapp/app -name "*.component.ts" 2>/dev/null | wc -l

# State management
find src/main/webapp/app -name "*.reducer.ts" -o -name "*.effects.ts" 2>/dev/null | head -10

# Shared components
ls src/main/webapp/app/shared/ 2>/dev/null
```

### Step 4: Backend Architecture
```bash
# Service layer
find src/main/java -name "*Service.java" -o -name "*ServiceImpl.java" 2>/dev/null | head -20

# REST controllers
find src/main/java -name "*Resource.java" 2>/dev/null | head -20

# Repository layer
find src/main/java -name "*Repository.java" 2>/dev/null | head -20

# Configuration
find src/main/java -name "*Configuration.java" 2>/dev/null | head -10
```

### Step 5: Testing Infrastructure
```bash
# Backend tests
find src/test/java -name "*Test.java" -o -name "*IT.java" 2>/dev/null | wc -l

# Frontend tests
find src/test/javascript -name "*.spec.ts" 2>/dev/null | wc -l
find src/main/webapp -name "*.spec.ts" 2>/dev/null | wc -l
```

## Output

Append these sections to the foundation draft:

### Technology Stack
- **Framework**: JHipster {version}
- **Backend**: Spring Boot {version} ({imperative/reactive})
- **Frontend**: Angular {version}
- **Build Tool**: {Maven/Gradle}
- **Database**: {production db} (dev: {dev db})
- **Authentication**: {JWT/OAuth2/Session}
- **App Type**: {Monolith/Microservice/Gateway}
- **Test Framework**: JUnit 5 + Jasmine/Jest

### Domain Context
- **Architecture**: {monolith / microservices with N services / gateway}
- **Entities**: {count} entities with {relationship summary}
- **Frontend Pattern**: {lazy-loaded modules / NgRx state / service-based}
- **API Pattern**: {REST with Spring MVC / reactive WebFlux}
- **Database Migration**: Liquibase with {count} changelogs

### Domain-Specific Principles
- Entity changes MUST use JDL and regeneration; avoid hand-editing generated entity code
- Database migrations MUST use Liquibase changelogs (never manual DDL)
- REST endpoints MUST follow JHipster conventions (Resource suffix, proper HTTP status codes)
- Frontend components MUST follow Angular module lazy-loading patterns
- Authentication and authorization MUST use Spring Security with {detected auth type}
- Tests MUST cover both backend (JUnit integration tests) and frontend (component specs)
