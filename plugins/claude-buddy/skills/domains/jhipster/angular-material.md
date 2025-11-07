================
CODE SNIPPETS
================
TITLE: Installing Node.js Dependencies for AngularJS Material
DESCRIPTION: This command installs all necessary Node.js packages and project dependencies defined in `package.json` for the AngularJS Material project. It's the first step required before running any build or test commands.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_0

LANGUAGE: Bash
CODE:
```
npm install
```

LANGUAGE: Bash
CODE:
```
npm i
```

--------------------------------

TITLE: Installing Gulp v3 Globally
DESCRIPTION: This command installs Gulp version 3 globally on the system. Gulp is a JavaScript task runner used for automating development workflows, including building AngularJS Material.

SOURCE: https://github.com/angular/material/blob/master/README.md#_snippet_1

LANGUAGE: bash
CODE:
```
npm install -g gulp@3
```

--------------------------------

TITLE: Installing NPM Dependencies for AngularJS Material
DESCRIPTION: This command installs all required Node Package Manager (NPM) dependencies for the AngularJS Material project. It should be run from the project's root directory to set up the development environment.

SOURCE: https://github.com/angular/material/blob/master/README.md#_snippet_0

LANGUAGE: bash
CODE:
```
npm install
```

--------------------------------

TITLE: Installing Latest Stable AngularJS Material via NPM
DESCRIPTION: This command installs the latest stable version of the AngularJS Material library from NPM into the project's node_modules directory. The --save flag adds it as a dependency in package.json.

SOURCE: https://github.com/angular/material/blob/master/README.md#_snippet_5

LANGUAGE: bash
CODE:
```
npm install angular-material --save
```

--------------------------------

TITLE: Installing Latest Master Branch of AngularJS Material via NPM
DESCRIPTION: This command installs the most recent version of AngularJS Material directly from the master branch of its GitHub repository. It's used for accessing the very latest, potentially unstable, development version.

SOURCE: https://github.com/angular/material/blob/master/README.md#_snippet_6

LANGUAGE: bash
CODE:
```
npm install http://github.com/angular/bower-material#master --save
```

--------------------------------

TITLE: Utilizing Additional Flex Values for Advanced Sizing Control
DESCRIPTION: Presents a range of special `flex` values beyond percentages, offering more nuanced control over element growth and shrinkage. These include `none` (no grow/shrink), `nogrow` (shrinks but doesn't grow), `grow` (grows/shrinks, starts at 100%), `initial` (shrinks, starts at natural size), `auto` (grows/shrinks, starts at natural size), `noshrink` (grows but doesn't shrink), and `0` (grows/shrinks, starts at 0%).

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-children.tmpl.html#_snippet_8

LANGUAGE: HTML
CODE:
```
flex="none"
```

LANGUAGE: HTML
CODE:
```
flex
```

LANGUAGE: HTML
CODE:
```
flex="nogrow"
```

LANGUAGE: HTML
CODE:
```
flex="grow"
```

LANGUAGE: HTML
CODE:
```
flex="initial"
```

LANGUAGE: HTML
CODE:
```
flex="auto"
```

LANGUAGE: HTML
CODE:
```
flex="noshrink"
```

LANGUAGE: HTML
CODE:
```
flex="0"
```

--------------------------------

TITLE: Angular Material Typography and Button Usage Examples
DESCRIPTION: This comprehensive HTML snippet illustrates the practical application of various Angular Material typography classes (.md-body-1, .md-body-2, .md-caption) and the <md-button> component, showcasing how to combine them for different text styles and interactive elements.

SOURCE: https://github.com/angular/material/blob/master/docs/content/CSS/typography.md#_snippet_7

LANGUAGE: HTML
CODE:
```
<p class="md-body-2">Body copy with medium weight.</p>
<md-button>Button</md-button>
<p class="md-body-1">Regular body copy <small class="md-caption">with small text</small>.</p>
<span class="md-caption">Caption</span>
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 20 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 20. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_19

LANGUAGE: HTML
CODE:
```
md-whiteframe="20"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 21 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 21. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_20

LANGUAGE: HTML
CODE:
```
md-whiteframe="21"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 22 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 22. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_21

LANGUAGE: HTML
CODE:
```
md-whiteframe="22"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 24 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 24. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_23

LANGUAGE: HTML
CODE:
```
md-whiteframe="24"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 23 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 23. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_22

LANGUAGE: HTML
CODE:
```
md-whiteframe="23"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 17 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 17. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_16

LANGUAGE: HTML
CODE:
```
md-whiteframe="17"
```

--------------------------------

TITLE: Illustrative JavaScript Code for Breaking Change in Commit Message
DESCRIPTION: This snippet provides an example of how JavaScript code changes, specifically a breaking change, are documented within a Git commit message. It shows both the old and new syntax for a constant, guiding users on necessary code updates.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/MERGE_REQUESTS.md#_snippet_13

LANGUAGE: js
CODE:
```
  $mdConstant.SOMETHING_ELSE
```

LANGUAGE: js
CODE:
```
  $mdConstant.SOMETHING
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 15 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 15. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_14

LANGUAGE: HTML
CODE:
```
md-whiteframe="15"
```

--------------------------------

TITLE: Implementing Responsive Flex Sizing with `flex` and `flex-gt-sm`
DESCRIPTION: Shows how to apply different flex behaviors based on device screen size using responsive `flex` directives. This example sets an element to flex 33% on mobile devices and 66% on devices larger than small (`gt-sm`). This allows for adaptive layouts across various viewports.

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-children.tmpl.html#_snippet_2

LANGUAGE: HTML
CODE:
```
flex="33" flex-gt-sm="66"
```

LANGUAGE: HTML
CODE:
```
flex="66" flex-gt-sm="33"
```

--------------------------------

TITLE: Using Angular Material Component as Element (Nunjucks/Jinja2 Template)
DESCRIPTION: This snippet demonstrates how to use an Angular Material component as a custom HTML element. It dynamically generates the element tag and its attributes based on the component's name and parameters, suitable for direct component instantiation in templates.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/api/directive.template.html#_snippet_0

LANGUAGE: Nunjucks/Jinja2 Template
CODE:
```
<{$ doc.name | dashCase $} {%- for param in doc.params %} {$ directiveParam(param.alias or param.name, param.type, "=", "") $} {%- endfor %}> ...
```

--------------------------------

TITLE: Implementing Standard HTML Checkbox with Angular Directives
DESCRIPTION: This snippet shows how to use a standard HTML <input type="checkbox"> element enhanced with Angular's ng-checked and ng-click directives. It provides an alternative to Material components for managing checkbox state and user interaction.

SOURCE: https://github.com/angular/material/blob/master/src/components/checkbox/demoSyncing/index.html#_snippet_2

LANGUAGE: HTML
CODE:
```
<input type="checkbox" ng-checked="exists(item, selected)" ng-click="toggle(item, selected)">
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 2 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 2. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_1

