# CustomizeOpinions Workflow

Guide the user through creating their OPINIONS.md file — personal perspectives and viewpoints.

## Variables

```
TARGET_FILE: ~/.buddy/PAI-USER/OPINIONS.md
```

## Instructions

- Ask questions one at a time using AskUserQuestion
- If updating an existing file, show current content first
- Show generated content for confirmation before writing

## Workflow

### Step 1: Check Existing Content

```bash
cat ~/.buddy/PAI-USER/OPINIONS.md 2>/dev/null
```

If exists, display current content as reference.

### Step 2: Gather Information

Ask these questions one at a time:

**Question 1:**
```
Question: "What are your strong opinions about technology, software development, or your professional field? (e.g., 'monoliths are better than microservices for most teams', 'tests should be written first')"
(Free text response)
```

**Question 2:**
```
Question: "Are there common industry practices or trends you disagree with? (e.g., 'most companies over-engineer their infrastructure', 'agile has lost its meaning')"
(Free text response)
```

**Question 3:**
```
Question: "What principles guide your decision-making? (e.g., 'simplicity over cleverness', 'ship fast and iterate', 'measure before optimizing')"
(Free text response)
```

### Step 3: Compile and Confirm

```markdown
# Opinions

## Technology & Development

{Strong opinions from Q1}

## Industry Perspectives

{Disagreements and contrarian views from Q2}

## Guiding Principles

{Decision-making principles from Q3}
```

Show and confirm with user (Save / Edit / Cancel).

### Step 4: Write File

Write confirmed content to `~/.buddy/PAI-USER/OPINIONS.md`.

Report: "OPINIONS.md saved."
