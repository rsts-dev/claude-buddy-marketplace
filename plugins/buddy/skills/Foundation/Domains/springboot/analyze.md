# Domain Analysis: springboot

Executed by CreateFoundation after Spring Boot domain detection. Performs deep analysis of the Spring Boot application structure, configuration, and layering.

## Analysis Steps

### Step 1: Build & Dependencies
```bash
cat pom.xml 2>/dev/null | head -120
cat build.gradle 2>/dev/null || cat build.gradle.kts 2>/dev/null
```
Extract:
- Spring Boot version (parent / plugin version)
- Build tool (Maven / Gradle) and Java version (`java.version` / `sourceCompatibility`)
- Starters in use (web, webflux, data-jpa, security, actuator, validation)
- Database driver / migration tool (Flyway, Liquibase)

### Step 2: Application Configuration
```bash
cat src/main/resources/application.yml 2>/dev/null || cat src/main/resources/application.properties 2>/dev/null
ls src/main/resources/application-*.yml src/main/resources/application-*.properties 2>/dev/null
```
Determine: server port, active profiles, datasource, and notable config (security, actuator endpoints).

### Step 3: Architecture
```bash
# Web layer (MVC vs reactive)
grep -rl "@RestController\|@Controller" src/main/java 2>/dev/null | wc -l
grep -rl "org.springframework.web.reactive\|Mono<\|Flux<" src/main/java 2>/dev/null | head -1
# Service + data layers
find src/main/java -name "*Service.java" 2>/dev/null | wc -l
find src/main/java -name "*Repository.java" 2>/dev/null | wc -l
grep -rl "@Entity" src/main/java 2>/dev/null | wc -l
# Config / security
find src/main/java -name "*Config*.java" -o -name "*SecurityConfig*.java" 2>/dev/null | head -10
```
Catalog: controllers/endpoints, services, repositories, JPA entities; MVC vs WebFlux; security setup.

### Step 4: Testing Infrastructure
```bash
find src/test/java -name "*Test.java" -o -name "*Tests.java" -o -name "*IT.java" 2>/dev/null | wc -l
grep -rl "@SpringBootTest\|@WebMvcTest\|@DataJpaTest\|Testcontainers" src/test/java 2>/dev/null | head -10
```
Determine test styles: unit, slice tests, integration tests, Testcontainers usage.

## Output

Append these sections to the foundation draft:

### Technology Stack
- **Framework**: Spring Boot {version}
- **Language**: Java {version} (or Kotlin)
- **Web**: {Spring MVC / WebFlux (reactive)}
- **Data**: {Spring Data JPA / R2DBC / JDBC} ({database})
- **Build Tool**: {Maven / Gradle}
- **Test Framework**: JUnit 5 {+ Testcontainers}
- **Migration**: {Flyway / Liquibase / none}

### Domain Context
- **Architecture**: {monolith / microservice} — Controller/Service/Repository layering
- **API Style**: {REST (MVC) / reactive (WebFlux)}
- **Endpoints**: {count} controllers; **Entities**: {count}; **Repositories**: {count}
- **Security**: {Spring Security config / none}
- **Config**: profiles = {list}; Actuator = {enabled/disabled}

### Domain-Specific Principles
- Dependencies MUST be injected via constructors (no field injection)
- Layering MUST be respected: Controller → Service → Repository; controllers stay thin
- DTOs MUST be used at the API boundary; JPA entities MUST NOT leak past the service layer
- Input MUST be validated with Bean Validation; errors handled centrally (`@ControllerAdvice`)
- Transactions MUST be scoped at the service layer (`@Transactional`)
- Configuration MUST be externalized via profiles; secrets MUST NOT be hardcoded
- Tests MUST include slice tests and at least one `@SpringBootTest` integration test (Testcontainers for real dependencies)
