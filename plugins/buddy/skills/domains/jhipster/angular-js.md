================
CODE SNIPPETS
================
TITLE: Start Firebase Emulators Locally
DESCRIPTION: Starts the Firebase emulators to serve the documentation site locally from the './deploy' directory and use the local function for tasks like search crawling.

SOURCE: https://github.com/angular/angular.js/blob/master/scripts/docs.angularjs.org-firebase/readme.firebase.docs.md#_snippet_3

LANGUAGE: Shell
CODE:
```
$(yarn bin)/firebase emulators:start
```

LANGUAGE: Shell
CODE:
```
..\..\node_modules\.bin\firebase emulators:start
```

--------------------------------

TITLE: Defining an AngularJS Documentation Example Tag
DESCRIPTION: This snippet demonstrates the structure of the `<example>` tag used in AngularJS documentation. It shows how to specify the application module, example name, required dependencies, and animation usage via attributes. Nested `<file>` tags are used to include different source files for the example.

SOURCE: https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#_snippet_7

LANGUAGE: html
CODE:
```
<example
  module="angularAppModule"
  name="exampleName"
  deps="angular-animate.js;angular-route.js"
  animations="true">
  ...
  <file name="index.html">...</file>
  <file name="script.js">...</file>
  <file name="animations.css">...</file>
  <file name="protractor.js">...</file>
  ...
</example>
```

--------------------------------

TITLE: Change Directory for Docs Firebase Setup
DESCRIPTION: Navigates into the specific directory containing the Firebase configuration and scripts for the documentation site.

SOURCE: https://github.com/angular/angular.js/blob/master/scripts/docs.angularjs.org-firebase/readme.firebase.docs.md#_snippet_0

LANGUAGE: Shell
CODE:
```
cd scripts/docs.angularjs.org-firebase
```

--------------------------------

TITLE: Prepare Docs Files for Deployment
DESCRIPTION: Runs the Grunt task 'prepareDeploy' to copy built documentation content and search partials to the deployment and functions directories.

SOURCE: https://github.com/angular/angular.js/blob/master/scripts/docs.angularjs.org-firebase/readme.firebase.docs.md#_snippet_2

LANGUAGE: Shell
CODE:
```
yarn grunt prepareDeploy
```

--------------------------------

TITLE: Build Docs Files with Grunt
DESCRIPTION: Executes the Grunt task 'package' to build the necessary files for the documentation site deployment.

SOURCE: https://github.com/angular/angular.js/blob/master/scripts/docs.angularjs.org-firebase/readme.firebase.docs.md#_snippet_1

LANGUAGE: Shell
CODE:
```
yarn grunt package
```

--------------------------------

TITLE: Starting Local Development Web Server (Shell)
DESCRIPTION: Starts a local HTTP server based on Node.js using Grunt. This server is useful for debugging, running end-to-end tests, and serving the documentation. Access is typically via http://localhost:8000/.

SOURCE: https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#_snippet_1

LANGUAGE: shell
CODE:
```
yarn grunt webserver
```

--------------------------------

TITLE: Interactive JavaScript Input Example
DESCRIPTION: Demonstrates providing a simple JavaScript expression as input to the Closure Compiler running in interactive mode.

SOURCE: https://github.com/angular/angular.js/blob/master/vendor/closure-compiler/README.md#_snippet_2

LANGUAGE: JavaScript
CODE:
```
var x = 17 + 25;
```

--------------------------------

TITLE: Running Closure Compiler Interactively
DESCRIPTION: Starts the Closure Compiler in interactive mode from the command line, allowing direct JavaScript input from the console.

SOURCE: https://github.com/angular/angular.js/blob/master/vendor/closure-compiler/README.md#_snippet_1

LANGUAGE: Command Line
CODE:
```
java -jar build/compiler.jar
```

--------------------------------

TITLE: Run Unit Tests on Browserstack (Shell)
DESCRIPTION: Execute the unit test suite using Grunt and specify target browsers on Browserstack. Requires Karma Browserstack setup.

SOURCE: https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#_snippet_4

LANGUAGE: shell
CODE:
```
yarn grunt test:unit --browsers=BS_Chrome,BS_Firefox,BS_Safari,BS_IE_9,BS_IE_10,BS_IE_11,BS_EDGE,BS_iOS_10
```

--------------------------------

TITLE: jqLite data camelCase - Before (Example 1)
DESCRIPTION: Demonstrates the previous behavior of `jqLite#data` where keys were not camelCased consistently, leading to 'my-key' and 'myKey' referring to different data slots. This example shows setting different values for both keys.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_64

LANGUAGE: js
CODE:
```
/* 1 */
elem.data('my-key', 2);
elem.data('myKey', 3);
```

--------------------------------

TITLE: Interactively rebasing a Git branch (Shell)
DESCRIPTION: Start an interactive rebase of your current branch onto the 'master' branch. This allows you to squash, reorder, or edit commits before pushing.

SOURCE: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#_snippet_4

LANGUAGE: Shell
CODE:
```
git rebase master -i
```

--------------------------------

TITLE: AngularJS Component Controller Before $onInit
DESCRIPTION: Example of an AngularJS component controller accessing bindings directly in the constructor before the default change of `$compileProvider.preAssignBindingsEnabled`. This approach is discouraged in AngularJS 1.5+.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_58

LANGUAGE: JavaScript
CODE:
```
angular.module('myApp', [])
  .component('myComponent', {
    bindings: {value: '<'},
    controller: function() {
      this.doubleValue = this.value * 2;
    }
  });
```

--------------------------------

TITLE: CSS Transition Styling for ngAnimate Breaking Change
DESCRIPTION: This snippet illustrates a breaking change in ngAnimate 1.3.0-beta.4 requiring an explicit zero-duration transition (`transition:0s none` or `transition:0s linear all`) in the setup CSS class to ensure styles are applied immediately before the animation begins. The 'Before' example shows the old approach, while 'After' shows the corrected styling.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_235

LANGUAGE: CSS
CODE:
```
.animated.my-class-add {
  opacity:0;
  transition:0.5s linear all;
}
.animated.my-class-add.my-class-add-active {
  opacity:1;
}
```

LANGUAGE: CSS
CODE:
```
.animated.my-class-add {
  transition:0s linear all;
  opacity:0;
}
.animated.my-class-add.my-class-add-active {
  transition:0.5s linear all;
  opacity:1;
}
```

--------------------------------

TITLE: jqLite data camelCase - After (Example 1)
DESCRIPTION: Demonstrates the updated behavior of `jqLite#data` where keys are camelCased internally. 'my-key' and 'myKey' now map to the same data slot. The example shows renaming one key ('my-key2') to avoid conflict and store distinct values.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_67

LANGUAGE: js
CODE:
```
/* 1 */
// Rename one of the keys as they would now map to the same data slot.
elem.data('my-key', 2);
elem.data('my-key2', 3);
```

