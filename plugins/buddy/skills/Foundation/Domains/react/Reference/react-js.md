================
CODE SNIPPETS
================
TITLE: React Installation Guide
DESCRIPTION: Provides instructions on how to install React and get started with building applications. It covers common setup methods and dependencies.

SOURCE: https://17.reactjs.org/docs/index

LANGUAGE: HTML
CODE:
```
<p>Installation</p>
<p>Main Concepts</p>
<p>Advanced Guides</p>
<p>API Reference</p>
<p>Hooks</p>
<p>Testing</p>
<p>Contributing</p>
<p>FAQ</p>
```

--------------------------------

TITLE: Render 'Hello, world!' Heading with React
DESCRIPTION: This snippet demonstrates the most basic React application. It uses ReactDOM.render to display an 'Hello, world!' heading in the HTML element with the ID 'root'. This is a fundamental example for starting with React.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: JavaScript
CODE:
```
ReactDOM.render(
  <h1>Hello, world!</h1>,
  document.getElementById('root')
);
```

--------------------------------

TITLE: Install JSX Preprocessor with npm
DESCRIPTION: This section provides the npm commands to install the necessary packages for a JSX preprocessor setup. It includes initializing the project with `npm init -y` and installing `babel-cli` and `babel-preset-react-app`.

SOURCE: https://17.reactjs.org/docs/add-react-to-a-website

LANGUAGE: bash
CODE:
```
npm init -y
npm install babel-cli@6 babel-preset-react-app@3
```

--------------------------------

TITLE: Add React to a Website (CDN)
DESCRIPTION: This section explains how to add React to an existing website using CDN links. It's a quick way to start using React without a build process.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: html
CODE:
```
<script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>

<!-- Load our React component. -->
<script src="example.js"></script>
```

--------------------------------

TITLE: Create a New React App (CLI)
DESCRIPTION: This guide covers creating a new React application using the command-line interface (CLI). It typically involves tools like Create React App for setting up a project with a build pipeline.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: bash
CODE:
```
npx create-react-app my-app
cd my-app
npm start
```

--------------------------------

TITLE: Create React App Setup
DESCRIPTION: This snippet demonstrates the command-line steps to create a new React application using Create React App, navigate into the project directory, and start the development server. It requires Node.js and npm.

SOURCE: https://17.reactjs.org/docs/create-a-new-react-app

LANGUAGE: bash
CODE:
```
npx create-react-app my-app
cd my-app
npm start
```

--------------------------------

TITLE: Create a New React App
DESCRIPTION: This section recommends starting new React projects with a simple HTML page and script tags for quick setup. For larger applications, it suggests using JavaScript toolchains that offer minimal configuration and access to the React ecosystem.

SOURCE: https://17.reactjs.org/docs/getting-started

LANGUAGE: bash
CODE:
```
# Example using Create React App (CRA)
npx create-react-app my-app
cd my-app
npm start
```

--------------------------------

TITLE: Building Your Own Hooks
DESCRIPTION: Guides on creating custom Hooks to share stateful logic between different components, promoting code reuse and organization.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: javascript
CODE:
```
import { useState, useEffect } from 'react';

function useDocumentTitle(title) {
  useEffect(() => {
    document.title = title;
  });
}

function MyComponent() {
  useDocumentTitle('My Page Title');
  // ... component logic
}
```

--------------------------------

TITLE: Hello World Example
DESCRIPTION: A basic 'Hello World' example demonstrating the fundamental structure of a React component and how to render it to the DOM.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
function HelloWorld() {
  return <h1>Hello, World!</h1>;
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<HelloWorld />);
```

--------------------------------

TITLE: Installing Dependencies
DESCRIPTION: This command installs all project dependencies listed in the package.json file using Yarn.

SOURCE: https://17.reactjs.org/docs/how-to-contribute

LANGUAGE: Shell
CODE:
```
yarn
```

--------------------------------

TITLE: Thinking In React
DESCRIPTION: Provides a thought process for building React applications, starting from identifying the core components and managing their state.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
// Example of identifying components and state management
// Step 1: Break the UI into a component hierarchy
// Step 2: Think about where to store state
// Step 3: Identify where your state should live
// Step 4: Add Inverse Functions and State
```

--------------------------------

