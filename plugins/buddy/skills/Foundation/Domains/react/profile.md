---
type_key: react
priority: 50
description: React.js application development with modern hooks, component patterns, and ecosystem tooling
---
# Domain: React

React.js frontend application development covering component architecture, hooks, state management, testing, and the broader React ecosystem (Next.js, React Native, etc.).

## Dependencies
- **Runtime**: Node 20+
- **CLI Tools**: npm/yarn/pnpm, Vite (preferred) or Next.js
- **Build**: Vite or Next.js built-in (webpack/CRA for legacy)

## Keywords
React, React 19, component, hook, JSX, TSX, useState, useEffect, useContext, useReducer, Server Components, RSC, use client, actions, props, state, Redux, Zustand, TanStack Query, Next.js, app router, React Router, React Native, Vite, React Testing Library, Vitest, styled-components, Emotion, Tailwind

## Reference Materials
| File | Description | Load When |
|------|-------------|-----------|
| Reference/react-js.md | Comprehensive React code examples, patterns, and API reference | Plan, Implementation |

## Best Practices Summary
- Use functional components with hooks; class components only for legacy code
- Keep components small and focused; prefer composition over inheritance
- Lift state up appropriately; use Context or state management libraries for shared state
- Follow React hooks rules (no conditional hooks, dependency arrays)
- Implement error boundaries and proper cleanup in useEffect
- On React 19 / Next app router, default to Server Components; mark client components with `use client` only when interactivity requires it
