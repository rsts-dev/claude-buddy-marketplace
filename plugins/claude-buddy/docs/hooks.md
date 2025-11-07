# Hook System

## Overview

Hooks are the safety and automation layer of Claude Buddy, implemented as Python scripts that execute before (pre-tool) or after (post-tool) Claude Code tool calls. They provide file protection, command validation, automatic formatting, and extensible safety mechanisms without requiring changes to core plugin logic.

## Hook Architecture

### Core Concept

Hooks intercept tool calls at two key moments:
- **PreToolUse**: Before a tool executes (validation, blocking)
- **PostToolUse**: After a tool executes (automation, formatting)

### Design Philosophy

1. **Safety-First**: Block dangerous operations before they happen
2. **Transparency**: Clear communication about what's blocked and why
3. **Configurability**: Extensive customization via hooks.json
4. **Zero-Friction**: Hooks work automatically without user intervention
5. **Fail-Safe**: Hook failures don't crash the plugin

## Hook Execution Model

### Execution Flow

```
User/Agent requests tool call (Write, Edit, Bash, etc.)
         ↓
PreToolUse hooks execute (if configured)
  ├─ Read tool_name and tool_input from stdin (JSON)
  ├─ Validate against rules
  ├─ Return decision: approve | block | warn
  └─ If blocked: Tool call prevented, reason shown to user
         ↓
Tool executes (if approved)
         ↓
PostToolUse hooks execute (if configured)
  ├─ Read tool_name, tool_input, and result from stdin (JSON)
  ├─ Perform automation (formatting, logging, etc.)
  └─ Return status
         ↓
Result returned to user/agent
```

### Hook Protocol

Hooks are Python scripts following this protocol:

**Input** (stdin): JSON object
```json
{
  "tool_name": "Write|Edit|Bash|...",
  "tool_input": {
    "file_path": "/path/to/file",
    "command": "bash command",
    ...
  },
  "tool_output": {
    // Only in PostToolUse
    "result": "...",
    "success": true
  }
}
```

**Output** (stdout): JSON object
```json
{
  "decision": "approve|block|warn",
  "reason": "Human-readable explanation",
  "continue": true|false,
  "suppressOutput": true|false
}
```

**Exit Codes**:
- `0`: Success (approve or warn)
- `2`: Blocking (tool call prevented)
- `1`: Error (hook failed, tool call proceeds)

## Hook Registry

Claude Buddy includes 3 core hooks:

### 1. file-guard.py
**Type**: PreToolUse
**Purpose**: Protect sensitive files from modification
**Triggers**: Write, Edit, MultiEdit tools

**Protected File Patterns**:
- Environment files: `.env.*`
- Cryptographic keys: `*.key`, `*.pem`, `*.p12`, `*.pfx`
- Secrets: `*secret*`, `*credential*`, `api-keys.*`, `tokens.*`
- SSH keys: `id_rsa*`, `id_ed25519*`, `authorized_keys`
- Databases: `*.sqlite*`, `*.db`
- Configuration: `.aws/*`, `.ssh/*`, `.docker/config.json`
- Critical system paths: `/etc/passwd`, `/etc/shadow`, `/boot/`, `/sys/`

**Decision Logic**:
1. Check if file is whitelisted → approve
2. Check if file matches sensitive pattern → block
3. Otherwise → approve

**Configuration** (hooks.json):
```json
{
  "config": {
    "file_protection": {
      "enabled": true,
      "additional_patterns": ["*custom-secret*"],
      "whitelist_patterns": ["test-env.txt"],
      "strict_mode": false
    }
  }
}
```

**Example Blocked Operation**:
```
Tool: Write
File: .env.production

Result: 🛡️ File Protection: Access to '.env.production' has been blocked.

Environment files often contain API keys, database credentials, and other secrets.

Claude Buddy protects sensitive files to prevent accidental exposure of:
• API keys and secrets
• Database credentials
• SSH private keys
• Authentication tokens
• Personal data

To modify this file:
1. Use your text editor directly
2. Add to whitelist in .claude/hooks.json
3. Disable protection by setting config.file_protection.enabled = false

Stay secure! 🔒
```

