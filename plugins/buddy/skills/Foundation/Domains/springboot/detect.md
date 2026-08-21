# Detection Rules: springboot

## File Patterns
Files whose presence indicates a Spring Boot project:
- `src/main/java/**/*Application.java` containing `@SpringBootApplication` (confidence: high)
- `src/main/resources/application.yml` or `application.yaml` (confidence: medium)
- `src/main/resources/application.properties` (confidence: medium)
- `mvnw` / `gradlew` wrapper (confidence: low)

## Manifest Checks
Check dependency manifests for Spring Boot entries:
- `pom.xml` contains `spring-boot-starter-parent` (confidence: high)
- `pom.xml` contains `org.springframework.boot` / `spring-boot-starter` (confidence: high)
- `build.gradle` or `build.gradle.kts` contains `org.springframework.boot` (confidence: high)
- `pom.xml` contains `spring-boot-starter-web` / `-webflux` / `-data-jpa` (confidence: medium)

## Directory Structure
Expected directory patterns:
- `src/main/java/` AND `src/main/resources/` (confidence: medium)
- `src/test/java/` (confidence: low)

## Scoring
- HIGH match: 90 points
- MEDIUM match: 30 points
- LOW match: 10 points
- Activation threshold: 60 points
- Note: `spring-boot-starter-parent` / `org.springframework.boot` in the build manifest, or a `@SpringBootApplication` class, alone scores 90 (threshold met).

## Relationship to the `jhipster` domain
JHipster projects also match these Spring Boot markers, but the `jhipster` domain has higher priority (70 vs 60) and its own HIGH-confidence markers (`.yo-rc.json`, `tech.jhipster` in `pom.xml`), so JHipster repos resolve to `jhipster`. Use `springboot` for plain, non-JHipster Spring Boot backends.
