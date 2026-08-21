---
type_key: salesforce
priority: 70
description: Salesforce platform development with Apex, Lightning Web Components, Flows, and Agentforce on Salesforce DX
---
# Domain: Salesforce

Salesforce platform development using Salesforce DX (SFDX): Apex, Lightning Web Components (LWC), Aura, Flows/automation, SOQL/SOSL, metadata-driven configuration, scratch orgs, and Agentforce agents. Targets sfdx-format source projects deployed to scratch, sandbox, or production orgs.

## Dependencies
- **Runtime**: Salesforce platform (Apex runtime), Node 18+ for LWC/Jest tooling
- **CLI Tools**: Salesforce CLI (`sf`), optional `@salesforce/cli` plugins
- **Build**: `sf project deploy` / `sf project retrieve`; scratch-org lifecycle via `sf org`

## Keywords
Salesforce, sfdx, Salesforce DX, Apex, trigger, LWC, Lightning Web Component, Aura, SOQL, SOSL, Flow, Agentforce, scratch org, sandbox, metadata, package.xml, permission set, custom object, sf CLI, force-app

## Reference Materials
| File | Description | Load When |
|------|-------------|-----------|
| Reference/README.md | Index + the official `sf-skills` collection installed via `/setup:salesforce` | Plan, Implementation |

## Best Practices Summary
- Bulkify Apex: no SOQL/DML inside loops; handle collections, respect governor limits
- Prefer Lightning Web Components over Aura for new UI; keep components small and reactive
- Model data with custom objects/fields + declarative automation (Flow) before code
- Keep Apex test coverage ≥75% with meaningful assertions (not coverage padding)
- Use scratch orgs + source-tracked SFDX; treat metadata as the source of truth in git
- Guard with permission sets / sharing rules; never hardcode IDs or secrets

## Official Skills

The official Salesforce agent skills ([`forcedotcom/sf-skills`](https://github.com/forcedotcom/sf-skills) — Agentforce, DX Code Analyzer, org management, Flow automation) are installed via **`/setup:salesforce`** (from the `setup` plugin). This domain provides the foundation/templates; the official skills provide deep platform tooling.
