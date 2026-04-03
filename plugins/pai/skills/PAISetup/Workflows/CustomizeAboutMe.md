# CustomizeAboutMe Workflow

Guide the user through creating their ABOUTME.md identity file.

## Variables

```
TARGET_FILE: ~/.buddy/PAI-USER/ABOUTME.md
```

## Instructions

- Ask questions one at a time using AskUserQuestion
- If updating an existing file, show current content first
- Compile all answers into structured markdown
- Show the generated content for user confirmation before writing

## Workflow

### Step 1: Check Existing Content

```bash
cat ~/.buddy/PAI-USER/ABOUTME.md 2>/dev/null
```

If the file exists and has content, display it: "Here's your current ABOUTME.md:" followed by the content.

### Step 2: Gather Information

Ask these questions one at a time using AskUserQuestion:

**Question 1:**
```
Question: "What is your name and what do you do professionally?"
(Free text response)
```

**Question 2:**
```
Question: "What are your main areas of expertise or interest? (e.g., software engineering, data science, design, etc.)"
(Free text response)
```

**Question 3:**
```
Question: "What are your current professional goals or what are you working toward?"
(Free text response)
```

**Question 4:**
```
Question: "Is there anything else you'd like your AI assistant to know about you? (hobbies, communication preferences, context about your work environment, etc.)"
(Free text response — optional, can be skipped)
```

### Step 3: Compile and Confirm

Compile the answers into structured markdown:

```markdown
# About Me

## Identity
{Name and professional role from Q1}

## Expertise
{Areas of expertise from Q2}

## Goals
{Professional goals from Q3}

## Additional Context
{Additional info from Q4, if provided}
```

Show the generated content to the user: "Here's your ABOUTME.md. Does this look good?"

Use AskUserQuestion:
```
Question: "Confirm this content for ABOUTME.md?"
Options:
- Save — Write this file
- Edit — Let me provide corrections
- Cancel — Don't save
```

If "Edit": Ask what they'd like to change, update accordingly, and re-confirm.

### Step 4: Write File

Write the confirmed content to `~/.buddy/PAI-USER/ABOUTME.md`.

Report: "ABOUTME.md saved to ~/.buddy/PAI-USER/ABOUTME.md"
