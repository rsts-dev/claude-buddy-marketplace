# Troubleshooting

[< Back to Docs](README.md)

## Common Issues

### PAI Installation

#### "Git is required but not installed"

PAI setup needs git to clone the repository. Install git via your system package manager:

```bash
# macOS
brew install git

# Ubuntu/Debian
sudo apt install git

# Windows
winget install Git.Git
```

#### PAI installer fails but files are in place

The PAI installer (`install.sh`) may fail if Bun isn't installed. The core PAI files are already copied by the plugin workflow — the installer handles optional components. You can:

1. Install Bun manually: `curl -fsSL https://bun.sh/install | bash`
2. Re-run: `/pai:setup`

#### Symlinks not working

Verify symlinks point to the correct locations:

```bash
readlink ~/.claude/MEMORY
# Expected: /Users/{you}/.buddy/MEMORY

readlink ~/.claude/PAI/USER
# Expected: /Users/{you}/.buddy/PAI-USER
```

If broken, recreate them:

```bash
rm -f ~/.claude/MEMORY
ln -s ~/.buddy/MEMORY ~/.claude/MEMORY

rm -f ~/.claude/PAI/USER
ln -s ~/.buddy/PAI-USER ~/.claude/PAI/USER
```

#### "Existing PAI installation detected" when doing fresh install

The plugin checks `~/.buddy/.pai-version` to detect existing installations. If you want to force a fresh install:

1. Back up your data: `cp -r ~/.buddy ~/.buddy-backup`
2. Remove the version file: `rm ~/.buddy/.pai-version`
3. Run `/pai:setup install`

### Buddy Plugin

#### "Foundation must exist" error

Most buddy skills require `/directive/foundation.md`. Create it:

```
/buddy:foundation
```

#### Domain not detected correctly

Check detection manually against [domain detection rules](../plugins/buddy/docs/domains.md#built-in-domains):

| Domain | Key files |
|--------|-----------|
| react | `package.json` with `"react"`, `.jsx`/`.tsx` files |
| jhipster | `.yo-rc.json`, `pom.xml` with `tech.jhipster` |
| mulesoft | `mule-artifact.json`, `*.dwl` files |

If detection is wrong, you can:
1. Update the foundation manually: `/buddy:foundation update domain to {correct-domain}`
2. Create a custom domain: `/buddy:foundation create domain`

#### Spec/Plan/Tasks not finding previous artifacts

The workflow discovers artifacts by scanning `specs/*/` for folders containing the expected files:

- `/buddy:plan` looks for folders with `spec.md` but no `plan.md`
- `/buddy:tasks` looks for folders with `plan.md` but no `tasks.md`
- `/buddy:implement` looks for folders with `tasks.md`

If multiple matches exist, pass an identifier: `/buddy:plan user-auth`

#### Custom domain not detected

See [Creating Custom Domains](../plugins/buddy/docs/domains.md#creating-custom-domains). User domains must be in:
```
~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/
```

Verify the directory contains:
- `profile.md` with valid `type_key` and `priority` frontmatter
- `detect.md` with detection rules
- `analyze.md`
- `Templates/` with Spec.md, Plan.md, Tasks.md, Docs.md

### General

#### Plugins not loading after install

Restart Claude Code. Plugins activate on session start, not on install.

#### Commands not recognized

Verify plugins are installed and enabled:

```
/plugin list
```

If missing, reinstall:

```
/plugin install buddy@claude-buddy-marketplace
/plugin install pai@claude-buddy-marketplace
```

#### Skill customizations not applied

Customizations are loaded from:
```
~/.claude/PAI/USER/SKILLCUSTOMIZATIONS/{SkillName}/PREFERENCES.md
```

This path goes through the symlink, so the actual file is:
```
~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/{SkillName}/PREFERENCES.md
```

Verify the file exists and the skill name matches exactly (case-sensitive).

## Debugging

### Check PAI installation status

See [PAI Workflows > VerifyInstallation](../plugins/pai/docs/workflows.md#verifyinstallation).

```
/pai:setup verify
```

### Check file structure

```bash
# PAI installation
ls -la ~/.claude/
ls -la ~/.claude/PAI/

# Persistent user data
ls -la ~/.buddy/
ls -la ~/.buddy/PAI-USER/

# Symlinks
readlink ~/.claude/MEMORY
readlink ~/.claude/PAI/USER

# Version
cat ~/.buddy/.pai-version
```

### Check plugin structure

```bash
# From marketplace root
ls plugins/buddy/.claude-plugin/
ls plugins/pai/.claude-plugin/
```

## FAQ

**Q: Can I use Buddy without PAI?**
A: No. Buddy depends on PAI infrastructure. Run `/pai:setup` first.

**Q: Will upgrading PAI overwrite my customizations?**
A: No. User data lives in `~/.buddy/` and is preserved via symlinks. Upgrades only add new files — they never overwrite existing ones.

**Q: Can I use multiple domains in one project?**
A: No. Foundation uses a single domain per project. The domain with the highest detection score is selected.

**Q: Where do custom domains go?**
A: `~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{domain-name}/`. These take priority over built-in domains.

**Q: Can I run skills out of order?**
A: SourceControl and Docs can run anytime. The spec->plan->tasks->implement chain must follow order since each reads the previous step's output.

**Q: How do I reset my foundation?**
A: Delete `/directive/foundation.md` and run `/buddy:foundation` to recreate it.