TITLE: React Context Provider Setup
DESCRIPTION: Illustrates setting up a React Context Provider to supply theme data to consuming components. This example defines themes, creates a context, and wraps a component tree with the `ThemeContext.Provider`.

SOURCE: https://17.reactjs.org/docs/hooks-reference

LANGUAGE: jsx
CODE:
```
const themes = {
  light: {
    foreground: "#000000",
    background: "#eeeeee"
  },
  dark: {
    foreground: "#ffffff",
    background: "#222222"
  }
};

const ThemeContext = React.createContext(themes.light);

function App() {
  return (
    <ThemeContext.Provider value={themes.dark}>
      <Toolbar />
    </ThemeContext.Provider>
  );
}

function Toolbar(props) {
  return (
    <div>
      <ThemedButton />
    </div>
  );
}
```

--------------------------------

TITLE: React Router Example
DESCRIPTION: This snippet demonstrates how to set up routing in a React application using React Router. It shows how to define routes and navigate between different components. You will need to install `react-router-dom`.

SOURCE: https://17.reactjs.org/docs/accessibility

LANGUAGE: javascript
CODE:
```
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/about">
          <About />
        </Route>
        <Route path="/">
          <Home />
        </Route>
      </Switch>
    </Router>
  );
}
```

--------------------------------

TITLE: Install React Experimental Version
DESCRIPTION: Installs an experimental version of React with unreleased features and flags enabled. This channel also tracks the main branch and is for testing purposes only.

SOURCE: https://17.reactjs.org/docs/release-channels

LANGUAGE: bash
CODE:
```
npm install react@experimental react-dom@experimental
```

--------------------------------

TITLE: Install React Next Version
DESCRIPTION: Installs a prerelease version of React from the 'next' channel, which tracks the main branch and serves as release candidates. Not recommended for user-facing applications due to potential breaking changes.

SOURCE: https://17.reactjs.org/docs/release-channels

LANGUAGE: bash
CODE:
```
npm install react@next react-dom@next
```

--------------------------------

TITLE: Install React Latest Version
DESCRIPTION: Installs the latest stable version of React, which is recommended for all user-facing applications. This version follows semantic versioning.

SOURCE: https://17.reactjs.org/docs/release-channels

LANGUAGE: bash
CODE:
```
npm install react react-dom
```

--------------------------------

TITLE: Styling and CSS
DESCRIPTION: Discusses various methods for styling React components, including plain CSS, CSS Modules, and CSS-in-JS solutions.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: css
CODE:
```
/* Example using plain CSS */
.my-component {
  color: blue;
  font-size: 16px;
}
```

LANGUAGE: jsx
CODE:
```
/* Example using inline styles */
function MyStyledComponent() {
  const style = {
    color: 'red',
    fontSize: '20px'
  };
  return <div style={style}>Styled Component</div>;
}
```

--------------------------------

TITLE: Rendering Elements
DESCRIPTION: Demonstrates how to render React elements into the DOM. This involves using `ReactDOM.createRoot` and the `render` method to display components.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
const element = <h1>Hello, world</h1>;
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(element);
```

--------------------------------

TITLE: ReactJS: Initial Render Example
DESCRIPTION: Demonstrates how to initiate the React rendering process by mounting the root component and appending the resulting DOM node to a specified root element in the HTML.

SOURCE: https://17.reactjs.org/docs/implementation-notes

LANGUAGE: javascript
CODE:
```
var rootEl = document.getElementById('root');
var node = mount(<App />);
rootEl.appendChild(node);
```

--------------------------------

TITLE: Lists and Keys
DESCRIPTION: Covers rendering lists of data and the importance of using unique `key` props for efficient updates and identification of elements in a list.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li key={number.toString()}>
      {number}
    </li>
  );

  return (
    <ul>{listItems}</ul>
  );
}

const numbers = [1, 2, 3, 4, 5];
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<NumberList numbers={numbers} />);
```

--------------------------------

TITLE: React App Bundling Example
DESCRIPTION: Demonstrates a simple React application structure with an `app.js` file importing an `add` function from `math.js`, and the resulting bundled output.

SOURCE: https://17.reactjs.org/docs/code-splitting

LANGUAGE: JavaScript
CODE:
```
// app.js
import { add } from './math.js';

console.log(add(16, 26)); // 42
```