### 2. command-validator.py
**Type**: PreToolUse
**Purpose**: Validate and block dangerous bash commands
**Triggers**: Bash tool

**Dangerous Command Patterns**:

**Destructive Operations**:
- `rm -rf /` - Recursive deletion from root
- `rm -rf *` - Recursive deletion with wildcards
- `sudo rm -rf` - Sudo recursive deletion
- `> /dev/sda` - Direct writes to disk devices

**System Modification**:
- `chmod 777 /` - Overly permissive root permissions
- `chown ... /` - Ownership changes to root
- `fdisk /dev/` - Disk partitioning
- `mkfs.*` - Filesystem creation
- `dd ... of=/dev/` - Direct disk writes

**Remote Code Execution**:
- `curl ... | sh` - Download and execute scripts
- `wget ... | sh` - Download and execute scripts
- `bash <(curl ...)` - Bash from remote scripts
- `nc ... -e` - Netcat with command execution

**Process Manipulation**:
- `kill -9 1` - Killing init process
- `killall -9` - Forceful termination of all

**System Files**:
- `echo ... > /etc/` - Writing to system config
- `> /etc/passwd` - Modifying user accounts
- `> /etc/shadow` - Modifying password file

**Performance Warnings** (non-blocking):
- `find ... -name` → Suggest `rg --files -g pattern`
- `grep` (without pipe) → Suggest `rg` (ripgrep)
- `cat ... | grep` → Suggest `rg pattern file`
- `ls ... | grep` → Suggest shell globbing

**Best Practice Suggestions** (non-blocking):
- `sudo` (non-package manager) → Consider if sudo is necessary
- `chmod 755` → Consider symbolic permissions (`chmod u+x`)
- `git push --force` → Consider `--force-with-lease`

**Configuration** (hooks.json):
```json
{
  "config": {
    "command_validation": {
      "enabled": true,
      "block_dangerous": true,
      "warn_performance": true,
      "suggest_best_practices": true,
      "additional_dangerous_patterns": [],
      "whitelist_patterns": [],
      "strict_mode": false
    }
  }
}
```

**Example Blocked Command**:
```
Command: sudo rm -rf /var/lib/docker

Result: 🚫 Dangerous Command Blocked: 'sudo rm -rf /var/lib/docker'

⚠️ Risk: Sudo recursive deletion

🛡️ Claude Buddy blocked this command to protect your system from potential damage.

💡 Safer approach: Double-check the path and consider using a non-destructive approach first

If you're certain this command is safe:
1. Run it directly in your terminal
2. Add to whitelist in .claude/hooks.json
3. Disable validation by setting config.command_validation.block_dangerous = false

Stay safe! 🔒
```

**Example Performance Warning**:
```
Command: find . -name "*.js"

Result: ⚠️ Command Analysis: 'find . -name "*.js"'

🐌 Performance Suggestions:
  • Consider using 'rg --files -g pattern' for better performance

Command will proceed, but consider the suggestions above.
```

### 3. auto-formatter.py
**Type**: PostToolUse
**Purpose**: Automatically format code files after edits
**Triggers**: Write, Edit, MultiEdit tools

**Supported File Types**:
- Python: `.py` (black, autopep8, yapf)
- JavaScript/TypeScript: `.js`, `.ts`, `.jsx`, `.tsx` (prettier, eslint)
- JSON: `.json` (prettier, jq)
- CSS/SCSS: `.css`, `.scss` (prettier, stylelint)
- Markdown: `.md` (prettier, markdownlint)

**Formatter Detection**:
1. Check if formatters installed in project (package.json, requirements.txt)
2. Check for formatter config files (.prettierrc, .eslintrc, pyproject.toml)
3. Use system-installed formatters as fallback
4. Skip if no formatter available

