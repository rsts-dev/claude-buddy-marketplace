# Reference Materials — Salesforce Domain

This domain ships lightweight guidance and defers deep platform tooling to the **official Salesforce agent skills**.

## Official Salesforce skills (install via `/setup:salesforce`)

The [`forcedotcom/sf-skills`](https://github.com/forcedotcom/sf-skills) collection (marketplace `salesforce`, plugin `salesforce-development`, ~41 skills) provides the authoritative platform tooling. Install it with the `setup` plugin:

```
/setup:salesforce
```

Key skills to reach for during implementation:

| Skill | Use when |
|-------|----------|
| `agentforce-generate` / `-observe` / `-test` | Building, monitoring, or security-testing Agentforce agents |
| `dx-code-analyzer-run` / `-configure` / `-custom-rule-create` | Static analysis of Apex/LWC; custom rules |
| `dx-org-manage` | Scratch-org / org lifecycle |
| `automation-flow-generate` | Generating Flow automation |

> Upstream warns these skills may be renamed/restructured/removed between releases.

## When referenced

- **Spec / Plan**: this README + `profile.md` best practices are sufficient.
- **Implementation**: prefer the official skills above (installed via `/setup:salesforce`) for Apex/LWC/Flow/Agentforce work.
- **Docs**: use the `Docs.md` template's data-model + deployment sections.

Add local reference `.md` files here and register them in `../profile.md` if you want on-demand domain-specific material.