LANGUAGE: JavaScript
CODE:
```
// math.js
export function add(a, b) {
  return a + b;
}
```

LANGUAGE: JavaScript
CODE:
```
function add(a, b) {
  return a + b;
}

console.log(add(16, 26)); // 42
```

--------------------------------

TITLE: Browserify Production Build with Transforms
DESCRIPTION: This demonstrates installing and using transforms like envify, terser, and uglifyify with Browserify for optimized production builds. The order of transforms is crucial for correct environment setup and code optimization.

SOURCE: https://17.reactjs.org/docs/optimizing-performance

LANGUAGE: bash
CODE:
```
# If you use npm
npm install --save-dev envify થશે uglifyify

# If you use Yarn
yarn add --dev envify થશે uglifyify

browserify ./index.js \
  -g [ envify --NODE_ENV production ] \
  -g uglifyify \
  | થશે --compress --mangle > ./bundle.js
```

--------------------------------

TITLE: Components and Props
DESCRIPTION: Explains the concept of React components, which are reusable pieces of UI. It also covers how to pass data between components using props.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

function App() {
  return (
    <div>
      <Welcome name="Sara" />
      <Welcome name="Cahal" />
    </div>
  );
}
```

--------------------------------

TITLE: State and Lifecycle
DESCRIPTION: Covers managing component state and understanding the component lifecycle methods in React. State allows components to change over time.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  componentDidMount() {
    this.timerID = setInterval(
      () => this.tick(),
      1000
    );
  }

  componentWillUnmount() {
    clearInterval(this.timerID);
  }

  tick() {
    this.setState({date: new Date()});
  }

  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
```

--------------------------------

TITLE: Example Prerelease Version Format
DESCRIPTION: Illustrates the versioning format for prereleases in React's 'Next' and 'Experimental' channels, which includes a hash of contents and commit date.

SOURCE: https://17.reactjs.org/docs/release-channels

LANGUAGE: text
CODE:
```
0.0.0-68053d940-20210623 (Next)
0.0.0-experimental-68053d940-20210623 (Experimental)
```

--------------------------------

TITLE: React Component Rendering Example
DESCRIPTION: This snippet demonstrates a basic React component rendering process. It shows how to define a component and render it to the DOM. No external dependencies are required for this basic example.

SOURCE: https://17.reactjs.org/docs/faq-internals

LANGUAGE: javascript
CODE:
```
import React from 'react';
import ReactDOM from 'react-dom';

function App() {
  return (
    <div>
      <h1>Hello, React!</h1>
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById('root'));
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: A basic example of a React functional component that renders a simple message. This demonstrates the fundamental structure of a React component.

SOURCE: https://17.reactjs.org/docs/portals

LANGUAGE: javascript
CODE:
```
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/react-dom-server

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React Component Rendering Example
DESCRIPTION: This snippet demonstrates a basic React component rendering process. It showcases how to define a component and render it to the DOM. No external dependencies are required for this core functionality.

SOURCE: https://17.reactjs.org/docs/getting-started

LANGUAGE: javascript
CODE:
```
import React from 'react';
import ReactDOM from 'react-dom';

function App() {
  return (
    <div>
      <h1>Hello, React!</h1>
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById('root'));
```

--------------------------------

