================
CODE SNIPPETS
================
TITLE: Example Output for Variable Content Check (JSON)
DESCRIPTION: This JSON snippet shows the expected output for the DataWeave script that checks for an item within a local variable. The output is a JSON object indicating whether the requested item was found, which is `true` in this specific example.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_25

LANGUAGE: JSON
CODE:
```
{
  "ContainsRequestedItem": true
}
```

--------------------------------

TITLE: Example Output for Data Transformation (JSON)
DESCRIPTION: This JSON snippet shows the expected output structure and data resulting from the DataWeave transformation script. It demonstrates how the input data from `myVar` and `myVar2` is mapped, filtered, and structured into a JSON array of objects.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_22

LANGUAGE: JSON
CODE:
```
[
  {
    "id": "101",
    "topic": "world history",
    "cost": 19.99,
    "author": "john doe"
  },
  {
    "id": "202",
    "topic": "the great outdoors",
    "cost": 15.99,
    "author": "jane doe"
  }
]
```

--------------------------------

TITLE: Output of startsWith Example (JSON)
DESCRIPTION: The expected JSON output from the DataWeave example demonstrating the startsWith function.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-startswith.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
[ true, false ]
```

--------------------------------

TITLE: Get First Characters of String (DataWeave)
DESCRIPTION: This DataWeave example demonstrates how to use the `first` function to extract the initial characters from a string. It imports the function from `dw::core::Strings` and applies it to the string 'hello world!' to get the first 5 characters.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-first.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import first from dw::core::Strings
output application/json
---
"hello world!" first 5
```

--------------------------------

TITLE: Using now() Selectors and Casting in DataWeave
DESCRIPTION: This example shows uses of the `now()` function with valid selectors. It also shows how to get the epoch time with `now() as Number`. For additional examples, see Date and Time (dw::Core Types).

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-now.adoc#_snippet_1

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
{
  now: now(),
  epochTime : now() as Number,
  nanoseconds: now().nanoseconds,
  milliseconds: now().milliseconds,
  seconds: now().seconds,
  minutes: now().minutes,
  hour: now().hour,
  day: now().day,
  month: now().month,
  year: now().year,
  quarter: now().quarter,
  dayOfWeek: now().dayOfWeek,
  dayOfYear: now().dayOfYear,
  offsetSeconds: now().offsetSeconds,
  formattedDate: now() as String {format: "y-MM-dd"},
  formattedTime: now() as String {format: "hh:m:s"}
}
```

LANGUAGE: JSON
CODE:
```
{
  "now": "2019-06-18T16:55:46.678-07:00",
  "epochTime": 1560902146,
  "nanoseconds": 678000000,
  "milliseconds": 678,
  "seconds": 46,
  "minutes": 55,
  "hour": 16,
  "day": 18,
  "month": 6,
  "year": 2019,
  "quarter": 2,
  "dayOfWeek": 2,
  "dayOfYear": 169,
  "offsetSeconds": -25200,
  "formattedDate": "2019-06-18",
  "formattedTime": "04:55:46"
}
```

--------------------------------

TITLE: DataWeave Example Source
DESCRIPTION: This example demonstrates the usage of the `minutes` function with different inputs, including adding/subtracting from DateTime values and converting decimal/whole numbers to Period format.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-periods-functions-minutes.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Periods
output application/json
---
{
   nextMinute: |2020-10-05T20:22:34.385Z| + minutes(1),
   previousMinute: |2020-10-05T20:22:34.385Z| - minutes(1),
   decimalInputPeriod: minutes(4.555),
   wholeNumberInputPeriod: minutes(4),
   addNegativeValue: minutes(-1) + minutes(2)
}
```

--------------------------------

