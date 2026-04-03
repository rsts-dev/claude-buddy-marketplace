# UpdateFoundation Workflow

Update an existing project foundation with semantic versioning and consistency propagation.

## Variables

```
FOUNDATION_PATH: /directive/foundation.md
```

## Workflow

### Step 1: Load Existing Foundation

Read `/directive/foundation.md` and extract:
- Current version number
- Existing principles
- Foundation type
- Governance rules

### Step 2: Determine Changes

Based on user input, identify:
- Principles to add, modify, or remove
- Governance changes
- Metadata updates

### Step 3: Apply Semantic Versioning

Determine version bump:
- **MAJOR (X.0.0)**: Principle removals, fundamental redefinitions, governance overhauls
- **MINOR (x.Y.0)**: New principles, sections materially expanded, new governance procedures
- **PATCH (x.y.Z)**: Clarifications, wording improvements, typo fixes

When ambiguous, present reasoning and recommend before finalizing.

### Step 4: Update Foundation

- Apply changes to the document
- Update `Last Amended` date to today
- Update version number
- Update any `TODO()` markers if information is now available

### Step 5: Generate Sync Impact Report

Prepend as HTML comment at top of foundation:

```html
<!--
SYNC IMPACT REPORT
Version Change: [old] -> [new]
Bump Rationale: [explanation]

Modified Principles:
- [principle name]: [nature of change]

Added Sections:
- [section name]: [brief description]

Removed Sections:
- [section name]: [rationale]

Generated: [ISO timestamp]
-->
```

### Step 6: Consistency Propagation

Check dependent artifacts for needed updates:
- Spec templates: Verify scope/requirements reflect new constraints
- Plan templates: Verify foundation check sections align
- Tasks templates: Update categorization for principle-driven types

For each: report ✅ Updated / ⚠️ Pending / ➖ No changes needed

### Step 7: Validate

Before writing:
- No unexplained bracket tokens remain
- Version line matches Sync Impact Report
- All dates in ISO format
- Principles are declarative, testable, use precise modal verbs
- Governance section is complete

### Step 8: Write and Report

Write updated foundation to `/directive/foundation.md`.

```
## Foundation Updated

- Version: {old} -> {new}
- Bump: {MAJOR|MINOR|PATCH} — {rationale}
- Changes: {summary}
- Propagation: {status of dependent artifacts}
- Suggested commit: docs: amend foundation to v{new} ({brief description})
```