LANGUAGE: HTML
CODE:
```
md-whiteframe="2"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 16 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 16. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_15

LANGUAGE: HTML
CODE:
```
md-whiteframe="16"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 19 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 19. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_18

LANGUAGE: HTML
CODE:
```
md-whiteframe="19"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 10 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 10. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_9

LANGUAGE: HTML
CODE:
```
md-whiteframe="10"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 5 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 5. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_4

LANGUAGE: HTML
CODE:
```
md-whiteframe="5"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 7 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 7. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_6

LANGUAGE: HTML
CODE:
```
md-whiteframe="7"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 11 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 11. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_10

LANGUAGE: HTML
CODE:
```
md-whiteframe="11"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 18 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 18. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_17

LANGUAGE: HTML
CODE:
```
md-whiteframe="18"
```

--------------------------------

TITLE: Implementing Dynamic Themes with md-theme-watch in AngularJS Material
DESCRIPTION: This HTML example demonstrates how to enable dynamic theme switching based on user interaction. The md-theme-watch directive ensures that the theme updates when the bound scope variable changes, allowing elements to switch themes dynamically.

SOURCE: https://github.com/angular/material/blob/master/docs/content/Theming/04_multiple_themes.md#_snippet_3

LANGUAGE: html
CODE:
```
<div>
  <md-button ng-click="dynamicTheme = 'default'">Default</md-button>
  <md-button ng-click="dynamicTheme = 'altTheme'">altTheme</md-button>
  <div md-theme="{{ dynamicTheme }}" md-theme-watch>
    <md-button class="md-primary">I'm dynamic</md-button>
  </div>
</div>
```

--------------------------------

TITLE: Standard ng-repeat List Example - HTML
DESCRIPTION: This HTML snippet demonstrates a standard AngularJS `ng-repeat` implementation for displaying a list of people. While functional, it can lead to performance issues in Internet Explorer with large datasets due to extensive DOM manipulation and layout recalculations, especially when interacting with elements like `md-dialog`.

SOURCE: https://github.com/angular/material/blob/master/docs/content/performance/internet-explorer.md#_snippet_2

LANGUAGE: html
CODE:
```
<md-list>
  <md-list-item ng-repeat="person in people"
                ng-click="goToPerson(person.name, $event)">
    <img alt="{{::person.name }}" ng-src="{{::person.img }}" class="md-avatar">
    <p>{{::person.name }}</p>
    <md-checkbox class="md-secondary" ng-model="person.selected"></md-checkbox>
    <md-icon md-svg-icon="communication:email" ng-click="doSecondaryAction($event)"
             aria-label="Send Email" class="md-secondary md-hue-3"></md-icon>
    <md-icon class="md-secondary" ng-click="doSecondaryAction($event)" aria-label="Chat"
             md-svg-icon="communication:message"></md-icon>
  </md-list-item>
</md-list>
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 8 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 8. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_7

LANGUAGE: HTML
CODE:
```
md-whiteframe="8"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 13 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 13. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_12

LANGUAGE: HTML
CODE:
```
md-whiteframe="13"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 14 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 14. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_13

LANGUAGE: HTML
CODE:
```
md-whiteframe="14"
```

--------------------------------

TITLE: Displaying Start Date with Angular Date Pipe
DESCRIPTION: This snippet displays the `startDate` property from the controller (`ctrl`) using Angular's `date` pipe. The `shortDate` format argument ensures the date is presented in a localized short date format.

SOURCE: https://github.com/angular/material/blob/master/src/components/datepicker/demoCalendar/index.html#_snippet_0

LANGUAGE: Angular Template
CODE:
```
{{ctrl.startDate | date:shortDate}}
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 9 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 9. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_8

LANGUAGE: HTML
CODE:
```
md-whiteframe="9"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 3 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 3. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_2

LANGUAGE: HTML
CODE:
```
md-whiteframe="3"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 6 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 6. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_5

LANGUAGE: HTML
CODE:
```
md-whiteframe="6"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 1 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 1. This directive adds a subtle shadow effect, simulating a slightly raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_0

LANGUAGE: HTML
CODE:
```
md-whiteframe="1"
```

--------------------------------

TITLE: Implementing Multi-Breakpoint Responsive Flex Sizing
DESCRIPTION: Shows a comprehensive example of responsive flex sizing across multiple breakpoints: 100% on mobile, 50% on medium devices (`md`), and 25% on devices larger than medium (`gt-md`). This allows for fine-grained control over element sizing across a wide range of screen dimensions.

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-children.tmpl.html#_snippet_5

