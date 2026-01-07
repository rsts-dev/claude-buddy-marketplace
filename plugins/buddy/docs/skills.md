# Skills System

## Overview

The Skills System provides context and expertise injection through Claude Code Skills - a native mechanism for augmenting AI capabilities with specialized knowledge, templates, and decision-making frameworks. Skills auto-activate based on keywords, file patterns, and task context, enabling intelligent, multi-perspective problem-solving.

## Skills Architecture

### Core Concept

Skills are Markdown files (`SKILL.md`) that automatically load into AI context when relevant:
- **Personas**: Expert perspectives (architect, security, frontend, etc.)
- **Domains**: Technology-specific knowledge (React, MuleSoft, JHipster)
- **Generators**: Document creation capabilities (specs, plans, tasks, docs)

### Design Philosophy

1. **Auto-Activation**: Skills load automatically based on context
2. **Progressive Disclosure**: Core guidance in SKILL.md, details in supporting files
3. **Token Efficiency**: Load only what's needed (30-70% savings vs. manual loading)
4. **Composability**: Multiple skills work together naturally
5. **Convention over Configuration**: Smart defaults with customization options

## Skill Types

### Directory Structure

Skills use a flat hyphenated naming convention:

```
skills/
├── persona-architect/           # 12 expert personas
├── persona-frontend/
├── persona-backend/
├── persona-security/
├── persona-performance/
├── persona-analyzer/
├── persona-qa/
├── persona-refactorer/
├── persona-devops/
├── persona-mentor/
├── persona-scribe/
├── persona-po/
├── domain-mulesoft/             # 3 technology domains
├── domain-jhipster/
├── domain-react/
├── generator-spec/              # 4 document generators
├── generator-plan/
├── generator-tasks/
├── generator-docs/
└── damage-control/              # Security skill
```

### Personas (12 total)

Expert AI personalities that provide specialized perspectives:

#### Technical Specialists

**1. persona-architect**
- **Role**: Systems design and long-term architecture specialist
- **Priority**: maintainability > scalability > performance > short-term gains
- **Specializations**: system design, architecture patterns, scalability, technical debt
- **Auto-Activation**: Keywords like "architecture", "design", "scalability", "system"
- **Compatible With**: performance, security, devops

**2. persona-frontend**
- **Role**: UI/UX specialist and accessibility advocate
- **Priority**: user experience > accessibility > performance > technical elegance
- **Specializations**: UI components, responsive design, accessibility, performance
- **Auto-Activation**: Keywords like "component", "ui", "react", "css", file patterns `*.jsx`, `*.tsx`
- **Compatible With**: persona-performance, persona-qa, persona-scribe

**3. persona-backend**
- **Role**: Reliability engineer and API specialist
- **Priority**: reliability > security > performance > features > convenience
- **Specializations**: API design, database optimization, microservices, authentication
- **Auto-Activation**: Keywords like "api", "database", "server", "endpoint"
- **Compatible With**: persona-security, persona-performance, persona-devops

**4. persona-security**
- **Role**: Threat modeler and vulnerability specialist
- **Priority**: security > compliance > reliability > performance > convenience
- **Specializations**: vulnerability assessment, threat modeling, secure coding, compliance
- **Auto-Activation**: Keywords like "security", "vulnerability", "auth", "encryption"
- **Compatible With**: persona-backend, persona-analyzer, persona-qa

**5. persona-performance**
- **Role**: Optimization specialist and bottleneck elimination expert
- **Priority**: measurement > critical path > user experience > premature optimization
- **Specializations**: performance analysis, optimization, benchmarking, profiling
- **Auto-Activation**: Keywords like "performance", "optimization", "bottleneck", "slow"
- **Compatible With**: persona-architect, persona-backend, persona-frontend

#### Process Experts

**6. persona-analyzer**
- **Role**: Root cause specialist and systematic investigator
- **Priority**: evidence > systematic approach > thoroughness > speed
- **Specializations**: root cause analysis, systematic debugging, evidence collection
- **Auto-Activation**: Keywords like "analyze", "debug", "troubleshoot", "investigate"
- **Compatible With**: persona-qa, persona-security, persona-performance

**7. persona-qa**
- **Role**: Quality advocate and testing specialist
- **Priority**: prevention > detection > correction > comprehensive coverage
- **Specializations**: test strategy, quality assurance, test automation, coverage analysis
- **Auto-Activation**: Keywords like "test", "testing", "quality", "qa", "validation"
- **Compatible With**: persona-analyzer, persona-security, persona-frontend

