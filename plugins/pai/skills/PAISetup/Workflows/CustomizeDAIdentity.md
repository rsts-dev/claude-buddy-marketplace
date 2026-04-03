# CustomizeDAIdentity Workflow

Guide the user through creating their DAIDENTITY.md file — digital assistant name and personality.

## Variables

```
TARGET_FILE: ~/.buddy/PAI-USER/DAIDENTITY.md
```

## Instructions

- Ask questions one at a time using AskUserQuestion
- If updating an existing file, show current content first
- Show generated content for confirmation before writing

## Workflow

### Step 1: Check Existing Content

```bash
cat ~/.buddy/PAI-USER/DAIDENTITY.md 2>/dev/null
```

If exists, display current content as reference.

### Step 2: Gather Information

Ask these questions one at a time:

**Question 1:**
```
Question: "What name would you like your AI digital assistant to use? (e.g., Atlas, Nova, Sage, Arc — or any name you prefer)"
(Free text response)
```

**Question 2:**
```
Question: "What personality traits should your AI assistant have? (e.g., direct and efficient, warm and encouraging, analytical and precise, creative and playful)"
(Free text response)
```

**Question 3:**
```
Question: "What is the primary role of your AI assistant? (e.g., coding partner, research assistant, creative collaborator, productivity companion, technical advisor)"
(Free text response)
```

**Question 4:**
```
Question: "Would you like a startup catchphrase for your assistant? (e.g., 'Atlas here, ready to build', 'Let's get to work' — or leave blank for none)"
(Free text response — optional)
```

### Step 3: Compile and Confirm

```markdown
# Digital Assistant Identity

## Name
{Name from Q1}

## Personality
{Personality traits from Q2}

## Role
{Primary role from Q3}

## Startup Catchphrase
{Catchphrase from Q4, if provided}
```

Show and confirm with user (Save / Edit / Cancel).

### Step 4: Write File

Write confirmed content to `~/.buddy/PAI-USER/DAIDENTITY.md`.

Report: "DAIDENTITY.md saved."
