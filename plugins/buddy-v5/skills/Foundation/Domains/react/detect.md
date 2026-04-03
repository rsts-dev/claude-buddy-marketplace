# Detection Rules: react

## File Patterns
Files whose presence indicates a React project:
- `src/**/*.jsx` (confidence: high)
- `src/**/*.tsx` with JSX content (confidence: high)
- `src/App.jsx` or `src/App.tsx` (confidence: high)
- `next.config.js` or `next.config.mjs` or `next.config.ts` (confidence: high)
- `src/index.jsx` or `src/index.tsx` (confidence: medium)
- `public/index.html` with React root div (confidence: medium)

## Manifest Checks
Check dependency manifests for React entries:
- `package.json` contains `"react"` in dependencies (confidence: high)
- `package.json` contains `"next"` in dependencies (confidence: high)
- `package.json` contains `"react-dom"` in dependencies (confidence: medium)
- `package.json` contains `"@testing-library/react"` in devDependencies (confidence: medium)
- `package.json` contains `"react-scripts"` in dependencies (confidence: medium)

## Directory Structure
Expected directory patterns:
- `src/components/` (confidence: medium)
- `src/hooks/` (confidence: medium)
- `pages/` or `app/` with Next.js structure (confidence: medium)

## Scoring
- HIGH match: 90 points
- MEDIUM match: 30 points
- LOW match: 10 points
- Activation threshold: 60 points
- Note: A project with `package.json` containing `"react"` immediately scores 90 (threshold met)
