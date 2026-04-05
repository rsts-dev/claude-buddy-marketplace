# Marketplace Architecture

## System Overview

The Claude Buddy Marketplace is a plugin distribution system for Claude Code. It hosts two plugins that together provide a complete AI-augmented development workflow built on Daniel Miessler's Personal AI Infrastructure (PAI).

```mermaid
graph TB
    subgraph Marketplace["Claude Buddy Marketplace"]
        MJ[".claude-plugin/marketplace.json"]
    end

    subgraph Plugins
        PAI["PAI Plugin<br/>v1.0.0"]
        Buddy["Buddy Plugin<br/>v5.1.0"]
    end

    subgraph ClaudeCode["Claude Code Runtime"]
        CC["Plugin Loader"]
        Commands["Slash Commands"]
        Skills["Skills Engine"]
    end

    subgraph UserSystem["User System"]
        BuddyDir["~/.buddy/<br/>Persistent user data"]
        ClaudeDir["~/.claude/<br/>PAI installation"]
        ProjectDir["/directive/foundation.md<br/>Project foundation"]
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

The marketplace follows Claude Code's plugin architecture:

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

### Plugin Manifest

Each plugin declares its identity in `plugin.json`:

```json
{
  "name": "buddy",
  "version": "5.1.0",
  "description": "PAI-native development workflow platform...",
  "keywords": ["pai", "workflow", "tdd", "domains", "personas"]
}
```

Source: `plugins/buddy/.claude-plugin/plugin.json`

## Dependency Graph

```mermaid
graph LR
    CC["Claude Code"] --> M["Marketplace"]
    M --> PAI["PAI Plugin"]
    M --> Buddy["Buddy Plugin"]
    PAI --> PAIFW["PAI Framework<br/>~/.claude/PAI/"]
    Buddy -->|"requires"| PAI
    Buddy --> Foundation["Foundation Skill"]
    Foundation --> Domains["Domain System"]
    Foundation --> Personas["Persona System"]
    Buddy --> Spec["Spec Skill"]
    Buddy --> Plan["Plan Skill"]
    Buddy --> Tasks["Tasks Skill"]
    Buddy --> Impl["Implementation Skill"]
    Buddy --> SC["SourceControl Skill"]
    Buddy --> Docs["Docs Skill"]
```

**Key dependency**: The Buddy plugin requires PAI to be installed (`~/.buddy/.pai-version` must exist). The PAI plugin handles this installation.

## Data Flow

### Development Lifecycle

```mermaid
sequenceDiagram
    participant U as User
    participant F as /buddy:foundation
    participant S as /buddy:spec
    participant P as /buddy:plan
    participant T as /buddy:tasks
    participant I as /buddy:implement
    participant C as /buddy:commit
    participant D as /buddy:docs

    U->>F: Initialize project
    F->>F: Detect domain (react, jhipster, mulesoft, default)
    F-->>U: /directive/foundation.md

    U->>S: Describe feature
    S->>S: Load PO persona + domain template
    S-->>U: specs/YYYYMMDD-slug/spec.md

    U->>P: Generate plan
    P->>P: Load Architect persona + domain template
    P-->>U: specs/YYYYMMDD-slug/plan.md

    U->>T: Break into tasks
    T->>T: Load QA persona + domain template
    T-->>U: specs/YYYYMMDD-slug/tasks.md

    U->>I: Execute tasks
    I->>I: TDD cycle (red-green-refactor)
    I-->>U: Source code + updated checkboxes

    U->>C: Commit changes
    C->>C: Load Scribe persona
    C-->>U: Conventional commit

    U->>D: Generate docs
    D->>D: Load Scribe persona + domain template
    D-->>U: docs/ directory
```

### Template Resolution

All template-aware skills (Spec, Plan, Tasks, Docs) resolve templates through a three-level cascade:

```
1. User domain template
   ~/.buddy/PAI-USER/SKILLCUSTOMIZATIONS/Foundation/Domains/{type}/Templates/{Skill}.md
                    |
                    v (not found)
2. Built-in domain template
   plugins/buddy/skills/Foundation/Domains/{type}/Templates/{Skill}.md
                    |
                    v (not found)
3. Default fallback
   plugins/buddy/skills/{Skill}/Templates/Default{Skill}.md
```

### File System Layout

```
Project Root/
├── directive/
│   └── foundation.md              # Project foundation (created by /buddy:foundation)
├── specs/
│   └── YYYYMMDD-slug/
│       ├── spec.md                # Feature specification
│       ├── plan.md                # Implementation plan
│       ├── tasks.md               # TDD-ordered tasks
│       ├── research.md            # (optional) Research notes
│       ├── data-model.md          # (optional) Data model
│       └── contracts/             # (optional) API contracts
├── docs/                          # Generated documentation
│   ├── README.md
│   ├── architecture.md
│   ├── api-reference.md
│   ├── setup.md
│   ├── deployment.md
│   └── troubleshooting.md
└── [source code]                  # Implemented features
```

## Design Principles

1. **PAI-Native** — Built on PAI infrastructure for identity, memory, and agent orchestration
2. **Skill-per-Feature** — Each development lifecycle stage maps to exactly one skill
3. **Workflow-Driven** — Complex logic lives in workflow files, not skill definitions
4. **Domain-Extensible** — Technology-specific knowledge is modular and auto-discovered
5. **Persona-Enhanced** — Expert perspectives loaded on-demand during workflow execution
6. **Template-Cascading** — Three-level resolution enables customization without plugin modification

## Key Architectural Decisions

### Skills Over Agents (v5)

v5 consolidated v4's 20+ skills/agents/generators into 7 focused skills with workflows. Each skill owns its complete lifecycle: routing, template selection, persona loading, execution, and output.

### Domains in Foundation

Technology-specific knowledge lives inside the Foundation skill rather than as separate skills. This centralizes detection, analysis, and template ownership.

### Personas as Loadable Definitions

Rather than auto-activating standalone skills, personas are markdown files loaded by workflows at specific steps. Workflows control which expert perspective applies and when.

### Declarative Domain Detection

Domains use confidence-scored rules (HIGH=90, MEDIUM=30, LOW=10) with a 60-point threshold. This prevents false positives while allowing single definitive markers to trigger detection.