TITLE: Forms
DESCRIPTION: Explains how to handle forms in React, including managing form input values with state and handling form submissions.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
class NameForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    alert('A name was submitted: ' + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Name:
          <input type="text" value={this.state.value} onChange={this.handleChange} />
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
```

--------------------------------

TITLE: Using the State Hook
DESCRIPTION: Demonstrates how to use the `useState` Hook in functional components to add state management capabilities.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function Example() {
  // Declare a new state variable, which we'll call "count"
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage state, and render JSX. No external dependencies are required for this basic example.

SOURCE: https://17.reactjs.org/docs/accessibility

LANGUAGE: javascript
CODE:
```
function ExampleComponent(props) {
  const [count, setCount] = React.useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: Handling Events
DESCRIPTION: Details how to handle user interactions and events in React, such as clicks and input changes, using synthetic event system.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
function ActionLink() {
  function handleClick(e) {
    e.preventDefault();
    console.log('The link was clicked.');
  }

  return (
    <a href="#" onClick={handleClick}>
      Click me
    </a>
  );
}
```

--------------------------------

TITLE: Component State
DESCRIPTION: Covers the concept of component state in React, how it's initialized, updated using `setState`, and how it affects re-rendering.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
class Counter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  increment = () => {
    this.setState({ count: this.state.count + 1 });
  };

  render() {
    return (
      <div>
        <p>Count: {this.state.count}</p>
        <button onClick={this.increment}>Increment</button>
      </div>
    );
  }
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/release-channels

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: Composition vs Inheritance
DESCRIPTION: Discusses the benefits of composition over inheritance for code reuse in React, promoting flexible and maintainable component design.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
function FancyBorder(props) {
  return (
    <div className={'FancyBorder FancyBorder-' + props.color}>
      {props.children}
    </div>
  );
}

function WelcomeDialog() {
  return (
    <FancyBorder color="blue">
      <h1 className="Dialog-title">
        Welcome
      </h1>
      <p className="Dialog-message">
        Thank you for visiting our spacecraft!
      </p>
    </FancyBorder>
  );
}
```

--------------------------------

TITLE: Multiple Effects in a Component
DESCRIPTION: This example illustrates how to use multiple useEffect hooks within a single React functional component to manage different side effects independently. Each effect can handle its own setup and cleanup logic.

SOURCE: https://17.reactjs.org/docs/hooks-overview

LANGUAGE: jsx
CODE:
```
function FriendStatusWithCounter(props) {
  const [count, setCount] = useState(0);
  useEffect(() => {
    document.title = `You clicked ${count} times`;
  });

  const [isOnline, setIsOnline] = useState(null);
  useEffect(() => {
    ChatAPI.subscribeToFriendStatus(props.friend.id, handleStatusChange);
    return () => {
      ChatAPI.unsubscribeFromFriendStatus(props.friend.id, handleStatusChange);
    };
  });

  function handleStatusChange(status) {
    setIsOnline(status.isOnline);
  }
  // ...
}
```

--------------------------------

TITLE: React Form Handling Example
DESCRIPTION: Shows a basic example of handling form input in React. This involves controlling the input value with state and updating it on change.

SOURCE: https://17.reactjs.org/docs/faq-functions

LANGUAGE: JavaScript
CODE:
```
import React, { useState } from 'react';

function MyForm() {
  const [name, setName] = useState('');

  const handleChange = (event) => {
    setName(event.target.value);
  };

  const handleSubmit = (event) => {
    alert('A name was submitted: ' + name);
    event.preventDefault();
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>
        Name:
        <input type="text" value={name} onChange={handleChange} />
      </label>
      <button type="submit">Submit</button>
    </form>
  );
}
```

--------------------------------

TITLE: HOC with Additional Arguments (Relay Example)
DESCRIPTION: Illustrates an HOC pattern that accepts additional arguments, using Relay's `createContainer` as an example to specify data dependencies.

SOURCE: https://17.reactjs.org/docs/higher-order-components

LANGUAGE: javascript
CODE:
```
const CommentWithRelay = Relay.createContainer(Comment, config);
```

--------------------------------

TITLE: Conditional Rendering
DESCRIPTION: Explains different ways to conditionally render components or elements based on state or props in React.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
function UserGreeting(props) {
  return <h1>Welcome back!</h1>;
}

function GuestGreeting(props) {
  return <h1>Please sign up.</h1>;
}

function Greeting(props) {
  const isLoggedIn = props.isLoggedIn;
  if (isLoggedIn) {
    return <UserGreeting />;
  }
  return <GuestGreeting />;
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Greeting isLoggedIn={false} />);
```

--------------------------------

TITLE: AJAX and APIs
DESCRIPTION: Discusses how to fetch data from external APIs within React components, often using `useEffect` and libraries like `fetch` or `axios`.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: javascript
CODE:
```
import React, { useState, useEffect } from 'react';

function DataFetcher() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch('https://api.example.com/data')
      .then(response => response.json())
      .then(data => setData(data));
  }, []);

  if (!data) {
    return <div>Loading...</div>;
  }

  return <div>{JSON.stringify(data)}</div>;
}
```

--------------------------------

TITLE: Passing Functions to Components
DESCRIPTION: Explains how to pass callback functions as props to child components, enabling communication from child to parent.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
function ParentComponent() {
  const handleChildClick = () => {
    console.log('Clicked from child!');
  };

  return <ChildComponent onClick={handleChildClick} />;
}

function ChildComponent(props) {
  return <button onClick={props.onClick}>Click Me</button>;
}
```

