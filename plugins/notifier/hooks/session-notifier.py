#!/usr/bin/env python3
"""
Notifier Plugin - Session Events Hook

This hook is triggered on session start (SessionStart) and session stop (Stop).

Skeleton implementation - add your custom notification logic below.
"""

import sys
import json
import os
from datetime import datetime
from pathlib import Path
from typing import Dict, Any


def load_config() -> Dict[str, Any]:
    """
    Load hook configuration from hooks.json.

    TODO: Customize this to load your specific configuration needs.
    """
    return {
        "enabled": True,
        "session_events": {
            "notify_on_start": True,
            "notify_on_stop": True
        }
    }


def handle_session_start(input_data: Dict[str, Any]) -> None:
    """
    Handle session start notifications.

    TODO: Implement your custom notification logic here.

    Args:
        input_data: Hook input data containing session information

    Example uses:
        - Send welcome notification
        - Initialize session tracking
        - Log session start time
        - Check for updates
        - Load user preferences
    """
    cwd = os.getcwd()
    timestamp = datetime.now().isoformat()

    # TODO: Add your notification logic here
    # Examples:
    # - Send to external service
    # - Display welcome message
    # - Initialize session state
    # - Check for plugin updates

    log_event({
        "event_type": "session_start",
        "working_directory": cwd,
        "timestamp": timestamp
    })


def handle_session_stop(input_data: Dict[str, Any]) -> None:
    """
    Handle session stop notifications.

    TODO: Implement your custom notification logic here.

    Args:
        input_data: Hook input data containing session information

    Example uses:
        - Send goodbye notification
        - Save session state
        - Log session duration
        - Clean up resources
        - Generate session summary
    """
    timestamp = datetime.now().isoformat()

    # TODO: Add your notification logic here
    # Examples:
    # - Send session summary
    # - Save session metrics
    # - Clean up temporary files
    # - Archive session logs

    log_event({
        "event_type": "session_stop",
        "timestamp": timestamp
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


def create_response() -> Dict[str, Any]:
    """
    Create hook response.

    Session hooks don't block anything, so always return success.
    """
    return {
        "decision": "approve",
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

    # Detect hook type from environment or input
    hook_type = input_data.get("hook_type", "")

    # Load configuration
    config = load_config()

    if not config.get("enabled", True):
        # Plugin disabled - approve and continue
        print(json.dumps(create_response()))
        sys.exit(0)

    # Route to appropriate handler
    try:
        if hook_type == "SessionStart" or "session_start" in input_data:
            handle_session_start(input_data)
        elif hook_type == "Stop" or "session_stop" in input_data:
            handle_session_stop(input_data)
        else:
            # Try to infer from context
            # SessionStart hooks typically run first
            # Stop hooks run at session end
            handle_session_start(input_data)
    except Exception as e:
        # Catch all exceptions - don't block the hook
        log_event({
            "event_type": "error",
            "error": str(e),
            "timestamp": datetime.now().isoformat()
        })

    # Always approve for session hooks
    print(json.dumps(create_response()))
    sys.exit(0)


if __name__ == "__main__":
    main()