--------------------------------

TITLE: AngularJS Controller Definition (Before)
DESCRIPTION: Example showing the previous method for defining AngularJS controllers where 'this' was used directly and required capturing 'this' in callbacks to maintain context.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_283

LANGUAGE: JavaScript
CODE:
```
function MyCtrl() {
  var self = this;

  this.model = 'some model of any type';

  this.fnUsedFromTemplate = function() {
    someApiThatTakesCallback(function callbackFn() {
      self.model = 'updatedModel';
    });
  };
}
```

--------------------------------

TITLE: Building AngularJS Source Code (Shell)
DESCRIPTION: Clones the user's fork of the AngularJS repository, navigates into the directory, adds the main repository as an upstream remote, installs JavaScript dependencies using Yarn, and builds the project using Grunt. The build output is placed in the 'build' directory.

SOURCE: https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#_snippet_0

LANGUAGE: shell
CODE:
```
git clone https://github.com/<github username>/angular.js.git
cd angular.js
git remote add upstream "https://github.com/angular/angular.js.git"
yarn install
yarn grunt package
```

--------------------------------

TITLE: AngularJS Radio Input Non-Strict Comparison Example - HTML
DESCRIPTION: Demonstrates AngularJS radio input examples that relied on non-strict comparison (`==`) for checking the selected status. After the change to strict comparison (`===`), these examples will no longer result in the radio button being checked if the values are of different types (e.g., number `0` vs string `"0"`).

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_113

LANGUAGE: HTML
CODE:
```
  <!-- this.selected = 0 -->
  <input type="radio" ng-model="$ctrl.selected" value="0" >

  <!-- this.selected = 0; this.value = false; -->
  <input type="radio" ng-model="$ctrl.selected" ng-value="$ctrl.value" >
```

--------------------------------

TITLE: Configuring Location Hash Prefix - JavaScript
DESCRIPTION: Provides an example of how to configure the `$locationProvider` to set a custom hash prefix, specifically showing how to revert to an empty string prefix if needed after the default changed from "" to "!".

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_163

LANGUAGE: JavaScript
CODE:
```
appModule.config(['$locationProvider', function($locationProvider) {
  $locationProvider.hashPrefix('');
}]);
```

--------------------------------

TITLE: Configuring $location Hash Prefix (AngularJS)
DESCRIPTION: Provides a configuration block example showing how to set the hash prefix for $location back to an empty string ('') to override the new default '!' prefix, useful for applications not using HTML5 mode.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_108

LANGUAGE: javascript
CODE:
```
appModule.config(['$locationProvider', function($locationProvider) {
  $locationProvider.hashPrefix('');
}]);
```

--------------------------------

TITLE: Defining Scope Objects for ngBind Examples - JavaScript
DESCRIPTION: Defines plain and custom objects on the Angular scope used to demonstrate the behavior changes in the `ngBind` directive when binding non-string values.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_156

LANGUAGE: JavaScript
CODE:
```
$scope.myPlainObject = {a: 1, b: 2};
$scope.myCustomObject = {a: 1, b: 2, toString: function() {return 'a+b';}};
```

--------------------------------

TITLE: $resource Parameter Handling (Before/After)
DESCRIPTION: This JavaScript snippet illustrates the updated behavior of the `$resource` service when handling parameters. Previously, properties inherited from `Object.prototype` were excluded from query parameters, but now all owned properties are included, as shown by the `toString` example.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_154

LANGUAGE: JavaScript
CODE:
```
var Foo = $resource('/foo/:id');
Foo.get({id: 42, bar: 'baz', toString: 'hmm'});
    // URL: /foo/42?bar=baz
    // Note that `toString` is _not_ included in the query,
    // because `Object.prototype.toString` is defined :(
```

LANGUAGE: JavaScript
CODE:
```
var Foo = $resource('/foo/:id');
Foo.get({id: 42, bar: 'baz', toString: 'hmm'});
    // URL: /foo/42?bar=baz&toString=hmm
    // Note that `toString` _is_ included in the query, as expected :)
```

--------------------------------

TITLE: Configuring $resource with Interceptors and Callbacks - AngularJS
DESCRIPTION: Defines an Angular $resource with custom response and responseError interceptors, along with separate success and error callbacks. This setup is used to demonstrate the change in execution order between interceptors and callbacks.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_34

LANGUAGE: javascript
CODE:
```
var User = $resource('/api/users/:id', {id: '@id'}, {
  get: {
    method: 'get',
    interceptor: {
      response: function(response) {
        console.log('responseInterceptor-1');
        return $timeout(1000).then(function() {
          console.log('responseInterceptor-2');
          return response.resource;
        });
      },
      responseError: function(response) {
        console.log('responseErrorInterceptor-1');
        return $timeout(1000).then(function() {
          console.log('responseErrorInterceptor-2');
          return $q.reject('Ooops!');
        });
      }
    }
  }
});
var onSuccess = function(value) { console.log('successCallback', value); };
var onError = function(error) { console.log('errorCallback', error); };

// Assuming the following call is successful...
User.get({id: 1}, onSuccess, onError);
  // Old behavior:
  //   responseInterceptor-1
  //   successCallback, {/* Promise object */}
  //   responseInterceptor-2
  // New behavior:
  //   responseInterceptor-1
  //   responseInterceptor-2
  //   successCallback, {/* User object */}

// Assuming the following call returns an error...
User.get({id: 2}, onSuccess, onError);
  // Old behavior:
  //   errorCallback, {/* Response object */}
  //   responseErrorInterceptor-1
  //   responseErrorInterceptor-2
  // New behavior:
  //   responseErrorInterceptor-1
  //   responseErrorInterceptor-2
  //   errorCallback, Ooops!
```

--------------------------------

TITLE: Directive Usage Without Optional Attribute (AngularJS)
DESCRIPTION: Example HTML demonstrating the usage of a custom directive `my-dir` without providing the optional `myAttr`. This context is used to show the scenario where the old `$observe` behavior changed.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_204

LANGUAGE: html
CODE:
```
<my-dir></my-dir>
```

--------------------------------

TITLE: AngularJS Controller Definition (After)
DESCRIPTION: Example showing the new method for defining AngularJS controllers where the controller is a standalone object and '$scope' is injected and used for model and function binding.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_284

LANGUAGE: JavaScript
CODE:
```
function MyCtrl($scope) {
  $scope.model = 'some model of any type';

  $scope.fnUsedFromTemplate = function() {
    someApiThatTakesCallback(function() {
      $scope.model = 'updatedModel';
    });
  }
}
```

--------------------------------

TITLE: $cookies Interaction After (Recommended)
DESCRIPTION: This snippet demonstrates the recommended way to interact with cookies using the `$cookies` service after the removal of `$cookieStore`. It specifically shows using `putObject` and `getObject` for handling object values, as `get`/`put` methods do not correctly handle objects.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_5

