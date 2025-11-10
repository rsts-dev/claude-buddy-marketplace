#!/usr/bin/env python3
"""
Notifier Plugin - File Operations & Command Execution Hook

This PostToolUse hook is triggered after file operations (Write, Edit, MultiEdit)
and command executions (Bash) complete.

Skeleton implementation - add your custom notification logic below.
"""

import sys
import json
from datetime import datetime
from pathlib import Path
from typing import Dict, Any, Optional


def load_config() -> Dict[str, Any]:
    """
    Load hook configuration from hooks.json.

    TODO: Customize this to load your specific configuration needs.
    """
    # Default configuration
    return {
        "enabled": True,
        "file_operations": {
            "notify_on_write": True,
            "notify_on_edit": True,
            "notify_on_multi_edit": True
        },
        "command_execution": {
            "notify_on_success": True,
            "notify_on_failure": True
        }
    }


def handle_file_operation(tool_name: str, tool_input: Dict[str, Any], tool_output: Dict[str, Any]) -> None:
    """
    Handle file operation notifications (Write, Edit, MultiEdit).

    TODO: Implement your custom notification logic here.

    Args:
        tool_name: Name of the tool (Write, Edit, or MultiEdit)
        tool_input: Input parameters to the tool (contains file_path, content, etc.)
        tool_output: Output from the tool (success status, errors, etc.)

    Example:
        tool_input = {"file_path": "/path/to/file.py", "content": "..."}
        tool_output = {"success": True}
    """
    file_path = tool_input.get("file_path", "unknown")
    success = tool_output.get("success", False)

    # TODO: Add your notification logic here
    # Examples:
    # - Send to external service (webhook, API)
    # - Write to log file
    # - Send email/SMS
    # - Update dashboard
    # - Trigger other automation

    log_event({
        "event_type": "file_operation",
        "tool": tool_name,
        "file": file_path,
        "success": success,
        "timestamp": datetime.now().isoformat()
    })


def handle_command_execution(tool_input: Dict[str, Any], tool_output: Dict[str, Any]) -> None:
    """
    Handle command execution notifications (Bash).

    TODO: Implement your custom notification logic here.

    Args:
        tool_input: Input parameters (contains command string)
        tool_output: Output from command (exit code, stdout, stderr)

    Example:
        tool_input = {"command": "npm install"}
        tool_output = {"exit_code": 0, "stdout": "...", "stderr": ""}
    """
    command = tool_input.get("command", "unknown")
    exit_code = tool_output.get("exit_code", -1)

    # TODO: Add your notification logic here

    log_event({
        "event_type": "command_execution",
        "command": command,
        "exit_code": exit_code,
        "timestamp": datetime.now().isoformat()
    })


def log_event(event: Dict[str, Any]) -> None:
    """
    Log event to file.

    TODO: Customize logging behavior or remove if not needed.
    """
    log_file = Path.home() / ".claude" / "logs" / "notifier.log"
    log_file.parent.mkdir(parents=True, exist_ok=True)

    try:
        with open(log_file, "a") as f:
            f.write(json.dumps(event) + "\n")
    except IOError as e:
        # Silently fail - don't block the tool
        pass


def create_response(approve: bool = True, reason: str = "") -> Dict[str, Any]:
    """
    Create hook response.

    For PostToolUse hooks, the tool has already executed, so we always approve.
    """
    return {
        "decision": "approve",
        "reason": reason,
        "continue": True,
        "suppressOutput": False
    }


def main():
    """Main hook execution."""
    try:
        # Read input from stdin
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError:
        # Invalid input - approve and continue
        print(json.dumps(create_response()))
        sys.exit(0)

    # Extract tool information
    tool_name = input_data.get("tool_name", "")
    tool_input = input_data.get("tool_input", {})
    tool_output = input_data.get("tool_output", {})

    # Load configuration
    config = load_config()

    if not config.get("enabled", True):
        # Plugin disabled - approve and continue
        print(json.dumps(create_response()))
        sys.exit(0)

    # Route to appropriate handler
    try:
        if tool_name in ["Write", "Edit", "MultiEdit"]:
            handle_file_operation(tool_name, tool_input, tool_output)
        elif tool_name == "Bash":
            handle_command_execution(tool_input, tool_output)
    except Exception as e:
        # Catch all exceptions - don't block the tool
        log_event({
            "event_type": "error",
            "error": str(e),
            "timestamp": datetime.now().isoformat()
        })

    # Always approve for PostToolUse hooks
    print(json.dumps(create_response()))
    sys.exit(0)


if __name__ == "__main__":
    main()
