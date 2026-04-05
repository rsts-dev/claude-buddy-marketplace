# Domain Analysis: mulesoft

Executed by CreateFoundation after MuleSoft domain detection. Performs deep analysis of the Mule application structure, connectors, and API design.

## Analysis Steps

### Step 1: Project Configuration
Read and parse Mule project configuration:
```bash
cat mule-artifact.json 2>/dev/null
cat pom.xml 2>/dev/null | head -100
```
Extract:
- Mule runtime version
- Maven coordinates (groupId, artifactId, version)
- Connector dependencies
- Plugin configuration
- CloudHub deployment settings

### Step 2: API Specification
```bash
# RAML/OAS specs
find src/main/resources/api -name "*.raml" -o -name "*.yaml" -o -name "*.json" 2>/dev/null

# Read main API spec
cat src/main/resources/api/*.raml 2>/dev/null | head -50
```
Determine:
- API specification format (RAML, OAS)
- API version
- Resource endpoints
- Data types defined

### Step 3: Flow Architecture
```bash
# Mule configuration files
find src/main/mule -name "*.xml" 2>/dev/null

# Count flows
grep -c "<flow " src/main/mule/*.xml 2>/dev/null

# Count sub-flows
grep -c "<sub-flow " src/main/mule/*.xml 2>/dev/null

# Identify connectors in use
grep -o 'config-ref="[^"]*"' src/main/mule/*.xml 2>/dev/null | sort -u
```
Catalog:
- Flow count and organization
- Sub-flow reuse patterns
- Connectors used (HTTP, Database, Salesforce, SAP, etc.)
- Error handling strategy

### Step 4: DataWeave Analysis
```bash
# Standalone DWL files
find . -name "*.dwl" 2>/dev/null | head -20

# Inline transformations
grep -c "ee:transform" src/main/mule/*.xml 2>/dev/null
```

### Step 5: Testing Infrastructure
```bash
# MUnit tests
find src/test/munit -name "*.xml" 2>/dev/null | head -20

# MUnit test count
grep -c "<munit:test " src/test/munit/*.xml 2>/dev/null
```

### Step 6: API Layer Classification
Based on the analysis, determine:
- Is this a System API (direct backend integration)?
- Is this a Process API (orchestration/aggregation)?
- Is this an Experience API (channel-specific)?
- Or is it a standalone integration flow?

## Output

Append these sections to the foundation draft:

### Technology Stack
- **Framework**: Mule {version}
- **Build Tool**: Maven {version}
- **Java Version**: {detected}
- **API Spec**: {RAML/OAS} {version}
- **Connectors**: {list of connectors used}
- **Test Framework**: MUnit {version}
- **Deployment**: {CloudHub/On-Premises/RTF}

### Domain Context
- **API Layer**: {System/Process/Experience/Standalone}
- **Flow Architecture**: {count} flows, {count} sub-flows
- **Connectors**: {HTTP, Database, Salesforce, etc.}
- **DataWeave**: {count} transformations ({inline + standalone})
- **Error Strategy**: {on-error-continue / on-error-propagate patterns}

### Domain-Specific Principles
- API design MUST follow API-led connectivity principles for the {detected layer}
- DataWeave transformations MUST use type coercion and null-safe patterns
- Error handling MUST use structured on-error handlers (not catch-all)
- Flows MUST be organized by responsibility (one flow per logical operation)
- MUnit tests MUST cover happy path, error paths, and edge cases
- Sensitive configuration MUST use secure property placeholders
- Large payloads MUST use streaming to prevent memory issues
