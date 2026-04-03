# DetectDomain Workflow

Scan all available domains and determine the best match for the current project based on declarative detection rules with confidence scoring.

## Variables

```
BUILTIN_DOMAINS_DIR: skills/Foundation/Domains/
USER_DOMAINS_DIR: ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/
```

## Workflow

### Step 1: Enumerate Domains

Scan **both** domain directories for subdirectories. Each subdirectory (except `_domain-template`) represents a registered domain.

```bash
# Built-in domains
ls -d skills/Foundation/Domains/*/ 2>/dev/null | grep -v '_domain-template'

# User-created domains
ls -d ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/*/ 2>/dev/null
```

Build a unified list of candidate domains from both locations. If a domain name exists in both locations, the **user version takes precedence** (overrides the built-in).

### Step 2: Evaluate Detection Rules

For each candidate domain, read its `detect.md` file and evaluate all detection rules:

#### 2a: File Pattern Checks
For each file pattern in the domain's `detect.md`:
```bash
# For exact file checks
test -f {pattern} && echo "MATCH"

# For glob patterns
find . -path "./{pattern}" -not -path './.git/*' -not -path './node_modules/*' | head -1
```

#### 2b: Manifest Checks
For each manifest check:
```bash
# Check if manifest file contains the pattern
grep -q "{search-pattern}" {manifest-file} 2>/dev/null && echo "MATCH"
```

#### 2c: Directory Structure Checks
For each directory pattern:
```bash
test -d {directory-pattern} && echo "MATCH"
```

### Step 3: Calculate Confidence Scores

For each domain, calculate total confidence score:
- Each **HIGH** confidence match: **90 points**
- Each **MEDIUM** confidence match: **30 points**
- Each **LOW** confidence match: **10 points**

Sum all matching rule scores for the domain's total.

### Step 4: Select Domain

1. Filter domains to those meeting or exceeding the activation threshold (60 points)
2. Sort qualifying domains by total confidence score (descending)
3. If tied: read `profile.md` for each tied domain and use `priority` field to break ties (higher priority wins)
4. If no domain meets threshold: select `default`
5. Return the selected domain's `type_key` from its `profile.md`

### Step 5: Report Detection

```
Domain Detection Results:
- Selected: {type_key} (score: {score})
- Candidates evaluated: {count}
- Matches above threshold:
  {domain1}: {score1} points
  {domain2}: {score2} points
  ...
- Using domain at: Domains/{type_key}/
```

## Adding New Domains

**Interactive (recommended):** Run `/buddy:foundation create domain` to use the guided wizard.

**Manual:** Create a directory under either location with:
- `profile.md` — Domain metadata, dependencies, keywords, reference index
- `detect.md` — Detection rules with confidence scoring
- `analyze.md` — Deep analysis workflow fragment
- `Templates/` — Spec.md, Plan.md, Tasks.md, Docs.md
- `Reference/` — Domain-specific reference materials (optional)

**Locations:**
- Built-in: `skills/Foundation/Domains/{domain-name}/`
- User-created: `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/`

No changes to this workflow or any other files are needed. The new domain is automatically discovered and evaluated.
