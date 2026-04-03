# Reference Materials — MuleSoft Domain

## Files

| File | Size | Description |
|------|------|-------------|
| [dataweave.md](dataweave.md) | ~55KB | DataWeave language reference: transformations, functions, type coercion, modules |
| [mule-sdk.md](mule-sdk.md) | ~54KB | Mule SDK documentation: building custom modules, Maven archetype, annotations, testing |
| [mule-connector.md](mule-connector.md) | ~43KB | Connector development: operations, connection providers, media types, best practices |
| [mule-guidelines.md](mule-guidelines.md) | ~62KB | Development guidelines: patterns, error handling, performance, security, API-led |
| [anypoint-cli.md](anypoint-cli.md) | ~66KB | Anypoint CLI: deployment, app management, API management, runtime operations |
| [docs-general.md](docs-general.md) | ~54KB | Documentation patterns: RAML, MTF tests, API-led design, deployment guides |

## When Referenced

- **Spec phase**: Not loaded (spec focuses on API consumer needs, not implementation)
- **Plan phase**: Load `mule-guidelines.md` and `dataweave.md` for architecture and transformation planning
- **Implementation phase**: Load files as needed based on task context:
  - DataWeave task → `dataweave.md`
  - Connector development → `mule-connector.md` + `mule-sdk.md`
  - Deployment → `anypoint-cli.md`
  - General patterns → `mule-guidelines.md`
- **Docs phase**: Load `docs-general.md` for documentation structure