TITLE: Create a Number Range using to in DataWeave
DESCRIPTION: This example demonstrates how to use the `to` function to create a range of numbers from a start value to an inclusive end value.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-to.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
{ "myRange": 1 to 10 }
```

LANGUAGE: JSON
CODE:
```
{ "myRange": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
```

--------------------------------

TITLE: Example DataWeave Test Input (payload.json)
DESCRIPTION: An example JSON input file used for testing the DataWeave mapping. Located at `src/test/resources/myPackage/MyMapping/NewScenario/inputs/payload.json`.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-testing-framework.adoc#_snippet_2

LANGUAGE: dataweave
CODE:
```
{
  "message": "Hello world!"
}
```

--------------------------------

TITLE: Example using camelize with String input - DataWeave
DESCRIPTION: This example demonstrates how to use the `camelize` function from the `dw::core::Strings` module to convert strings containing underscores into camel case. It shows conversion for a standard case and a case starting with an underscore. The expected output is provided in JSON format.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-camelize.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Strings
output application/json
---
{
  "a" : camelize("customer_first_name"),
  "b" : camelize("_name_starts_with_underscore")
}
```

LANGUAGE: JSON
CODE:
```
{
   "a": "customerFirstName",
   "b": "nameStartsWithUnderscore"
 }
```

--------------------------------

TITLE: Output JSON Demonstrating Data Types
DESCRIPTION: Shows the JSON output generated by the DataWeave script that defines various data types. It illustrates how DataWeave types are represented in the resulting JSON structure.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_6

LANGUAGE: JSON
CODE:
```
{
  "myString": "hello world",
  "myNumber": 123,
  "myFloatingPointNumber": 123.456,
  "myVeryBigNumber": 12341234134123412341234123,
  "myDate": "2018-12-07",
  "myTime": "11:55:56",
  "myDateTime": "2018-10-01T23:57:59-03:00",
  "myBoolean": true,
  "myArray": [ 1, 2, 3, 5, 8 ],
  "myMixedArray": [ 1, 2, "blah", { "hello": "there" } ],
  "myObjectKeyValuePair": { "innerKey": "innerValue" },
  "myObjectWithConditionalField": { "a": { "b": 1, "c": 2 } },
  "myNull": null,
  "myBinary": "abcd1234123"
}
```

--------------------------------

TITLE: Example JSON Input
DESCRIPTION: Provides a simple JSON object structure used as input for subsequent DataWeave transformation examples.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-language-introduction.adoc#_snippet_7

LANGUAGE: json
CODE:
```
{
    "message": "Hello world!"
}
```

--------------------------------

TITLE: Using metadataOf in DataWeave Example
DESCRIPTION: This example demonstrates how to use the `metadataOf` function to retrieve metadata associated with a custom type. It defines a type `AType` with a 'format' property and then uses `metadataOf` to get this property.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-types-functions-metadataof.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Types
type AType = String {format: "YYYY-MM-dd"}
output application/json
---
{
   a: metadataOf(AType)
}
```

LANGUAGE: Json
CODE:
```
{
  "a": {"format": "YYYY-MM-dd"}
}
```

--------------------------------

TITLE: toTimeOrNull Example Output
DESCRIPTION: This is the expected output for the `toTimeOrNull` example source code.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-coercions-functions-totimeornull.adoc#_snippet_1

LANGUAGE: DataWeave
CODE:
```
{
  a: |13:44:12.000000283-08:00| as Time {format: "HH:mm:ss.nxxx"},
  b: null
}
```

--------------------------------

TITLE: Asserting String Starts With Prefix with startWith (DataWeave)
DESCRIPTION: This example shows how to use the `startWith` function to assert that a string (`"A Text"`) begins with a specific prefix (`"A"`).

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-test-asserts.adoc#_snippet_29

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import dw::tests::Asserts
---
"A Text" must startWith("A")
```

--------------------------------

TITLE: Sample JSON File Content (myJson.json)
DESCRIPTION: This JSON snippet provides sample content to be saved in a file named `myJson.json` within the `src/main/resources` folder. This file is used as input data for a subsequent DataWeave script that reads file contents.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_13

LANGUAGE: JSON
CODE:
```
{
  "hello": "world"
}
```

--------------------------------

TITLE: Example application/dw Output
DESCRIPTION: Shows the output in `application/dw` format resulting from transforming the multi-root JSON input, illustrating the structure before attempting XML conversion.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-language-introduction.adoc#_snippet_12

LANGUAGE: dataweave
CODE:
```
{
  size: 1,
  person: {
    name: "Yoda"
  }
}
```

--------------------------------

TITLE: Example Output JSON
DESCRIPTION: This JSON snippet shows an example of the output produced by the DataWeave script, which is a Base64 encoded string representing the binary input. The string is shortened for readability.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-binaries-functions-tobase64.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
"/9j/4AAQSkZJRgABAQEAYABgAAD//..."
```

--------------------------------

TITLE: Example XML Input for DataWeave Format
DESCRIPTION: This XML snippet represents the input data used in the example to demonstrate how it is interpreted by the DataWeave (dw) format.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-formats-dw.adoc#_snippet_0

LANGUAGE: xml
CODE:
```
<employees>
  <employee>
    <firstname>Mariano</firstname>
    <lastname>DeAchaval</lastname>
  </employee>
  <employee>
    <firstname>Leandro</firstname>
    <lastname>Shokida</lastname>
  </employee>
</employees>
```

--------------------------------

TITLE: Filter Object by Key in DataWeave
DESCRIPTION: This example only outputs an object if the key starts with "letter".

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-filterobject.adoc#_snippet_1

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
{"letter1": "a", "letter2": "b", "id": 1} filterObject ((value, key) -> key startsWith "letter")
```

LANGUAGE: JSON
CODE:
```
{ "letter1": "a", "letter2": "b" }
```

--------------------------------

TITLE: Using atBeginningOfHour with LocalTime in DataWeave
DESCRIPTION: This example illustrates how to use the `atBeginningOfHour` function with a `LocalTime` value in DataWeave. It transforms the input `LocalTime` by setting the minutes and seconds to `00:00`, yielding a `LocalTime` at the start of the hour.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-dates-functions-atbeginningofhour.adoc#_snippet_2

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Dates
output application/json
---
{
   "atBeginningOfHourLocalTime": atBeginningOfHour(|18:23:20.351|)
}
```

LANGUAGE: Json
CODE:
```
{
 "atBeginningOfHourLocalTime": "18:00:00"
}
```

--------------------------------

TITLE: Output of runUrl Example - JSON
DESCRIPTION: This JSON object shows the expected output from the `runUrl` example. It indicates a successful execution (`success: true`) and includes the resulting value, mime type, encoding, and any logs.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-runtime-functions-runurl.adoc#_snippet_1

LANGUAGE: Json
CODE:
```
{
   "execute_ok": {
     "success": true,
     "value": "\"Mariano\"",
     "mimeType": "application/dw",
     "encoding": "UTF-8",
     "logs": [

     ]
   }
 }
```

--------------------------------

TITLE: DataWeave Library Project Directory Structure (Text)
DESCRIPTION: This snippet illustrates the standard directory layout for a DataWeave library project built with Maven. It shows the location for DataWeave mappings and modules (src/main/dw), test files (src/test/dw), resources, sample data, scenarios, and the project's pom.xml file.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-extension-plugin.adoc#_snippet_0

LANGUAGE: text
CODE:
```
├── src
│   ├── main
│   │   ├── dw // Put your DataWeave mappings and module files here
│   │   │   ├── MyMapping.dwl
|   |   |   └── MyModule.dwl
│   │   └── resources
│   └── test
│       ├── dw
│       │   └── MyModuleTest.dwl  //Unit tests for the functions in your module
│       │   └── MyMappingTest.dwl //Integration test for your mapping using the saved scenarios
│       ├── resources
│       │       └── MyMapping //Contains the different scenarios for your mapping
│       │           ├── default
│       │           │   └── inputs
│       │           │       └── payload.json //[Sample data](#sample-data) for your mappings
│       │           └── SavedTestScenario //Scenario used for the integration test
├── pom.xml
```

--------------------------------

TITLE: JSON Output for prependIfMissing Example
DESCRIPTION: This JSON snippet shows the expected output when the provided DataWeave example using the `prependIfMissing` function is executed.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-prependifmissing.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{
  "a": null,
  "b": "abc",
  "c": "xyz",
  "d": "xyzabc",
  "e": "xyzabc"
}
```

--------------------------------

TITLE: Example Syntax for Multipart::field (txt)
DESCRIPTION: Shows the basic syntax for the `Multipart::field` function, which is similar to `Multipart::file` but used for general fields. This snippet is presented as an example of the list format.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-multipart-functions-file.adoc#_snippet_3

LANGUAGE: txt
CODE:
```
Multipart::field("myFile", myClients, 'application/json', "partMyClients.json")
```

--------------------------------

TITLE: Example: Get System Property (DataWeave Source)
DESCRIPTION: This DataWeave script demonstrates how to use the `prop` function from the `dw::Runtime` module to retrieve the value of the 'user.timezone' system property and wrap it in a JSON object under the key 'props'.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-runtime-functions-prop.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::Runtime
output application/dw
---
{ "props" : prop("user.timezone") }
```

--------------------------------

TITLE: Example Output of substringBefore
DESCRIPTION: This JSON snippet shows the expected output when the DataWeave example using `substringBefore` is executed. It corresponds directly to the results of applying the function with the inputs provided in the source code example.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-substringbefore.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{
  "a": null,
  "b": "",
  "c": "a",
  "d": "ab",
  "e": "",
  "f": ""
}
```

--------------------------------

TITLE: DataWeave Script Demonstrating Data Types and Comments
DESCRIPTION: This DataWeave script showcases various supported data types including strings, numbers, dates, times, booleans, arrays, objects, null, and binary. It also illustrates both single-line and multi-line comment syntax in DataWeave.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_5

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
{
  /*
   * A multi-line
   * comment here.
   */
  myString: "hello world",
  myNumber: 123,
  myFloatingPointNumber: 123.456,
  myVeryBigNumber: 12341234134123412341234123,
  myDate: |2018-12-07|,
  myTime: |11:55:56|,
  myDateTime: |2018-10-01T23:57:59-03:00|,
  myBoolean: true,
  myArray: [ 1, 2, 3, 5, 8],
  myMixedArray: [ 1, 2, "blah", { hello: "there" } ],
  myObjectKeyValuePair: { innerKey: "innerValue" },
  myObjectWithConditionalField: { a : { b : 1, ( c : 2 ) if true, (d : 4) if false } },
  myNull: null,
  myBinary: "abcd1234123" as Binary
  //A one-line comment here.
}
```

--------------------------------

TITLE: Output of isOdd Example (JSON)
DESCRIPTION: Shows the resulting JSON structure and values produced by the DataWeave example that uses the `isOdd` function, illustrating the boolean output for each input.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-isodd.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{ "isOdd": [ false, true, false ] }
```

--------------------------------

TITLE: Output of leftPad Example - JSON
DESCRIPTION: Shows the expected JSON output when the DataWeave example using `leftPad` is executed.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-leftpad.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{
  "a": null,
  "b": "   ",
  "c": "  bat",
  "d": "bat",
  "e": "bat"
}
```

--------------------------------

TITLE: Calling tomorrow() function in DataWeave
DESCRIPTION: This example demonstrates how to use the `tomorrow()` function from the `dw::core::Dates` module in DataWeave to get the date for tomorrow. The output is configured to be in JSON format.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-dates-functions-tomorrow.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import tomorrow from dw::core::Dates
output application/json
---
tomorrow()
```

--------------------------------

TITLE: Input JSON Payload for DataWeave Map Example 2
DESCRIPTION: This is the input payload for the second DataWeave mapping example, which is identical in structure and content to the input used in Example 1.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-cookbook-map.adoc#_snippet_4

LANGUAGE: JSON
CODE:
```
[
  {
    "title": "The Hitchhiker's Guide to the Galaxy",
    "author": "Douglas Adams",
    "price": "10.99"
  },
  {
    "title": "The Lord of the Rings",
    "author": ["J.R.R. Tolkien"],
    "price": "25.50"
  },
  {
    "title": "Pride and Prejudice",
    "author": "Jane Austen",
    "price": "8.75"
  }
]
```

--------------------------------

TITLE: Getting String Size in DataWeave
DESCRIPTION: This example demonstrates using the sizeOf function to count the number of characters in a simple string. It takes a string as input and returns the character count.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-sizeof.adoc#_snippet_5

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
sizeOf("abc")
```

LANGUAGE: JSON
CODE:
```
3
```

--------------------------------

TITLE: Generate DataWeave Documentation via prepare-package (Console)
DESCRIPTION: Run the 'prepare-package' Maven goal from the command line. This goal often triggers the 'data-weave:generate-docs' goal as part of the standard Maven lifecycle, automatically generating documentation.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-maven-plugin.adoc#_snippet_5

LANGUAGE: console
CODE:
```
mvn prepare-package
```

--------------------------------

TITLE: toTimeOrNull Example Source
DESCRIPTION: This example shows how `toTimeOrNull` behaves with different inputs. It produces output in the `application/dw` format.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-coercions-functions-totimeornull.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::util::Coercions
output application/dw
---
{
  a: toTimeOrNull("13:44:12.283-08:00", [{format: "HH:mm:ss.xxx"}, {format: "HH:mm:ss.nxxx"}]),
  b: toTimeOrNull("13:44:12.283-08:00", [{format: "HH:mm:ss.xxx"}])
}
```

--------------------------------

TITLE: Getting Array Size in DataWeave
DESCRIPTION: This example demonstrates how to use the sizeOf function to count the number of elements in a simple array. It takes an array of strings as input and returns the count.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-sizeof.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
sizeOf([ "a", "b", "c"])
```

LANGUAGE: JSON
CODE:
```
3
```

--------------------------------

TITLE: Example XML Output Structure
DESCRIPTION: An example XML structure representing a Supermarket with multiple Item Value elements. This structure is likely used as an input or output example in a DataWeave transformation context.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-selectors.adoc#_snippet_14

LANGUAGE: xml
CODE:
```
<?xml version='1.0' encoding='UTF-8'?>
<Supermarket>
  <Item>
    <Value>Perfume</Value>
    <Value>t-Shirt</Value>
    <Value>Bosque</Value>
    <Value>t-Shirt2</Value>
    <Value>t-Shirt red</Value>
    <Value>t-Shirt red with logo</Value>
  </Item>
</Supermarket>
```

--------------------------------

TITLE: Output of asExpressionString Example (Json)
DESCRIPTION: This JSON shows the string output produced by the `asExpressionString` function when applied to the specified Path value in the example.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-tree-functions-asexpressionstring.adoc#_snippet_1

LANGUAGE: Json
CODE:
```
".user.@name"
```

--------------------------------

TITLE: Configure DataWeave Output to XML (DW)
DESCRIPTION: This DataWeave script header demonstrates how to set the output format to 'application/xml' using the 'output' directive. This prepares the script to generate XML output from the transformation.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_2

LANGUAGE: dw
CODE:
```
%dw 2.0
output application/xml
---
```

--------------------------------

TITLE: Setting JSON Payload with DataWeave
DESCRIPTION: This DataWeave expression creates a simple JSON object {"hello": "world"} and sets it as the message payload. It's used to provide static sample data.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_27

LANGUAGE: DataWeave
CODE:
```
output application/json --- { hello : "world"}
```

--------------------------------

TITLE: DataWeave Function Documentation Template
DESCRIPTION: This snippet provides a template using AsciiDoc syntax within DataWeave comments (`/** ... */`) for documenting custom functions, including sections for description, parameters, and examples with source, input, and output.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-create-module.adoc#_snippet_9

LANGUAGE: DataWeave
CODE:
```
/**
* %Replace with your function description%
*
*
* %Add additional information to your function description% (optional section)
*
* === Parameters (optional section)
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | %`The parameter name`% | %`The parameter type`% | %The parameter description%  (one row per param)
* |===
*
* === Example (optional section)
*
* %The example description% (optional)
*
* ==== Source (optional section)
*
* [source,%The language%,linenums] (optional)
* ----
* YOUR CODE
* ----
*
* ==== Input (optional section)
*
* The input description (optional)
*
* [source,%The language%,linenums] (optional)
* ----
* YOUR CODE
* ----
*
* ==== Output (optional section)
*
* The output description (optional)
*
* [source,%The language%,linenums] (optional)
* ----
* YOUR CODE
* ----
*/
```

--------------------------------

TITLE: Getting Object Size in DataWeave
DESCRIPTION: This example illustrates how to use the sizeOf function to count the number of key-value pairs in a DataWeave object. It takes a simple object as input and returns the count.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-sizeof.adoc#_snippet_2

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
sizeOf({a: 1, b: 2})
```

LANGUAGE: JSON
CODE:
```
2
```

--------------------------------

TITLE: Expected Output for rightPad Example (JSON)
DESCRIPTION: This JSON snippet shows the expected output when the DataWeave example using `rightPad` is executed. It illustrates the results for null, empty, short, exact, and negative size inputs.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-rightpad.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{
  "a": null,
  "b": "   ",
  "c": "bat  ",
  "d": "bat",
  "e": "bat"
}
```

--------------------------------

TITLE: Calling substring function in DataWeave
DESCRIPTION: This example demonstrates how to use the `substring` function in DataWeave to extract a portion of a string. It takes the input string, a starting index (`from`), and an ending index (`until`), returning the characters from the `from` index up to (but not including) the `until` index.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-substring.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Strings
output application/json
var text = "hello world!"
---
substring(text, 1, 5)
```

LANGUAGE: JSON
CODE:
```
"ello"
```

--------------------------------

TITLE: View Concatenated String Output (JSON)
DESCRIPTION: This JSON snippet shows the expected output in the Anypoint Studio Preview pane. It is the result of the DataWeave script that concatenates 'hello' and 'World' into a single string value for the 'myString' key.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_1

LANGUAGE: json
CODE:
```
{ "myString": "helloWorld" }
```

--------------------------------

TITLE: Example Multipart Form Data Input for Transformation
DESCRIPTION: This is the raw `multipart/form-data` payload used as input for the transformation examples in Example 2. It contains three parts: a text part, a JSON file part, and an HTML file part, similar to Example 1, to demonstrate accessing and transforming individual parts.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-formats-multipart.adoc#_snippet_4

LANGUAGE: text
CODE:
```
--34b21
Content-Disposition: form-data; name="text"
Content-Type: text/plain

Book
--34b21
Content-Disposition: form-data; name="file1"; filename="a.json"
Content-Type: application/json

{
  "title": "Java 8 in Action",
  "author": "Mario Fusco",
  "year": 2014
}
--34b21
Content-Disposition: form-data; name="file2"; filename="a.html"
Content-Type: text/html

<!DOCTYPE html>
<title>
  Available for download!
</title>
--34b21--
```

--------------------------------

TITLE: Example YAML Input Payload
DESCRIPTION: This YAML snippet serves as the input payload for the DataWeave transformation example, representing baseball teams grouped by league.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-formats-yaml.adoc#_snippet_0

LANGUAGE: yaml
CODE:
```
american:
  - Boston Red Sox
  - Detroit Tigers
  - New York Yankees
national:
  - New York Mets
  - Chicago Cubs
  - Atlanta Braves
```

--------------------------------

TITLE: Getting Multiple Object Sizes in DataWeave
DESCRIPTION: This example demonstrates using sizeOf with both non-empty and empty objects within a single DataWeave script. It returns an object containing the sizes of the input objects.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-sizeof.adoc#_snippet_3

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
{
   objectSizes : {
     sizeIs2: sizeOf({a:1,b:2}),
     sizeIs0: sizeOf({})
   }
}
```

LANGUAGE: JSON
CODE:
```
{
  "objectSize": {
    "sizeIs2": 2,
    "sizeIs0": 0
  }
}
```

--------------------------------

TITLE: Generate DataWeave Documentation Directly (Console)
DESCRIPTION: Run the 'data-weave:generate-docs' goal directly from the command line to auto-generate documentation for your DataWeave library without executing the full prepare-package phase.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-maven-plugin.adoc#_snippet_6

LANGUAGE: console
CODE:
```
mvn data-weave:generate-docs
```

--------------------------------

TITLE: General DataWeave Transformation Example
DESCRIPTION: A general DataWeave transformation script, potentially demonstrating basic data extraction or manipulation techniques.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-cookbook-extract-data.adoc#_snippet_1

LANGUAGE: DataWeave
CODE:
```
include::partial$cookbook-dw/extract-data-ex08/transform.dwl[]
```

--------------------------------

TITLE: Output of indexOf String Example
DESCRIPTION: Provides the expected JSON output from the DataWeave example using `indexOf` on strings, showing the resulting index or -1.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-indexof.adoc#_snippet_3

LANGUAGE: Json
CODE:
```
{
   "present": 2,
   "notPresent": -1,
   "presentMoreThanOnce": 2
}
```

--------------------------------

TITLE: Using atBeginningOfHour with Time in DataWeave
DESCRIPTION: This example demonstrates the usage of the `atBeginningOfHour` function with a `Time` value in DataWeave. It takes a `Time` input and returns a new `Time` with the minutes and seconds set to `00:00`, effectively moving the time to the start of the hour while preserving the offset.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-dates-functions-atbeginningofhour.adoc#_snippet_3

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Dates
output application/json
---
{
   "atBeginningOfHourTime": atBeginningOfHour(|18:23:20.351-03:00|)
}
```

LANGUAGE: Json
CODE:
```
{
 "atBeginningOfHourTime":  "18:00:00-03:00"
}
```

--------------------------------

TITLE: JSON Schema with anyOf Keyword (Partial)
DESCRIPTION: An example of a JSON schema using the `anyOf` keyword, which DataWeave maps to a `Union` type. This snippet is incomplete but shows the start of the structure.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-type-reuse-json-schema.adoc#_snippet_19

LANGUAGE: JSON
CODE:
```
{
  "anyOf": [
    { "type": "string" },

```

--------------------------------

TITLE: Example DataWeave Integration Test (MyMappingTest.dwl)
DESCRIPTION: A DataWeave test file demonstrating how to import test modules, define test sections and cases, evaluate a mapping with inputs, and assert the output against an expected result file.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-testing-framework.adoc#_snippet_5

LANGUAGE: dataweave
CODE:
```
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test MyMapping" describedBy [
   "Assert NewScenario" in do {
       evalPath("myPackage/MyMapping.dwl", inputsFrom("myPackage/MyMapping/NewScenario"),"application/json") must
                 equalTo(outputFrom("myPackage/MyMapping/NewScenario"))
   }
]
```

--------------------------------

TITLE: Deploying DataWeave Library and Docs using Maven Console
DESCRIPTION: This console command shows the standard Maven goal used to deploy a DataWeave library. When the dataweave-maven-plugin is configured, this command also triggers the upload of the generated documentation to Exchange by default.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-maven-plugin.adoc#_snippet_8

LANGUAGE: console
CODE:
```
mvn deploy
```

--------------------------------

TITLE: Output XML from DataWeave Transformation
DESCRIPTION: This snippet demonstrates the XML output generated by transforming the input JSON. The JSON key becomes the root element, and the string value becomes the element's content.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_4

LANGUAGE: XML
CODE:
```
<?xml version='1.0' encoding='UTF-8'?>
<myString>helloWorld</myString>
```

--------------------------------

TITLE: Output of isDecimal Example
DESCRIPTION: This is the expected JSON output from the DataWeave example demonstrating the results of calling `isDecimal` on different inputs.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-isdecimal.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
[ true, false, true ]
```

--------------------------------

TITLE: Getting Binary Array Size in DataWeave
DESCRIPTION: This example shows how to use the sizeOf function to determine the number of elements in an array containing binary values. It takes an array of binary values and returns the count.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-sizeof.adoc#_snippet_4

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
sizeOf(["\u0000" as Binary, "\u0001" as Binary, "\u0002" as Binary])
```

LANGUAGE: JSON
CODE:
```
3
```

--------------------------------

TITLE: Output of Pluck and Filter Composition in DataWeave
DESCRIPTION: This snippet shows the expected JSON output from the DataWeave examples demonstrating function composition using `pluck` and `filter`. It contains an array of objects, where each object represents a collaborator with the role 'ADMIN'.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-language-guide.adoc#_snippet_5

LANGUAGE: json
CODE:
```
[
  {
    "Name": "Max",
    "Role": "ADMIN",
    "ID": "01"
  },
  {
    "Name": "Astro",
    "Role": "ADMIN",
    "ID": "03"
  }
]
```

--------------------------------

TITLE: Example JSON Output for uuid()
DESCRIPTION: This snippet shows a typical example of the JSON string output generated by the `uuid()` function.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-uuid.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
"7cc64d24-f2ad-4d43-8893-fa24a0789a99"
```

--------------------------------

TITLE: Finding Substring Indices in DataWeave String
DESCRIPTION: This example illustrates using the `find` function to locate all occurrences of a specific substring within a source string. It returns an array of numbers, indicating the starting indices of each match.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-find.adoc#_snippet_2

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
"aabccdbce" find "a"
```

LANGUAGE: JSON
CODE:
```
[0,1]
```

--------------------------------

TITLE: Using atBeginningOfHour with DateTime in DataWeave
DESCRIPTION: This example demonstrates how to use the `atBeginningOfHour` function with a `DateTime` value in DataWeave. It takes a `DateTime` input and returns a new `DateTime` with the minutes and seconds set to `00:00`, effectively moving the time to the start of the hour.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-dates-functions-atbeginningofhour.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Dates
output application/json
---
{
   "atBeginningOfHourDateTime": atBeginningOfHour(|2020-10-06T18:23:20.351-03:00|)
}
```

LANGUAGE: Json
CODE:
```
{
 "atBeginningOfHourDateTime": "2020-10-06T18:00:00-03:00"
}
```

--------------------------------

TITLE: Demonstrating dw::Runtime::run Function in DataWeave
DESCRIPTION: This DataWeave script demonstrates various use cases of the `dw::Runtime::run` function, including executing simple scripts, capturing logs, handling security grants, using libraries, setting timeouts, and handling execution, parsing, writer, and reader failures. It also shows how to provide inputs and configure the output format.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-runtime-functions-run.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
import * from dw::Runtime
var jsonValue = {
  value: '{"name": "Mariano"}' as Binary {encoding: "UTF-8"},
  encoding: "UTF-8",
  properties: {},
  mimeType: "application/json"
}

var jsonValue2 = {
  value: '{"name": "Mariano", "lastName": "achaval"}' as Binary {encoding: "UTF-8"},
  encoding: "UTF-8",
  properties: {},
  mimeType: "application/json"
}

var invalidJsonValue = {
  value: '{"name": "Mariano' as Binary {encoding: "UTF-8"},
  encoding: "UTF-8",
  properties: {},
  mimeType: "application/json"
}

var Utils = "fun sum(a,b) = a +b"
---
{
  "execute_ok" : run("main.dwl", {"main.dwl": "{a: 1}"}, {"payload": jsonValue }),
  "logs" : do {
    var execResult = run("main.dwl", {"main.dwl": "{a: log(1)}"}, {"payload": jsonValue })
    ---
    {
        m: execResult.logs.message,
        l: execResult.logs.level
    }
  },
  "grant" : run("main.dwl", {"main.dwl": "{a: readUrl(`http://google.com`)}"}, {"payload": jsonValue }, { securityManager: (grant, args) -> false }),
  "library" : run("main.dwl", {"main.dwl": "Utils::sum(1,2)", "/Utils.dwl": Utils }, {"payload": jsonValue }),
  "timeout" : run("main.dwl", {"main.dwl": "(1 to 1000000000000) map \$ + 1" }, {"payload": jsonValue }, {timeOut: 2}).success,
  "execFail" : run("main.dwl", {"main.dwl": "dw::Runtime::fail('My Bad')" }, {"payload": jsonValue }),
  "parseFail" : run("main.dwl", {"main.dwl": "(1 + " }, {"payload": jsonValue }),
  "writerFail" : run("main.dwl", {"main.dwl": "output application/xml --- 2" }, {"payload": jsonValue }),
  "readerFail" : run("main.dwl", {"main.dwl": "output application/xml --- payload" }, {"payload": invalidJsonValue }),
  "defaultOutput" : run("main.dwl", {"main.dwl": "payload" }, {"payload": jsonValue2}, {outputMimeType: "application/csv", writerProperties: {"separator": "|"}}),
}
```

--------------------------------

TITLE: Output of DataWeave match Statement Example 1
DESCRIPTION: Shows the JSON output resulting from the evaluation of the preceding DataWeave `match` statement example, demonstrating that the first matching case (the regex match) was executed.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-pattern-matching.adoc#_snippet_3

LANGUAGE: JSON
CODE:
```
"hello was matched"
```

--------------------------------

TITLE: Example Output of Time Measurement in JSON
DESCRIPTION: Shows the expected JSON output structure when using the `dw::util::Timer::time` function. Each entry in the `testing` array is a `TimeMeasurement` object containing `start`, `result`, and `end` timestamps/values.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-timer-functions-time.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{
  "testing": [
    {
      "start": "2018-10-05T19:23:01.49Z",
      "result": "My result",
      "end": "2018-10-05T19:23:01.591Z"
    },
    {
      "start": "2018-10-05T19:23:01.591Z",
      "result": 10,
      "end": "2018-10-05T19:23:01.591Z"
    }
  ]
}
```