LANGUAGE: HTML
CODE:
```
flex="100" flex-md="50" flex-gt-md="25"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 4 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 4. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_3

LANGUAGE: HTML
CODE:
```
md-whiteframe="4"
```

--------------------------------

TITLE: Applying md-whiteframe Elevation 12 (HTML)
DESCRIPTION: Demonstrates the use of the `md-whiteframe` directive in Angular Material to apply an elevation level of 12. This directive adds a shadow effect, simulating a raised surface.

SOURCE: https://github.com/angular/material/blob/master/src/components/whiteframe/demoDirectiveAttributeUsage/index.html#_snippet_11

LANGUAGE: HTML
CODE:
```
md-whiteframe="12"
```

--------------------------------

TITLE: Using Angular Material Directive as CSS Class (Nunjucks/Jinja2 Template)
DESCRIPTION: This snippet shows how to apply an Angular Material directive by adding a specific CSS class to an HTML element. It dynamically constructs the class attribute with directive-specific parameters, enabling styling and behavior modifications through CSS-based directive activation.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/api/directive.template.html#_snippet_2

LANGUAGE: Nunjucks/Jinja2 Template
CODE:
```
{% set sep = joiner(' ') %} <{$ doc.element $} class=" {%- for param in doc.params -%} {$ sep() $}{$ directiveParam(param.name, param.type, ': ', ';') $} {%- endfor %}"> ...
```

--------------------------------

TITLE: Using Angular Material Directive as Attribute (Nunjucks/Jinja2 Template)
DESCRIPTION: This snippet illustrates the usage of an Angular Material directive as an HTML attribute. It applies the directive to an existing HTML element, dynamically adding attributes based on the directive's parameters. This is common for enhancing standard HTML elements with Angular Material functionality.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/api/directive.template.html#_snippet_1

LANGUAGE: Nunjucks/Jinja2 Template
CODE:
```
<{$ doc.element $} {%- for param in doc.params %} {$ directiveParam(param.name, param.type, "=", "") $} {%- endfor %}> ...
```

--------------------------------

TITLE: Displaying Selected Items Array as JSON
DESCRIPTION: This snippet uses Angular's interpolation combined with the json pipe to render the selected array as a formatted JSON string. This is useful for debugging or visualizing the current state of selected items.

SOURCE: https://github.com/angular/material/blob/master/src/components/checkbox/demoSyncing/index.html#_snippet_3

LANGUAGE: Angular Template
CODE:
```
{{selected | json}}
```

--------------------------------

TITLE: Optimized md-virtual-repeat List Example - HTML
DESCRIPTION: This HTML snippet demonstrates the use of `md-virtual-repeat` to optimize large lists for performance, particularly in Internet Explorer. It only renders elements visible within the viewport, significantly reducing DOM size and improving layout calculation speeds. This approach is ideal for displaying millions of records efficiently, provided all list items have equal and static heights.

SOURCE: https://github.com/angular/material/blob/master/docs/content/performance/internet-explorer.md#_snippet_3

LANGUAGE: html
CODE:
```
<md-content layout="column" ng-controller="ListCtrl">
  <md-virtual-repeat-container id="vertical-container">
    <md-list>
      <md-list-item md-virtual-repeat="person in people"
                    ng-click="goToPerson(person.name, $event)">
        <img alt="{{ person.name }}" ng-src="{{ person.img }}" class="md-avatar">
        <p>{{ person.name }}</p>
        <md-checkbox class="md-secondary" ng-model="person.selected"></md-checkbox>
        <md-icon md-svg-icon="communication:email" ng-click="doSecondaryAction($event)"
                 aria-label="Send Email" class="md-secondary md-hue-3"></md-icon>
        <md-icon class="md-secondary" ng-click="doSecondaryAction($event)" aria-label="Chat"
                 md-svg-icon="communication:message"></md-icon>
      </md-list-item>
    </md-list>
  </md-virtual-repeat-container>
</md-content>
```

--------------------------------

TITLE: Binding Phone Object Properties in Angular Template
DESCRIPTION: Shows how to bind properties ('number', 'type') of a 'phone' object. These expressions are typically used to display details of a contact or similar structured data.

SOURCE: https://github.com/angular/material/blob/master/src/components/list/demoBasicUsage/index.html#_snippet_2

LANGUAGE: Angular Template
CODE:
```
{{ phone.number }}
```

LANGUAGE: Angular Template
CODE:
```
{{ phone.type }}
```

--------------------------------

TITLE: Binding Item Object Properties in Angular Template
DESCRIPTION: Demonstrates binding individual properties ('who', 'what', 'notes') of an 'item' object. These expressions are typically used together to display structured data for a single entity, often in a multi-line list item.

SOURCE: https://github.com/angular/material/blob/master/src/components/list/demoBasicUsage/index.html#_snippet_0

LANGUAGE: Angular Template
CODE:
```
{{ item.who }}
```

LANGUAGE: Angular Template
CODE:
```
{{ item.what }}
```

LANGUAGE: Angular Template
CODE:
```
{{ item.notes }}
```

--------------------------------

TITLE: Building AngularJS Material Documentation
DESCRIPTION: This command compiles the AngularJS Material documentation from source code into the `dist/docs` directory. The documentation is generated using `dgeni` and utilizes AngularJS Material's own layout, components, and themes.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_3

LANGUAGE: Bash
CODE:
```
npm run docs:build
```

--------------------------------

TITLE: Displaying Item Value using Angular Interpolation
DESCRIPTION: This snippet utilizes Angular's interpolation syntax to display the value of the item variable. It typically serves as a label or descriptive text associated with a selectable item, often alongside a checkbox.

SOURCE: https://github.com/angular/material/blob/master/src/components/checkbox/demoSyncing/index.html#_snippet_1

LANGUAGE: Angular Template
CODE:
```
{{ item }}
```

--------------------------------

TITLE: Building AngularJS Material Documentation and Demos
DESCRIPTION: This Gulp task builds the documentation and live demos for AngularJS Material, placing them in the /dist/docs directory. It's useful for local review of the library's features and API.

SOURCE: https://github.com/angular/material/blob/master/README.md#_snippet_3

LANGUAGE: bash
CODE:
```
gulp docs
```

--------------------------------

TITLE: Interactively Rebasing Commits for Squashing (Shell)
DESCRIPTION: Describes how to start an interactive rebase session against `origin/master` to manipulate, merge, and rename commits, typically used to squash multiple commits into a single one before merging to maintain a clean Git log.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/MERGE_REQUESTS.md#_snippet_2

LANGUAGE: sh
CODE:
```
git rebase --interactive origin/master
```

--------------------------------

TITLE: Implementing Angular Material Checkbox for Item Selection
DESCRIPTION: This snippet demonstrates using the Angular Material <md-checkbox> component. It binds the checkbox's checked state to the exists(item, selected) function and its click event to toggle(item, selected), enabling selection management for items.

SOURCE: https://github.com/angular/material/blob/master/src/components/checkbox/demoSyncing/index.html#_snippet_0

LANGUAGE: HTML
CODE:
```
<md-checkbox ng-checked="exists(item, selected)" ng-click="toggle(item, selected)">
```

--------------------------------

TITLE: Setting and Removing Browser Color Theming at Runtime (AngularJS)
DESCRIPTION: This example shows how to dynamically set the browser header color at runtime using `$mdTheming.setBrowserColor` within an AngularJS controller. It also demonstrates how to properly remove the applied browser color when the controller's scope is destroyed, ensuring clean-up and preventing memory leaks.

SOURCE: https://github.com/angular/material/blob/master/docs/content/Theming/06_browser_color.md#_snippet_1

LANGUAGE: js
CODE:
```
myAppModule
    .controller('myCtrl', function($scope, $mdTheming) {
      var removeFunction = $mdTheming.setBrowserColor({
        theme: 'myTheme', // Default is 'default'
        palette: 'accent', // Default is 'primary', any basic material palette and extended palettes are available
        hue: '200' // Default is '800'
      });
      
      $scope.$on('$destroy', function () {
        removeFunction(); // COMPLETELY removes the browser color
      })
    })
