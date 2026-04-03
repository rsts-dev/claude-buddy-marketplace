# CustomizeWritingStyle Workflow

Guide the user through creating their WRITINGSTYLE.md file — writing preferences and patterns.

## Variables

```
TARGET_FILE: ~/.buddy/PAI-USER/WRITINGSTYLE.md
```

## Instructions

- Ask questions one at a time using AskUserQuestion
- If updating an existing file, show current content first
- Show generated content for confirmation before writing

## Workflow

### Step 1: Check Existing Content

```bash
cat ~/.buddy/PAI-USER/WRITINGSTYLE.md 2>/dev/null
```

If exists, display current content as reference.

### Step 2: Gather Information

Ask these questions one at a time:

**Question 1:**
```
Question: "How would you describe your writing style? (e.g., academic and precise, conversational and approachable, technical and concise, narrative and storytelling)"
(Free text response)
```

**Question 2:**
```
Question: "What tone do you prefer? (e.g., professional, friendly, authoritative, neutral, witty)"
(Free text response)
```

**Question 3:**
```
Question: "Do you have preferences about sentence length, vocabulary, or formatting? (e.g., short punchy sentences, plain language over jargon, heavy use of bullet points, minimal markdown)"
(Free text response)
```

**Question 4:**
```
Question: "Are there writing patterns or habits you'd like your AI to emulate? (e.g., 'I start blog posts with a question', 'I use Oxford commas', 'I avoid passive voice')"
(Free text response — optional)
```

### Step 3: Compile and Confirm

```markdown
# Writing Style

## Style
{Writing style description from Q1}

## Tone
{Preferred tone from Q2}

## Formatting Preferences
{Sentence/vocabulary/formatting preferences from Q3}

## Patterns & Habits
{Writing patterns from Q4, if provided}
```

Show and confirm with user (Save / Edit / Cancel).

### Step 4: Write File

Write confirmed content to `~/.buddy/PAI-USER/WRITINGSTYLE.md`.

Report: "WRITINGSTYLE.md saved."