--------------------------------

TITLE: Output of Map with Lambda Expression in DataWeave
DESCRIPTION: This snippet shows the expected JSON output from the DataWeave example using the `map` function with a lambda expression. It contains an array of strings, where each string is the original array element prefixed by its index.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-language-guide.adoc#_snippet_7

LANGUAGE: json
CODE:
```
[
    "0 - Max",
    "1 - the",
    "2 - Mule"
]
```

--------------------------------

TITLE: Compose Functions with Pluck and Filter (Prefix Notation) in DataWeave
DESCRIPTION: This DataWeave snippet shows the same function composition as the previous example but uses prefix notation. It explicitly shows how the `pluck` function's result is passed as the first argument to the `filter` function, transforming an object into an array and then filtering it based on the 'ADMIN' role.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-language-guide.adoc#_snippet_4

LANGUAGE: dataweave
CODE:
```
%dw 2.0
output application/json
var collaborators =
{
    Max: {role: "admin", id: "01"},
    Einstein: {role: "dev", id: "02"},
    Astro: {role: "admin", id: "03"},
    Blaze: {role: "user", id: "04"}
}
---
filter(
   pluck(
       collaborators, (value,key,index)->
       {
           "Name": key,
           "Role": upper(value.role),
           "ID": value.id
       }),
   (item, index) -> item.Role == "ADMIN")
```

