# Setup Plugin Workflows Reference

[< Back to Setup README](../README.md) | [All Docs](../../../docs/README.md)

Per-target detail. Every workflow drives an *official* upstream installer — orchestrating and verifying it rather than re-implementing it.

## Targets

| Command | Skill | Workflow(s) |
|---------|-------|-------------|
| `/setup:lifeos` | LifeOSSetup | InstallLifeOS, RunInterview, Doctor, UpdateLifeOS, UninstallLifeOS |
| `/setup:mulesoft` | MuleSoftSetup | InstallMuleSoftSkills |
| `/setup:salesforce` | SalesforceSetup | InstallSalesforceSkills |
| `/setup:springboot` | SpringBootSetup | InstallSpringBootSkill |

---

# Target: LifeOS (`/setup:lifeos`)

| Workflow | File | Trigger |
|----------|------|---------|
| **InstallLifeOS** | `skills/LifeOSSetup/Workflows/InstallLifeOS.md` | `setup` or no verb, no `~/.claude/LIFEOS/VERSION` |
| **RunInterview** | `skills/LifeOSSetup/Workflows/RunInterview.md` | `interview`, after setup |
| **Doctor** | `skills/LifeOSSetup/Workflows/Doctor.md` | `doctor` |
| **UpdateLifeOS** | `skills/LifeOSSetup/Workflows/UpdateLifeOS.md` | `update` |
| **UninstallLifeOS** | `skills/LifeOSSetup/Workflows/UninstallLifeOS.md` | `uninstall` |

---

## InstallLifeOS

**Trigger**: `/setup:lifeos` or `/setup:lifeos setup` (no existing install)

### Phase A: Prerequisites & Detection
1. Verify `bun`, `git`, `curl`.
2. Check `~/.claude/LIFEOS/VERSION` — if it exists, offer Doctor/Update instead.
3. Dev-tree refusal — never install inside the LifeOS source repo.

### Phase B: Choose Install Path
- AI-native (recommended): follow the official `INSTALL.md`.
- Terminal shortcut (Claude Code, macOS/Linux): `curl -fsSL https://ourlifeos.ai/install.sh | bash`.

### Phase C: Run the Official Installer
- Relay each mutation to the user; confirm `settings.json` backup before hooks are wired.

### Phase D: Verify
- Confirm `~/.claude/LIFEOS/VERSION`; run `Doctor.ts`; relay the capability table.

### Phase E: Onboard
- Transition into RunInterview.

**Key guarantee**: additive, never clobbering; permission before every mutation.

---

## RunInterview

**Trigger**: `/setup:lifeos interview` (setup must have run first)

1. Confirm LifeOS is installed (else route to InstallLifeOS).
2. Name the DA; capture principal identity.
3. Capture TELOS current state → ideal state.
4. Pull in the user's sources (notes, configs, exports) additively.
5. Seed the Pulse dashboard; confirm it reflects real data.

**Key guarantee**: never overwrite a populated USER file without confirmation.

---

## Doctor

**Trigger**: `/setup:lifeos doctor`

1. Confirm LifeOS is installed.
2. Run `bun ~/.claude/LIFEOS/TOOLS/Doctor.ts`.
3. Relay the four capability states — **live / broken / declined / stale**.
4. Offer the exact fix command for anything broken; suggest `update` for anything stale; leave declined capabilities alone.

The doctor is self-describing — relay its output rather than diagnosing by hand.

---

## UpdateLifeOS

**Trigger**: `/setup:lifeos update`

1. Confirm an existing install; record the current version.
2. Re-run the official update path (AI-native `INSTALL.md`, or the terminal shortcut).
3. Verify the new version; run the doctor.

**Key guarantee**: idempotent re-overlay; the USER tree is preserved.

---

## UninstallLifeOS

**Trigger**: `/setup:lifeos uninstall`

1. Confirm an existing install.
2. Confirm intent and scope (keep USER data vs. delete everything).
3. Run the official uninstall — unwire hooks/settings, restore the `settings.json` backup.
4. Verify removal.

**Key guarantee**: never `rm` a foreign file; preserve the USER tree unless the user explicitly opts to delete it.

---

# Target: MuleSoft skills (`/setup:mulesoft`)

## InstallMuleSoftSkills

**File**: `skills/MuleSoftSetup/Workflows/InstallMuleSoftSkills.md`

1. Verify prerequisites — Anypoint CLI v4 (+ API Project plugin), Node, Python 3.
2. Fetch the `mulesoft/mulesoft-dx` README at run time for the current install target.
3. Drive `/plugin marketplace add …` with permission (or the project-local copy alternative).
4. Verify the 8 skills (api-spec-validator, api-doc-generator, api-schema-inferrer, jtbd-generator, jtbd-validator, review-pr, skill-quality-review, validate-imperative-format).

**Key guarantee**: thin wrapper; nothing vendored; permission before every mutation. Pairs with the buddy `mulesoft` domain.

---

# Target: Salesforce skills (`/setup:salesforce`)

## InstallSalesforceSkills

**File**: `skills/SalesforceSetup/Workflows/InstallSalesforceSkills.md`

1. Verify prerequisites — Salesforce CLI (`sf`), Node.
2. Fetch the `forcedotcom/sf-skills` README at run time for the current install method.
3. Drive `/plugin marketplace add forcedotcom/sf-skills` + install `salesforce-development`, or `npx skills add forcedotcom/sf-skills`, with permission.
4. Verify the skills (agentforce-*, dx-code-analyzer-*, dx-org-manage, automation-flow-generate).

**Key guarantee**: thin wrapper; surface the upstream warning that skills change between releases. Pairs with the buddy `salesforce` domain.

---

# Target: Spring Boot / Dr JSkill (`/setup:springboot`)

## InstallSpringBootSkill

**File**: `skills/SpringBootSetup/Workflows/InstallSpringBootSkill.md`

1. Verify prerequisites — Java 25, Node 24.x/npm 11.x, Docker.
2. Fetch the `jdubois/dr-jskill` README at run time for the current install path.
3. Clone the single-skill repo into the skills dir (e.g. `~/.claude/skills/dr-jskill`) with permission; offer `git pull` if it already exists.
4. Verify `SKILL.md` is present/discoverable.

**Key guarantee**: thin wrapper; a missing runtime (Java 25 / Docker) doesn't block installing the skill — report and continue.
