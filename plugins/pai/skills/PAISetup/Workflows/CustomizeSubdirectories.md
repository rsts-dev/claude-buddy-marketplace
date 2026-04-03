# CustomizeSubdirectories Workflow

Guide the user through setting up optional PAI-USER subdirectory content.

## Variables

```
PAI_USER_DIR: ~/.buddy/PAI-USER
```

## Instructions

- Offer subdirectories in a loop until user selects "Done"
- For each subdirectory, ask relevant questions
- Create files in the appropriate subdirectory under ~/.buddy/PAI-USER/
- Show generated content for confirmation before writing

## Workflow

### Step 1: Subdirectory Selection Loop

Use AskUserQuestion in a loop:

```
Question: "Which subdirectory would you like to set up?"
Options:
- TELOS — Goals, beliefs, challenges, wisdom (Life OS)
- BUSINESS — Company info, brand, templates
- PROJECTS — Project registry and metadata
- Done — Finish subdirectory setup
```

For each selection, execute the corresponding section below.

### TELOS Setup

TELOS is the "Life OS" — it tracks goals, beliefs, and wisdom.

**Question 1:**
```
Question: "What are your current goals? List your short-term (this month), medium-term (this year), and long-term goals."
(Free text response)
```

Write response to `~/.buddy/PAI-USER/TELOS/GOALS.md`:
```markdown
# Goals

## Short-Term
{parsed short-term goals}

## Medium-Term
{parsed medium-term goals}

## Long-Term
{parsed long-term goals}
```

**Question 2:**
```
Question: "What are your core beliefs or values that guide your decisions? (optional — skip if you prefer)"
(Free text response — optional)
```

If provided, write to `~/.buddy/PAI-USER/TELOS/BELIEFS.md`:
```markdown
# Core Beliefs

{beliefs formatted as a list}
```

**Question 3:**
```
Question: "What are your current challenges or obstacles? (optional)"
(Free text response — optional)
```

If provided, write to `~/.buddy/PAI-USER/TELOS/CHALLENGES.md`:
```markdown
# Current Challenges

{challenges formatted as a list}
```

### BUSINESS Setup

**Question 1:**
```
Question: "What is your company or organization? Provide a brief overview including mission, products/services, and your role."
(Free text response)
```

Write to `~/.buddy/PAI-USER/BUSINESS/COMPANY.md`:
```markdown
# Company Overview

{company information formatted with sections for Name, Mission, Products/Services, Role}
```

**Question 2:**
```
Question: "Do you have brand guidelines or tone preferences for business communications? (optional)"
(Free text response — optional)
```

If provided, write to `~/.buddy/PAI-USER/BUSINESS/BRAND.md`:
```markdown
# Brand Guidelines

{brand info}
```

### PROJECTS Setup

**Question 1:**
```
Question: "List your current projects. For each, provide: project name, directory path, URL (if any), and tech stack."
(Free text response)
```

Write to `~/.buddy/PAI-USER/PROJECTS/PROJECTS.md`:
```markdown
# Project Registry

| Project | Path | URL | Stack |
|---------|------|-----|-------|
{parsed project entries as table rows}
```

### Step 2: Loop Back

After completing a subdirectory, return to the selection loop (Step 1) and offer the remaining options.

### Step 3: Summary

When user selects "Done", report which subdirectories were set up:

```
## Subdirectory Setup Complete

### Configured
- {list of subdirectories that were set up}

### Available for Later
- {list of subdirectories not set up}

These can be configured later by running /pai:setup customize
```