```

--------------------------------

TITLE: Running All Unit Tests for AngularJS Material
DESCRIPTION: This command executes the complete suite of unit tests for the AngularJS Material project. It ensures comprehensive test coverage and validates the functionality of all components and services.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_7

LANGUAGE: Bash
CODE:
```
npm run test:full
```

--------------------------------

TITLE: Applying Responsive Flex Order with `flex-order-gt-md`
DESCRIPTION: Illustrates how to apply different `flex-order` values based on screen size using responsive directives like `flex-order-gt-md`. This example sets an element's order to '3' on devices larger than medium, overriding its default order for specific breakpoints. This enables adaptive element reordering for responsive designs.

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-children.tmpl.html#_snippet_10

LANGUAGE: HTML
CODE:
```
flex-order-gt-md="3"
```

LANGUAGE: HTML
CODE:
```
flex-order-gt-md="1"
```

--------------------------------

TITLE: Building and Watching AngularJS Material Documentation with Live Reload
DESCRIPTION: This command builds the AngularJS Material library and its documentation, then watches for file changes to automatically rebuild and serve the documentation with live reload. It's used for local development and viewing docs at `http://localhost:8080`.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_4

LANGUAGE: Bash
CODE:
```
npm run docs:watch
```

--------------------------------

TITLE: Applying Heading Styles in HTML
DESCRIPTION: This example shows how to apply AngularJS Material's typography classes to standard HTML heading tags (<h1>, <h2>, <h3>). These classes (.md-display-3, .md-display-1, .md-headline) provide consistent visual styling for headings while preserving semantic structure.

SOURCE: https://github.com/angular/material/blob/master/docs/content/CSS/typography.md#_snippet_1

LANGUAGE: html
CODE:
```
<h1 class="md-display-3">Headline</h1>
<h2 class="md-display-1">Headline</h2>
<h3 class="md-headline">Headline</h3>
```

--------------------------------

TITLE: Creating AngularJS Material Panels with Presets using $mdPanel
DESCRIPTION: This snippet illustrates how to create or open an `$mdPanel` instance by referencing a previously defined preset. By passing the preset name to `$mdPanel.create`, the panel inherits the pre-configured options, significantly reducing the amount of repetitive configuration code required for similar panels.

SOURCE: https://github.com/angular/material/blob/master/src/components/panel/demoPanelProvider/index.html#_snippet_1

LANGUAGE: JavaScript
CODE:
```
function MyController($mdPanel) {
  $mdPanel.create('myCustomPanelPreset', {
    // Optional: override or add more options specific to this instance
    attachTo: angular.element(document.body)
  }).then(function(panelRef) {
    panelRef.open();
  });
}
```

--------------------------------

TITLE: Displaying State Abbreviation with Angular Interpolation
DESCRIPTION: This snippet demonstrates Angular's interpolation syntax to display the 'abbrev' property of a 'state' object. It's typically used for one-way data binding to show dynamic content in templates, often within Angular Material form fields.

SOURCE: https://github.com/angular/material/blob/master/src/components/input/demoInlineForm/index.html#_snippet_0

LANGUAGE: HTML
CODE:
```
{{state.abbrev}}
```

--------------------------------

TITLE: Displaying Autocomplete Result Item (Angular)
DESCRIPTION: This Angular template expression is used to display the `display` property of an `item` object, typically representing a selected or suggested value from an `md-autocomplete` component's data source. It renders the user-friendly text of the item.

SOURCE: https://github.com/angular/material/blob/master/src/components/autocomplete/demoInsideDialog/dialog.tmpl.html#_snippet_0

LANGUAGE: Angular
CODE:
```
{{item.display}}
```

--------------------------------

TITLE: Debugging Specific AngularJS Material Component Demos
DESCRIPTION: This Gulp command is used to watch, build, and serve a specific component's demos for debugging purposes. It rebuilds the component source and demos on save, and the server provides live reload on port 8080, deploying a self-contained AngularJS application for the specified component.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_10

LANGUAGE: Bash
CODE:
```
gulp watch-demo -c textfield server
```

--------------------------------

TITLE: Binding Todos Array Element Properties in Angular Template
DESCRIPTION: Illustrates binding the 'who' property from elements of a 'todos' array using array indexing. This pattern is used for accessing specific items within a collection, such as a list of tasks or events.

SOURCE: https://github.com/angular/material/blob/master/src/components/list/demoBasicUsage/index.html#_snippet_1

LANGUAGE: Angular Template
CODE:
```
{{ todos[0].who }}
```

LANGUAGE: Angular Template
CODE:
```
{{ todos[1].who }}
```

--------------------------------

TITLE: Building Individual AngularJS Material Component Modules
DESCRIPTION: This command compiles and deploys assets for each AngularJS Material component individually. Each component is treated as its own module, allowing for granular builds and distribution to `dist/modules/js/<component folder>`.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_8

LANGUAGE: Bash
CODE:
```
npm run build:modules
```

--------------------------------

TITLE: Displaying End Date with Angular Date Pipe
DESCRIPTION: This snippet displays the `endDate` property from the controller (`ctrl`) using Angular's `date` pipe. Similar to the start date, the `shortDate` format argument is applied for consistent formatting.

SOURCE: https://github.com/angular/material/blob/master/src/components/datepicker/demoCalendar/index.html#_snippet_1

LANGUAGE: Angular Template
CODE:
```
{{ctrl.endDate | date:shortDate}}
```

--------------------------------

TITLE: Example of Overlapping Responsive Flex Directives
DESCRIPTION: Highlights an incorrect usage pattern where responsive flex directives overlap, specifically `flex-md` and `flex-gt-sm` both applying to 'medium' devices. This can lead to unpredictable layout behavior and should be avoided. It's crucial to ensure directives don't conflict for the same breakpoint.

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-children.tmpl.html#_snippet_3

LANGUAGE: HTML
CODE:
```
flex="100" flex-md="50" flex-gt-sm="25"
```