LANGUAGE: javascript
CODE:
```
$cookies.putObject('name', {key: 'value'});
$cookies.getObject('name'); // {key: 'value'}
$cookies.remove('name');
```

--------------------------------

TITLE: $animate.addClass Digest Requirement (Before/After) - Angular.js
DESCRIPTION: Demonstrates that $animate.addClass (and similar methods) now require a digest cycle ($rootScope.$digest()) to be triggered before the animation actually starts, affecting testing code.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_213

LANGUAGE: js
CODE:
```
//before this fix
$animate.addClass(element, 'super');
expect(element).toHaveClass('super');

//now
$animate.addClass(element, 'super');
$rootScope.$digest();
expect(element).toHaveClass('super');
```

--------------------------------

TITLE: AngularJS Input Radio Before Strict Comparison
DESCRIPTION: Examples of AngularJS `input type='radio'` bindings where non-strict comparison (`==`) would previously result in the radio being checked. With the change to strict comparison (`===`), these examples will no longer be checked unless values are strictly equal.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_61

LANGUAGE: HTML
CODE:
```
  <!-- this.selected = 0 -->
  <input type="radio" ng-model="$ctrl.selected" value="0" >

  <!-- this.selected = 0; this.value = false; -->
  <input type="radio" ng-model="$ctrl.selected" ng-value="$ctrl.value" >
```

--------------------------------

TITLE: jqLite data camelCase - Before (Example 3)
DESCRIPTION: Shows the previous behavior where setting data via property access using the hyphenated key ('foo-bar') and the camelCased key ('fooBar') resulted in two distinct data entries. Retrieving by the hyphenated key returned the value set via that key.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_66

LANGUAGE: js
CODE:
```
/* 3 */
elem.data()['foo-bar'] = 1;
elem.data()['fooBar'] = 2;
elem.data('foo-bar'); // 1
```

--------------------------------

TITLE: $cookieStore Interaction Before (Deprecated)
DESCRIPTION: This code shows how to use the deprecated `$cookieStore` service to put, get, and remove cookie values. Note that `$cookieStore` has been removed and applications should migrate to the `$cookies` service.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_4

LANGUAGE: javascript
CODE:
```
$cookieStore.put('name', {key: 'value'});
$cookieStore.get('name'); // {key: 'value'}
$cookieStore.remove('name');
```

--------------------------------

TITLE: jqLite boolean attributes (prop reflection) - After CSS
DESCRIPTION: Example CSS selector targeting an input element based on the 'checked' property state using the `:checked` pseudo-class, which is the recommended way after the change.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_76

LANGUAGE: css
CODE:
```
input:checked { ... }
```

--------------------------------

TITLE: Securing link[href] with $sce (AngularJS HTML)
DESCRIPTION: Describes the enhancement where `link[href]` attributes are now protected by the $sce service using the `RESOURCE_URL` context. Shows an example of an interpolated URL from a different domain that will fail the default security check. Mentions whitelisting or using `$sce.trustAsResourceUrl` as methods to allow such URLs.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_97

LANGUAGE: html
CODE:
```
<link href="{{ 'http://mydomain.org/unsafe.css' }}" rel="stylesheet">
```

--------------------------------

TITLE: Updating $locationProvider.html5Mode API - AngularJS
DESCRIPTION: This snippet demonstrates the change in the `$locationProvider.html5Mode` API. Previously, it returned a boolean; now it returns an object. To get the enabled state, access the `enabled` property on the returned object.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_207

LANGUAGE: JavaScript
CODE:
```
// Before:
var mode = $locationProvider.html5Mode();

// After:
var mode = $locationProvider.html5Mode().enabled;
```

--------------------------------

TITLE: jqLite css camelCase - Before JS
DESCRIPTION: Shows the previous behavior of `jqLite#css` where setting and getting CSS properties using various hyphenated or underscored names were treated as equivalent to the camelCased version.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_71

LANGUAGE: js
CODE:
```
// All five versions used to be equivalent.
elem.css('background_color', 'blue');
elem.css('background:color', 'blue');
elem.css('background-color', 'blue');
elem.css('background--color', 'blue');
elem.css('backgroundColor', 'blue');

// All five versions used to be equivalent.
var bgColor = elem.css('background_color');
var bgColor = elem.css('background:color');
var bgColor = elem.css('background-color');
var bgColor = elem.css('background--color');
var bgColor = elem.css('backgroundColor');
```

--------------------------------

TITLE: jqLite data camelCase - Before (Example 2)
DESCRIPTION: Illustrates the previous behavior of `jqLite#data` where accessing data via the original hyphenated key ('foo-bar') and the non-camelCased property access returned the set value, while the camelCased property access ('fooBar') returned undefined.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_65

LANGUAGE: js
CODE:
```
/* 2 */
elem.data('foo-bar', 42);
elem.data()['foo-bar']; // 42
elem.data()['fooBar']; // undefined
```

--------------------------------

TITLE: jqLite boolean attributes (prop reflection) - Before CSS
DESCRIPTION: Example CSS selector targeting an input element based on the presence and value of the 'checked' attribute, which was previously set by jqLite's `attr` method.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_74

LANGUAGE: css
CODE:
```
input[checked="checked"] { ... }
```

--------------------------------

TITLE: Interpolation Using JSON Filter After Change - HTML
DESCRIPTION: Shows how to use the `json` filter with interpolation after the change that makes it respect custom `toString()`, allowing you to still get the `JSON.stringify` output.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_161

LANGUAGE: HTML
CODE:
```
<span>{{myObject | json}}</span>
```

--------------------------------

TITLE: jqLite data camelCase - After (Example 3)
DESCRIPTION: Shows the updated behavior where setting data via property access using 'foo-bar' and 'fooBar' now maps to the same data slot ('fooBar'). The last value set (via 'fooBar') is the one retrieved when accessing by the hyphenated key ('foo-bar').

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_69

LANGUAGE: js
CODE:
```
/* 3 */
elem.data()['foo-bar'] = 1;
elem.data()['fooBar'] = 2;
elem.data('foo-bar'); // 2
```

--------------------------------

TITLE: jqLite css camelCase - After JS
DESCRIPTION: Shows the updated behavior of `jqLite#css` where only single hyphens followed by a lowercase letter are converted to camelCase. Only 'background-color' and 'backgroundColor' are now treated as equivalent for setting and getting properties.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_73

LANGUAGE: js
CODE:
```
// Previous five versions are no longer equivalent but these two still are.
elem.css('background-color', 'blue');
elem.css('backgroundColor', 'blue');

// Previous five versions are no longer equivalent but these two still are.
var bgColor = elem.css('background-color');
var bgColor = elem.css('backgroundColor');
```

--------------------------------

