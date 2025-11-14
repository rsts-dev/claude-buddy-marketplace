---
name: react-development
description: React.js development best practices, patterns, and code examples. Use when working with React components, JSX, hooks, state management, or React-based applications. Auto-activates for .jsx, .tsx files and React-specific tasks.
---

# React Development Skill

This skill provides React.js development guidance, best practices, and common code patterns to assist with React application development.

## When to Use This Skill

- Building React components and user interfaces
- Working with React hooks (useState, useEffect, useContext, etc.)
- State management in React applications
- Component lifecycle and performance optimization
- JSX syntax and best practices
- React Router and navigation
- Form handling and validation in React
- Testing React components

## Auto-Activation

This skill automatically activates when:
- Working with .jsx or .tsx files
- Keywords: React, component, hook, JSX, useState, useEffect, props, state
- Package.json contains React dependencies
- Discussion of component architecture or state management

## Reference Materials

For detailed React code examples, patterns, and snippets, see [react-js.md](react-js.md).

## Key Concepts

### Component Patterns
- Functional components with hooks (preferred modern approach)
- Class components (legacy, but still supported)
- Higher-Order Components (HOCs)
- Render props pattern
- Compound components
- Controlled vs uncontrolled components

### State Management
- Local state with useState
- Shared state with useContext
- State management libraries (Redux, Zustand, Jotai)
- Server state with React Query or SWR
- Form state management

### Performance Optimization
- React.memo for component memoization
- useMemo and useCallback for value/function memoization
- Code splitting with React.lazy and Suspense
- Virtualization for long lists
- Avoiding unnecessary re-renders

### Best Practices
- Keep components small and focused
- Lift state up when needed, but not prematurely
- Use composition over inheritance
- Prefer declarative over imperative code
- Follow the React hooks rules
- Implement proper error boundaries
- Use TypeScript for type safety

## Common Tasks

### Creating a Functional Component
```jsx
import React, { useState, useEffect } from 'react';

function MyComponent({ initialValue }) {
  const [count, setCount] = useState(initialValue);

  useEffect(() => {
    // Side effect logic here
    return () => {
      // Cleanup logic here
    };
  }, [count]); // Dependencies

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}

export default MyComponent;
```

### Using Context for State Sharing
```jsx
import React, { createContext, useContext, useState } from 'react';

const ThemeContext = createContext();

export function ThemeProvider({ children }) {
  const [theme, setTheme] = useState('light');

  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  );
}

export function useTheme() {
  return useContext(ThemeContext);
}
```

### Custom Hooks
```jsx
import { useState, useEffect } from 'react';

function useFetch(url) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch(url)
      .then(res => res.json())
      .then(data => {
        setData(data);
        setLoading(false);
      })
      .catch(err => {
        setError(err);
        setLoading(false);
      });
  }, [url]);

  return { data, loading, error };
}
```

## Testing

### Component Testing with React Testing Library
```jsx
import { render, screen, fireEvent } from '@testing-library/react';
import MyComponent from './MyComponent';

test('increments counter on button click', () => {
  render(<MyComponent initialValue={0} />);

  const button = screen.getByText('Increment');
  fireEvent.click(button);

  expect(screen.getByText('Count: 1')).toBeInTheDocument();
});
```

## Common Pitfalls to Avoid

1. **Stale Closures**: Not including dependencies in useEffect
2. **Infinite Loops**: Missing dependencies or incorrect dependency arrays
3. **Prop Drilling**: Passing props through many levels (use Context or state management)
4. **Not Cleaning Up Effects**: Missing cleanup functions in useEffect
5. **Mutating State Directly**: Always use setState or state setter functions
6. **Keys in Lists**: Not providing unique keys for list items
7. **Side Effects in Render**: Performing side effects during render phase

## Integration with Other Technologies

- **TypeScript**: Add type safety to React applications
- **Next.js**: Server-side rendering and static site generation
- **React Native**: Build mobile applications with React
- **Styled Components / Emotion**: CSS-in-JS solutions
- **React Router**: Client-side routing
- **Redux / Zustand**: Complex state management

## Resources

See the [react-js.md](react-js.md) file for comprehensive code examples and patterns from React documentation.
