# Detection Rules: mulesoft

## File Patterns
Files whose presence indicates a MuleSoft project:
- `src/main/mule/*.xml` (confidence: high)
- `**/*.dwl` (confidence: high)
- `src/main/resources/api/*.raml` (confidence: high)
- `src/test/munit/*.xml` (confidence: high)
- `mule-artifact.json` (confidence: high)
- `src/main/resources/application-types.xml` (confidence: medium)

## Manifest Checks
Check dependency manifests for MuleSoft entries:
- `pom.xml` contains `mule-maven-plugin` (confidence: high)
- `pom.xml` contains `org.mule.runtime` (confidence: high)
- `pom.xml` contains `org.mule.connectors` (confidence: high)
- `pom.xml` contains `munit-maven-plugin` (confidence: medium)
- `pom.xml` contains `org.mule.extensions` (confidence: medium)

## Directory Structure
Expected directory patterns:
- `src/main/mule/` (confidence: high)
- `src/main/resources/api/` (confidence: medium)
- `src/test/munit/` (confidence: medium)
- `src/main/resources/dwl/` (confidence: medium)

## Scoring
- HIGH match: 90 points
- MEDIUM match: 30 points
- LOW match: 10 points
- Activation threshold: 60 points
- Note: `mule-artifact.json` or `src/main/mule/*.xml` alone scores 90 (threshold met)
