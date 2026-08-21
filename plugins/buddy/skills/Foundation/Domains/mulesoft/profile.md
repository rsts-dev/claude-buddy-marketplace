---
type_key: mulesoft
priority: 70
description: MuleSoft integration and API development with Mule 4, DataWeave, and Anypoint Platform
---
# Domain: MuleSoft

Integration and API development using MuleSoft's Anypoint Platform. Covers Mule 4 application development, DataWeave transformations, connector development, API-led connectivity, and deployment to CloudHub or on-premises runtime.

## Dependencies
- **Runtime**: Mule 4.x, Java 8+ (11+ recommended)
- **CLI Tools**: Anypoint CLI, Maven
- **Build**: Maven 3.6+

## Keywords
MuleSoft, Mule, DataWeave, Anypoint, connector, RAML, OAS, OpenAPI, API-led, CloudHub, flow, transformation, dwl, integration, System API, Process API, Experience API, MUnit, API spec, JTBD, spec-first

## Reference Materials
| File | Description | Load When |
|------|-------------|-----------|
| Reference/dataweave.md | DataWeave language reference, transformations, and functions | Plan, Implementation |
| Reference/mule-sdk.md | Mule SDK for building custom modules | Implementation |
| Reference/mule-connector.md | Connector development best practices | Implementation |
| Reference/mule-guidelines.md | MuleSoft development guidelines and patterns | Plan, Implementation |
| Reference/anypoint-cli.md | Anypoint CLI command reference | Implementation |
| Reference/docs-general.md | RAML, MTF tests, API-led design documentation | Docs |

## Best Practices Summary
- Design API-spec-first (OAS/RAML) before implementation; validate specs for agent-friendliness
- Follow API-led connectivity: System, Process, and Experience API layers
- Use DataWeave for all data transformations; leverage built-in functions and type coercion
- Implement proper error handling with on-error-continue and on-error-propagate
- Use streaming for large payloads; configure connection pooling appropriately
- Test with MUnit; use secure property placeholders for credentials

## Official Skills

The official MuleSoft API-design skills ([`mulesoft/mulesoft-dx`](https://github.com/mulesoft/mulesoft-dx/tree/master/skills) — `api-spec-validator`, `api-doc-generator`, `api-schema-inferrer`, `jtbd-generator`, `jtbd-validator`, and review helpers) support a spec-first, Jobs-To-Be-Done API workflow. Install them via **`/setup:mulesoft`** (from the `setup` plugin). This domain provides the foundation/templates; the official skills provide deep API-spec tooling (Anypoint CLI under the hood).