--------------------------------

TITLE: Mule Flow Configuration Snippet - XML
DESCRIPTION: A snippet of the Mule flow XML configuration showing the start of a flow named `my-appFlow`. This flow would typically contain components like the Transform Message used for the DataWeave examples.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-cookbook-java-methods.adoc#_snippet_8

LANGUAGE: xml
CODE:
```
<flow name="my-appFlow" >

```

--------------------------------

TITLE: Filtering String Characters by Index in DataWeave
DESCRIPTION: This example demonstrates using the filter function on a string to remove characters based on their index. The provided source shows the setup but the filtering criteria is incomplete in the snippet.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-filter.adoc#_snippet_5

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
```

--------------------------------

TITLE: Using indexWhere with Array in DataWeave
DESCRIPTION: This example demonstrates how to use the `indexWhere` function to find the index of the first element in a string array that starts with 'Jul'. It shows the DataWeave source code and the expected JSON output.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-arrays-functions-indexwhere.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Arrays
output application/json
var users = ["Mariano", "Leandro", "Julian"]
---
users indexWhere (item) -> item startsWith "Jul"
```

LANGUAGE: json
CODE:
```
2
```

--------------------------------

TITLE: Using reduce with Initial Accumulator Values and Custom Lambdas in DataWeave
DESCRIPTION: This example illustrates setting an initial value for the accumulator (`acc = initValue`) and using explicit parameter names (`item`, `acc`) instead of shorthands. It shows string concatenation starting with 'z', summing with an initial value of 3, and multiplication with and without an initial accumulator.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-reduce.adoc#_snippet_2

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
{
   "concat" : ["a", "b", "c", "d"] reduce ((item, acc = "z") -> acc ++ item),
   "sum": [0, 1, 2, 3, 4, 5] reduce ((item, acc = 3) -> acc + item),
   "multiply" : [2,3,3] reduce ((item, acc) -> acc * item),
   "multiplyAcc" : [2,2,3] reduce ((item, acc = 3) -> acc * item)
}
```

LANGUAGE: JSON
CODE:
```
{ "concat": "zabcd", "sum": 18, "multiply": 18, "multiplyAcc": 36 }
```

--------------------------------

TITLE: Example Output for first Function (Json)
DESCRIPTION: This JSON snippet shows the expected output when applying the `first` function with an amount of 5 to the string 'hello world!'. The result is the first five characters.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-first.adoc#_snippet_1

LANGUAGE: Json
CODE:
```
"hello"
```

--------------------------------

TITLE: Example XML Output
DESCRIPTION: Shows the resulting XML output produced by transforming the simple JSON input using the basic DataWeave script.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-language-introduction.adoc#_snippet_9

LANGUAGE: xml
CODE:
```
<?xml version='1.0' encoding='UTF-8'?>
<message>Hello world!</message>
```

--------------------------------

TITLE: Output of toPeriod example
DESCRIPTION: Shows the expected output in `application/dw` format (represented as JSON) when the DataWeave example using `toPeriod` is executed. The output shows the resulting `Period` values.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-coercions-functions-toperiod.adoc#_snippet_1

LANGUAGE: Json
CODE:
```
{
  toPeriodEx1: |P1D|,
  toPeriodEx2: |PT1H1M|
}
```

--------------------------------

TITLE: Expected Output of abs Function Example
DESCRIPTION: This JSON snippet shows the expected output when the DataWeave example using the abs function is executed. It is an array containing the absolute values corresponding to the inputs in the source example.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-abs.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
[ 2, 2.5, 3.4, 3 ]
```

