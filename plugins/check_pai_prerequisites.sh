#!/usr/bin/env bash

# check_pai_prerequisites.sh - Pre-flight check for PAI setup plugin
# Verifies that the minimum requirements are met to install and invoke
# the pai:setup plugin. Once PAI is installed, its own install.sh handles
# all further dependency installation (bun, git, etc).

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

# ============================================================================
# PAI Setup Prerequisites
# ============================================================================

check_pai_prerequisites() {
    print_header "PAI SETUP PREREQUISITES"

    # Claude Code — required to invoke /pai:setup
    if command -v claude &> /dev/null; then
        print_success "Claude Code: installed"
    else
        print_error "Claude Code: not found" \
            "Install from https://claude.ai/code or via npm: npm install -g @anthropic-ai/claude-code"
    fi

    # curl — required by PAI's install.sh bootstrap
    if command -v curl &> /dev/null; then
        print_success "curl: installed"
    else
        print_error "curl: not found" \
            "Install curl (required by PAI installer)"
    fi

    # bash — PAI install.sh is a bash script
    if command -v bash &> /dev/null; then
        local bash_version=$(bash --version 2>&1 | head -1 | grep -oE '[0-9]+\.[0-9]+' | head -1 || echo "unknown")
        print_success "bash: $bash_version"
    else
        print_error "bash: not found" \
            "bash is required to run the PAI installer"
    fi

    # git — checked by PAI install.sh, but good to flag early
    if command -v git &> /dev/null; then
        local git_version=$(git --version 2>&1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1 || echo "unknown")
        print_success "git: $git_version"
        print_info "PAI install.sh will install git if missing, but having it pre-installed avoids prompts"

        # Check git user config
        local git_name=$(git config user.name 2>/dev/null || echo "")
        local git_email=$(git config user.email 2>/dev/null || echo "")
        if [[ -n "$git_name" ]] && [[ -n "$git_email" ]]; then
            print_info "Git user: $git_name <$git_email>"
        else
            print_warning "Git user not fully configured" \
                'git config --global user.name "Your Name" && git config --global user.email "you@example.com"'
        fi
    else
        print_warning "git: not found (PAI installer will attempt to install it)" \
            "Pre-install: https://git-scm.com/downloads"
    fi

    # gh CLI — optional, used by buddy:commit for PRs
    if command -v gh &> /dev/null; then
        local gh_version=$(gh --version 2>&1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1 || echo "unknown")
        print_success "gh CLI: $gh_version (optional, used for PR creation)"
    else
        print_warning "gh CLI: not found (optional, needed for /buddy:commit PRs)" \
            "Install: https://cli.github.com"
    fi

    # bun — required by PAI, install.sh will install it if missing
    if command -v bun &> /dev/null; then
        local bun_version=$(bun --version 2>/dev/null || echo "unknown")
        print_success "bun: $bun_version"
    else
        print_warning "bun: not found (PAI installer will install it automatically)" \
            "Pre-install: https://bun.sh"
    fi

    # Platform check
    local platform=$(uname -s)
    local arch=$(uname -m)
    case "$platform" in
        Darwin|Linux)
            print_success "Platform: $platform ($arch)"
            ;;
        *)
            print_error "Unsupported platform: $platform" \
                "PAI requires macOS or Linux"
            ;;
    esac
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
            echo -e "${GREEN}✅ Ready to install PAI${NC}"
            if [[ $WARNINGS -gt 0 ]]; then
                echo -e "${YELLOW}⚠️  $WARNINGS item(s) not found — PAI installer will handle them${NC}"
            fi
            echo ""
            echo -e "${BOLD}Next step:${NC} Run ${BLUE}/pai:setup${NC} in Claude Code"
        else
            echo -e "${RED}❌ $CRITICAL_FAILURES critical requirement(s) missing${NC}"
            echo ""
            echo -e "${BOLD}Status: ${RED}NOT READY${NC} — fix the errors above before running /pai:setup"
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

Pre-flight check for PAI setup plugin installation.

Verifies the minimum requirements to install and invoke the pai:setup
plugin via Claude Code. Once PAI is installed, its own installer handles
all further dependencies (bun, git, etc).

OPTIONS:
    -h, --help              Show this help message
    -v, --verbose           Show detailed information
    -j, --json              Output results in JSON format

EXAMPLES:
    $(basename "$0")                    # Run pre-flight check
    $(basename "$0") --verbose          # Check with detailed output
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
            *)
                echo "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done

    if [[ "$JSON_OUTPUT" == "false" ]]; then
        echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${BOLD}PAI SETUP — PRE-FLIGHT CHECK${NC}"
        echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    fi

    check_pai_prerequisites
    print_summary

    if [[ $CRITICAL_FAILURES -gt 0 ]]; then
        exit $EXIT_CRITICAL_FAILURE
    else
        exit $EXIT_SUCCESS
    fi
}

main "$@"
