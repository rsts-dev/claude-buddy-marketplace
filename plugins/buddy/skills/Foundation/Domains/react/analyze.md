# Domain Analysis: react

Executed by CreateFoundation after React domain detection. Performs deep analysis of the React project structure, ecosystem, and patterns.

## Analysis Steps

### Step 1: Package Configuration
Read and parse React project configuration:
```bash
cat package.json 2>/dev/null
```
Extract:
- React version (16.x, 17.x, 18.x, 19.x)
- React DOM version
- Build tool (react-scripts, vite, next, webpack)
- State management library (redux, zustand, jotai, recoil, mobx)
- Routing library (react-router, next/router, tanstack-router)
- Styling approach (styled-components, emotion, tailwindcss, css-modules)
- Testing framework (jest, vitest, cypress, playwright)
- TypeScript usage

### Step 2: Architecture Assessment
```bash
# Component structure
find src -name "*.jsx" -o -name "*.tsx" 2>/dev/null | head -30

# Hooks directory
ls src/hooks/ 2>/dev/null

# State management
ls src/store/ src/state/ src/redux/ 2>/dev/null

# API layer
ls src/api/ src/services/ src/lib/ 2>/dev/null

# Next.js structure
ls pages/ app/ 2>/dev/null
ls src/pages/ src/app/ 2>/dev/null
```
Determine:
- Single-page app vs server-rendered (Next.js)
- Component organization (feature-based, type-based, atomic design)
- State management architecture
- API integration pattern (REST, GraphQL, tRPC)

### Step 3: Build Configuration
```bash
# Build tool config
cat vite.config.* 2>/dev/null
cat next.config.* 2>/dev/null
cat craco.config.* 2>/dev/null
cat webpack.config.* 2>/dev/null

# TypeScript config
cat tsconfig.json 2>/dev/null

# Testing config
cat jest.config.* 2>/dev/null
cat vitest.config.* 2>/dev/null
```

### Step 4: Testing Patterns
```bash
# Find test files
find src -name "*.test.*" -o -name "*.spec.*" 2>/dev/null | head -20

# Check test setup
cat src/setupTests.* 2>/dev/null
```

## Output

Append these sections to the foundation draft:

### Technology Stack
- **Framework**: React {version} {with Next.js {version} if detected}
- **Language**: {JavaScript / TypeScript}
- **Build Tool**: {vite / react-scripts / next / webpack}
- **State Management**: {redux / zustand / context API / none detected}
- **Routing**: {react-router / next/router / none detected}
- **Styling**: {tailwind / styled-components / css-modules / emotion}
- **Test Framework**: {jest / vitest} with {React Testing Library / Enzyme}
- **Package Manager**: {npm / yarn / pnpm}

### Domain Context
- **App Type**: {SPA / SSR (Next.js) / Static (Next.js export)}
- **Component Pattern**: {feature-based / type-based / atomic}
- **API Pattern**: {REST fetch / axios / GraphQL / tRPC}
- **Rendering Strategy**: {CSR / SSR / SSG / ISR}

### Domain-Specific Principles
- Components MUST be functional with hooks (no new class components)
- State management MUST follow the established pattern ({detected library or Context API})
- Tests MUST use React Testing Library for component testing
- Styling MUST follow the project's established approach ({detected method})
- New dependencies SHOULD be evaluated for bundle size impact
