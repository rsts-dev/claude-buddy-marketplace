---
type_key: react
priority: 50
description: React.js application development with modern hooks, component patterns, and ecosystem tooling
---
# Domain: React

React.js frontend application development covering component architecture, hooks, state management, testing, and the broader React ecosystem (Next.js, React Native, etc.).

## Dependencies
- **Runtime**: Node 18+
- **CLI Tools**: npm/yarn/pnpm, create-react-app or vite
- **Build**: webpack, vite, or Next.js built-in

## Keywords
React, component, hook, JSX, TSX, useState, useEffect, useContext, useReducer, props, state, Redux, Zustand, Next.js, React Router, React Native, React Testing Library, styled-components, Emotion

## Reference Materials
| File | Description | Load When |
|------|-------------|-----------|
| Reference/react-js.md | Comprehensive React code examples, patterns, and API reference | Plan, Implementation |

## Best Practices Summary
- Use functional components with hooks; class components only for legacy code
- Keep components small and focused; prefer composition over inheritance
- Lift state up appropriately; use Context or state management libraries for shared state
- Follow React hooks rules (no conditional hooks, dependencies arrays)
- Implement error boundaries and proper cleanup in useEffect