TITLE: Displaying Closure Compiler Help
DESCRIPTION: Runs the Closure Compiler with the '--help' flag to display available command-line options and usage information.

SOURCE: https://github.com/angular/angular.js/blob/master/vendor/closure-compiler/README.md#_snippet_3

LANGUAGE: Command Line
CODE:
```
java -jar compiler.jar --help
```

--------------------------------

TITLE: jqLite data camelCase - After (Example 2)
DESCRIPTION: Illustrates the updated behavior of `jqLite#data` where keys are camelCased. Setting data with 'foo-bar' results in the data being stored under 'fooBar'. Accessing via the hyphenated key ('foo-bar') now returns undefined, while accessing via the camelCased key ('fooBar') returns the value.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_68

LANGUAGE: js
CODE:
```
/* 2 */
elem.data('foo-bar', 42);
elem.data()['foo-bar']; // undefined
elem.data()['fooBar']; // 42
```

--------------------------------

TITLE: Run AngularJS Release Script (Bash)
DESCRIPTION: Executes the main release script for AngularJS. It takes parameters for dry-run status, the specific commit SHA to release, the version number, and the version code-name. Requires write access to GitHub dist repositories and npm publish rights.

SOURCE: https://github.com/angular/angular.js/blob/master/RELEASE.md#_snippet_1

LANGUAGE: bash
CODE:
```
scripts/release/release.sh --git-push-dryrun=false --commit-sha=8822a4f --version-number=1.7.6 --version-name=gravity-manipulation
```

--------------------------------

TITLE: List Contributors for Release Announcement (Bash)
DESCRIPTION: Uses git log to extract the names of contributors between two specified version tags. The output is sorted and unique names are listed, useful for acknowledging contributors in release announcements or blog posts.

SOURCE: https://github.com/angular/angular.js/blob/master/RELEASE.md#_snippet_2

LANGUAGE: bash
CODE:
```
git log --format='%aN' v1.2.12..v1.2.13 | sort -u
```

--------------------------------

TITLE: Using $animateCss Service in Angular.js (Before/After)
DESCRIPTION: Demonstrates the updated usage of the `$animateCss` service in Angular.js. Previously, code checked if the service returned a valid animator object before calling `start()`. Now, the service always returns an object, so the null check is removed.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_187

LANGUAGE: JavaScript
CODE:
```
// before
var animator = $animateCss(element, { ... });
if (!animator) {
  continueApp();
  return;
}
var runner = animator.start();
runner.done(continueApp);
runner.then(continueApp);
```

LANGUAGE: JavaScript
CODE:
```
// now
var animator = $animateCss(element, { ... });
var runner = animator.start();
runner.done(continueApp);
runner.then(continueApp);
```

--------------------------------

TITLE: Building Closure Compiler with Ant
DESCRIPTION: Executes the 'jar' target in the build.xml file using Ant to compile the Closure Compiler source into a runnable JAR file.

SOURCE: https://github.com/angular/angular.js/blob/master/vendor/closure-compiler/README.md#_snippet_0

LANGUAGE: Ant
CODE:
```
ant jar
```

--------------------------------

TITLE: Interpolating Objects with Custom toString (AngularJS)
DESCRIPTION: Shows how interpolation ({{}}) now uses custom toString() functions for non-Date, Array, or Number objects. The example demonstrates using the 'json' filter to explicitly stringify an object if the JSON.stringify output is desired.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_106

LANGUAGE: html
CODE:
```
<span>{{myObject}}</span>
<span>{{myObject | json}}</span>
```

--------------------------------

TITLE: Generate Release Notes with Changez (Bash)
DESCRIPTION: Uses the changez tool to automatically generate release notes based on commit history. Requires specifying an output file, the new version number, and the base branch for comparison. The output should be reviewed and manually adjusted.

SOURCE: https://github.com/angular/angular.js/blob/master/RELEASE.md#_snippet_0

LANGUAGE: bash
CODE:
```
node_modules/.bin/changez -o changes.md -v <new version> <base branch>
```

--------------------------------

TITLE: Migrating ngMessagesInclude Directive in AngularJS
DESCRIPTION: Illustrates the breaking change in AngularJS 1.4.x where the `ngMessagesInclude` attribute was converted into a directive that must be placed as a child element within the `ngMessages` container. The examples show the syntax before and after the change.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_194

LANGUAGE: HTML
CODE:
```
<!-- AngularJS 1.3.x -->
<div ng-messages="model.$error" ng-messages-include="remote.html">
  <div ng-message="required">Your message is required</div>
</div>
```

LANGUAGE: HTML
CODE:
```
<!-- AngularJS 1.4.x -->
<div ng-messages="model.$error">
  <div ng-message="required">Your message is required</div>
  <div ng-messages-include="remote.html"></div>
</div>
```

--------------------------------

TITLE: Demonstrating $compile href Interpolation Failure in AngularJS 1.2.30+
DESCRIPTION: This HTML snippet shows an example of a `<link>` tag where the `href` attribute uses interpolation with a URL from a different domain. Due to security fixes in AngularJS 1.2.30, this will fail the `$sce` `RESOURCE_URL` context check by default, preventing the external resource from being loaded unless the domain is whitelisted or the URL is explicitly trusted.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_165

LANGUAGE: HTML
CODE:
```
<link rel="stylesheet" href="{{ 'https://otherdomain.org/unsafe.css' }}" />
```

--------------------------------

TITLE: AngularJS Component Controller Using $onInit
DESCRIPTION: Demonstrates the recommended pattern for accessing component bindings in AngularJS 1.5+ using the `$onInit` lifecycle hook, which is called after all bindings have been initialized.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_59

LANGUAGE: JavaScript
CODE:
```
angular.module('myApp', [])
  .component('myComponent', {
    bindings: {value: '<'},
    controller: function() {
      this.$onInit = function() {
        this.doubleValue = this.value * 2;
      };
    }
  });
```

--------------------------------

TITLE: Handling White-space in AngularJS Attributes
DESCRIPTION: Describes the change where white-space in attributes is no longer automatically trimmed. This includes leading/trailing white-space and attributes that are purely white-space. Provides a JavaScript example showing how to manually trim attribute values when using $attrs.$observe for comparison, as $parse still trims expressions automatically.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_148

LANGUAGE: javascript
CODE:
```
$attrs.$observe('myAttr', function(newVal) {
  if (newVal === 'false') ...
});
```

LANGUAGE: javascript
CODE:
```
$attrs.$observe('myAttr', function(newVal) {
  if (newVal.trim() === 'false') ...
});
```

--------------------------------

TITLE: Running AngularJS tests with Yarn (Shell)
DESCRIPTION: Execute the full suite of AngularJS unit and E2E tests using Yarn and Grunt. This command should be run before submitting a pull request to ensure all tests pass.

SOURCE: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#_snippet_2