--------------------------------

TITLE: React Router V4 Example with Context
DESCRIPTION: Illustrates how React Router V4 utilizes context for communication between components like Router, Link, and Route. This example sets up basic routing.

SOURCE: https://17.reactjs.org/docs/legacy-context

LANGUAGE: javascript
CODE:
```
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

const BasicExample = () => (
  <Router>
    <div>
      <ul>
        <li><Link to="/">Home</Link></li>
        <li><Link to="/about">About</Link></li>
        <li><Link to="/topics">Topics</Link></li>
      </ul>

      <hr />

      <Route exact path="/" component={Home} />
      <Route path="/about" component={About} />
      <Route path="/topics" component={Topics} />
    </div>
  </Router>
);
```

--------------------------------

TITLE: React Component Rendering Example
DESCRIPTION: Demonstrates how to render a basic React component. This snippet is fundamental for building user interfaces with React.

SOURCE: https://17.reactjs.org/docs/glossary

LANGUAGE: javascript
CODE:
```
function MyComponent() {
  return (
    <div>
      <h1>Hello, React!</h1>
    </div>
  );
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/create-a-new-react-app

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: Using Invariant for Code Path Enforcement (JavaScript)
DESCRIPTION: This example shows how to use the `invariant` module to enforce conditions that must always hold true. If the condition is false, an error is thrown. Error messages are replaced with codes in production.

SOURCE: https://17.reactjs.org/docs/codebase-overview

LANGUAGE: JavaScript
CODE:
```
var invariant = require('invariant');

invariant(
  2 + 2 === 4,
  'You shall not pass!'
);
```

--------------------------------

TITLE: React Event Handling Example
DESCRIPTION: Shows how to handle user events, such as button clicks, in React. This example demonstrates attaching an event handler to a DOM element and executing a function in response. It's essential for user interaction.

SOURCE: https://17.reactjs.org/docs/context

LANGUAGE: javascript
CODE:
```
import React from 'react';

function ClickButton() {
  const handleClick = () => {
    alert('Button clicked!');
  };

  return (
    <button onClick={handleClick}>
      Click Me
    </button>
  );
}

export default ClickButton;
```

--------------------------------

TITLE: Example Usage: Connecting NameInput to Backbone Model
DESCRIPTION: This example demonstrates how to use the `connectToBackboneModel` HOC to integrate a `NameInput` React component with a Backbone.js model. It shows how to create a Backbone model, render the connected component, and update the model's attribute when the input changes.

SOURCE: https://17.reactjs.org/docs/integrating-with-other-libraries

LANGUAGE: jsx
CODE:
```
function NameInput(props) {
  return (
    <p>
      <input value={props.firstName} onChange={props.handleChange} />
      <br />
      My name is {props.firstName}.
    </p>
  );
}

const BackboneNameInput = connectToBackboneModel(NameInput);
function Example(props) {
  function handleChange(e) {
    props.model.set('firstName', e.target.value);
  }

  return (
    <BackboneNameInput
      model={props.model}
      handleChange={handleChange}
    />
  );
}

const model = new Backbone.Model({ firstName: 'Frodo' });
ReactDOM.render(
  <Example model={model} />,
  document.getElementById('root')
);
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/faq-versioning

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: Multiple Children/Slots Example (React)
DESCRIPTION: Illustrates how a component can accept multiple children or named slots, further demonstrating component composition patterns.

SOURCE: https://17.reactjs.org/docs/context

LANGUAGE: JavaScript
CODE:
```
function Page(props) {
  const user = props.user;
  const content = <Feed user={user} />;
  const topBar = (
    <NavigationBar>
      <Link href={user.permalink}>
        <Avatar user={user} size={props.avatarSize} />
      </Link>
    </NavigationBar>
  );
  return (
    <PageLayout
      topBar={topBar}
      content={content}
    />
  );
}
```

--------------------------------