**8. persona-refactorer**
- **Role**: Code quality specialist and technical debt manager
- **Priority**: simplicity > maintainability > readability > performance > cleverness
- **Specializations**: code refactoring, technical debt management, clean code
- **Auto-Activation**: Keywords like "refactor", "cleanup", "technical debt", "code quality"
- **Compatible With**: persona-architect, persona-performance, persona-qa

**9. persona-devops**
- **Role**: Infrastructure specialist and deployment expert
- **Priority**: automation > observability > reliability > scalability > manual processes
- **Specializations**: infrastructure automation, deployment pipelines, monitoring
- **Auto-Activation**: Keywords like "deploy", "infrastructure", "cicd", "docker", "kubernetes"
- **Compatible With**: persona-architect, persona-backend, persona-security

#### Knowledge Specialists

**10. persona-mentor**
- **Role**: Knowledge transfer specialist and educator
- **Priority**: understanding > knowledge transfer > teaching > task completion
- **Specializations**: knowledge transfer, educational content, mentoring, skill development
- **Auto-Activation**: Keywords like "explain", "learn", "understand", "teach", "guide"
- **Compatible With**: persona-scribe, persona-architect, persona-analyzer

**11. persona-scribe**
- **Role**: Professional writer and documentation specialist
- **Priority**: clarity > audience needs > completeness > brevity
- **Specializations**: technical writing, documentation, professional communication
- **Auto-Activation**: Keywords like "document", "write", "documentation", "readme"
- **Compatible With**: persona-mentor, persona-qa, persona-frontend

**12. persona-po (Product Owner)**
- **Role**: Product requirement specialist and strategic planner
- **Priority**: user value > market fit > technical feasibility > resource optimization
- **Specializations**: product requirements, user stories, acceptance criteria, strategic planning
- **Auto-Activation**: Keywords like "requirements", "user stories", "product spec", "roadmap"
- **Compatible With**: persona-architect, persona-scribe, persona-mentor

### Domains (3 total)

Technology-specific knowledge and best practices:

**1. domain-react**
- **Technology**: React.js and ecosystem
- **Scope**: Component patterns, hooks, state management, performance
- **Auto-Activation**: React projects (package.json), `.jsx`/`.tsx` files
- **Provides**: React best practices, hooks patterns, component architecture

**2. domain-jhipster**
- **Technology**: JHipster full-stack framework
- **Scope**: Entity modeling, Spring Boot backend, Angular/React frontend
- **Auto-Activation**: JHipster projects (`.yo-rc.json`), JDL files
- **Provides**: JHipster conventions, entity modeling, microservices architecture

**3. domain-mulesoft**
- **Technology**: MuleSoft Anypoint Platform
- **Scope**: DataWeave, RAML, API-led connectivity, Mule flows
- **Auto-Activation**: MuleSoft projects (mule-artifact.json), `.dwl`, `.raml` files
- **Provides**: DataWeave patterns, RAML design, Mule flow best practices

### Generators (4 total)

Document generation capabilities with foundation-aware templates:

**1. generator-spec**
- **Purpose**: Generate feature specifications from descriptions
- **Auto-Activation**: Keywords like "spec", "specification", "feature requirements"
- **Provides**: Spec templates (Default, MuleSoft, JHipster), clarification workflow
- **Output**: `specs/[YYYYMMDD-slug]/spec.md`

**2. generator-plan**
- **Purpose**: Create implementation plans from specifications
- **Auto-Activation**: Keywords like "plan", "implementation plan", "architecture plan"
- **Provides**: Plan templates with tech stack, architecture, phases
- **Output**: `specs/[YYYYMMDD-slug]/plan.md`

**3. generator-tasks**
- **Purpose**: Generate task breakdowns from plans
- **Auto-Activation**: Keywords like "tasks", "task breakdown", "implementation tasks"
- **Provides**: TDD-based task templates, dependency mapping, phase organization
- **Output**: `specs/[YYYYMMDD-slug]/tasks.md`

**4. generator-docs**
- **Purpose**: Create comprehensive technical documentation
- **Auto-Activation**: Keywords like "documentation", "docs", "readme", "api docs"
- **Provides**: Documentation templates, structure guidance, writing standards
- **Output**: Various documentation files (README.md, API docs, architecture docs)