--------------------------------

TITLE: Example: Get System Property (JSON Output)
DESCRIPTION: This is the expected JSON output when the DataWeave script successfully retrieves the 'user.timezone' property, showing the property value wrapped in a 'props' key. The output includes type information added by DataWeave.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-runtime-functions-prop.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{ props: "America/Los_Angeles" as String {class: "java.lang.String"} }
```

--------------------------------

TITLE: Example: Creating a LocalTime value
DESCRIPTION: This example shows how to use the `localTime` function with an object containing `hour`, `minutes`, and `seconds` to create a `LocalTime` value.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-dates-functions-localtime.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Dates
output application/json
---
{
  newLocalTime: localTime({ hour: 12, minutes: 30, seconds: 40})
}
```

LANGUAGE: Json
CODE:
```
{
   "newLocalTime": "12:30:40"
}
```

--------------------------------

TITLE: Expected Output for substringBeforeLast DataWeave Example
DESCRIPTION: The JSON output produced by the DataWeave example, showing the results of applying `substringBeforeLast` to different inputs.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-substringbeforelast.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{
  "a": null,
  "b": "",
  "c": "a",
  "d": "abc",
  "e": "",
  "f": "ab"
}
```

--------------------------------

TITLE: Output of DataWeave capitalize example
DESCRIPTION: This JSON snippet shows the expected output when the DataWeave example using the `capitalize` function is executed. It illustrates how different input strings are transformed.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-capitalize.adoc#_snippet_1

LANGUAGE: JSON
CODE:
```
{
  "a": "Customer",
  "b": "Customer First Name",
  "c": "Customer Name",
  "d": "Customer Name",
  "e": "A*S B’S"
}
```

--------------------------------

TITLE: Documenting DataWeave Annotation @StreamCapable
DESCRIPTION: Illustrates how to document a DataWeave annotation using a documentation comment (`/** ... */`). The example documents the `@StreamCapable` annotation, explaining its purpose to mark stream-capable parameters or variables and showing the use of the `@AnnotationTarget` annotation.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-create-module.adoc#_snippet_17

LANGUAGE: dataweave
CODE:
```
/**
* Annotation that marks a parameter as stream capable, which means that this
* field will consume an array of objects in a forward-only manner.
*/
@AnnotationTarget(targets = ["Parameter", "Variable"])
annotation StreamCapable()
```

--------------------------------

TITLE: JSON Example Output
DESCRIPTION: The expected JSON output generated by the DataWeave example, showing the resulting DateTime values, Period formats, and the numeric result from adding periods.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-periods-functions-minutes.adoc#_snippet_1

LANGUAGE: Json
CODE:
```
{
   "nextMinute": "2020-10-05T20:23:34.385Z",
   "previousMinute": "2020-10-05T20:21:34.385Z",
   "decimalInputPeriod": "PT4M33.3S",
   "wholeNumberInputPeriod": "PT4M",
   "addNegativeValue": 60
}
```

--------------------------------

TITLE: Example Source
DESCRIPTION: This example shows how `objectFields` behaves with different inputs, demonstrating its use with various custom and built-in object types.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-types-functions-objectfields.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
import * from dw::core::Types
ns ns0 http://acme.com
type ADictionary = {_ : String}
type ASchema = {ns0#name @(ns0#foo: String): {}}
type AUser = {name @(foo?: String,l: Number)?: String, lastName*: Number}
---
{
    a: objectFields(ADictionary),
    b: objectFields(ASchema),
    c: objectFields(Object),
    d: objectFields(AUser)
}
```