**Execution Flow**:
1. Tool completes (Write/Edit)
2. Hook receives file path and extension
3. Check if extension is in enabled list
4. Check if file is in excluded patterns
5. Detect available formatter
6. Run formatter on file
7. Report success or failure (non-blocking)

**Configuration** (hooks.json):
```json
{
  "config": {
    "auto_formatting": {
      "enabled": true,
      "extensions": [".py", ".js", ".ts", ".tsx", ".jsx", ".json", ".css", ".scss", ".md"],
      "tools": {
        "python": "black",
        "javascript": "prettier",
        "json": "prettier"
      },
      "exclude_patterns": [
        "node_modules/",
        ".git/",
        "dist/",
        "build/",
        "__pycache__/",
        ".venv/"
      ],
      "create_backup": false
    }
  }
}
```

**Example Formatting**:
```
Tool: Write
File: src/api/auth.js

Result: ✓ File written successfully
        ✓ Auto-formatted with prettier (245ms)
```

## hooks.json Configuration

The `hooks/hooks.json` file defines which hooks execute and how they behave.

### File Structure

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "uv run --no-project python hooks/file-guard.py",
            "description": "Protect sensitive files",
            "enabled": true,
            "timeout": 10
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "uv run --no-project python hooks/auto-formatter.py",
            "description": "Auto-format code files",
            "enabled": true,
            "timeout": 30
          }
        ]
      }
    ],
    "Notification": [],
    "Stop": [],
    "SubagentStop": [],
    "PreCompact": []
  },
  "config": {
    "file_protection": { ... },
    "command_validation": { ... },
    "auto_formatting": { ... },
    "git": { ... },
    "features": { ... },
    "logging": { ... },
    "notifications": { ... }
  }
}
```

### Hook Definition Fields

**matcher** (required): Tool name(s) to hook
- String: `"Write"` (single tool)
- Regex: `"Write|Edit|MultiEdit"` (multiple tools)

**type** (required): Hook execution type
- `"command"`: Run external command/script
- `"inline"`: Execute inline code (future)

**command** (required): Command to execute
- Must read JSON from stdin
- Must write JSON to stdout
- Must exit with appropriate code (0, 1, 2)

**description** (optional): Human-readable description

**enabled** (required): Enable/disable this hook
- `true`: Hook executes
- `false`: Hook skipped

**timeout** (required): Maximum execution time (seconds)
- PreToolUse: Typically 10s
- PostToolUse: Typically 30s
- Hook killed if exceeded

### Configuration Sections

**file_protection**: File guard settings
```json
{
  "enabled": true,
  "additional_patterns": ["*custom-pattern*"],
  "whitelist_patterns": ["test-data.db"],
  "strict_mode": false
}
```

**command_validation**: Command validator settings
```json
{
  "enabled": true,
  "block_dangerous": true,
  "warn_performance": true,
  "suggest_best_practices": true,
  "additional_dangerous_patterns": ["custom-danger"],
  "whitelist_patterns": ["safe-command"],
  "strict_mode": false
}
```

**auto_formatting**: Auto-formatter settings
```json
{
  "enabled": true,
  "extensions": [".py", ".js", ".ts"],
  "tools": {
    "python": "black",
    "javascript": "prettier"
  },
  "exclude_patterns": ["node_modules/"],
  "create_backup": false
}
```

**git**: Git workflow settings
```json
{
  "auto_push": true,
  "branch_protection": ["main", "master"],
  "commit_validation": true,
  "conventional_commits": true,
  "sign_commits": false
}
```

**features**: Global feature toggles
```json
{
  "auto_commit": true,
  "safety_hooks": true,
  "auto_formatting": true,
  "commit_templates": "conventional",
  "documentation_generation": true,
  "code_review": true,
  "personas": true
}
```

**logging**: Logging configuration
```json
{
  "enabled": true,
  "level": "info|warn|error",
  "file_operations": true,
  "command_executions": true,
  "hook_activities": true
}
```

**notifications**: Desktop notification settings
```json
{
  "desktop_alerts": false,
  "protection_events": true,
  "formatting_results": false,
  "commit_summaries": true
}
```

## Hook Execution Environment

### Python Environment

Hooks run in isolated Python environment managed by `uv`:

```bash
# Hook command format
uv run --no-project python hooks/file-guard.py
```

**Benefits**:
- No virtual environment setup required
- Isolated from project dependencies
- Fast execution (uv is performant)
- Consistent Python version

**Requirements**:
- Python 3.8+
- `uv` installed (`pip install uv`)
- Standard library only (no external packages)

### Input/Output Format

**stdin**: JSON with tool information
```python
import sys
import json

