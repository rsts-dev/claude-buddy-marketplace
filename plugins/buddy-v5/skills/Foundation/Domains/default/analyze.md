# Domain Analysis: default

Generic codebase analysis for projects without a specific domain match. Discovers technology stack through general-purpose inspection.

## Analysis Steps

### Step 1: Language Detection
Identify primary programming languages:
```bash
# Count files by extension
find . -type f -not -path './.git/*' -not -path './node_modules/*' -not -path './.claude/*' -not -path './target/*' -not -path './build/*' | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -15
```
Determine primary and secondary languages.

### Step 2: Package Manager & Dependencies
```bash
# Check for common package/dependency files
cat package.json 2>/dev/null
cat pom.xml 2>/dev/null
cat build.gradle 2>/dev/null
cat Cargo.toml 2>/dev/null
cat go.mod 2>/dev/null
cat requirements.txt 2>/dev/null
cat pyproject.toml 2>/dev/null
cat Gemfile 2>/dev/null
cat composer.json 2>/dev/null
```
Extract framework, dependencies, and build configuration.

### Step 3: Project Structure
```bash
# Identify source directories
ls -d src/ lib/ app/ cmd/ pkg/ internal/ 2>/dev/null
# Identify test directories
ls -d test/ tests/ spec/ __tests__/ 2>/dev/null
# Identify config files
ls *.config.* .env* docker* Makefile Taskfile* 2>/dev/null
```

### Step 4: Testing Framework
```bash
# Detect test framework from config or dependencies
cat jest.config.* 2>/dev/null
cat vitest.config.* 2>/dev/null
cat pytest.ini 2>/dev/null
cat .rspec 2>/dev/null
```

## Output

Append these sections to the foundation draft:

### Technology Stack
- **Language**: {detected primary language}
- **Framework**: {detected framework, if any}
- **Build Tool**: {detected build tool}
- **Test Framework**: {detected test framework}
- **Package Manager**: {detected package manager}

### Domain Context
{General observations about project architecture, patterns, and conventions}

### Domain-Specific Principles
{Generic principles based on discovered technology:}
- Code organization follows {detected} project conventions
- Testing uses {detected framework} with {detected patterns}
- Build and deployment through {detected tooling}