LANGUAGE: Shell
CODE:
```
yarn grunt test
```

--------------------------------

TITLE: Running Tests with Gradle
DESCRIPTION: This command executes the test suite for the ng-closure-runner project using the Gradle build tool. It performs the necessary compilation and runs all configured tests to verify the project's functionality.

SOURCE: https://github.com/angular/angular.js/blob/master/vendor/ng-closure-runner/README.md#_snippet_0

LANGUAGE: Shell
CODE:
```
$ gradle check
```

--------------------------------

TITLE: Multi-Slot Transclusion with Default Text Nodes in AngularJS (IE11)
DESCRIPTION: Illustrates the impact of the IE11 text node merging fix on multi-slot transclusion with non-consecutive, default-content text nodes that form interpolated expressions when merged. Shows the DOM structure before and after the change, and provides an HTML migration example using <span> wrappers to prevent merging.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_146

LANGUAGE: html
CODE:
```
<!-- And assuming the following view: -->
<some-thing>
  {{
  <very-important-content>Nooot</very-important-content>
  'foo'}}
</some-thing>
```

LANGUAGE: html
CODE:
```
<!-- Before: -->
<some-thing>
  <ng-transclude>
    {{       <-- Two separate
    'foo'}}  <-- text nodes
  </ng-transclude>
</some-thing>
```

LANGUAGE: html
CODE:
```
<!-- After: -->
<some-thing>
  <ng-transclude>
    foo  <-- The text nodes were merged into `{{'foo'}}`, which was then interpolated
  </ng-transclude>
</some-thing>
```

LANGUAGE: html
CODE:
```
<!-- To (visually) get the old behavior, wrap top-level text nodes on -->
<!-- multi-slot transclusion directives into `<span>` elements; e.g.: -->
<some-thing>
  <span>{{</span>
  <very-important-content>Nooot</very-important-content>
  <span>'foo'}}</span>
</some-thing>
```

LANGUAGE: html
CODE:
```
<!-- Result: -->
<some-thing>
  <ng-transclude>
    <span>{{</span>       <-- Two separate
    <span>'foo'}}</span>  <-- nodes
  </ng-transclude>
</some-thing>
```

--------------------------------

TITLE: Overwriting ngModel max validator in Angular.js
DESCRIPTION: Provides an example of an Angular.js directive definition object that overwrites the default `max` validator for `ngModelController` to validate against the `modelValue` instead of the new `viewValue`, addressing a breaking change in `input[type=number]` validation.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_16

LANGUAGE: JavaScript
CODE:
```
{
  restrict: 'A',
  require: 'ngModel',
  link: function(scope, element, attrs, ctrl) {
    var maxValidator = ctrl.$validators.max;

    ctrl.$validators.max = function(modelValue, viewValue) {
      return maxValidator(modelValue, modelValue);
    };
  }
}
```

--------------------------------

TITLE: Compiling Array of Text Nodes with $compile in AngularJS (IE11)
DESCRIPTION: Demonstrates the change in behavior when compiling an array or jqLite/jQuery collection of parent-less text nodes directly with $compile in IE11. Previously, consecutive text nodes were not merged; now they are. Includes examples showing the behavior before and after the change, and the recommended migration strategy to achieve the old behavior by compiling each node separately.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_145

LANGUAGE: javascript
CODE:
```
// Assuming:
var textNodes = [
  document.createTextNode('{{'),
  document.createTextNode('"foo:"'),
  document.createTextNode('}}')
];
var compiledNodes = $compile(textNodes)($rootScope);

// Before:
console.log(compiledNodes.length);   // 3
console.log(compiledNodes.text());   // {{'foo'}}

// After:
console.log(compiledNodes.length);   // 1
console.log(compiledNodes.text());   // foo
```

LANGUAGE: javascript
CODE:
```
// To get the old behavior, compile each node separately:
var textNodes = [
  document.createTextNode('{{'),
  document.createTextNode('"foo"'),
  document.createTextNode('}}')
];
var compiledNodes = angular.element(textNodes.map(function (node) {
  return $compile(node)($rootScope)[0];
}));
```

--------------------------------

TITLE: Running Unit Tests on Specified Browsers (Shell)
DESCRIPTION: Executes the unit and integration tests using Karma on a list of specified browsers. Multiple browser names should be provided as a comma-separated list without spaces.

SOURCE: https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#_snippet_3

LANGUAGE: shell
CODE:
```
yarn grunt test:unit --browsers=Chrome,Firefox
```

--------------------------------

TITLE: Customizing NgModelController.$isEmpty() in Angular.js Directive - JavaScript
DESCRIPTION: Provides an example of how to override the default `NgModelController.$isEmpty()` method within a custom directive's `link` function. This allows restoring the previous behavior or defining custom logic for determining emptiness based on the model value.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_85

LANGUAGE: javascript
CODE:
```
.directive('myCheckbox', function myCheckboxDirective() {
  return {
    require: 'ngModel',
    link: function myCheckboxPostLink(scope, elem, attrs, ngModelCtrl) {
      ngModelCtrl.$isEmpty = function myCheckboxIsEmpty(value) {
        return !value;   // Any falsy value means "empty"

        // Or to restore the previous behavior:
        // return value === false;
      };
    }
  };
})
```

--------------------------------

TITLE: Testing Checkbox Model Update Before Change Event Fix (AngularJS)
DESCRIPTION: This snippet shows a test setup that might fail after the change event fix. It compiles an input element with ng-model and triggers a click event without attaching the element to the document, expecting the model to update. This relies on the 'click' event directly updating the model, which is no longer the case when 'change' is the primary listener.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_45

LANGUAGE: JavaScript
CODE:
```
    it('should update the model', inject(function($compile, $rootScope) {
      var inputElm = $compile('<input type="checkbox" ng-model="checkbox" />')($rootScope);

      inputElm[0].click(); // Or different trigger mechanisms, such as jQuery.trigger()
      expect($rootScope.checkbox).toBe(true);
    });
```

--------------------------------

TITLE: Compiling JavaScript Files Using Globs
DESCRIPTION: Uses a minimatch-style glob pattern from the command line to include all JavaScript files recursively from a source directory for compilation.

SOURCE: https://github.com/angular/angular.js/blob/master/vendor/closure-compiler/README.md#_snippet_5

LANGUAGE: Bash
CODE:
```
# Recursively include all js files in subdirs
java -jar compiler.jar --js_output_file=out.js 'src/**.js'
```

--------------------------------

TITLE: Overriding $isEmpty for custom checkbox - AngularJS
DESCRIPTION: This snippet provides an example of an AngularJS directive that overrides the default `$isEmpty()` method for a custom checkbox control. It shows how to define a custom function to determine when the model value should be considered 'empty', including an option to restore the previous behavior.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_133

