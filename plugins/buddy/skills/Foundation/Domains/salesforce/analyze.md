# Domain Analysis: salesforce

Executed by CreateFoundation after Salesforce domain detection. Performs deep analysis of the SFDX project structure, metadata, and automation.

## Analysis Steps

### Step 1: Project Configuration
```bash
cat sfdx-project.json 2>/dev/null
cat config/project-scratch-def.json 2>/dev/null
```
Extract:
- Package directories and default package
- `sourceApiVersion`
- Namespace (if any)
- Scratch org features/edition

### Step 2: Metadata Inventory
```bash
find force-app/main/default -maxdepth 1 -type d 2>/dev/null
# Apex
find force-app -name "*.cls" 2>/dev/null | wc -l
find force-app -name "*.trigger" 2>/dev/null | wc -l
# UI
find force-app -path "*/lwc/*" -name "*.js" 2>/dev/null | wc -l
find force-app -path "*/aura/*" 2>/dev/null | head -1
# Data model + automation
find force-app -name "*.object-meta.xml" 2>/dev/null | wc -l
find force-app -name "*.flow-meta.xml" 2>/dev/null | wc -l
```
Catalog: Apex classes/triggers, LWC vs Aura components, custom objects, Flows, permission sets.

### Step 3: Test Infrastructure
```bash
# Apex tests (by @isTest / Test suffix)
grep -rl "@isTest" force-app 2>/dev/null | wc -l
# LWC Jest
cat package.json 2>/dev/null | grep -E "sfdx-lwc-jest|test:unit"
```
Determine Apex test approach and whether LWC Jest tests exist.

### Step 4: Org & Deployment
```bash
sf org list 2>/dev/null | head -20 || echo "sf CLI not available / not authenticated"
```
Note the default target org / deployment model (scratch, sandbox, production).

## Output

Append these sections to the foundation draft:

### Technology Stack
- **Platform**: Salesforce (API {sourceApiVersion})
- **Language**: Apex, JavaScript (LWC)
- **UI Framework**: {LWC / Aura / both}
- **Build/Deploy**: Salesforce CLI (`sf project deploy/retrieve`)
- **Test Framework**: Apex tests {+ LWC Jest if present}
- **Org Model**: {scratch / sandbox / production}

### Domain Context
- **Metadata**: {N} Apex classes, {N} triggers, {N} LWC, {N} custom objects, {N} Flows
- **Automation**: {Flow-first / Apex-heavy}
- **Namespace**: {none / managed}
- **Packaging**: {unlocked package / org-based}

### Domain-Specific Principles
- Apex MUST be bulkified — no SOQL/DML in loops; respect governor limits
- New UI SHOULD use Lightning Web Components; Aura only for legacy
- Declarative automation (Flow) SHOULD be preferred over code where feasible
- Apex test coverage MUST be ≥75% with real assertions
- Metadata MUST be source-tracked (SFDX) and treated as the source of truth
- Security MUST use permission sets / sharing; no hardcoded IDs or secrets
