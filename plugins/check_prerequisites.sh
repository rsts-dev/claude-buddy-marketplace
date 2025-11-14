#!/usr/bin/env bash

# check_prerequisites.sh - Prerequisites checker for Claude Buddy Marketplace plugins
# Validates system requirements for both buddy and notifier plugins

set -euo pipefail

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Exit codes
EXIT_SUCCESS=0
EXIT_CRITICAL_FAILURE=1

# Global counters
CRITICAL_FAILURES=0
WARNINGS=0
SUCCESSES=0

# Configuration
VERBOSE=false
JSON_OUTPUT=false
CHECK_PLUGIN=""

# Script directory (where this script is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ============================================================================
# Utility Functions
# ============================================================================

print_header() {
    if [[ "$JSON_OUTPUT" == "false" ]]; then
        echo -e "\n${BOLD}${BLUE}=== $1 ===${NC}\n"
    fi
}

print_success() {
    SUCCESSES=$((SUCCESSES + 1))
    if [[ "$JSON_OUTPUT" == "false" ]]; then
        echo -e "${GREEN}✅${NC} $1"
    fi
}

print_warning() {
    WARNINGS=$((WARNINGS + 1))
    if [[ "$JSON_OUTPUT" == "false" ]]; then
        echo -e "${YELLOW}⚠️${NC}  $1"
        if [[ -n "${2:-}" ]]; then
            echo -e "   ${YELLOW}→${NC} Fix: $2"
        fi
    fi
}

print_error() {
    CRITICAL_FAILURES=$((CRITICAL_FAILURES + 1))
    if [[ "$JSON_OUTPUT" == "false" ]]; then
        echo -e "${RED}❌${NC} $1"
        if [[ -n "${2:-}" ]]; then
            echo -e "   ${RED}→${NC} Fix: $2"
        fi
    fi
}

print_info() {
    if [[ "$VERBOSE" == "true" ]] && [[ "$JSON_OUTPUT" == "false" ]]; then
        echo -e "   ${BLUE}ℹ${NC}  $1"
    fi
}

check_command() {
    local cmd=$1
    local name=${2:-$cmd}

    if command -v "$cmd" &> /dev/null; then
        local version=""
        case "$cmd" in
            python|python3)
                version=$("$cmd" --version 2>&1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || echo "unknown")
                ;;
            uv|git)
                version=$("$cmd" --version 2>&1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1 || echo "unknown")
                ;;
            *)
                version="installed"
                ;;
        esac
        print_success "$name: $version"
        return 0
    else
        return 1
    fi
}

check_python_version() {
    local python_cmd=$1
    local min_version=$2

    if ! command -v "$python_cmd" &> /dev/null; then
        return 1
    fi

    local version=$("$python_cmd" --version 2>&1 | grep -oE '[0-9]+\.[0-9]+' | head -1)
    local major=$(echo "$version" | cut -d. -f1)
    local minor=$(echo "$version" | cut -d. -f2)
    local min_major=$(echo "$min_version" | cut -d. -f1)
    local min_minor=$(echo "$min_version" | cut -d. -f2)

    if [[ "$major" -gt "$min_major" ]] || \
       [[ "$major" -eq "$min_major" && "$minor" -ge "$min_minor" ]]; then
        return 0
    else
        return 1
    fi
}