LANGUAGE: js
CODE:
```
.directive('myCheckbox', function myCheckboxDirective() {
  return {
    require: 'ngModel',
    link: function myCheckboxPostLink(scope, elem, attrs, ngModelCtrl) {
      ngModelCtrl.$isEmpty = function myCheckboxIsEmpty(value) {
        return !value;   // Any falsy value means "empty"

        // Or to restore the previous behavior:
        // return value === false;
      };
    }
  };
})
```

--------------------------------

TITLE: Compiling Multiple JavaScript Files
DESCRIPTION: Uses the Closure Compiler from the command line to combine and optimize several input JavaScript files into a single output file.

SOURCE: https://github.com/angular/angular.js/blob/master/vendor/closure-compiler/README.md#_snippet_4

LANGUAGE: Bash
CODE:
```
java -jar compiler.jar --js_output_file=out.js in1.js in2.js in3.js ...
```

--------------------------------

TITLE: Registering AngularJS Controller via Module API
DESCRIPTION: Demonstrates the recommended way to register a controller using the AngularJS Module API, replacing the deprecated method of instantiating controllers from the global window object.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_50

LANGUAGE: JavaScript
CODE:
```
angular.module('myModule', []).controller('myController', function() {...});
```

--------------------------------

TITLE: Overriding input[type=number] min/max Validation in Angular.js JavaScript
DESCRIPTION: Provides an example of an Angular.js directive definition object used to override the default min/max validation behavior for input[type=number]. The directive intercepts the built-in validator and forces it to validate against the $modelValue instead of the $viewValue, restoring the pre-change behavior for applications that rely on model-based validation.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_44

LANGUAGE: JavaScript
CODE:
```
{
  restrict: 'A',
  require: 'ngModel',
  link: function(scope, element, attrs, ctrl) {
    var maxValidator = ctrl.$validators.max;

    ctrl.$validators.max = function(modelValue, viewValue) {
      return maxValidator(modelValue, modelValue);
    };
  }
}
```

--------------------------------

TITLE: Build AngularJS Documentation (Shell)
DESCRIPTION: Executes the grunt task to build the project documentation from source code and markdown files. This task internally uses gulp for the build process.

SOURCE: https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#_snippet_5

LANGUAGE: Shell
CODE:
```
yarn grunt docs
```

--------------------------------

TITLE: Using Old Angular Compile API with $init
DESCRIPTION: Demonstrates the deprecated way of compiling a DOM element and initializing the scope using the $init() method, which was primarily used by low-level widget tests.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_287

LANGUAGE: JavaScript
CODE:
```
angular.compile(element).$init();
```

--------------------------------

TITLE: Pushing a Git branch to origin (Shell)
DESCRIPTION: Push your local branch to your remote repository on GitHub. This makes your changes available online and is necessary to create a pull request.

SOURCE: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#_snippet_3

LANGUAGE: Shell
CODE:
```
git push origin my-fix-branch
```

--------------------------------

TITLE: Build AngularJS Project (Shell)
DESCRIPTION: Runs the main grunt build task for the AngularJS project. This is often required before viewing the documentation locally, as the docs application relies on the locally built project files.

SOURCE: https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#_snippet_6

LANGUAGE: Shell
CODE:
```
yarn grunt build
```

--------------------------------

TITLE: Defining Component Controller After preAssignBindingsEnabled Change - AngularJS - JavaScript
DESCRIPTION: Shows the recommended way to define a component controller in AngularJS 1.5+ after `preAssignBindingsEnabled` defaults to `false`. Initialization logic that depends on bindings is moved into the `$onInit` lifecycle hook method.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_111

LANGUAGE: JavaScript
CODE:
```
angular.module('myApp', [])
  .component('myComponent', {
    bindings: {value: '<'},
    controller: function() {
      this.$onInit = function() {
        this.doubleValue = this.value * 2;
      };
    }
  });
```

--------------------------------

TITLE: Configure AngularJS preAssignBindingsEnabled to true
DESCRIPTION: Shows how to configure `$compileProvider.preAssignBindingsEnabled` back to `true` in an AngularJS module's config block. This can be used as a temporary migration step but is not recommended for libraries.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_60

LANGUAGE: JavaScript
CODE:
```
angular.module('myApp', [])
  .config(function($compileProvider) {
    $compileProvider.preAssignBindingsEnabled(true);
  })
  .component('myComponent', {
    bindings: {value: '<'},
    controller: function() {
      this.doubleValue = this.value * 2;
    }
  });
```

--------------------------------

TITLE: Registering AngularJS Controller via $controllerProvider
DESCRIPTION: Shows how to register a controller using the $controllerProvider within a module's config block, providing an alternative to the Module API for controller registration.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_51

LANGUAGE: JavaScript
CODE:
```
angular.module('myModule', []).config(function($controllerProvider) {
  $controllerProvider.register('myController', function() {...});
});
```

--------------------------------

TITLE: Passing All Params in $resource (JavaScript)
DESCRIPTION: Demonstrates how `$resource` now includes all owned properties from the params object, including those that might shadow `Object.prototype` properties, as query parameters in the URL.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_103

LANGUAGE: JavaScript
CODE:
```
var Foo = $resource('/foo/:id');
Foo.get({id: 42, bar: 'baz', toString: 'hmm'});
    // URL: /foo/42?bar=baz
    // Note that `toString` is _not_ included in the query,
    // because `Object.prototype.toString` is defined :(
```

LANGUAGE: JavaScript
CODE:
```
var Foo = $resource('/foo/:id');
Foo.get({id: 42, bar: 'baz', toString: 'hmm'});
    // URL: /foo/42?bar=baz&toString=hmm
    // Note that `toString` _is_ included in the query, as expected :)
```

--------------------------------

TITLE: Defining Module Decorators (AngularJS)
DESCRIPTION: Demonstrates the declaration order of a factory, a $provide.decorator within a config block, and a module.decorator, illustrating how their processing order changed to align module.decorator with the config queue.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_107

LANGUAGE: javascript
CODE:
```
angular
  .module('theApp', [])
  .factory('theFactory', theFactoryFn)
  .config(function($provide) {
    $provide.decorator('theFactory', provideDecoratorFn);
  })
  .decorator('theFactory', moduleDecoratorFn);
```

--------------------------------

TITLE: Defining Component Controller Before preAssignBindingsEnabled Change - AngularJS - JavaScript
DESCRIPTION: Shows how a component controller was defined before the default change of `preAssignBindingsEnabled` to `false`. Initialization logic relying on bindings was placed directly in the controller function. This approach is discouraged in 1.5+ in favor of `$onInit`.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_110

LANGUAGE: JavaScript
CODE:
```
angular.module('myApp', [])
  .component('myComponent', {
    bindings: {value: '<'},
    controller: function() {
      this.doubleValue = this.value * 2;
    }
  });
```

--------------------------------

