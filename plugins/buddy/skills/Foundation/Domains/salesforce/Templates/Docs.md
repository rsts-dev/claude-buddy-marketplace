---
description: "Salesforce (SFDX) documentation template"
---

# Documentation Template: [PROJECT NAME]

## Required Documentation Files

### architecture.md
- Org/solution overview and purpose
- Data model diagram (objects + relationships, mermaid)
- Automation map (Flows, triggers, async)
- Security model (profiles, permission sets, sharing)
- Key design decisions

### data-model.md
- Custom objects and fields (name, type, purpose)
- Relationships (lookup / master-detail)
- Validation rules

### setup.md
- Prerequisites (Salesforce CLI `sf`, Node for LWC)
- Create/authorize a scratch org
- `sf project deploy` steps
- Seed/sample data
- Running Apex tests + LWC Jest

### deployment.md *(if applicable)*
- Package/deploy strategy (unlocked package vs org-based)
- Sandbox → production path
- Post-deploy steps (permission set assignment, remote site/named credentials)

### troubleshooting.md
- Common deploy errors and fixes
- Governor-limit debugging
- FAQ

## Documentation Guidelines
- Include a mermaid ER diagram for the data model
- Reference actual metadata paths under `force-app/main/default/`
- Use real Apex/LWC examples from the repo
- Keep docs in sync with metadata
