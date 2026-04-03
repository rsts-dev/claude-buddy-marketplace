# CustomizeIdentity Workflow

Orchestrator that walks the user through customizing PAI identity files one at a time.

## Variables

```
PAI_USER_DIR: ~/.buddy/PAI-USER
MODE: all (default) | new_only (skip files with existing content)
```

## Instructions

- Process identity files in order: ABOUTME, AISTEERINGRULES, OPINIONS, DAIDENTITY, WRITINGSTYLE
- For each file, check if it already exists and has user content
- Respect the MODE variable: in `new_only` mode, auto-skip files that already have content
- Use AskUserQuestion for each file decision
- After identity files, offer subdirectory customization

## Workflow

### Step 1: Introduction

Report to user:

"PAI uses 5 identity files to personalize your AI experience. I'll walk through each one so you can customize your setup."

### Step 2: Process Identity Files

For each file in this order:
1. `ABOUTME.md` — Your background, expertise, and goals
2. `AISTEERINGRULES.md` — Rules for how AI should behave with you
3. `OPINIONS.md` — Your perspectives and strong opinions
4. `DAIDENTITY.md` — Your digital assistant's name and personality
5. `WRITINGSTYLE.md` — Your writing style preferences

Do the following:

#### 2a: Check Existing Content

Read the file at `~/.buddy/PAI-USER/{FILENAME}`:
```bash
test -f ~/.buddy/PAI-USER/{FILENAME} && wc -l ~/.buddy/PAI-USER/{FILENAME}
```

Determine if the file has user content (more than just a template/README header).

#### 2b: Decision Based on Mode and Content

**If MODE is `new_only` AND file has user content:**
- Report: "Skipping {FILENAME} (already customized)"
- Continue to next file

**If MODE is `all` AND file has user content:**
- Show a brief summary of current content
- Use AskUserQuestion:
  ```
  Question: "{FILENAME} already has content. What would you like to do?"
  Options:
  - Update — Re-customize this file (current content will be shown as reference)
  - Keep — Keep existing content
  - Skip — Move to next file
  ```

**If file does NOT have user content (or doesn't exist):**
- Use AskUserQuestion:
  ```
  Question: "Would you like to customize {FILENAME}? ({brief description})"
  Options:
  - Yes — Set up this file now
  - Skip — Move to next file
  - Stop — End customization
  ```

#### 2c: Execute Customization

If user chose to customize, read and execute the corresponding workflow:
- ABOUTME.md -> `Workflows/CustomizeAboutMe.md`
- AISTEERINGRULES.md -> `Workflows/CustomizeAISteeringRules.md`
- OPINIONS.md -> `Workflows/CustomizeOpinions.md`
- DAIDENTITY.md -> `Workflows/CustomizeDAIdentity.md`
- WRITINGSTYLE.md -> `Workflows/CustomizeWritingStyle.md`

If user chose "Stop", end the customization process entirely.

### Step 3: Subdirectory Customization

After processing all 5 identity files, use AskUserQuestion:

```
Question: "Would you like to also set up content in subdirectories (TELOS goals/beliefs, BUSINESS info, PROJECTS registry)?"
Options:
- Yes — Walk through subdirectory setup
- No — Finish customization
```

If "Yes": Read and execute `Workflows/CustomizeSubdirectories.md`

### Step 4: Summary

Report which files were customized, which were skipped, and which still need setup.

```
## Customization Summary

### Configured
- {list of files that were customized or already had content}

### Not Set Up
- {list of files still empty — user can run customization again later}

To re-run customization: /pai:setup customize
```