check_python_package() {
    local package=$1
    local python_cmd=${2:-python3}

    if uv run --no-project "$python_cmd" -c "import $package" 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

# ============================================================================
# System Requirements Checks
# ============================================================================

check_system_requirements() {
    print_header "CRITICAL REQUIREMENTS"

    # Check uv
    if check_command "uv" "uv"; then
        print_info "uv is the Python package manager required for running hooks"
    else
        print_error "uv: not found" "Install uv: curl -LsSf https://astral.sh/uv/install.sh | sh"
    fi

    # Check Python
    local python_cmd=""
    if command -v python3 &> /dev/null; then
        python_cmd="python3"
    elif command -v python &> /dev/null; then
        python_cmd="python"
    fi

    if [[ -n "$python_cmd" ]]; then
        if check_python_version "$python_cmd" "3.11"; then
            local version=$("$python_cmd" --version 2>&1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
            print_success "Python: $version (>= 3.11.0 required for notifier)"
            print_info "Buddy plugin requires Python >= 3.8.0 (satisfied)"
        else
            local version=$("$python_cmd" --version 2>&1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
            if check_python_version "$python_cmd" "3.8"; then
                print_warning "Python: $version (>= 3.11.0 recommended for notifier plugin)" \
                    "Upgrade Python: https://www.python.org/downloads/"
                print_info "Buddy plugin will work (requires >= 3.8.0)"
            else
                print_error "Python: $version (< 3.8.0)" \
                    "Install Python 3.11+: https://www.python.org/downloads/"
            fi
        fi
    else
        print_error "Python: not found" "Install Python 3.11+: https://www.python.org/downloads/"
    fi

    # Check git
    if check_command "git" "git"; then
        print_info "git is required for /buddy:commit command"
    else
        print_error "git: not found" "Install git: https://git-scm.com/downloads"
    fi

    # Check platform
    local platform=$(uname -s)
    print_info "Platform: $platform"
    if [[ "$platform" == "Darwin" ]]; then
        print_info "macOS detected - native TTS (pyttsx3) available"
    elif [[ "$platform" == "Linux" ]]; then
        print_info "Linux detected - TTS support available"
    fi
}

# ============================================================================
# Buddy Plugin Checks
# ============================================================================

check_buddy_plugin() {
    print_header "BUDDY PLUGIN"

    local buddy_dir="$SCRIPT_DIR/buddy"
    local hooks_dir="$buddy_dir/hooks"

    # Check hook scripts
    local hook_scripts=("file-guard.py" "command-validator.py" "auto-formatter.py")
    local missing_scripts=()

    for script in "${hook_scripts[@]}"; do
        if [[ -f "$hooks_dir/$script" ]]; then
            print_success "Hook script: $script"
        else
            missing_scripts+=("$script")
            print_error "Hook script missing: $script" "Check buddy plugin installation"
        fi
    done

    # Check hooks.json
    if [[ -f "$hooks_dir/hooks.json" ]]; then
        if python3 -c "import json; json.load(open('$hooks_dir/hooks.json'))" 2>/dev/null; then
            print_success "Configuration: hooks.json valid"
        else
            print_error "Configuration: hooks.json invalid JSON" "Validate JSON syntax"
        fi
    else
        print_error "Configuration: hooks.json not found" "Check buddy plugin installation"
    fi

    # Check git configuration
    if command -v git &> /dev/null; then
        local git_name=$(git config user.name 2>/dev/null || echo "")
        local git_email=$(git config user.email 2>/dev/null || echo "")

        if [[ -n "$git_name" ]] && [[ -n "$git_email" ]]; then
            print_success "Git config: user.name and user.email set"
            print_info "Name: $git_name, Email: $git_email"
        else
            if [[ -z "$git_name" ]]; then
                print_warning "Git config: user.name not set" \
                    'git config --global user.name "Your Name"'
            fi
            if [[ -z "$git_email" ]]; then
                print_warning "Git config: user.email not set" \
                    'git config --global user.email "you@example.com"'
            fi
        fi
    fi

    # Check optional formatters
    local formatters_found=()
    local formatters_missing=()

    # Python formatters
    for formatter in black autopep8 yapf; do
        if command -v "$formatter" &> /dev/null; then
            formatters_found+=("$formatter")
        else
            formatters_missing+=("$formatter")
        fi
    done

    # JS/TS formatters
    for formatter in prettier eslint; do
        if command -v "$formatter" &> /dev/null; then
            formatters_found+=("$formatter")
        else
            formatters_missing+=("$formatter")
        fi
    done

    # Other formatters
    for formatter in jq rustfmt gofmt goimports; do
        if command -v "$formatter" &> /dev/null; then
            formatters_found+=("$formatter")
        else
            formatters_missing+=("$formatter")
        fi
    done

    if [[ ${#formatters_found[@]} -gt 0 ]]; then
        print_success "Formatters: ${formatters_found[*]}"
    fi

    if [[ ${#formatters_missing[@]} -gt 0 ]]; then
        print_warning "Optional formatters not found: ${formatters_missing[*]}" \
            "Install as needed (auto-formatter will skip unsupported file types)"
    fi

    # Check desktop notifications
    if [[ "$(uname -s)" == "Darwin" ]]; then
        if command -v osascript &> /dev/null; then
            print_success "Notifications: osascript available (macOS)"
        else
            print_warning "Notifications: osascript not found" "Should be available on macOS"
        fi
    elif [[ "$(uname -s)" == "Linux" ]]; then
        if command -v notify-send &> /dev/null; then
            print_success "Notifications: notify-send available (Linux)"
        else
            print_warning "Notifications: notify-send not found" \
                "Install libnotify: sudo apt-get install libnotify-bin (Ubuntu/Debian)"
        fi
    fi

    print_info "Buddy plugin uses only Python standard library (no external packages required)"
}

# ============================================================================
# Notifier Plugin Checks
# ============================================================================

check_notifier_plugin() {
    print_header "NOTIFIER PLUGIN"

    local notifier_dir="$SCRIPT_DIR/notifier"
    local hooks_dir="$notifier_dir/hooks"

    # Check main notification script
    if [[ -f "$hooks_dir/notification.py" ]]; then
        print_success "Hook script: notification.py"
    else
        print_error "Hook script missing: notification.py" "Check notifier plugin installation"
    fi

    # Check hooks.json
    if [[ -f "$hooks_dir/hooks.json" ]]; then
        if python3 -c "import json; json.load(open('$hooks_dir/hooks.json'))" 2>/dev/null; then
            print_success "Configuration: hooks.json valid"
        else
            print_error "Configuration: hooks.json invalid JSON" "Validate JSON syntax"
        fi
    else
        print_error "Configuration: hooks.json not found" "Check notifier plugin installation"
    fi

    # Check utils directory
    if [[ -d "$hooks_dir/utils" ]]; then
        print_success "Utils directory: present"

        # Check subdirectories
        for subdir in tts llm; do
            if [[ -d "$hooks_dir/utils/$subdir" ]]; then
                print_info "Utils/$subdir: present"
            else
                print_warning "Utils/$subdir: missing" "Check notifier plugin installation"
            fi
        done
    else
        print_error "Utils directory: missing" "Check notifier plugin installation"
    fi

    # Check Python packages
    local packages_core=("dotenv:python-dotenv")
    local packages_tts=("elevenlabs:elevenlabs" "openai:openai" "pyttsx3:pyttsx3")
    local packages_llm=("anthropic:anthropic")

    # Check core packages
    for pkg_entry in "${packages_core[@]}"; do
        local import_name="${pkg_entry%%:*}"
        local package_name="${pkg_entry##*:}"

        if check_python_package "$import_name" "python3"; then
            print_success "Python package: $package_name"
        else
            print_warning "Python package missing: $package_name" \
                "uv pip install $package_name"
        fi
    done

    # Check TTS packages
    local tts_available=false
    for pkg_entry in "${packages_tts[@]}"; do
        local import_name="${pkg_entry%%:*}"
        local package_name="${pkg_entry##*:}"

        if check_python_package "$import_name" "python3"; then
            print_success "TTS package: $package_name"
            tts_available=true
        fi
    done

    if [[ "$tts_available" == "false" ]]; then
        print_warning "No TTS packages found (all optional)" \
            "Install one: uv pip install elevenlabs OR uv pip install openai OR uv pip install pyttsx3"
    fi

    # Check LLM packages (optional)
    for pkg_entry in "${packages_llm[@]}"; do
        local import_name="${pkg_entry%%:*}"
        local package_name="${pkg_entry##*:}"

        if check_python_package "$import_name" "python3"; then
            print_success "LLM package: $package_name"
        else
            print_warning "LLM package missing: $package_name (optional)" \
                "uv pip install $package_name"
        fi
    done

    # Check environment variables
    local env_vars=("ELEVENLABS_API_KEY" "OPENAI_API_KEY" "ANTHROPIC_API_KEY" "ENGINEER_NAME")

    for var in "${env_vars[@]}"; do
        if [[ -n "${!var:-}" ]]; then
            print_success "Environment: $var set"
        else
            if [[ "$var" == "ENGINEER_NAME" ]]; then
                print_info "$var not set (optional - used for personalized notifications)"
            else
                print_warning "Environment: $var not set (optional)" \
                    "Set in ~/.zshrc or ~/.bashrc: export $var='your-key'"
            fi
        fi
    done

    # Check log directory
    local log_dir="$HOME/.claude/logs"
    if [[ -d "$log_dir" ]]; then
        if [[ -w "$log_dir" ]]; then
            print_success "Log directory: writable ($log_dir)"
        else
            print_warning "Log directory: not writable ($log_dir)" \
                "chmod u+w $log_dir"
        fi
    else
        if mkdir -p "$log_dir" 2>/dev/null; then
            print_success "Log directory: created ($log_dir)"
        else
            print_warning "Log directory: cannot create ($log_dir)" \
                "mkdir -p $log_dir"
        fi
    fi
}

# ============================================================================
# JSON Output
# ============================================================================

output_json() {
    cat <<EOF
{
  "status": "$([[ $CRITICAL_FAILURES -eq 0 ]] && echo "ready" || echo "failed")",
  "critical_failures": $CRITICAL_FAILURES,
  "warnings": $WARNINGS,
  "successes": $SUCCESSES,
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
}
EOF
}

# ============================================================================
# Summary
# ============================================================================

print_summary() {
    if [[ "$JSON_OUTPUT" == "false" ]]; then
        echo ""
        echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${BOLD}SUMMARY${NC}"
        echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""

        if [[ $CRITICAL_FAILURES -eq 0 ]]; then
            echo -e "${GREEN}✅ All critical requirements met${NC}"
            if [[ $WARNINGS -gt 0 ]]; then
                echo -e "${YELLOW}⚠️  $WARNINGS optional feature(s) unavailable (see warnings above)${NC}"
            fi
            echo ""
            echo -e "${BOLD}Status: ${GREEN}READY${NC}"
        else
            echo -e "${RED}❌ $CRITICAL_FAILURES critical requirement(s) missing${NC}"
            if [[ $WARNINGS -gt 0 ]]; then
                echo -e "${YELLOW}⚠️  $WARNINGS warning(s) found${NC}"
            fi
            echo ""
            echo -e "${BOLD}Status: ${RED}NOT READY${NC}"
        fi

        echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
    else
        output_json
    fi
}

# ============================================================================
# Usage
# ============================================================================

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Prerequisites checker for Claude Buddy Marketplace plugins.

OPTIONS:
    -h, --help              Show this help message
    -v, --verbose           Show detailed information
    -j, --json              Output results in JSON format
    -p, --plugin <name>     Check only specific plugin (buddy|notifier)

EXAMPLES:
    $(basename "$0")                    # Check all plugins
    $(basename "$0") --verbose          # Check with detailed output
    $(basename "$0") --plugin buddy     # Check only buddy plugin
    $(basename "$0") --json             # Output JSON for CI/CD

EXIT CODES:
    0 - All critical requirements met
    1 - One or more critical requirements missing

EOF
}

# ============================================================================
# Main
# ============================================================================

main() {
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                usage
                exit 0
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -j|--json)
                JSON_OUTPUT=true
                shift
                ;;
            -p|--plugin)
                CHECK_PLUGIN="$2"
                shift 2
                ;;
            *)
                echo "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done

    # Validate plugin name if specified
    if [[ -n "$CHECK_PLUGIN" ]] && [[ "$CHECK_PLUGIN" != "buddy" ]] && [[ "$CHECK_PLUGIN" != "notifier" ]]; then
        echo "Invalid plugin name: $CHECK_PLUGIN (must be 'buddy' or 'notifier')"
        exit 1
    fi

    # Print header
    if [[ "$JSON_OUTPUT" == "false" ]]; then
        echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${BOLD}CLAUDE BUDDY MARKETPLACE - PREREQUISITES CHECKER${NC}"
        echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    fi

    # Run checks
    check_system_requirements

    if [[ -z "$CHECK_PLUGIN" ]] || [[ "$CHECK_PLUGIN" == "buddy" ]]; then
        check_buddy_plugin
    fi

    if [[ -z "$CHECK_PLUGIN" ]] || [[ "$CHECK_PLUGIN" == "notifier" ]]; then
        check_notifier_plugin
    fi

    # Print summary
    print_summary

    # Exit with appropriate code
    if [[ $CRITICAL_FAILURES -gt 0 ]]; then
        exit $EXIT_CRITICAL_FAILURE
    else
        exit $EXIT_SUCCESS
    fi
}

main "$@"
