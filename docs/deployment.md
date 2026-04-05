# Deployment & Distribution

[< Back to Docs](README.md)

## Publishing the Marketplace

The marketplace is a Git repository. Distribution happens through GitHub:

```
Repository: https://github.com/rsts-dev/claude-buddy-marketplace
```

### Adding the Marketplace

Users register the marketplace in Claude Code:

```
/plugin marketplace add rsts-dev/claude-buddy-marketplace
```

This adds the repository URL to Claude Code's known marketplaces list in the user's settings.

### Version Management

Each plugin maintains its own version in `plugin.json`:

| Plugin | Version File | Current |
|--------|-------------|---------|
| buddy | `plugins/buddy/.claude-plugin/plugin.json` | 5.1.0 |
| pai | `plugins/pai/.claude-plugin/plugin.json` | 1.0.0 |

The marketplace manifest at `.claude-plugin/marketplace.json` lists available plugins and their source paths.

### Branch and Tag Support

Claude Code supports installing from specific branches or tags:

```
/plugin install buddy@claude-buddy-marketplace#v5.1.0
/plugin install buddy@claude-buddy-marketplace#develop
```

## Repository Structure

```
claude-buddy-marketplace/
├── .claude-plugin/
│   └── marketplace.json          # Marketplace manifest
├── .gitignore
├── LICENSE                       # MIT
├── README.md                     # Marketplace README
├── _context/
│   └── claude-code.md            # Claude Code reference context
├── plugins/
│   ├── check_pai_prerequisites.sh
│   ├── buddy/                    # Development workflow plugin
│   │   ├── .claude-plugin/plugin.json
│   │   ├── README.md
│   │   ├── commands/             # 7 slash commands
│   │   ├── docs/                 # Plugin-level docs
│   │   └── skills/               # 7 skills with workflows
│   └── pai/                      # PAI setup plugin
│       ├── .claude-plugin/plugin.json
│       ├── README.md
│       ├── commands/             # 1 slash command
│       └── skills/               # 1 skill with workflows
└── docs/                         # Marketplace-level documentation
```

## Release Process

### Updating a Plugin

1. Make changes to plugin files
2. Update version in `plugin.json`
3. Update relevant documentation
4. Commit with conventional commit format
5. Push to main branch

### Versioning Guidelines

Follow semantic versioning:

- **MAJOR** — Breaking changes to command interfaces or skill behavior
- **MINOR** — New features, new domains, new personas
- **PATCH** — Bug fixes, documentation updates, template improvements

### Compatibility

| Component | Requires |
|-----------|----------|
| Marketplace | Claude Code with plugin support |
| PAI Plugin | git, curl, Claude Code |
| Buddy Plugin | PAI installed (`~/.buddy/.pai-version`), git |

## Contributing

### Adding a New Plugin

1. Create `plugins/{name}/` directory
2. Add `.claude-plugin/plugin.json` with name, version, description
3. Add `commands/` with at least one slash command
4. Add `skills/` with at least one skill (SKILL.md + Workflows/)
5. Register in `.claude-plugin/marketplace.json`
6. Add documentation in `plugins/{name}/README.md`

### Plugin File Requirements

**Minimum plugin structure:**

```
plugins/{name}/
├── .claude-plugin/
│   └── plugin.json              # Required: name, version, description
├── commands/
│   └── {command}.md             # At least one command
└── skills/
    └── {Skill}/
        ├── SKILL.md             # Skill definition
        └── Workflows/
            └── {Workflow}.md    # At least one workflow
```

See [API & Extension Points](api-reference.md) for the full `plugin.json` schema and all extension formats.
