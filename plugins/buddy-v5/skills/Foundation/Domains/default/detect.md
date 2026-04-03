# Detection Rules: default

The default domain always matches with the lowest possible score. It serves as the fallback when no other domain meets its activation threshold.

## File Patterns
No specific file patterns — matches any project.

## Manifest Checks
No specific manifest checks.

## Directory Structure
No specific directory structure requirements.

## Scoring
- Always returns: 1 point (guaranteed minimum match)
- Priority: 0 (lowest — any other domain with threshold met takes precedence)