# Read input
input_data = json.load(sys.stdin)

tool_name = input_data.get("tool_name")
tool_input = input_data.get("tool_input", {})
tool_output = input_data.get("tool_output", {})  # PostToolUse only
```

**stdout**: JSON with decision
```python
response = {
    "decision": "approve",  # or "block" or "warn"
    "reason": "Why this decision was made",
    "continue": True,       # Allow tool to proceed?
    "suppressOutput": True  # Hide hook output from user?
}

print(json.dumps(response))
```

**stderr**: Error messages (optional)
```python
import sys

print(f"Error: {error_message}", file=sys.stderr)
```

**Exit codes**:
```python
sys.exit(0)  # Success (approve/warn)
sys.exit(2)  # Blocking (tool prevented)
sys.exit(1)  # Error (hook failed)
```

### Timeout Handling

Hooks must complete within timeout:

```json
{
  "timeout": 10  // seconds
}
```

If timeout exceeded:
- PreToolUse: Hook considered failed, tool proceeds
- PostToolUse: Hook killed, tool result unaffected
- Warning logged to user

## Creating Custom Hooks

### Step 1: Define Purpose

```
Hook: dependency-validator
Type: PreToolUse
Purpose: Validate package.json changes don't introduce vulnerable dependencies
Triggers: Write, Edit on package.json
```

### Step 2: Create Hook Script

```bash
touch hooks/dependency-validator.py
chmod +x hooks/dependency-validator.py
```

### Step 3: Implement Hook Protocol

```python
#!/usr/bin/env python3
"""
Dependency Validator Hook
Checks package.json changes for vulnerable dependencies.
"""

import sys
import json
import subprocess
from typing import Dict, Any

def load_config() -> Dict[str, Any]:
    """Load hook configuration."""
    # Load from hooks.json
    config_path = ".claude/hooks.json"
    try:
        with open(config_path, 'r') as f:
            data = json.load(f)
            return data.get("config", {})
    except (FileNotFoundError, json.JSONDecodeError):
        return {}

def check_vulnerabilities(file_path: str) -> tuple[bool, list[str]]:
    """Check for known vulnerabilities in dependencies."""
    if "package.json" not in file_path:
        return False, []

    # Run npm audit (example)
    try:
        result = subprocess.run(
            ["npm", "audit", "--json"],
            capture_output=True,
            timeout=5
        )

        if result.returncode != 0:
            audit_data = json.loads(result.stdout)
            vulnerabilities = audit_data.get("vulnerabilities", {})

            # Check for high/critical
            critical = [v for v in vulnerabilities.values()
                       if v.get("severity") in ["high", "critical"]]

            if critical:
                return True, [f"{v['name']}: {v['title']}"
                            for v in critical]

        return False, []

    except (subprocess.TimeoutExpired, json.JSONDecodeError):
        return False, []

