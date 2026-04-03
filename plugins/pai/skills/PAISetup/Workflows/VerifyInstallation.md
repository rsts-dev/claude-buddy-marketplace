# VerifyInstallation Workflow

Verify the PAI installation is complete and healthy.

## Workflow

### Step 1: Check Version

```bash
cat ~/.buddy/.pai-version 2>/dev/null || echo "NOT INSTALLED"
```

### Step 2: Check ~/.buddy Contents

```bash
echo "=== MEMORY ===" && ls -la ~/.buddy/MEMORY/ 2>/dev/null || echo "MISSING"
echo "=== PAI-USER ===" && ls -la ~/.buddy/PAI-USER/ 2>/dev/null || echo "MISSING"
```

Count identity files:
```bash
for f in ABOUTME.md AISTEERINGRULES.md OPINIONS.md DAIDENTITY.md WRITINGSTYLE.md; do
  if [ -f ~/.buddy/PAI-USER/$f ]; then
    echo "  [configured] $f"
  else
    echo "  [not set up] $f"
  fi
done
```

### Step 3: Verify Symlinks

```bash
ls -la ~/.claude/MEMORY 2>/dev/null
ls -la ~/.claude/PAI/USER 2>/dev/null
```

Check that symlinks point to correct targets:
- `~/.claude/MEMORY` should be a symlink to `~/.buddy/MEMORY`
- `~/.claude/PAI/USER` should be a symlink to `~/.buddy/PAI-USER`

```bash
readlink ~/.claude/MEMORY 2>/dev/null || echo "NOT A SYMLINK"
readlink ~/.claude/PAI/USER 2>/dev/null || echo "NOT A SYMLINK"
```

### Step 4: Check PAI Installation Health

```bash
test -f ~/.claude/install.sh && echo "install.sh: OK" || echo "install.sh: MISSING"
test -d ~/.claude/PAI && echo "PAI directory: OK" || echo "PAI directory: MISSING"
test -d ~/.claude/PAI-Install && echo "PAI-Install: OK" || echo "PAI-Install: MISSING"
test -f ~/.claude/CLAUDE.md && echo "CLAUDE.md: OK" || echo "CLAUDE.md: MISSING"
test -f ~/.claude/settings.json && echo "settings.json: OK" || echo "settings.json: MISSING"
```

### Step 5: Report Summary

Present a summary table:

```
## PAI Installation Status

| Component | Status |
|-----------|--------|
| Version | {version from .pai-version} |
| ~/.buddy/MEMORY | {OK/MISSING} |
| ~/.buddy/PAI-USER | {OK/MISSING} |
| MEMORY symlink | {OK: points to ~/.buddy/MEMORY / BROKEN / MISSING} |
| PAI/USER symlink | {OK: points to ~/.buddy/PAI-USER / BROKEN / MISSING} |
| PAI installation | {OK/MISSING} |
| CLAUDE.md | {OK/MISSING} |
| settings.json | {OK/MISSING} |

### Identity Files
| File | Status |
|------|--------|
| ABOUTME.md | {configured/not set up} |
| AISTEERINGRULES.md | {configured/not set up} |
| OPINIONS.md | {configured/not set up} |
| DAIDENTITY.md | {configured/not set up} |
| WRITINGSTYLE.md | {configured/not set up} |

### Subdirectories
{List PAI-USER subdirectories with file counts}
```