TITLE: Install ESLint React Hooks Plugin
DESCRIPTION: Command to install the ESLint plugin for React Hooks as a development dependency. This plugin helps enforce the rules of Hooks in your React projects.

SOURCE: https://17.reactjs.org/docs/hooks-rules

LANGUAGE: bash
CODE:
```
npm install eslint-plugin-react-hooks --save-dev
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/introducing-jsx

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: Adding Flow Type Annotations to React Code (Flow)
DESCRIPTION: This example shows how to add Flow type annotations to React code. Files with the `@flow` annotation are type-checked by Flow. This practice is encouraged for new code and accepting pull requests that add annotations.

SOURCE: https://17.reactjs.org/docs/codebase-overview

LANGUAGE: Flow
CODE:
```
//@flow

ReactRef.detachRefs = function(
  instance: ReactInstance,
  element: ReactElement | string | number | null | false,
): void {
  // ...
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/web-components

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: Using the Effect Hook
DESCRIPTION: Explains how to use the `useEffect` Hook for performing side effects in functional components, such as data fetching or subscriptions.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: javascript
CODE:
```
import React, { useState, useEffect } from 'react';

function Example() {
  const [count, setCount] = useState(0);

  // Similar to componentDidMount and componentDidUpdate:
  useEffect(() => {
    // Update the document title using the browser API
    document.title = `You clicked ${count} times`;
  });

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/lists-and-keys

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React Event Handling Example
DESCRIPTION: Shows how to handle user events, such as button clicks, in React. This is essential for user interaction.

SOURCE: https://17.reactjs.org/docs/glossary

LANGUAGE: javascript
CODE:
```
function MyButton() {
  const handleClick = () => {
    alert('Button clicked!');
  };

  return (
    <button onClick={handleClick}>
      Click Me
    </button>
  );
}
```

--------------------------------

TITLE: Install Babel Flow Preset (npm)
DESCRIPTION: Installs the @babel/preset-flow package as a development dependency using npm, required for stripping Flow syntax when not using Create React App.

SOURCE: https://17.reactjs.org/docs/static-type-checking

LANGUAGE: bash
CODE:
```
npm install --save-dev @babel/preset-flow
```

--------------------------------

TITLE: React Product Data Example
DESCRIPTION: This JSON data represents a collection of products, including their category, price, stock status, and name. It serves as the data model for the searchable product table example in React.

SOURCE: https://17.reactjs.org/docs/thinking-in-react

LANGUAGE: json
CODE:
```
[
  {category: "Sporting Goods", price: "$49.99", stocked: true, name: "Football"},
  {category: "Sporting Goods", price: "$9.99", stocked: true, name: "Baseball"},
  {category: "Sporting Goods", price: "$29.99", stocked: false, name: "Basketball"},
  {category: "Electronics", price: "$99.99", stocked: true, name: "iPod Touch"},
  {category: "Electronics", price: "$399.99", stocked: false, name: "iPhone 5"},
  {category: "Electronics", price: "$199.99", stocked: true, name: "Nexus 7"}
];
```

--------------------------------

TITLE: Lifting State Up
DESCRIPTION: Demonstrates the pattern of 'lifting state up' in React, where shared state is moved to the closest common ancestor of components that need it.

SOURCE: https://17.reactjs.org/docs/hello-world

LANGUAGE: jsx
CODE:
```
function BoilingVerdict(props) {
  if (props.celsius >= 100) {
    return <p>The water would boil.</p>;
  }
  return <p>The water would not boil.</p>;
}

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {temperature: ''};
    this.handleCelsiusChange = this.handleCelsiusChange.bind(this);
  }

  handleCelsiusChange(temperature) {
    this.setState({temperature});
  }

  render() {
    const temperature = this.state.temperature;
    return (
      <div>
        <TemperatureInput scale="c" />
        <TemperatureInput scale="f" />
        <BoilingVerdict
          celsius={parseFloat(temperature)} />
      </div>
    );
  }
}
```

--------------------------------

TITLE: React Conditional Rendering Example
DESCRIPTION: Demonstrates conditional rendering in React, where UI elements are displayed or hidden based on certain conditions. This example uses a ternary operator.

SOURCE: https://17.reactjs.org/docs/faq-functions

LANGUAGE: JavaScript
CODE:
```
function Greeting({ isLoggedIn }) {
  return (
    <div>
      {isLoggedIn ? <p>Welcome back!</p> : <p>Please sign in.</p>}
    </div>
  );
}
```

--------------------------------

TITLE: React Event Handling Example
DESCRIPTION: Shows how to handle user events, such as button clicks, in React. This example uses an inline arrow function to update the component's state.

SOURCE: https://17.reactjs.org/docs/faq-functions

LANGUAGE: JavaScript
CODE:
```
function MyButton() {
  const handleClick = () => {
    alert('Button clicked!');
  };

  return (
    <button onClick={handleClick}>
      Click Me
    </button>
  );
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/javascript-environment-requirements

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: Install Babel Flow Preset (Yarn)
DESCRIPTION: Installs the @babel/preset-flow package as a development dependency using Yarn, required for stripping Flow syntax when not using Create React App.

SOURCE: https://17.reactjs.org/docs/static-type-checking

LANGUAGE: bash
CODE:
```
yarn add --dev @babel/preset-flow
```

--------------------------------

TITLE: Callback Refs in React
DESCRIPTION: Demonstrates the potential issue with inline callback refs in React. When a callback ref is defined as an inline function, it gets called twice during updates: once with `null` and then again with the DOM element. This is because a new instance of the function is created with each render, requiring React to clear the old ref and set up the new one. The example implies a scenario where this might occur.

SOURCE: https://17.reactjs.org/docs/refs-and-the-dom

LANGUAGE: jsx
CODE:
```
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.myRef = null;
    this.setMyRef = (element) => {
      this.myRef = element;
    };
  }

  componentDidMount() {
    // this.myRef will be the DOM element here
    console.log(this.myRef);
  }

  render() {
    return <div ref={this.setMyRef}>Hello</div>;
  }
}
```

--------------------------------

TITLE: React Hook Example
DESCRIPTION: This snippet illustrates the usage of a custom React hook. Custom hooks allow you to extract component logic into reusable functions. This example assumes a basic understanding of React hooks.

SOURCE: https://17.reactjs.org/docs/accessibility

LANGUAGE: javascript
CODE:
```
function useFetch(url) {
  const [data, setData] = React.useState(null);
  const [loading, setLoading] = React.useState(true);

  React.useEffect(() => {
    fetch(url)
      .then(response => response.json())
      .then(data => {
        setData(data);
        setLoading(false);
      });
  }, [url]);

  return { data, loading };
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/profiler

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React Component Rerendering Example
DESCRIPTION: Illustrates how React might rerender a component subtree. While React could rerender the whole app, the reconciliation algorithm optimizes this by applying only the necessary differences. This example highlights the concept of rerendering without unmounting.

SOURCE: https://17.reactjs.org/docs/reconciliation

LANGUAGE: javascript
CODE:
```
function MyComponent() {
  // ... component logic ...
  return <div>...</div>;
}

// In a scenario where state changes, React might call render() for MyComponent.
// The reconciliation algorithm then determines the minimal DOM changes.
// For example, if a subtree is moved amongst siblings, the whole subtree might be rerendered.
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/react-component

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React Context: Prop Drilling Example
DESCRIPTION: Demonstrates the traditional method of passing props down through multiple components, highlighting the inefficiency for global data like themes.

SOURCE: https://17.reactjs.org/docs/context

LANGUAGE: javascript
CODE:
```
class App extends React.Component {
  render() {
    return <Toolbar theme="dark" />;
  }
}

function Toolbar(props) {
  // The Toolbar component must take an extra "theme" prop  // and pass it to the ThemedButton. This can become painful  // if every single button in the app needs to know the theme  // because it would have to be passed through all components.
  return (
    <div>
      <ThemedButton theme={props.theme} />    </div>
  );
}

class ThemedButton extends React.Component {
  render() {
    return <Button theme={this.props.theme} />;
  }
}
```

--------------------------------

TITLE: Set Initial State in React
DESCRIPTION: Explains how to set the initial state for React components. It provides examples for both ES6 classes (using the constructor) and `create-react-class` (using `getInitialState`).

SOURCE: https://17.reactjs.org/docs/react-without-es6

LANGUAGE: JavaScript
CODE:
```
class Counter extends React.Component {
  constructor(props) {
    super(props);
    this.state = {count: props.initialCount};
  }
  // ...
}
```

LANGUAGE: JavaScript
CODE:
```
var Counter = createReactClass({
  getInitialState: function() {
    return {count: this.props.initialCount};
  },
  // ...
});
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/testing-environments

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React Tic-Tac-Toe Tutorial
DESCRIPTION: This practical tutorial guides users through building a tic-tac-toe game using React. It emphasizes that the techniques learned are fundamental for any React application, promoting a deeper understanding of React's core principles.

SOURCE: https://17.reactjs.org/docs/getting-started

LANGUAGE: javascript
CODE:
```
// Example of a React component for a Tic-Tac-Toe square
function Square(props) {
  return (
    <button className="square" onClick={props.onClick}>
      {props.value}
    </button>
  );
}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/state-and-lifecycle

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React State Management Example
DESCRIPTION: Illustrates how to manage component state using the `useState` hook in React. This is crucial for dynamic UI updates.

SOURCE: https://17.reactjs.org/docs/glossary

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React MouseTracker Component Example
DESCRIPTION: An example of how to use the `Mouse` component with a render prop. The `MouseTracker` component passes a function to the `render` prop of `Mouse`, which then renders a `Cat` component with the mouse's current position.

SOURCE: https://17.reactjs.org/docs/render-props

LANGUAGE: jsx
CODE:
```
class MouseTracker extends React.Component {
  render() {
    return (
      <div>
        <h1>Move the mouse around!</h1>
        <Mouse render={mouse => (
          <Cat mouse={mouse} />
        )}/>
      </div>
    );
  }
}
```

--------------------------------

TITLE: React useReducer Hook Example
DESCRIPTION: Shows how to use the `useReducer` hook as an alternative to `useState` for managing complex state logic. This example implements a counter with increment and decrement actions using a reducer function.

SOURCE: https://17.reactjs.org/docs/hooks-reference

LANGUAGE: javascript
CODE:
```
const [state, dispatch] = useReducer(reducer, initialArg, init);
```

LANGUAGE: javascript
CODE:
```
const initialState = {count: 0};

function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return {count: state.count + 1};
    case 'decrement':
      return {count: state.count - 1};
    default:
      throw new Error();
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, initialState);
  return (
    <>
      Count: {state.count}
      <button onClick={() => dispatch({type: 'decrement'})}>-</button>
      <button onClick={() => dispatch({type: 'increment'})}>+</button>
    </>
  );
}
```

--------------------------------

TITLE: Component Composition Example (React)
DESCRIPTION: Demonstrates how to pass components as props to avoid prop drilling, a common alternative to Context API for managing deeply nested data.

SOURCE: https://17.reactjs.org/docs/context

LANGUAGE: JavaScript
CODE:
```
function Page(props) {
  const user = props.user;
  const userLink = (
    <Link href={user.permalink}>
      <Avatar user={user} size={props.avatarSize} />
    </Link>
  );
  return <PageLayout userLink={userLink} />;
}

// Now, we have:
<Page user={user} avatarSize={avatarSize} />
// ... which renders ...
<PageLayout userLink={...} />
// ... which renders ...
<NavigationBar userLink={...} />
// ... which renders ...
{props.userLink}
```

--------------------------------

TITLE: React Component Example
DESCRIPTION: This snippet demonstrates a basic React component. It showcases how to define a component, manage its state, and render JSX. No external dependencies are explicitly mentioned for this core component structure.

SOURCE: https://17.reactjs.org/docs/react-api

LANGUAGE: javascript
CODE:
```
import React, { useState } from 'react';

function ExampleComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

--------------------------------

TITLE: React Component Rendering Example
DESCRIPTION: Demonstrates how to render a basic React component. This snippet is fundamental for understanding React's declarative UI approach. It typically involves JSX syntax and the ReactDOM.render method.

SOURCE: https://17.reactjs.org/docs/context

LANGUAGE: javascript
CODE:
```
import React from 'react';
import ReactDOM from 'react-dom';

function MyComponent() {
  return (
    <div>
      <h1>Hello, React!</h1>
    </div>
  );
}

ReactDOM.render(<MyComponent />, document.getElementById('root'));
```