--------------------------------

TITLE: Defining Angular Material Slider Module and Directive - JavaScript
DESCRIPTION: This JavaScript snippet demonstrates the definition of the 'material.components.slider' module and the 'mdSlider' directive in AngularJS. It includes comprehensive ngdoc comments detailing the directive's purpose, its two modes ('normal' and 'discrete'), usage examples with embedded HTML, and a list of its parameters. It adheres to conventions like module naming and directive prefixing.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/CODING.md#_snippet_3

LANGUAGE: js
CODE:
```
/**
 * @ngdoc module
 * @name material.components.slider
 */
angular.module('material.components.slider', [
  'material.core'
])
  .directive('mdSlider', SliderDirective);

/**
 * @ngdoc directive
 * @name mdSlider
 * @module material.components.slider
 * @restrict E
 * @description
 * The `<md-slider>` component allows the user to choose from a range of values.
 *
 * It has two modes: 'normal' mode, where the user slides between a wide range of values, and
 * 'discrete' mode, where the user slides between only a few select values.
 *
 * To enable discrete mode, add the `md-discrete` attribute to a slider, and use the `step`
 * attribute to change the distance between values the user is allowed to pick.
 *
 * @usage
 * <h4>Normal Mode</h4>
 * <hljs lang="html">
 *   <md-slider ng-model="myValue"
 *              min="5"
 *              max="500">
 *   </md-slider>
 * </hljs>
 *
 * <h4>Discrete Mode</h4>
 * <hljs lang="html">
 *   <md-slider md-discrete
 *              ng-model="myDiscreteValue"
 *              step="10"
 *              min="10"
 *              max="130">
 *   </md-slider>
 * </hljs>
 *
 * @param {boolean=} mdDiscrete Whether to enable discrete mode.
 * @param {number=} step The distance between values the user is allowed to pick. Default 1.
 * @param {number=} min The minimum value the user is allowed to pick. Default 0.
 * @param {number=} max The maximum value the user is allowed to pick. Default 100.
 */
function SliderDirective($mdTheming) {
  //...
}
```

--------------------------------

TITLE: Building AngularJS Material Library
DESCRIPTION: This command compiles the entire AngularJS Material library, including JavaScript components, services, theming, and CSS/SCSS styles, deploying them to the `dist` directory. It generates `angular-material.js`, `angular-material.css|scss`, and layout files.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_1

LANGUAGE: Bash
CODE:
```
npm run build
```

--------------------------------

TITLE: Running Fast Smoke Tests for AngularJS Material
DESCRIPTION: This command executes a subset of tests, referred to as smoke tests, for the AngularJS Material project. It provides a quick way to verify basic functionality and ensure critical components are working as expected.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_6

LANGUAGE: Bash
CODE:
```
npm run test:fast
```

--------------------------------

TITLE: Displaying Current Search Text (Angular)
DESCRIPTION: This Angular template expression accesses `ctrl.searchText`, which holds the current input value typed by the user into an `md-autocomplete` field. It's commonly used in 'no results found' messages to echo the user's query back to them.

SOURCE: https://github.com/angular/material/blob/master/src/components/autocomplete/demoInsideDialog/dialog.tmpl.html#_snippet_1

LANGUAGE: Angular
CODE:
```
{{ctrl.searchText}}
```

--------------------------------

TITLE: Running ESLint for AngularJS Material Code Quality
DESCRIPTION: This command executes ESLint across the AngularJS Material codebase to enforce coding standards and identify potential issues. It helps maintain code quality and consistency throughout the project.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_5

LANGUAGE: Bash
CODE:
```
npm run lint
```

--------------------------------

TITLE: Building Minified Production Assets for AngularJS Material
DESCRIPTION: This command performs a production build of the AngularJS Material library, minifying JavaScript and CSS assets, stripping `console.log` statements, and autoprefixing CSS. It generates `angular-material.min.js`, `angular-material.min.css|scss`, and layout files for optimized deployment.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_2

LANGUAGE: Bash
CODE:
```
npm run build:prod
```

--------------------------------

TITLE: Building Asset Cache for CodePen Demos - Shell
DESCRIPTION: This command executes a shell script to generate an object literal containing SVG asset mappings. The output is then copied to the paste buffer, ready to be inserted into the `svg-assets-cache.js` file. This step is crucial for populating the asset cache used by CodePen demos.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/CODEPEN.md#_snippet_0

LANGUAGE: Shell
CODE:
```
./scripts/build-asset-cache.sh | pbcopy
```

--------------------------------

TITLE: Angular Material Component Source Project Structure - Text
DESCRIPTION: This snippet illustrates the standard directory structure for component modules within the Angular Material source directory. Each component has its own folder containing JavaScript, spec, and SCSS files, along with a demo sub-folder.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/CODING.md#_snippet_0

LANGUAGE: text
CODE:
```
 -- /src
    -- /components
       -- /<component folder>

          -- <component>.js
          -- <component>.spec.js
          -- <component>.scss
          -- <component>-theme.scss

          -- /demo<name>

             -- index.html
             -- style.css
             -- script.js
```

--------------------------------

TITLE: Disabling Ink Ripple Effects in AngularJS Material for IE
DESCRIPTION: This example shows how to turn off the material ink ripple animation effects in an AngularJS Material application, specifically targeting Internet Explorer. It uses `$mdInkRippleProvider.disableInkRipple()` within the module's config block, conditional on detecting IE.

SOURCE: https://github.com/angular/material/blob/master/docs/content/performance/internet-explorer.md#_snippet_5

LANGUAGE: js
CODE:
```
var isIE = window.document.documentMode;

angular
  .module('myApp', ['ngMaterial'])
  .config( function($mdInkRippleProvider) {
    if (isIE) {
      $mdInkRippleProvider.disableInkRipple();
    }
  });
```

--------------------------------

TITLE: Initializing Google Analytics for Page Tracking - JavaScript
DESCRIPTION: This JavaScript snippet initializes Google Analytics and sends a pageview event. It sets up the 'ga' function globally, loads the analytics.js script asynchronously, and then uses 'ga' to create a tracker with a specific tracking ID and send an initial pageview.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/index.template.html#_snippet_0

LANGUAGE: JavaScript
CODE:
```
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) })(window,document,'script','//www.google-analytics.com/analytics.js','ga'); ga('create', 'UA-8594346-14', 'auto'); ga('send', 'pageview');
```