--------------------------------

TITLE: Getting Multiple Array Sizes in DataWeave
DESCRIPTION: This example shows how to use sizeOf with different types of arrays, including nested arrays and empty arrays, within a single DataWeave script. It returns an object containing the sizes.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-sizeof.adoc#_snippet_1

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
---
{
  "arraySizes": {
     size3: sizeOf([1,2,3]),
     size2: sizeOf([[1,2,3],[4]]),
     size0: sizeOf([])
   }
}
```

LANGUAGE: JSON
CODE:
```
{
   "arraySizes": {
     "size3": 3,
     "size2": 2,
     "size0": 0
   }
}
```

--------------------------------

TITLE: Get charCodeAt for String in DataWeave
DESCRIPTION: This DataWeave example demonstrates how to use the `charCodeAt` function to retrieve the Unicode value of a character at a specified index (1) within the input string "MuleSoft". The output is formatted as JSON.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-strings-functions-charcodeat.adoc#_snippet_0

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
import * from dw::core::Strings
output application/json
---
{
  "charCodeAt" : charCodeAt("MuleSoft", 1)
}
```

--------------------------------

TITLE: Example Multipart/Form-Data Input
DESCRIPTION: Shows a sample text representation of a multipart/form-data payload with two parts, one containing JSON and the other XML, separated by a boundary. This serves as input for the subsequent DataWeave transformation example.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-troubleshoot.adoc#_snippet_8

