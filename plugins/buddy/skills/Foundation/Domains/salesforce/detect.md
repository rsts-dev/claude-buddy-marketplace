# Detection Rules: salesforce

## File Patterns
Files whose presence indicates a Salesforce DX project:
- `sfdx-project.json` (confidence: high)
- `**/*.cls` (Apex classes) (confidence: high)
- `**/*.trigger` (Apex triggers) (confidence: high)
- `force-app/main/default/lwc/**` (Lightning Web Components) (confidence: high)
- `manifest/package.xml` (confidence: medium)
- `config/project-scratch-def.json` (confidence: medium)
- `**/*.cls-meta.xml` or `**/*.object-meta.xml` (confidence: medium)

## Manifest Checks
Check dependency manifests for Salesforce entries:
- `package.json` contains `@salesforce/sfdx-lwc-jest` or `@salesforce/eslint-config-lwc` (confidence: high)
- `package.json` contains `lwc` (confidence: medium)
- `sfdx-project.json` contains `packageDirectories` (confidence: high)

## Directory Structure
Expected directory patterns:
- `force-app/main/default/` (confidence: high)
- `force-app/main/default/classes/` (confidence: medium)
- `force-app/main/default/lwc/` or `force-app/main/default/aura/` (confidence: medium)

## Scoring
- HIGH match: 90 points
- MEDIUM match: 30 points
- LOW match: 10 points
- Activation threshold: 60 points
- Note: `sfdx-project.json` or `force-app/main/default/` alone scores 90 (threshold met immediately)