--------------------------------

TITLE: Generating Parameter Table (Nunjucks)
DESCRIPTION: This macro generates a formatted table for parameters, including headers for 'Parameter', 'Type', and 'Description'. It reuses the `paramList` macro to populate the table content.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/macros.html#_snippet_2

LANGUAGE: Nunjucks
CODE:
```
{% macro paramTable(params) %} {$ paramList(params) $}

Parameter

Type

Description

{% endmacro -%}
```

--------------------------------

TITLE: Documenting 'this' Context in Nunjucks Template
DESCRIPTION: This snippet demonstrates how the 'this' keyword, representing the method's execution context, is explicitly highlighted and documented within the generated output. It is used to provide clarity on what 'this' refers to for a particular method's implementation.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/methods.template.html#_snippet_0

LANGUAGE: JavaScript
CODE:
```
this
```

--------------------------------

TITLE: Generating Return Value Table (Nunjucks)
DESCRIPTION: This macro generates a table for a function's return value, including headers for 'Returns' and 'Description'. It uses the `typeList` macro to display the return type and includes the function's description.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/macros.html#_snippet_7

LANGUAGE: Nunjucks
CODE:
```
{% macro returnTable(fn) -%}

Returns

Description

{$ typeList(fn.typeList) $}

{$ fn.description | marked $}

{%- endmacro -%}
```

--------------------------------

TITLE: Conditionally Rendering Return Table using Nunjucks Macros
DESCRIPTION: This Nunjucks template snippet imports a `macros.html` file, aliasing it as `macros`. It then checks if the `doc.returns` property exists and is truthy. If so, it invokes the `returnTable` macro from the imported `macros` object, passing `doc.returns` as an argument to generate an HTML table of return values. This ensures that return documentation is only rendered when applicable.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/returns.template.html#_snippet_0

LANGUAGE: Nunjucks
CODE:
```
{% import \"./macros.html\" as macros %} {% if doc.returns -%}\n\n{$ macros.returnTable(doc.returns) $}\n\n{%- endif %}
```

--------------------------------

TITLE: Generating Property Table (Nunjucks)
DESCRIPTION: Similar to `paramTable`, this macro generates a formatted table specifically for properties, with headers for 'Property', 'Type', and 'Description'. It also leverages the `paramList` macro for content generation.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/macros.html#_snippet_3

LANGUAGE: Nunjucks
CODE:
```
{% macro propertyTable(params) %} {$ paramList(params) $}

Property

Type

Description

{% endmacro -%}
```

--------------------------------

TITLE: Generating Parameter List (Nunjucks)
DESCRIPTION: This macro generates a detailed list of parameters, distinguishing between required and optional ones. It includes the parameter name, alias, type, description, and default value if applicable, formatted for documentation.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/macros.html#_snippet_1

LANGUAGE: Nunjucks
CODE:
```
{% macro paramList(params) %}
{% for param in params %}
{%if not param.type.optional %} **\* {$ param.name $}** {% if param.alias %}| {$ param.alias $}{% endif %} {$ typeList(param.typeList) $} {$ typeList(param.typeList) $} {$ param.description | marked $} {% if param.default %}

_(default: {$ param.default $})_

{% endif %} {% endif %} {% endfor %}
{% for param in params %}
{%if param.type.optional %} {$ param.name $} {% if param.alias %}| {$ param.alias $}{% endif %} {$ typeList(param.typeList) $} {$ typeList(param.typeList) $} {$ param.description | marked $} {% if param.default %}

_(default: {$ param.default $})_

{% endif %} {% endif %} {% endfor %} {% endmacro -%}
```

--------------------------------

TITLE: Building AngularJS Material Distribution Files
DESCRIPTION: This Gulp task compiles the AngularJS Material JavaScript and CSS files, along with theme files, into the /dist directory. It's used to generate the production-ready library assets.

SOURCE: https://github.com/angular/material/blob/master/README.md#_snippet_2

LANGUAGE: bash
CODE:
```
gulp build
```

--------------------------------

TITLE: Running Full AngularJS Material Test Suite
DESCRIPTION: This command executes the complete test suite for the AngularJS Material project. It's essential to run this before submitting a pull request to ensure all changes pass existing tests and do not introduce regressions.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/PULL_REQUESTS.md#_snippet_2

LANGUAGE: shell
CODE:
```
npm run test:full
```

--------------------------------

TITLE: Including AngularJS Material via GitCDN.xyz (HTML)
DESCRIPTION: This snippet shows how to integrate the latest development builds of AngularJS Material directly from the `bower-material/master` branch using GitCDN.xyz. It includes the necessary CSS and JavaScript files, along with AngularJS core dependencies, for developers needing the most current versions.

SOURCE: https://github.com/angular/material/blob/master/README.md#_snippet_8

LANGUAGE: html
CODE:
```
  <head>

    <!-- AngularJS Material CSS using GitCDN to load directly from `bower-material/master` -->
    <link rel="stylesheet" href="https://gitcdn.xyz/cdn/angular/bower-material/master/angular-material.css">

  </head>
  <body>

    <!-- AngularJS Material Dependencies -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-animate.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-aria.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-messages.min.js"></script>

    <!-- AngularJS Material Javascript using GitCDN to load directly from `bower-material/master` -->
    <script src="https://gitcdn.xyz/cdn/angular/bower-material/master/angular-material.js"></script>

  </body>
```

--------------------------------

TITLE: Defining AngularJS Material Panel Presets with $mdPanelProvider
DESCRIPTION: This snippet demonstrates how to define a reusable configuration preset for `$mdPanel` elements using `$mdPanelProvider.definePreset` within an AngularJS `.config` block. It allows developers to store common panel options, excluding those dependent on user interaction, positioning, or animation, for later reuse when creating panels.

SOURCE: https://github.com/angular/material/blob/master/src/components/panel/demoPanelProvider/index.html#_snippet_0

LANGUAGE: JavaScript
CODE:
```
angular.module('myApp').config(function($mdPanelProvider) {
  $mdPanelProvider.definePreset('myCustomPanelPreset', {
    template: '<div>Hello from Preset!</div>',
    controller: 'MyPanelController',
    has  Backdrop: true
  });
});
```

--------------------------------