TITLE: Checking out the master branch in Git (Shell)
DESCRIPTION: Switch to the local 'master' branch. The '-f' option can be used to force the checkout, discarding local changes if necessary.

SOURCE: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#_snippet_7

LANGUAGE: Shell
CODE:
```
git checkout master -f
```

--------------------------------

TITLE: Bootstrapping Angular App with ng-app - HTML
DESCRIPTION: Illustrates the recommended way to bootstrap an Angular application by adding the ng-app attribute to the root HTML element, specifying the main module name.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_223

LANGUAGE: HTML
CODE:
```
<div ng-app="module">...</div>
```

--------------------------------

TITLE: Creating a new Git branch (Shell)
DESCRIPTION: Create a new Git branch based on the 'master' branch to isolate your changes for a fix or feature. This is the first step in the pull request workflow.

SOURCE: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#_snippet_0

LANGUAGE: Shell
CODE:
```
git checkout -b my-fix-branch master
```

--------------------------------

TITLE: Registering AngularJS Controllers via Module API or Provider
DESCRIPTION: This snippet demonstrates the recommended ways to register controllers in AngularJS after the removal of the ability to instantiate them from the global window scope. It shows registration using the standard module `.controller()` method and the `$controllerProvider.register()` method within a module's config block.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_22

LANGUAGE: JavaScript
CODE:
```
angular.module('myModule', []).controller('myController', function() {...});

angular.module('myModule', []).config(function($controllerProvider) {
  $controllerProvider.register('myController', function() {...});
});
```

--------------------------------

TITLE: Compiling JavaScript Files with Glob and Exclusion
DESCRIPTION: Uses glob patterns from the command line to include all JavaScript files recursively from a source directory while excluding specific files (e.g., test files) from the compilation process.

SOURCE: https://github.com/angular/angular.js/blob/master/vendor/closure-compiler/README.md#_snippet_6

LANGUAGE: Bash
CODE:
```
# Recursively include all js files in subdirs, exclusing test files.
# Use single-quotes, so that bash doesn't try to expand the '!'
java -jar compiler.jar --js_output_file=out.js 'src/**.js' '!**_test.js'
```

--------------------------------

TITLE: Handling AngularJS $http Success/Error Using Promise API
DESCRIPTION: This snippet shows the recommended way to handle $http responses using the standard promise methods then() and catch(). It illustrates both the then(success, error) and then(success).catch(error) patterns, noting the difference in error handling scope.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_135

LANGUAGE: javascript
CODE:
```
$http(...).
  then(function onSuccess(response) {
    // Handle success
    var data = response.data;
    var status = response.status;
    var statusText = response.statusText;
    var headers = response.headers;
    var config = response.config;
    ...
  }, function onError(response) {
    // Handle error
    var data = response.data;
    var status = response.status;
    var statusText = response.statusText;
    var headers = response.headers;
    var config = response.config;
    ...
  });

// or

$http(...).
  then(function onSuccess(response) {
    // Handle success
    var data = response.data;
    var status = response.status;
    var statusText = response.statusText;
    var headers = response.headers;
    var config = response.config;
    ...
  }).
  catch(function onError(response) {
    // Handle error
    var data = response.data;
    var status = response.status;
    var statusText = response.statusText;
    var headers = response.headers;
    var config = response.config;
    ...
  });
```

--------------------------------

TITLE: Making JSONP Requests with jsonpCallbackParam (AngularJS)
DESCRIPTION: Shows the updated way to make JSONP requests. The callback parameter name must now be specified using the jsonpCallbackParam property in the config object or globally via $http.defaults.jsonpCallbackParam. The JSON_CALLBACK placeholder is no longer used.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_90

LANGUAGE: javascript
CODE:
```
$http.json('trusted/url');
$http.json('other/trusted/url', {jsonpCallbackParam:'cb'});
```

--------------------------------

TITLE: Running Unit Tests on Chrome (Shell)
DESCRIPTION: Executes the unit and integration tests written with Jasmine using Karma. By default, this command runs all tests once on the Chrome browser.

SOURCE: https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#_snippet_2

LANGUAGE: shell
CODE:
```
yarn grunt test:unit
```

--------------------------------

TITLE: Specify User Agent - robots.txt
DESCRIPTION: This directive specifies which web crawler the following rules apply to. The asterisk (*) indicates that the rules apply to all user agents.

SOURCE: https://github.com/angular/angular.js/blob/master/docs/app/assets/robots.txt#_snippet_0

LANGUAGE: robots.txt
CODE:
```
User-agent: *
```

--------------------------------

TITLE: Reverting preAssignBindingsEnabled Setting - AngularJS - JavaScript
DESCRIPTION: Provides a temporary workaround to revert the default behavior of `preAssignBindingsEnabled` back to `true` using `$compileProvider.preAssignBindingsEnabled(true)`. This allows older code to function without immediate migration to `$onInit`, but is not recommended for libraries.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_112

LANGUAGE: JavaScript
CODE:
```
angular.module('myApp', [])
  .config(function($compileProvider) {
    $compileProvider.preAssignBindingsEnabled(true);
  })
  .component('myComponent', {
    bindings: {value: '<'},
    controller: function() {
      this.doubleValue = this.value * 2;
    }
  });
```

--------------------------------

TITLE: Committing changes in Git (Shell)
DESCRIPTION: Commit your changes to the current branch. The '-a' option automatically stages modified and deleted files. Ensure your commit message follows the project's conventions.

SOURCE: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#_snippet_1

LANGUAGE: Shell
CODE:
```
git commit -a
```

--------------------------------

TITLE: Applying/Getting styles with jqLite css before camelCase change (JS)
DESCRIPTION: Shows the previous behavior of `jqLite#css` where various key formats were treated as equivalent for CSS property names before the camelCasing logic was aligned with jQuery.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_119

LANGUAGE: javascript
CODE:
```
// All five versions used to be equivalent.
elem.css('background_color', 'blue');
elem.css('background:color', 'blue');
elem.css('background-color', 'blue');
elem.css('background--color', 'blue');
elem.css('backgroundColor', 'blue');

// All five versions used to be equivalent.
var bgColor = elem.css('background_color');
var bgColor = elem.css('background:color');
var bgColor = elem.css('background-color');
var bgColor = elem.css('background--color');
var bgColor = elem.css('backgroundColor');
```

--------------------------------

TITLE: Fixing $compile: Correct Async Directive Controller Instantiation
DESCRIPTION: Corrects the process of instantiating controllers specifically for asynchronous directives within the $compile service. Addresses issues #3493, #3482, #3537, and #3540.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_242



--------------------------------

TITLE: Using ngBind with Objects (AngularJS)
DESCRIPTION: Illustrates the usage of the ngBind directive with scope objects, showing how the output changes based on the object type (plain vs. custom toString) due to alignment with $interpolate behavior. Also shows how to explicitly call toString().

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_105