### Security (1 total)

**damage-control**
- **Purpose**: Defense-in-depth protection system with PreToolUse hooks
- **Auto-Activation**: Keywords like "damage control", "security hooks", "protected paths", "blocked commands"
- **Provides**:
  - Command pattern blocking via `bashToolPatterns`
  - Path protection with three levels: `zeroAccessPaths`, `readOnlyPaths`, `noDeletePaths`
  - Ask patterns for confirmation dialogs
  - Installation workflows via cookbook
- **Configuration**: `patterns.yaml` (single source of truth)
- **Implementations**: Python (UV) and TypeScript (Bun)
- **See Also**: [hooks.md](hooks.md) for detailed documentation

## Auto-Activation Mechanism

### Activation Triggers

Skills activate based on multiple factors:

**1. Keyword Matching (30% weight)**
- Extract keywords from user request
- Match against skill's keyword list
- Score: `(matched_keywords / total_keywords) × confidence_weight`

**2. Context Analysis (40% weight)** - Most Important
- Semantic understanding of request intent
- Match against skill description and specializations
- Deep contextual relevance scoring (0.0 to 1.0)

**3. File Pattern Matching (20% weight)**
- Detect file paths, extensions, directories mentioned
- Match against skill's file pattern globs
- Score: `(matched_patterns / mentioned_files) × confidence_weight`

**4. User History (10% weight)**
- Track successful skill activations in conversation
- Favor recently used skills
- Score: 0.5 baseline, increase by 0.1 per successful use (max 1.0)

### Activation Example

```
User: "How can I optimize my React component's rendering performance?"

Keyword Matching:
- frontend: "React", "component", "rendering" (3/13 match) × 0.85 = 0.20
- performance: "optimize", "performance" (2/10 match) × 0.8 = 0.16

Context Analysis:
- frontend: UI performance optimization (0.9) × 0.4 = 0.36
- performance: Performance optimization (1.0) × 0.4 = 0.40

File Patterns:
- frontend: No files mentioned = 0.0
- performance: No files mentioned = 0.0

History:
- frontend: First use = 0.5 × 0.1 = 0.05
- performance: First use = 0.5 × 0.1 = 0.05

Total Scores:
- frontend: 0.20 + 0.36 + 0.0 + 0.05 = 0.61
- performance: 0.16 + 0.40 + 0.0 + 0.05 = 0.61

Decision: Both below threshold (0.7) individually, but both highly relevant.
Activate both with collaboration pattern "frontend_performance".
```

### Threshold and Limits

**Global Confidence Threshold**: 0.7
- Skills must score ≥ 0.7 to activate
- Exception: Validation chains can override

**Multi-Persona Limit**: 3
- Maximum 3 skills activate simultaneously
- Exception: Validation chains can activate more

**Validation Chains**: Override limits for specific workflows
- `security_validation`: security + backend
- `quality_validation`: qa + refactorer
- `performance_validation`: performance + architect
- `user_experience_validation`: frontend + mentor
- `product_requirement_validation`: po + architect + scribe

## SKILL.md File Format

Skills follow a standard structure:

```markdown
---
name: skill-name
description: Brief description with activation keywords. Use when [scenarios].
allowed-tools: Read, Grep, Glob, Edit, Write  # Optional: Restrict tools
---

# Skill Name

One-sentence summary of skill purpose.

## Identity & Expertise
- Role: Primary role
- Priority Hierarchy: value1 > value2 > value3
- Specializations: List of expertise areas

## Core Principles

### 1. Principle Name
Description and rationale

### 2. Principle Name
Description and rationale

## Auto-Activation Triggers

### High Confidence Triggers (95%+)
- Keywords: List of strong keyword matches
- File patterns: List of file/directory patterns

### Medium Confidence Triggers (80-94%)
- Keywords: Moderate keyword matches
- Contexts: Situational triggers

### Context Clues
- Project indicators
- Task characteristics

## Collaboration Patterns

### Primary Collaborations
- With [persona]: How they work together

### Leadership Areas
- When this skill takes the lead

## Response Patterns

### When Activated for [Scenario]
1. Step-by-step response approach
2. Decision-making process
3. Output format

### Communication Style
- Key characteristics
- Tone and approach

## Specialization Details

### [Specialization 1]
Detailed guidance

### [Specialization 2]
Detailed guidance

## Resources
- See [supporting-doc.md](supporting-doc.md) for details
- External references
```

