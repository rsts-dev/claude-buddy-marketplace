#!/usr/bin/env python3
"""
Notifier Plugin - Error Detection Hook

This PreToolUse hook can inspect tool calls before execution and detect
potential errors or validate parameters.

Skeleton implementation - add your custom error detection logic below.
"""

import sys
import json
from datetime import datetime
from pathlib import Path
from typing import Dict, Any, Optional, Tuple


def load_config() -> Dict[str, Any]:
    """
    Load hook configuration from hooks.json.

    TODO: Customize this to load your specific configuration needs.
    """
    return {
        "enabled": True,
        "error_events": {
            "notify_on_tool_error": True,
            "notify_on_validation_error": True
        },
        "validation": {
            "check_file_paths": True,
            "check_dangerous_commands": True,
            "check_large_files": False
        }
    }


def validate_file_operation(tool_name: str, tool_input: Dict[str, Any]) -> Tuple[bool, Optional[str]]:
    """
    Validate file operations before they execute.

    TODO: Implement your custom validation logic here.

    Args:
        tool_name: Name of the tool (Write, Edit, MultiEdit)
        tool_input: Input parameters to the tool

    Returns:
        Tuple of (is_valid, error_message)
        - (True, None) if valid
        - (False, "error message") if invalid

    Example validations:
        - Check if file path is valid
        - Check if file is too large
        - Check if file is in protected directory
        - Check for dangerous operations
    """
    file_path = tool_input.get("file_path", "")

    # TODO: Add your validation logic here
    # Examples:
    # - Validate file path format
    # - Check file size limits
    # - Prevent operations on system files
    # - Check for overwriting important files

    # Example: Detect if trying to write to /etc (system directory)
    if file_path.startswith("/etc/"):
        return False, "Cannot write to system directory /etc/"

    return True, None


def validate_bash_command(tool_input: Dict[str, Any]) -> Tuple[bool, Optional[str]]:
    """
    Validate bash commands before they execute.

    TODO: Implement your custom validation logic here.

    Args:
        tool_input: Input parameters containing command

    Returns:
        Tuple of (is_valid, error_message)

    Example validations:
        - Check for dangerous commands (rm -rf /, dd, etc.)
        - Check for sudo usage
        - Validate command syntax
        - Check for known malicious patterns
    """
    command = tool_input.get("command", "")

    # TODO: Add your validation logic here
    # Examples:
    # - Block dangerous commands
    # - Warn about destructive operations
    # - Check for malicious patterns
    # - Validate syntax

    # Example: Detect dangerous patterns
    dangerous_patterns = ["rm -rf /", ":(){ :|:& };:", "mkfs", "dd if=/dev/zero"]
    for pattern in dangerous_patterns:
        if pattern in command:
            return False, f"Dangerous command pattern detected: {pattern}"

    return True, None


def handle_validation_error(tool_name: str, error_message: str) -> None:
    """
    Handle validation errors.

    TODO: Implement your custom error notification logic here.

    Args:
        tool_name: Name of the tool that failed validation
        error_message: Description of the validation error

    Example actions:
        - Send alert notification
        - Log error
        - Update dashboard
        - Send email/SMS
        - Trigger incident response
    """
    # TODO: Add your notification logic here

    log_event({
        "event_type": "validation_error",
        "tool": tool_name,
        "error": error_message,
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
    except IOError:
        # Silently fail - don't block the hook
        pass


def create_response(approve: bool = True, reason: str = "", block: bool = False) -> Dict[str, Any]:
    """
    Create hook response.

    For PreToolUse hooks, we can block execution by returning decision="block".

    Args:
        approve: Whether to approve the tool execution
        reason: Reason for the decision (shown to user if blocking)
        block: Whether to completely block the tool execution

    Returns:
        Hook response dictionary
    """
    if block:
        return {
            "decision": "block",
            "reason": reason,
            "continue": False,
            "suppressOutput": False
        }

    return {
        "decision": "approve",
        "reason": reason if reason else "",
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

    # Load configuration
    config = load_config()

    if not config.get("enabled", True):
        # Plugin disabled - approve and continue
        print(json.dumps(create_response()))
        sys.exit(0)

    # Validate based on tool type
    try:
        is_valid = True
        error_message = None

        if tool_name in ["Write", "Edit", "MultiEdit"]:
            is_valid, error_message = validate_file_operation(tool_name, tool_input)
        elif tool_name == "Bash":
            is_valid, error_message = validate_bash_command(tool_input)

        if not is_valid:
            # Validation failed - handle error and optionally block
            handle_validation_error(tool_name, error_message)

            # TODO: Decide if you want to block the operation
            # For now, we just warn but don't block
            print(json.dumps(create_response(
                approve=True,
                reason=f"Warning: {error_message}",
                block=False  # Change to True to actually block
            )))
            sys.exit(0)

    except Exception as e:
        # Catch all exceptions - don't block the tool
        log_event({
            "event_type": "error",
            "error": str(e),
            "timestamp": datetime.now().isoformat()
        })

    # Validation passed - approve
    print(json.dumps(create_response()))
    sys.exit(0)


if __name__ == "__main__":
    main()