def create_block_response(file_path: str, vulnerabilities: list[str]) -> Dict[str, Any]:
    """Create blocking response."""
    vuln_list = "\n".join(f"  • {v}" for v in vulnerabilities)

    return {
        "decision": "block",
        "reason": f"""🔒 Dependency Vulnerabilities Detected

File: {file_path}

Critical/High vulnerabilities found:
{vuln_list}

Resolve vulnerabilities before proceeding:
1. Run: npm audit fix
2. Review security advisories
3. Update vulnerable packages

Disable this check: config.dependency_validation.enabled = false""",
        "continue": False,
        "suppressOutput": False
    }

def create_approve_response() -> Dict[str, Any]:
    """Create approval response."""
    return {
        "decision": "approve",
        "continue": True,
        "suppressOutput": True
    }

def main():
    """Main hook execution."""
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError:
        sys.exit(1)

    tool_name = input_data.get("tool_name", "")
    tool_input = input_data.get("tool_input", {})

    # Only process Write/Edit tools
    if tool_name not in ["Write", "Edit"]:
        print(json.dumps(create_approve_response()))
        sys.exit(0)

    file_path = tool_input.get("file_path", "")

    # Check if dependency validation enabled
    config = load_config()
    if not config.get("dependency_validation", {}).get("enabled", True):
        print(json.dumps(create_approve_response()))
        sys.exit(0)

    # Check for vulnerabilities
    has_vulns, vulnerabilities = check_vulnerabilities(file_path)

    if has_vulns:
        response = create_block_response(file_path, vulnerabilities)
        print(json.dumps(response))
        sys.exit(2)  # Blocking

    print(json.dumps(create_approve_response()))
    sys.exit(0)

if __name__ == "__main__":
    main()
```

### Step 4: Register in hooks.json

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "uv run --no-project python hooks/dependency-validator.py",
            "description": "Validate dependencies for vulnerabilities",
            "enabled": true,
            "timeout": 10
          }
        ]
      }
    ]
  },
  "config": {
    "dependency_validation": {
      "enabled": true,
      "severity_threshold": "high"
    }
  }
}
```

### Step 5: Test Hook

```bash
# Test with safe file
echo '{"tool_name":"Write","tool_input":{"file_path":"test.txt"}}' | \
  uv run --no-project python hooks/dependency-validator.py

# Test with package.json
echo '{"tool_name":"Write","tool_input":{"file_path":"package.json"}}' | \
  uv run --no-project python hooks/dependency-validator.py

# Verify:
# - Returns valid JSON
# - Exit code correct (0 or 2)
# - Decision logic works
# - Timeout handling works
```

## Hook Design Patterns

### Pattern 1: Pattern Matching

Check if tool input matches patterns:

```python
import re

PATTERNS = [
    r"\.env.*",
    r".*secret.*",
    r".*credential.*"
]

def matches_pattern(text: str) -> bool:
    for pattern in PATTERNS:
        if re.match(pattern, text, re.IGNORECASE):
            return True
    return False

file_path = tool_input.get("file_path", "")
if matches_pattern(file_path):
    # Block or warn
```

### Pattern 2: Configuration Loading

Load settings from hooks.json:

```python
def load_config() -> Dict[str, Any]:
    config_paths = [
        ".claude/hooks.json",
        os.path.expanduser("~/.claude/hooks.json")
    ]

    for path in config_paths:
        if os.path.exists(path):
            try:
                with open(path, 'r') as f:
                    data = json.load(f)
                    return data.get("config", {})
            except (json.JSONDecodeError, IOError):
                continue

    return {}  # Defaults

config = load_config()
enabled = config.get("my_hook", {}).get("enabled", True)
```

### Pattern 3: Whitelist/Blacklist

Allow exceptions to rules:

```python
def is_whitelisted(file_path: str, config: Dict) -> bool:
    whitelist = config.get("whitelist_patterns", [])
    for pattern in whitelist:
        if re.match(pattern, file_path):
            return True
    return False

if is_whitelisted(file_path, config):
    # Approve
```

### Pattern 4: Logging