LANGUAGE: text
CODE:
```
--myboundary
Content-Disposition: form-data; name="file1"; filename="a.json"
Content-Type: application/json

{
"title": "Java 8 in Action",
"author": "Mario Fusco",
"year": 2014
}
--myboundary
Content-Disposition: form-data; name="file2"; filename="a.xml"
Content-Type: application/xml

<doc>
    <title> Available for download! </title>
    <content> Really large content </content>
</doc>
--myboundary--
```

--------------------------------

TITLE: Retrieve Payload Encoding with DataWeave in Mule XML
DESCRIPTION: This Mule flow illustrates the use of the `.^encoding` DataWeave selector in a Logger component to get and print the character encoding of the payload. The example sets the payload to a string.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-cookbook-extract-data.adoc#_snippet_25

LANGUAGE: XML
CODE:
```
<flow name="setpayloadobjectFlow" >
  <scheduler doc:name="Scheduler" >
    <scheduling-strategy >
      <fixed-frequency frequency="15" timeUnit="SECONDS"/>
    </scheduling-strategy>
  </scheduler>
  <!-- Set the payload to "my string". -->
  <set-payload value='"my string"' doc:name="Set Payload" />
  <!-- Select the encoding of "my string". -->
  <logger level="INFO" doc:name="Logger" message="#[payload.^encoding]"/>
</flow>
```