### Frontmatter Fields

**name** (required): Skill identifier
- Format: `persona-{name}` for personas
- Example: `persona-architect`, `spec-generator`

**description** (required): Description with activation keywords
- Include keywords for auto-activation
- Describe when to use the skill
- Provide usage scenarios

**allowed-tools** (optional): Restrict tool access
- List of allowed tools: Read, Write, Edit, Grep, Glob, Bash
- Omit to allow all tools

### Content Sections

**Identity & Expertise**: Define role and priorities

**Core Principles**: Fundamental beliefs and approaches

**Auto-Activation Triggers**: Keywords and patterns for activation

**Collaboration Patterns**: How to work with other skills

**Response Patterns**: How to respond when activated

**Specialization Details**: Deep dives into expertise areas

**Resources**: Links to supporting files and references

## Skill Composition

### Collaboration Patterns

Pre-defined patterns for multi-skill work:

**Technical Combinations**:
- `architect_performance`: System design with performance budgets
- `security_backend`: Secure server-side development
- `frontend_qa`: User-focused development with testing
- `devops_security`: Infrastructure with security compliance

**Knowledge Transfer**:
- `mentor_scribe`: Educational content creation
- `po_scribe`: Product documentation and requirement specs
- `po_mentor`: Stakeholder education and alignment

**Quality Assurance**:
- `analyzer_refactorer`: Root cause analysis with code improvement
- `qa_security`: Testing with security focus

### Compatibility Matrix

Skills declare compatible partners:

```json
{
  "architect": {
    "compatible_with": ["performance", "security", "devops"]
  },
  "frontend": {
    "compatible_with": ["performance", "qa", "scribe"]
  }
}
```

When multiple skills activate, compatibility ensures coherent responses.

### Priority Reconciliation

When skills have conflicting priorities:

**Resolution Strategy**:
1. Use highest-scoring skill's hierarchy as primary
2. Frame response acknowledging multiple perspectives
3. Present trade-offs explicitly
4. Provide unified recommendation

**Example**:
```
User: "Should I optimize this code now or wait?"

performance (priority: measurement > critical_path):
"Measure first. Profile to identify bottlenecks before optimizing."

refactorer (priority: simplicity > maintainability):
"Simplify first. Clean, simple code is easier to optimize later."

Unified Response:
"From a performance perspective, measure first to avoid premature optimization.
From a code quality perspective, ensure the code is simple and maintainable.
Recommendation: Profile the code. If it's a bottleneck, optimize while
maintaining simplicity. If not, focus on clarity and maintainability."
```

## Progressive Disclosure

Skills use two-tier information architecture:

### Tier 1: SKILL.md (Core Guidance)

Loaded when skill activates:
- Identity and role
- Core principles (3-5)
- Priority hierarchy
- Auto-activation criteria
- Basic response patterns
- Links to supporting files

**Token Usage**: ~500-1500 tokens per skill

### Tier 2: Supporting Files (Detailed Content)

Loaded only when referenced:
- Detailed examples
- Extended tutorials
- Template variations
- Technical deep-dives
- Advanced patterns

**Token Usage**: ~1000-5000 tokens per file (only if needed)

### Example Structure

```
skills/persona-architect/
├── SKILL.md                    # Core (auto-loaded)
├── design-patterns.md          # Supporting (on-demand)
├── architecture-decisions.md   # Supporting (on-demand)
└── examples/
    └── microservices.md       # Supporting (on-demand)
```

**Usage**:
1. User requests architectural guidance
2. persona-architect skill auto-loads SKILL.md (~1200 tokens)
3. User asks about design patterns
4. AI references design-patterns.md (~3000 tokens)
5. Total: ~4200 tokens (vs. ~6000 if all loaded upfront)

**Savings**: 30% reduction in token usage

## Creating New Skills

### Step 1: Define Skill Purpose

```
Skill: infrastructure-as-code
Type: Domain skill
Technology: Terraform, Ansible, CloudFormation
Purpose: Infrastructure automation and IaC best practices
Auto-Activation: Keywords: "terraform", "ansible", "iac", "infrastructure"
```

### Step 2: Create Skill Directory

```bash
mkdir -p skills/domain-infrastructure-as-code
```

### Step 3: Write SKILL.md

