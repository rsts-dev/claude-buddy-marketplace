# Detection Rules: jhipster

## File Patterns
Files whose presence indicates a JHipster project:
- `.yo-rc.json` (confidence: high)
- `*.jdl` in project root (confidence: high)
- `src/main/webapp/app/**/*.component.ts` (confidence: medium)
- `src/main/java/**/config/SecurityConfiguration.java` (confidence: medium)
- `src/main/resources/config/application.yml` with jhipster section (confidence: medium)

## Manifest Checks
Check dependency manifests for JHipster entries:
- `pom.xml` contains `io.github.jhipster` or `tech.jhipster` (confidence: high)
- `pom.xml` contains `spring-boot-starter` AND `package.json` contains `@angular/core` (confidence: high)
- `package.json` contains `@angular/core` (confidence: medium)
- `package.json` contains `ng-jhipster` or `@ng-bootstrap` (confidence: medium)
- `build.gradle` contains `jhipster` (confidence: high)

## Directory Structure
Expected directory patterns:
- `src/main/java/` AND `src/main/webapp/app/` (confidence: high)
- `src/main/resources/config/` (confidence: medium)
- `src/test/java/` AND `src/test/javascript/` (confidence: medium)

## Scoring
- HIGH match: 90 points
- MEDIUM match: 30 points
- LOW match: 10 points
- Activation threshold: 60 points
- Note: `.yo-rc.json` alone scores 90 (threshold met immediately)