TITLE: Combining Layout Margin, Padding, and Fill (HTML)
DESCRIPTION: Demonstrates the simultaneous application of `layout-margin`, `layout-padding`, and `layout-fill` directives on a single element. This allows for comprehensive control over spacing and sizing within a layout.

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-options.tmpl.html#_snippet_4

LANGUAGE: HTML
CODE:
```
<div layout-margin layout-padding layout-fill>...</div>
```

--------------------------------

TITLE: Generating Function Positional Syntax (Nunjucks)
DESCRIPTION: This macro generates a standard function signature with positional parameters. It lists each parameter by name, enclosing optional parameters in square brackets.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/macros.html#_snippet_6

LANGUAGE: Nunjucks
CODE:
```
{% macro functionSyntax(fn) %} {%- set sep = joiner(', ') -%} {$ fn.name $}({%- for param in fn.params %}{$ sep() $} {%- if param.type.optional %}\[{% endif -%} {$ param.name $} {%- if param.type.optional %}\]{% endif -%} {% endfor %}); {% endmacro -%}
```

--------------------------------

TITLE: Applying Responsive Show/Hide Directives (HTML)
DESCRIPTION: Demonstrates the use of responsive `show` and `hide` directives in Angular Material to conditionally display or conceal elements based on device screen size breakpoints. These directives are media query-aware alternatives to `ng-show` and `ng-hide`.

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-options.tmpl.html#_snippet_6

LANGUAGE: HTML
CODE:
```
<div show-gt-sm>Only show on gt-sm devices.</div>
```

LANGUAGE: HTML
CODE:
```
<div hide-gt-sm>Shown on small and medium.</div>
```

LANGUAGE: HTML
CODE:
```
<div show-sm show-md hide-gt-md>Shown on small and medium size devices.</div>
```

LANGUAGE: HTML
CODE:
```
<div show-md hide-gt-md hide-sm>Shown on medium size devices only.</div>
```

LANGUAGE: HTML
CODE:
```
<div show-gt-md>Shown on devices larger than 1200px wide only.</div>
```

--------------------------------

TITLE: Loading Roboto Font in HTML
DESCRIPTION: This snippet demonstrates how to load the Roboto font from a CDN using a <link> tag in HTML. AngularJS Material uses Roboto, but developers are responsible for loading it. This ensures the correct font is available for typography.

SOURCE: https://github.com/angular/material/blob/master/docs/content/CSS/typography.md#_snippet_0

LANGUAGE: html
CODE:
```
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
```

--------------------------------

TITLE: Angular Material Component Distribution Structure - Library - Text
DESCRIPTION: This snippet describes the distribution of all component modules as a single library. The compiled Angular Material JavaScript and CSS files are deployed directly to the '/dist' directory.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/CODING.md#_snippet_2

LANGUAGE: text
CODE:
```
 -- /dist
    -- angular.material.js
    -- angular.material.css
```

--------------------------------

TITLE: Running AngularJS Material in Development Watch Mode
DESCRIPTION: This NPM script initiates a watch mode for AngularJS Material development. It continuously rebuilds the source, documentation, and demos whenever changes are detected, facilitating rapid development and testing.

SOURCE: https://github.com/angular/material/blob/master/README.md#_snippet_4

LANGUAGE: bash
CODE:
```
npm run docs:watch
```

--------------------------------

TITLE: Generating Function Option Syntax (Nunjucks)
DESCRIPTION: This macro generates a function signature where parameters are passed as properties of an options object. It formats each parameter with its name and type, indicating optional parameters with square brackets.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/macros.html#_snippet_5

LANGUAGE: Nunjucks
CODE:
```
{% macro functionOptionSyntax(fn) %} {%- set sep = joiner(', ') -%} `{$ fn.name $}({` {%- for param in fn.params %}
  `{%- if param.type.optional %}[{% endif -%} {$ param.name $}: {$ param.type.name $} {%- if param.type.optional %}]{% endif -%},` {% endfor %}
`});` {% endmacro -%}
```

--------------------------------

TITLE: Displaying Formatted Pizza Order Details - Angular
DESCRIPTION: This snippet illustrates more advanced data binding in an Angular template, including method calls. It displays the 'size' in lowercase and uses a 'printSelectedToppings()' function to format and show the chosen toppings, providing a summary of the order.

SOURCE: https://github.com/angular/material/blob/master/src/components/select/demoOptionGroups/index.html#_snippet_1

LANGUAGE: Angular
CODE:
```
{{size.toLowerCase()}}
{{printSelectedToppings()}}
```

--------------------------------

TITLE: Formatting Directive Parameter (Nunjucks)
DESCRIPTION: This macro formats a single directive parameter, enclosing it in square brackets (`[]`) if it is optional. It combines the parameter name, join character, and description.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/macros.html#_snippet_4

LANGUAGE: Nunjucks
CODE:
```
{% macro directiveParam(name, type, join, sep) %} {%- if type.optional %}\[{% endif -%} {$ name | dashCase $}{$ join $}{$ type.description $}{$ sep $} {%- if type.optional %}\]{% endif -%} {% endmacro -%}
```

--------------------------------

TITLE: Implementing an Angular Material Dialog with $mdDialog
DESCRIPTION: This HTML snippet defines an Angular Material dialog (`md-dialog`) structure. It includes a toolbar, content area displaying dynamic data (`{{dialog.item.name}}`), and action buttons for closing or submitting the dialog, typically opened via the `$mdDialog` service. This structure is used to present interactive pop-up windows to the user.

SOURCE: https://github.com/angular/material/blob/master/src/components/fabSpeedDial/demoMoreOptions/index.html#_snippet_0

LANGUAGE: HTML
CODE:
```
<md-dialog> <md-toolbar> <div class="md-toolbar-tools">Cool Dialog!</div> </md-toolbar> <md-dialog-content layout-padding> Hello user! you clicked {{dialog.item.name}}. </md-dialog-content> <md-dialog-actions> <md-button aria-label="Close dialog" ng-click="dialog.close()" class="md-primary"> Close Greeting </md-button> <md-button aria-label="Submit dialog" ng-click="dialog.submit()" class="md-primary"> Submit </md-button> </md-dialog-actions> </md-dialog>
```

--------------------------------

TITLE: Using Angular Material Layout Directives in HTML
DESCRIPTION: This HTML snippet demonstrates the use of Angular Material's 'layout' and 'flex' directives. These attributes are used to define the layout and sizing of elements within a container, providing a declarative way to structure UI components before runtime transformation.

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-introduction.tmpl.html#_snippet_0