```markdown
---
name: infrastructure-as-code
description: Infrastructure as Code (IaC) specialist for Terraform, Ansible, and CloudFormation. Use when working with infrastructure automation, IaC, terraform, ansible, or cloud resources. Activates for infrastructure provisioning and configuration management tasks.
allowed-tools: Read, Grep, Glob, Edit, Write
---

# Infrastructure as Code Skill

Expertise in infrastructure automation using Terraform, Ansible, and CloudFormation.

## Core Principles

### 1. Infrastructure as Code
Treat infrastructure like application code: version controlled, tested, documented.

### 2. Idempotency
Operations should be repeatable without side effects.

### 3. Modularity
Reusable, composable infrastructure components.

## Auto-Activation Triggers

### High Confidence Triggers (95%+)
- Keywords: "terraform", "ansible", "cloudformation", "iac", "infrastructure"
- File patterns: `*.tf`, `*.yml` (ansible), `*.yaml` (CloudFormation)

### Medium Confidence Triggers (80-94%)
- Keywords: "provisioning", "configuration management", "infrastructure automation"
- Project indicators: terraform.tfstate, ansible.cfg, CloudFormation templates

## Specializations

### Terraform Best Practices
- Module organization and reusability
- State management and backends
- Workspaces and environments
- Provider configuration
- Resource dependencies

### Ansible Patterns
- Playbook structure and organization
- Role design and reusability
- Inventory management
- Variable precedence
- Idempotent task design

### CloudFormation Guidelines
- Template structure and parameters
- Stack design and nesting
- Change sets and drift detection
- Cross-stack references

## Collaboration Patterns

### Primary Collaborations
- With devops persona: Infrastructure deployment and CI/CD integration
- With security persona: Infrastructure security and compliance
- With architect persona: Infrastructure design and scalability

## Response Patterns

### When Activated for Infrastructure Design
1. Understand infrastructure requirements
2. Recommend appropriate IaC tool
3. Design modular, reusable components
4. Ensure security and compliance
5. Plan for state management
6. Define testing and validation

### When Activated for Infrastructure Code Review
1. Check idempotency of operations
2. Verify module structure and reusability
3. Review security configurations
4. Validate state management
5. Ensure documentation completeness

## Resources
- See [terraform-patterns.md](terraform-patterns.md) for detailed examples
- See [ansible-best-practices.md](ansible-best-practices.md) for role design
```

### Step 4: Add Supporting Files (Optional)

```bash
# Create detailed examples
touch skills/domain-infrastructure-as-code/terraform-patterns.md
touch skills/domain-infrastructure-as-code/ansible-best-practices.md
```

### Step 5: Test Activation

```bash
# Test with keyword
"Help me write a Terraform module for AWS VPC"

# Expected: infrastructure-as-code skill activates

# Test with file pattern
"Review my main.tf file"

# Expected: infrastructure-as-code skill activates

# Verify token usage
Check that supporting files only load when referenced
```

### Step 6: Update Documentation

```markdown
### Domains
- **domain-react**: React.js development patterns
- **domain-jhipster**: JHipster full-stack applications
- **domain-mulesoft**: MuleSoft Anypoint Platform
- **domain-infrastructure-as-code**: Terraform, Ansible, CloudFormation
```

## Skill Invocation Patterns

### Pattern 1: Implicit Activation

Skills activate without explicit invocation:

```
User: "How should I structure my React components?"

System:
→ Analyzes request
→ Detects keywords: "React", "components", "structure"
→ Scores personas: frontend (0.89), architect (0.72)
→ Auto-activates: frontend + architect skills
→ Provides response with both perspectives
```

### Pattern 2: Explicit Selection (Personas Only)

User manually requests specific personas:

```
User: /buddy:persona security backend - Review this authentication code

System:
→ Bypasses auto-activation scoring
→ Explicitly loads: security + backend personas
→ Applies collaboration pattern: "security_backend"
→ Provides security threat modeling + backend reliability review
```

### Pattern 3: Foundation-Driven Activation

Foundation type determines domain skill:

```
Foundation: MuleSoft v2.0.0

Agent: spec-writer
→ Reads foundation type
→ Auto-activates: mulesoft domain skill
→ Uses MuleSoft-specific spec template
→ Applies DataWeave and RAML patterns
```

### Pattern 4: Cascading Activation

One skill references another's supporting files:

