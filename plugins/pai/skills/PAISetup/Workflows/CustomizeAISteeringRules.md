# CustomizeAISteeringRules Workflow

Guide the user through creating their AISTEERINGRULES.md file — personal rules for AI behavior.

## Variables

```
TARGET_FILE: ~/.buddy/PAI-USER/AISTEERINGRULES.md
```

## Instructions

- Ask questions one at a time using AskUserQuestion
- If updating an existing file, show current content first
- Each rule should follow the Statement / Bad / Correct format from PAI conventions
- Show generated content for confirmation before writing

## Workflow

### Step 1: Check Existing Content

```bash
cat ~/.buddy/PAI-USER/AISTEERINGRULES.md 2>/dev/null
```

If exists, display current content as reference.

### Step 2: Gather Information

Ask these questions one at a time:

**Question 1:**
```
Question: "What communication style do you prefer from your AI assistant? (e.g., concise vs detailed, formal vs casual, technical vs simplified)"
(Free text response)
```

**Question 2:**
```
Question: "Are there topics, approaches, or behaviors you want your AI to always follow? (e.g., always explain reasoning, always use TypeScript, always test before committing)"
(Free text response)
```

**Question 3:**
```
Question: "Are there things you want your AI to avoid? (e.g., don't use emojis, don't add unnecessary comments, don't refactor without asking)"
(Free text response)
```

**Question 4:**
```
Question: "Do you have preferences about code style, output format, or tools? (e.g., prefer functional style, use ESM imports, prefer Bun over Node)"
(Free text response — optional)
```

**Question 5:**
```
Question: "Any other rules or patterns you've noticed work well or poorly with AI assistants?"
(Free text response — optional)
```

### Step 3: Compile and Confirm

Compile answers into the PAI steering rules format:

```markdown
# AI Steering Rules - Personal

Add your personal behavioral rules here. These extend `PAI/SYSTEM/AISTEERINGRULES.md`.

---

## Communication Style

{Rules derived from Q1, formatted as Statement / context}

## Always Do

{Rules from Q2, each as a clear imperative statement}

## Never Do

{Rules from Q3, each as a clear imperative statement}

## Code & Output Preferences

{Rules from Q4, if provided}

## Additional Rules

{Rules from Q5, if provided}

---

*These rules extend `PAI/SYSTEM/AISTEERINGRULES.md`. Both files are loaded and enforced together.*
```

Show and confirm with user (same pattern as CustomizeAboutMe: Save / Edit / Cancel).

### Step 4: Write File

Write confirmed content to `~/.buddy/PAI-USER/AISTEERINGRULES.md`.

Report: "AISTEERINGRULES.md saved."
