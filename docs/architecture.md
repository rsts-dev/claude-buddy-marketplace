# Marketplace Architecture

[< Back to Docs](README.md)

## System Overview

The Claude Buddy Marketplace is a plugin distribution system for Claude Code. It hosts two plugins that together provide a complete AI-augmented development workflow built on Daniel Miessler's Personal AI Infrastructure (PAI).

```mermaid
graph TB
    subgraph Marketplace["Claude Buddy Marketplace"]
        MJ[".claude-plugin/marketplace.json"]
    end

    subgraph Plugins
        PAI["PAI Plugin v1.0.0"]
        Buddy["Buddy Plugin v5.1.0"]
    end

    subgraph ClaudeCode["Claude Code Runtime"]
        CC["Plugin Loader"]
        Commands["Slash Commands"]
        Skills["Skills Engine"]
    end

    subgraph UserSystem["User System"]
        BuddyDir["~/.buddy/<br/>Persistent user data"]
        ClaudeDir["~/.claude/<br/>PAI installation"]
        ProjectDir["/directive/foundation.md"]
    end

    Marketplace --> CC
    CC --> PAI
    CC --> Buddy
    PAI --> Commands
    Buddy --> Commands
    Commands --> Skills
    PAI --> BuddyDir
    PAI --> ClaudeDir
    Buddy --> ProjectDir
    BuddyDir -.->|symlink| ClaudeDir
```

## Plugin Model

The marketplace uses Claude Code's plugin architecture:

| Component | Location | Purpose |
|-----------|----------|---------|
| Marketplace manifest | `.claude-plugin/marketplace.json` | Registers available plugins |
| Plugin manifest | `plugins/{name}/.claude-plugin/plugin.json` | Plugin metadata and version |
| Commands | `plugins/{name}/commands/*.md` | Thin slash-command wrappers |
| Skills | `plugins/{name}/skills/*/SKILL.md` | Workflow routing and logic |
| Workflows | `plugins/{name}/skills/*/Workflows/*.md` | Step-by-step execution plans |
| Templates | `plugins/{name}/skills/*/Templates/*.md` | Output format templates |

### Marketplace Manifest

```json
{
  "name": "claude-buddy-marketplace",
  "plugins": [
    { "name": "buddy", "source": "./plugins/buddy" }
  ]
}
```

Source: `.claude-plugin/marketplace.json`

## Dependency Graph

```mermaid
graph LR
    CC["Claude Code"] --> M["Marketplace"]
    M --> PAI["PAI Plugin"]
    M --> Buddy["Buddy Plugin"]
    PAI --> PAIFW["PAI Framework<br/>~/.claude/PAI/"]
    Buddy -->|requires| PAI
    Buddy --> Skills["7 Skills"]
    Skills --> Domains["Domain System"]
    Skills --> Personas["Persona System"]
```

**Key dependency**: Buddy requires PAI (`~/.buddy/.pai-version` must exist). The PAI plugin handles this installation.

## File System Layout

```
Project Root/
├── directive/
│   └── foundation.md              # Created by /buddy:foundation
├── specs/
│   └── YYYYMMDD-slug/
│       ├── spec.md                # /buddy:spec output
│       ├── plan.md                # /buddy:plan output
│       └── tasks.md               # /buddy:tasks output
├── docs/                          # /buddy:docs output
└── [source code]                  # /buddy:implement output
```

## Plugin Architecture Deep Dives

For detailed architecture of each plugin:

- **Buddy Plugin**: [Architecture](../plugins/buddy/docs/architecture.md) — Skill layers, domain detection flow, template cascade, persona loading
- **PAI Plugin**: [Architecture](../plugins/pai/docs/architecture.md) — Symlink strategy, persistent data, installation phases