LANGUAGE: HTML
CODE:
```
<div layout="row">
    <div flex>First item in row</div>
    <div flex>Second item in row</div>
</div>
<div layout="column">
    <div flex>First item in column</div>
    <div flex>Second item in column</div>
</div>
```

--------------------------------

TITLE: Configuring Browser Color Theming with $mdThemingProvider (AngularJS)
DESCRIPTION: This snippet demonstrates how to enable and configure browser header color theming during the AngularJS application's configuration phase. It uses `$mdThemingProvider.enableBrowserColor` to set the theme, palette, and hue, allowing for a consistent Material Design experience on mobile browsers.

SOURCE: https://github.com/angular/material/blob/master/docs/content/Theming/06_browser_color.md#_snippet_0

LANGUAGE: js
CODE:
```
myAppModule
    .config(function($mdThemingProvider) {
      // Enable browser color
      $mdThemingProvider.enableBrowserColor({
        theme: 'myTheme', // Default is 'default'
        palette: 'accent', // Default is 'primary', any basic material palette and extended palettes are available
        hue: '200' // Default is '800'
      });
    });
```

--------------------------------

TITLE: Angular Material Component Distribution Structure - Modules - Text
DESCRIPTION: This snippet shows the distribution structure for individual compiled component modules. After compilation, each component is placed in its respective folder under the '/dist/modules/js' directory.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/CODING.md#_snippet_1

LANGUAGE: text
CODE:
```
 -- /dist
    -- /modules
       -- /js
          -- /core
          -- /<component folder>
```

--------------------------------

TITLE: Exporting AngularJS Material Theming CSS to Clipboard - JavaScript
DESCRIPTION: This JavaScript snippet, intended for execution in Chrome DevTools, copies the dynamically generated AngularJS Material theming CSS to the clipboard. It identifies style elements with the 'md-theme-style' attribute and concatenates their content, enabling the theme to be saved to an external static file for improved Internet Explorer performance.

SOURCE: https://github.com/angular/material/blob/master/docs/content/performance/internet-explorer.md#_snippet_0

LANGUAGE: js
CODE:
```
copy([].slice.call(document.styleSheets)
  .map(e => e.ownerNode)
  .filter(e => e.hasAttribute('md-theme-style'))
  .map(e => e.textContent)
  .join('\n');
);
```

--------------------------------

TITLE: Generating a Predefined Theme at Runtime in AngularJS Material
DESCRIPTION: This JavaScript code shows how to explicitly generate a theme at runtime using $mdTheming.generateTheme(). This is necessary when generateThemesOnDemand is enabled, ensuring the theme's CSS is created before it's used in the application.

SOURCE: https://github.com/angular/material/blob/master/docs/content/Theming/04_multiple_themes.md#_snippet_6

LANGUAGE: js
CODE:
```
$mdTheming.generateTheme('altTheme');
```

--------------------------------

TITLE: Displaying Initial Model State in AngularJS Template
DESCRIPTION: This snippet demonstrates how to display the initial state of `ctrl.selectedItem` using AngularJS one-time binding (`::`). The `| json` filter formats the object as a JSON string. This binding updates only once upon initialization.

SOURCE: https://github.com/angular/material/blob/master/src/components/select/demoTrackBy/index.html#_snippet_0

LANGUAGE: AngularJS Template
CODE:
```
{{ ::ctrl.selectedItem | json }}
```

--------------------------------

TITLE: Generating Type List (Nunjucks)
DESCRIPTION: This macro formats a list of type names, joining them with a pipe (`|`) and escaping each name. It is typically used to display the types of parameters or return values in documentation.

SOURCE: https://github.com/angular/material/blob/master/docs/config/template/ngdoc/lib/macros.html#_snippet_0

LANGUAGE: Nunjucks
CODE:
```
{% macro typeList(types) -%} {%- set sep = joiner('|') %} {% for typeName in types %}`{$ typeName | escape $}`{% endfor %} {%- endmacro -%}
```

--------------------------------

TITLE: Creating a New Git Branch for a Fix
DESCRIPTION: This command creates a new local Git branch named 'wip/my-fix-branch' based on the 'master' branch. It's a crucial first step for isolating changes and preparing for a pull request.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/PULL_REQUESTS.md#_snippet_0

LANGUAGE: shell
CODE:
```
git checkout -b wip/my-fix-branch master
```

--------------------------------

TITLE: Defining AngularJS Material Slider Component Module
DESCRIPTION: This JavaScript snippet illustrates the module definition for the AngularJS Material Slider component. It registers `material.components.slider` as an AngularJS module, declaring its dependency on `material.core`, which is a minimum requirement for all components.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/BUILD.md#_snippet_9

LANGUAGE: JavaScript
CODE:
```
/**
 * @ngdoc module
 * @name material.components.slider
 */
angular.module('material.components.slider', [
  'material.core'
]);
```

--------------------------------

TITLE: Using Flex and Layout Wrap (HTML)
DESCRIPTION: Illustrates the `layout-wrap` directive combined with `flex` attributes. `layout-wrap` enables `flex` children to wrap to the next line if their combined width exceeds 100%, while `flex` defines the proportional width of each child.

SOURCE: https://github.com/angular/material/blob/master/docs/app/partials/layout-options.tmpl.html#_snippet_5

LANGUAGE: HTML
CODE:
```
<div layout-wrap>
  <div flex="33"></div>
  <div flex="66"></div>
  <div flex="66"></div>
  <div flex="33"></div>
  <div flex="33"></div>
  <div flex="33"></div>
  <div flex="33"></div>
</div>
```

--------------------------------

TITLE: Committing Changes with Automatic Add/Remove
DESCRIPTION: This command commits all modified, deleted, and newly added files to the local repository. The '-a' option automatically stages all tracked files, simplifying the commit process.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/PULL_REQUESTS.md#_snippet_1

LANGUAGE: shell
CODE:
```
git commit -a
```

--------------------------------

TITLE: Pushing Local Branch to GitHub Remote
DESCRIPTION: This command pushes the local 'wip/my-fix-branch' to the 'origin' remote repository on GitHub. This makes the branch available online and allows for the creation of a pull request.

SOURCE: https://github.com/angular/material/blob/master/docs/guides/PULL_REQUESTS.md#_snippet_3

LANGUAGE: shell
CODE:
```
git push origin wip/my-fix-branch
```