--------------------------------

TITLE: Test DataWeave Library (Console)
DESCRIPTION: Run the 'test' goal of the DataWeave Maven plugin from the command line. This executes the test suite included in your DataWeave library using the DataWeave testing framework.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-maven-plugin.adoc#_snippet_3

LANGUAGE: console
CODE:
```
mvn test
```

--------------------------------

TITLE: DataWeave Script Defining and Using a Variable
DESCRIPTION: This DataWeave script demonstrates how to define a variable (`myJson`) in the header using the `var` directive. The script body then simply outputs the value stored in this variable.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dataweave-quickstart.adoc#_snippet_7

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
var myJson = { "hello" : "world" }
output application/json
---
myJson
```

--------------------------------

TITLE: Extracting Keys, Values, and Indices from XML using pluck (DataWeave)
DESCRIPTION: This example shows how to use `pluck` to extract keys, values, and indices from an XML structure. It iterates over the `<prices/>` element and uses anonymous parameters (`$$`, `$`, `$$$`) to get keys, values, and indices respectively. Values are cast to Number.

SOURCE: https://github.com/mulesoft/docs-dataweave/blob/v2.9/modules/ROOT/pages/dw-core-functions-pluck.adoc#_snippet_1

LANGUAGE: DataWeave
CODE:
```
%dw 2.0
output application/json
var readXml = read("<prices>\n    <basic>9.99</basic>\n    <premium>53.00</premium>\n    <vip>398.99</vip>\n    </prices>", "application/xml")
---
"result" : {
  "keys" : readXml.prices pluck($$),
  "values" : readXml.prices pluck($) as Number,
  "indices" : readXml.prices pluck($$$)
}
```