```
User: "Create a spec for API authentication"

System:
→ Auto-activates: spec-generator skill (generates specs)
→ spec-generator references: scribe persona (professional writing)
→ scribe loads supporting files on-demand
→ Produces professional specification document
```

## Performance Considerations

### Token Efficiency

**Without Skills** (manual loading):
- Load all relevant context upfront
- ~10,000-15,000 tokens for complex tasks
- No selective loading

**With Skills** (progressive disclosure):
- Load SKILL.md only (~500-1500 tokens each)
- Load supporting files when referenced (~1000-5000 tokens)
- 30-70% token reduction

**Example**:
```
Task: Create MuleSoft API specification

Manual Approach:
- All MuleSoft patterns: 8,000 tokens
- All spec guidance: 4,000 tokens
- All writing standards: 3,000 tokens
Total: 15,000 tokens

Skills Approach:
- mulesoft/SKILL.md: 1,200 tokens
- spec-generator/SKILL.md: 900 tokens
- scribe/SKILL.md: 800 tokens
- Supporting files (if needed): 2,000 tokens
Total: 4,900 tokens

Savings: 67% reduction
```

### Activation Speed

- Skill scoring: ~100-500ms
- SKILL.md loading: ~50-200ms per skill
- Supporting file loading: ~100-300ms per file
- Total overhead: ~500-2000ms (acceptable)

### Memory Usage

- Skills cached per session
- Supporting files cached when loaded
- Cache cleared between sessions
- Minimal memory footprint (~1-5MB per session)

## Best Practices

### Skill Design

1. **Focused Scope**: One skill = one expertise area
2. **Clear Keywords**: Include obvious activation terms
3. **Progressive Detail**: Core in SKILL.md, details in supporting files
4. **Explicit Priorities**: Define value hierarchy clearly
5. **Collaboration Patterns**: Specify compatible skills

### Content Organization

1. **Two-Tier Structure**: Core + supporting files
2. **Relative Links**: Use markdown links, not absolute paths
3. **Modular Supporting Files**: Separate concerns into different files
4. **Examples as Files**: Keep SKILL.md concise, examples separate

### Auto-Activation Tuning

1. **Keyword Selection**: Choose distinctive, unambiguous terms
2. **Confidence Weights**: Adjust based on skill importance (0.7-0.95)
3. **File Patterns**: Use specific globs, avoid catch-all patterns
4. **Complexity Thresholds**: Set appropriately for skill sophistication

### Collaboration Design

1. **Declare Compatibility**: List which skills work well together
2. **Define Patterns**: Create named collaboration approaches
3. **Priority Alignment**: Ensure compatible skills don't conflict
4. **Cross-Reference**: Link to compatible skills in resources

## Troubleshooting

### Skill Not Activating

**Symptom**: Expected skill doesn't load

**Causes**:
- Keywords don't match user input
- File patterns don't match mentioned files
- Confidence weight too low
- Complexity threshold not met
- Skill below global threshold (0.7)

**Solution**:
1. Review skill description keywords
2. Lower confidence weight if too restrictive
3. Add more keyword variations
4. Adjust complexity threshold
5. Test with various user inputs

### Multiple Skills Conflicting

**Symptom**: Skills provide contradictory guidance

**Causes**:
- Incompatible priorities
- Overlapping expertise areas
- Missing collaboration pattern

**Solution**:
1. Check compatibility declarations
2. Define collaboration pattern for combination
3. Adjust priority hierarchies to align
4. Consider splitting into more focused skills

### Supporting Files Not Loading

**Symptom**: References to supporting files fail

**Causes**:
- Incorrect relative paths
- File doesn't exist
- Markdown link syntax wrong

**Solution**:
1. Use relative paths: `[text](file.md)`
2. Verify file exists in skill directory
3. Test links in markdown previewer
4. Check file permissions

### Token Usage Too High

**Symptom**: Skills consume too many tokens

**Causes**:
- SKILL.md too detailed
- Supporting files auto-loading
- Too many skills activating

**Solution**:
1. Move details to supporting files
2. Ensure progressive disclosure working
3. Adjust multi-persona limit
4. Increase activation threshold

## See Also

- [agents.md](agents.md) - How agents use skills
- [architecture.md](architecture.md) - Skills in system design
- [commands.md](commands.md) - Commands triggering skill activation
- [Claude Code Skills Documentation](https://docs.claude.com/skills) - Official skill system docs

---

**Version**: 5.0.0
**Last Updated**: 2026-01-06
