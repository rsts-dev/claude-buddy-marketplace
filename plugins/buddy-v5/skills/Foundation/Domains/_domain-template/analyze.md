# Domain Analysis: {domain}

Executed by CreateFoundation after domain detection. Performs deep, domain-specific codebase analysis.

## Analysis Steps

### Step 1: Configuration Discovery
Read and parse domain-specific configuration files:
```bash
# {describe what to look for}
cat {config-file} 2>/dev/null
```
Extract: {what to extract}

### Step 2: Architecture Assessment
```bash
# {describe what to scan}
find {path} -name "{pattern}" | head -30
```
Determine: {what architectural decisions to identify}

### Step 3: Dependency Analysis
```bash
# {describe dependency discovery}
```
Catalog: {what dependencies matter}

## Output

Append these sections to the foundation draft:

### Technology Stack
- **Framework**: {detected framework and version}
- **Build Tool**: {detected build tool}
- **Test Framework**: {detected test tools}
- **Deployment**: {detected deployment method}

### Domain Context
{Architecture decisions, patterns, and conventions discovered}

### Domain-Specific Principles
{Principles to merge into foundation Core Principles, derived from domain best practices}
