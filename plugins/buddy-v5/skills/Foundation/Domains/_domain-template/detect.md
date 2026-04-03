# Detection Rules: {domain}

## File Patterns
Files whose presence indicates this domain:
- `{file-or-glob-pattern}` (confidence: high)
- `{another-pattern}` (confidence: medium)

## Manifest Checks
Check dependency manifests for domain-specific entries:
- `{manifest-file}` contains `{search-pattern}` (confidence: high)
- `{manifest-file}` contains `{search-pattern}` (confidence: medium)

## Directory Structure
Expected directory patterns:
- `{directory-pattern}` (confidence: medium)

## Scoring
- HIGH match: 90 points
- MEDIUM match: 30 points
- LOW match: 10 points
- Activation threshold: 60 points
- If multiple HIGH matches: sum all points