Track hook activity:

```python
def log_event(event: str, data: Dict, config: Dict):
    if not config.get("logging", {}).get("enabled", True):
        return

    log_dir = ".claude/logs"
    os.makedirs(log_dir, exist_ok=True)

    log_file = os.path.join(log_dir, "hooks.log")

    import datetime
    timestamp = datetime.datetime.now().isoformat()

    log_entry = {
        "timestamp": timestamp,
        "event": event,
        "data": data
    }

    with open(log_file, "a") as f:
        f.write(json.dumps(log_entry) + "\n")
```

### Pattern 5: Notifications

Alert user of important events:

```python
def send_notification(title: str, message: str):
    import platform
    system = platform.system()

    try:
        if system == "Darwin":  # macOS
            import subprocess
            script = f'display notification "{message}" with title "{title}"'
            subprocess.run(["osascript", "-e", script], timeout=2)
        elif system == "Linux":
            subprocess.run(["notify-send", title, message], timeout=2)
    except Exception:
        pass  # Fail silently
```

## Best Practices

### Hook Development

1. **Single Responsibility**: Each hook checks one thing
2. **Fast Execution**: Complete within timeout (10-30s)
3. **Fail-Safe**: Errors shouldn't crash plugin
4. **Clear Messages**: Explain why action blocked
5. **Configurable**: Respect hooks.json settings

### Error Handling

1. **Validate Input**: Check JSON structure
2. **Handle Timeouts**: External commands timeout
3. **Graceful Degradation**: Continue on hook failure
4. **Log Errors**: Record failures for debugging
5. **User Communication**: Explain errors clearly

### Performance

1. **Quick Checks**: Pattern matching before expensive ops
2. **Caching**: Cache results when safe
3. **Early Exit**: Approve fast, block only when necessary
4. **Async Operations**: Don't block on slow I/O
5. **Resource Limits**: Respect memory and CPU

### Security

1. **Input Validation**: Sanitize tool inputs
2. **No Shell Injection**: Use subprocess safely
3. **Limited Scope**: Only access necessary files
4. **Principle of Least Privilege**: Run with minimal permissions
5. **Audit Trail**: Log security-relevant actions

## Troubleshooting

### Hook Not Executing

**Symptom**: Hook doesn't run when expected

**Causes**:
- Hook not registered in hooks.json
- `enabled: false` in configuration
- Matcher doesn't match tool name
- Hook file not executable

**Solution**:
1. Verify hooks.json registration
2. Check enabled flag
3. Verify matcher regex
4. Check file permissions: `chmod +x hooks/my-hook.py`

### Hook Timeout

**Symptom**: Hook killed after timeout

**Causes**:
- External command too slow
- Infinite loop in hook logic
- Network request hanging

**Solution**:
1. Increase timeout in hooks.json
2. Add timeout to subprocess calls
3. Review hook logic for loops
4. Use async operations

### Hook Blocking Incorrectly

**Symptom**: Safe operations blocked

**Causes**:
- Overly broad patterns
- Missing whitelist entries
- Configuration mismatch

**Solution**:
1. Refine patterns to be more specific
2. Add to whitelist in hooks.json
3. Review configuration values
4. Test with various inputs

### Hook Output Invalid

**Symptom**: Hook returns invalid JSON

**Causes**:
- Print statements in hook code
- Syntax error in JSON
- Unicode encoding issues

**Solution**:
1. Remove debug print statements
2. Validate JSON structure
3. Use `json.dumps()` for output
4. Handle unicode: `ensure_ascii=False`

## See Also

- [architecture.md](architecture.md) - System design and hook integration
- [commands.md](commands.md) - Commands that trigger hooks
- [agents.md](agents.md) - Agents whose actions are validated by hooks
- [Python Hook Protocol](https://docs.claude.com/hooks) - Claude Code hook documentation

---

**Version**: 4.0.0
**Last Updated**: 2025-11-07