LANGUAGE: html
CODE:
```
<span ng-bind="myPlainObject"></span>
<span ng-bind="myCustomObject"></span>
<span ng-bind="myObject.toString()"></span>
```

--------------------------------

TITLE: Handling $http Success/Error with Deprecated Callbacks (AngularJS)
DESCRIPTION: Shows the old way of handling $http responses using the now-removed success() and error() callback methods. These methods received data, status, headers, and config as arguments.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_86

LANGUAGE: javascript
CODE:
```
$http(...).
  success(function onSuccess(data, status, headers, config) {
    // Handle success
    ...
  }).
  error(function onError(data, status, headers, config) {
    // Handle error
    ...
  });
```

--------------------------------

TITLE: Making JSONP Requests with Deprecated JSON_CALLBACK Placeholder (AngularJS)
DESCRIPTION: Illustrates the old method of making JSONP requests using the JSON_CALLBACK placeholder directly in the URL or params object to specify the callback parameter name. This method is now removed.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_89

LANGUAGE: javascript
CODE:
```
$http.json('trusted/url?callback=JSON_CALLBACK');
$http.json('other/trusted/url', {params: {cb:'JSON_CALLBACK'}});
```

--------------------------------

TITLE: Using Promise for $resource Timeout (Before Change)
DESCRIPTION: Demonstrates the previous method of using a promise with the `timeout` property in `$resource` to cancel requests. Shows the need to redefine the resource after cancellation.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_177

LANGUAGE: js
CODE:
```
var deferred = $q.defer();
var User = $resource('/api/user/:id', {id: '@id'}, {
  get: {method: 'GET', timeout: deferred.promise}
});

var user = User.get({id: 1});   // sends a request
deferred.resolve();             // aborts the request

// Now, we need to re-define `User` passing a new promise as `timeout`
// or else all subsequent requests from `someAction` will be aborted
User = $resource(...);
user = User.get({id: 2});
```

--------------------------------

TITLE: Registering New $http Interceptor (AngularJS)
DESCRIPTION: Demonstrates the current method for registering an interceptor using $provide.factory that returns an object with response and responseError properties. The interceptor service name is then pushed to the $httpProvider.interceptors array, replacing the old responseInterceptors.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_229

LANGUAGE: javascript
CODE:
```
$provide.factory('myHttpInterceptor', function($q) {
  return {
    response: function(response) {
      // do something on success
      return response;
    },
    responseError: function(response) {
      // do something on error
      if (canRecover(response)) {
        return responseOrNewPromise
      }
      return $q.reject(response);
    }
  };
});

$httpProvider.interceptors.push('myHttpInterceptor');
```

--------------------------------

TITLE: $animate.enter Promise API (Before/After) - Angular.js
DESCRIPTION: Illustrates the change in the $animate.enter method from using a callback function for completion notification to returning a promise that resolves upon completion.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_211

LANGUAGE: js
CODE:
```
//before
$animate.enter(element, container, null, callbackFn);

//after
$animate.enter(element, container).then(callbackFn);
```

--------------------------------

TITLE: $sce trustAs() with ng-src and $watch (New Way)
DESCRIPTION: Shows the recommended migration pattern for using `$sce.trustAsResourceUrl()` with `ng-src` in AngularJS 1.7.0+. Use `$watch` to compute the trusted URL value only when the input changes, binding the result directly to the `ng-src` attribute to avoid infinite digests.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_12

LANGUAGE: JavaScript
CODE:
```
  $scope.$watch('imgId', function(id) {
    $scope.imgThumb = $sce.trustAsResourceUrl(someService.someUrl(id));
  });
```

LANGUAGE: HTML
CODE:
```
  <img ng-src="{{imgThumb}}">
```

--------------------------------

TITLE: Pulling latest changes from upstream master (Shell)
DESCRIPTION: Fetch changes from the 'upstream' remote (the main repository) and merge them into your local 'master' branch using a fast-forward merge if possible.

SOURCE: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#_snippet_9

LANGUAGE: Shell
CODE:
```
git pull --ff upstream master
```

--------------------------------

TITLE: Force pushing a Git branch to origin (Shell)
DESCRIPTION: Force push your local branch to the remote repository. Use this command after rebasing or amending commits to overwrite the history on the remote branch.

SOURCE: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#_snippet_5

LANGUAGE: Shell
CODE:
```
git push origin my-fix-branch -f
```

--------------------------------

TITLE: Preferring Promises for $resource Error Handling - AngularJS
DESCRIPTION: Demonstrates the recommended approach for handling errors with $resource by attaching .then() and .catch() directly to the $promise property. Errors thrown within the .then() callback will now be caught by the .catch() handler.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_33

LANGUAGE: javascript
CODE:
```
// Prefer
User.query().
  $promise.
  then(function onSuccess(users) { throw new Error(); }).
  catch(function onError() { /* Will be called. */ });
```

--------------------------------

TITLE: Whitelisting JSONP Resource URLs with $sceDelegateProvider
DESCRIPTION: This snippet shows how to configure $sceDelegateProvider.resourceUrlWhitelist in a module configuration block to allow specific URL patterns for JSONP requests, ensuring they are treated as trusted resources.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_138

LANGUAGE: javascript
CODE:
```
appModule.config(['$sceDelegateProvider', function($sceDelegateProvider) {
  $sceDelegateProvider.resourceUrlWhitelist([
    // Allow same origin resource loads.
    'self',
    // Allow JSONP calls that match this pattern
    'https://some.dataserver.com/**.jsonp?**'
  ]);
}]);
```

--------------------------------

TITLE: Configure ngAria Keyboard Binding (Before/After)
DESCRIPTION: This snippet shows the configuration change required for ngAria's keyboard binding setting. The `bindKeypress` option was replaced by `bindKeydown` to align with the underlying event binding change in `ngClick`.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_150

LANGUAGE: JavaScript
CODE:
```
$ariaProvider.config({bindKeypress: xyz})
```

LANGUAGE: JavaScript
CODE:
```
$ariaProvider.config({bindKeydown: xyz})
```

--------------------------------

TITLE: Fixing $compile: Instantiate Controllers Before Pre-Link Functions
DESCRIPTION: Ensures that controllers are always instantiated before the pre-link functions of directives are executed during the compilation phase. Addresses issues #3493, #3482, and #3514.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_243



--------------------------------

TITLE: ngClick Keyboard Interaction (Before ngAria Change)
DESCRIPTION: This HTML snippet demonstrates the default behavior of an element with `ng-click` before the ngAria update. ngAria automatically added keyboard support, causing the element to respond to both `click` and `keypress` events.

SOURCE: https://github.com/angular/angular.js/blob/master/CHANGELOG.md#_snippet_151

LANGUAGE: HTML
CODE:
```
<div ng-click="onClick()">
  I respond to `click` and `keypress` (not `keydown`)
</div>
```