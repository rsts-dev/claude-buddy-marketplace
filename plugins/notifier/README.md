# Notifier Plugin

> Custom notification system for Claude Code events

Get notifications for file operations, command execution, session tracking, and error monitoring. This plugin provides a skeleton implementation that you can customize for your specific notification needs.

## Features

- **File Operations** - Track Write, Edit, and MultiEdit operations
- **Command Execution** - Monitor Bash command completion
- **Session Events** - Track session start and stop
- **Error Detection** - Pre-validate operations and detect potential errors
- **Customizable** - Skeleton implementation ready for your logic

## Architecture

The plugin uses Claude Code hooks to intercept events at different stages:

### Hook Types

1. **PostToolUse** (file-notifier.py)
   - Triggers AFTER file operations and commands complete
   - Cannot block operations (already executed)
   - Use for: Notifications, logging, automation

2. **SessionStart/Stop** (session-notifier.py)
   - Triggers at session lifecycle events
   - Use for: Welcome messages, cleanup, summaries

3. **PreToolUse** (error-notifier.py)
   - Triggers BEFORE operations execute
   - CAN block operations if validation fails
   - Use for: Validation, safety checks, error prevention

## Prerequisites

### System Requirements

**Required:**
- **Claude Code**: Latest version
- **Python**: ≥3.8
- **uv**: Python package manager

## Installation

### Via Claude Code Plugin System

**1. Add the marketplace:**
```bash
/plugin marketplace add rsts-dev/claude-buddy-marketplace
```

**2. Install the plugin:**
```bash
/plugin install notifier@claude-buddy-marketplace
```

**3. Restart Claude Code**

The plugin will be automatically activated on next session.

### Verify Installation

Check that the plugin is installed:
```bash
/plugin list
```

You should see `notifier` in the installed plugins list.

## Configuration

Edit `hooks/hooks.json` to customize hook behavior:

```json
{
  "config": {
    "notifier": {
      "enabled": true,
      "file_operations": {
        "notify_on_write": true,
        "notify_on_edit": true,
        "notify_on_multi_edit": true
      },
      "command_execution": {
        "notify_on_success": true,
        "notify_on_failure": true
      },
      "session_events": {
        "notify_on_start": true,
        "notify_on_stop": true
      },
      "error_events": {
        "notify_on_tool_error": true,
        "notify_on_validation_error": true
      }
    }
  }
}
```

### Enable/Disable Hooks

To temporarily disable a hook, edit `hooks/hooks.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "enabled": false,  // Set to false to disable
            ...
          }
        ]
      }
    ]
  }
}
```

## Customization

The plugin provides skeleton implementations that you need to customize for your specific needs.

### Implementing File Operation Notifications

Edit `hooks/file-notifier.py`:

```python
def handle_file_operation(tool_name: str, tool_input: Dict[str, Any], tool_output: Dict[str, Any]) -> None:
    """
    Handle file operation notifications (Write, Edit, MultiEdit).

    TODO: Implement your custom notification logic here.
    """
    file_path = tool_input.get("file_path", "unknown")
    success = tool_output.get("success", False)

    # YOUR CUSTOM LOGIC HERE
    # Examples:
    # - Send webhook to Slack/Discord
    # - Write to database
    # - Send email notification
    # - Update dashboard
    # - Trigger CI/CD pipeline
```

### Implementing Session Notifications

Edit `hooks/session-notifier.py`:

```python
def handle_session_start(input_data: Dict[str, Any]) -> None:
    """Handle session start notifications."""

    # YOUR CUSTOM LOGIC HERE
    # Examples:
    # - Send welcome message
    # - Initialize session tracking
    # - Load user preferences
    # - Check for updates
```

### Implementing Error Detection

Edit `hooks/error-notifier.py`:

```python
def validate_file_operation(tool_name: str, tool_input: Dict[str, Any]) -> Tuple[bool, Optional[str]]:
    """Validate file operations before they execute."""

    file_path = tool_input.get("file_path", "")

    # YOUR CUSTOM VALIDATION HERE
    # Examples:
    # - Check file path format
    # - Validate file size
    # - Prevent system file operations
    # - Check permissions

    if file_path.startswith("/etc/"):
        return False, "Cannot write to system directory"

    return True, None
```

## Hook Input/Output Reference

### Hook Input (from stdin)

```json
{
  "tool_name": "Write|Edit|Bash|...",
  "tool_input": {
    "file_path": "/path/to/file",
    "content": "...",
    "command": "..."
  },
  "tool_output": {
    "success": true,
    "result": "...",
    "error": "..."
  }
}
```

### Hook Output (to stdout)

```json
{
  "decision": "approve|block",
  "reason": "Explanation if blocking",
  "continue": true|false,
  "suppressOutput": false
}
```

**Note:** Only PreToolUse hooks can block operations by returning `"decision": "block"`.

## Examples

### Example 1: Webhook Notification

Send file changes to a webhook:

```python
import requests

def handle_file_operation(tool_name: str, tool_input: Dict[str, Any], tool_output: Dict[str, Any]) -> None:
    file_path = tool_input.get("file_path", "")

    requests.post("https://your-webhook.com/notify", json={
        "tool": tool_name,
        "file": file_path,
        "timestamp": datetime.now().isoformat()
    })
```

### Example 2: Slack Notification

Send session start to Slack:

```python
from slack_sdk import WebClient

def handle_session_start(input_data: Dict[str, Any]) -> None:
    client = WebClient(token=os.environ["SLACK_TOKEN"])
    client.chat_postMessage(
        channel="#notifications",
        text="Claude Code session started! :rocket:"
    )
```

### Example 3: Block Dangerous Commands

Prevent destructive operations:

```python
def validate_bash_command(tool_input: Dict[str, Any]) -> Tuple[bool, Optional[str]]:
    command = tool_input.get("command", "")

    if "rm -rf /" in command:
        return False, "Dangerous command blocked!"

    return True, None
```

## Logging

All hooks write events to `~/.claude/logs/notifier.log` by default.

View logs:
```bash
tail -f ~/.claude/logs/notifier.log
```

Example log entry:
```json
{"event_type": "file_operation", "tool": "Write", "file": "/path/to/file.py", "success": true, "timestamp": "2025-01-10T15:30:00"}
```

## Troubleshooting

### Hooks Not Executing

1. Verify plugin is installed: `/plugin list`
2. Check hooks are enabled in `hooks/hooks.json`
3. Restart Claude Code
4. Check Python and uv are installed

### Errors in Hook Execution

Check Claude Code output for hook errors. Common issues:
- Python not in PATH
- uv not installed
- Syntax errors in Python scripts
- Missing dependencies

### Testing Hooks

Test file operation hook:
```bash
# Make a simple edit to trigger the hook
# Check ~/.claude/logs/notifier.log for events
```

## File Structure

```
plugins/notifier/
├── .claude-plugin/
│   └── plugin.json           # Plugin metadata
├── hooks/
│   ├── hooks.json            # Hook configuration
│   ├── file-notifier.py      # File operations & commands
│   ├── session-notifier.py   # Session events
│   └── error-notifier.py     # Error detection
└── README.md                 # This file
```

## Support

- **GitHub Issues**: [Report bugs](https://github.com/rsts-dev/claude-buddy-marketplace/issues)
- **Discussions**: [Ask questions](https://github.com/rsts-dev/claude-buddy-marketplace/discussions)

## License

MIT License

Copyright (c) 2025 Notifier Contributors

---

**Notifier Plugin v1.0.0** - Custom Notification System for Claude Code
