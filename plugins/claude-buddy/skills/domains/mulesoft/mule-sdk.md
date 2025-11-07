================
CODE SNIPPETS
================
TITLE: Build Mule SDK Project with Maven
DESCRIPTION: Executes the Maven `clean install` command to build the generated Mule SDK project. This compiles the code, runs tests, and installs the project artifact into the local Maven repository.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/getting-started.adoc#_snippet_2

LANGUAGE: Shell
CODE:
```
mvn clean install
```

--------------------------------

TITLE: Example Maven Installation Output
DESCRIPTION: This console output shows the successful execution of the mvn clean install command for a sample cookbook-connector. It lists the artifacts being installed into the local Maven repository, including the POM, extension model JSON, and the Mule plugin JAR.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/certification-guidelines-for-connectors.adoc#_snippet_9

LANGUAGE: Console
CODE:
```
[INFO] No primary artifact to install, installing attached artifacts instead.
[INFO] Installing /Users/me/Downloads/mule4SampleConnector/cookbook-connector/pom.xml to /Users/me/.m2/repository/org/mule/extension/cookbook-connector/1.0.0/cookbook-connector-1.0.0.pom
[INFO] Installing /Users/me/Downloads/mule4SampleConnector/cookbook-connector/target/temporal-extension-model.json to /Users/me/.m2/repository/org/mule/extension/cookbook-connector/1.0.0/cookbook-connector-1.0.0-extension-model-4.0.0.json
[INFO] Installing /Users/me/Downloads/mule4SampleConnector/cookbook-connector/target/cookbook-connector-1.0.0-mule-plugin.jar to /Users/me/.m2/repository/org/mule/extension/cookbook-connector/1.0.0/cookbook-connector-1.0.0-mule-plugin.jar
[NOTE]
---
[INFO] BUILD SUCCESS
[NOTE]
---
[INFO] Total time: 35.057 s
[INFO] Finished at: 2018-01-11T17:10:50-08:00
[INFO] Final Memory: 49M/476M
[NOTE]
---
```

--------------------------------

TITLE: Generate Mule SDK Project using Maven Plugin
DESCRIPTION: Runs the Maven plugin command to generate a new Mule SDK extension project based on the specified archetype version. This command prompts for project details.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/getting-started.adoc#_snippet_0

LANGUAGE: Shell
CODE:
```
mvn org.mule.extensions:mule-extensions-archetype-maven-plugin:1.3.1:generate
```

--------------------------------

TITLE: Maven Build Success Output
DESCRIPTION: Example output from the Maven clean install command showing a successful build and MUnit test execution for the Mule XML SDK project.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_15

LANGUAGE: text
CODE:
```
 ...
 ..
 .
==================================================================================
Number of tests run: 2 - Failed: 0 - Errors: 0 - Skipped: 0 - Time elapsed: 2246ms
==================================================================================
[INFO] ====================================================================================
[INFO] MUnit Run Summary - Product: MULE, Version: 4.1.1
[INFO] ====================================================================================
[INFO]  >> assertion-munit-test.xml test result: Tests: 2, Errors: 0, Failures: 0, Skipped: 0
[INFO]
[INFO] ====================================================================================
[INFO]  > Tests:   	2
[INFO]  > Errors:  	0
[INFO]  > Failures:	0
[INFO]  > Skipped: 	0
[INFO] ====================================================================================
....
...
..
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```

--------------------------------

TITLE: Adding Example Value with @Example Annotation (Java)
DESCRIPTION: Demonstrates how to use the @Example annotation on a parameter to provide a sample value that can be displayed in the UI, guiding users on expected input format or values.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/parameter-layout.adoc#_snippet_0

LANGUAGE: Java
CODE:
```
@Parameter
@Example("0.0.0.0")
private String port;
```

--------------------------------

TITLE: Implementing onStart Method for Mule SDK Source (Java)
DESCRIPTION: Example implementation of the `onStart` method for a Mule SDK Source. This method is invoked when the source starts and is used to initialize resources. It receives a `SourceCallback` object for interacting with the runtime.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/sources-lifecycle.adoc#_snippet_0

LANGUAGE: java
CODE:
```
@Override
public void onStart(SourceCallback<Serializable, VMMessageAttributes> sourceCallback) throws MuleException {

}
```

--------------------------------

TITLE: Define Parent POM in Mule SDK Project
DESCRIPTION: Specifies the parent POM for a Mule SDK module project. This parent POM provides common configurations and defaults. The version should be compatible with the target Mule runtime and Java version.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/getting-started.adoc#_snippet_1

LANGUAGE: XML
CODE:
```
<parent>
  <groupId>org.mule.extensions</groupId>
  <artifactId>mule-modules-parent</artifactId>
  <version>1.9.0</version>
</parent>
```

--------------------------------

TITLE: Build and Install Mule XML SDK Project
DESCRIPTION: Maven command to build the Mule XML SDK project, run MUnit tests, and install the resulting connector artifact into the local Maven repository.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_14

LANGUAGE: text
CODE:
```
➜  hello-mule-extension mvn clean install
```

--------------------------------

TITLE: Add Mule SDK Connector Dependency to App POM
DESCRIPTION: Adds a dependency entry to a Mule application's `pom.xml` file to include a custom Mule SDK connector. This makes the connector available for use within the application.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/getting-started.adoc#_snippet_3

LANGUAGE: XML
CODE:
```
<dependencies>
  ...
  <dependency>
    <groupId>org.mule.connector</groupId>
    <artifactId>mule-connector</artifactId>
    <version>1.0.0</version>
    <classifier>mule-plugin</classifier>
  </dependency>
  ...
</dependencies>
```

--------------------------------

TITLE: Install Mule SDK Connector using Maven
DESCRIPTION: This command builds the connector project and installs the resulting artifact (Mule plugin JAR) into the local Maven repository. This makes the connector available for use in other Maven projects, including Anypoint Studio projects.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/certification-guidelines-for-connectors.adoc#_snippet_7

LANGUAGE: Console
CODE:
```
mvn clean install
```

--------------------------------

TITLE: Example Mule Application for Module Testing - XML
DESCRIPTION: Provides an example Mule application XML configuration used for testing a module. It includes a basic configuration for the module and defines two flows (`sayHiFlow` and `retrieveInfoFlow`) that utilize the module's operations.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/testing-writing-your-first-test-case.adoc#_snippet_2

LANGUAGE: xml
CODE:
```
<mule xmlns="http://www.mulesoft.org/schema/mule/core"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:basic="http://www.mulesoft.org/schema/mule/basic"
      xsi:schemaLocation="http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
          http://www.mulesoft.org/schema/mule/basic http://www.mulesoft.org/schema/mule/basic/current/mule-basic.xsd">

    <basic:config name="basic-config" configId="configId">
        <basic:connection requiredParameter="aValue" />
    </basic:config>

    <flow name="sayHiFlow">
        <basic:say-hi person="Mariano Gonzales"/>
    </flow>

    <flow name="retrieveInfoFlow">
        <basic:retrieve-info config-ref="basic-config"/>
    </flow>

</mule>
```

--------------------------------

TITLE: Logging Example for Pooling Connection Provider
DESCRIPTION: This example shows log messages related to connection acquisition and pool status from a Mule Pooling Connection Management Strategy.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/troubleshooting.adoc#_snippet_5

LANGUAGE: Log
CODE:
```
org.mule.runtime.core.internal.connection.PoolingConnectionManagementStrategy: Acquiring connection org.mule.extension.ftp.internal.connection.FtpFileSystem@1a0c776f from the pool FTP_Config-5e20b7d9-417d-4307-ab4c-9ef3e7ae4d9b
org.mule.runtime.core.internal.connection.PoolingConnectionManagementStrategy: Status for pool FTP_Config-5e20b7d9-417d-4307-ab4c-9ef3e7ae4d9b: 1 connections are active out of 5 max active limit, 0 connections are idle out of 5 max idle limit
```

--------------------------------

TITLE: Example XML SDK Module Using Core Components
DESCRIPTION: A complete example of an XML SDK module definition (`module-using-core`) showcasing operations that utilize core Mule components like `set-payload` and `raise-error`.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_42

LANGUAGE: xml
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>
<module name="module-using-core"
        doc:description="This module relies entirely in runtime provided components (no other Plugin dependencies)"

        xmlns="http://www.mulesoft.org/schema/mule/module"
        xmlns:mule="http://www.mulesoft.org/schema/mule/core"
        xmlns:doc="http://www.mulesoft.org/schema/mule/documentation"
        xmlns:tns="http://www.mulesoft.org/schema/mule/module-using-core"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="
           http://www.mulesoft.org/schema/mule/module http://www.mulesoft.org/schema/mule/module/current/mule-module.xsd
           http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
           http://www.mulesoft.org/schema/mule/module-using-core http://www.mulesoft.org/schema/mule/module-using-core/current/mule-module-using-core.xsd">

    <operation name="set-payload-hardcoded" doc:description="Sets the payload to the String value 'Wubba Lubba Dub Dub'">
        <body>
            <tns:private-set-payload-hardcoded/>
        </body>
        <output type="string" doc:description="Payload's output"/>
    </operation>

    <operation name="set-payload-hardcoded-two-times" doc:description="Sets the payload to the String value 'Wubba Lubba Dub Dub Dub Dub' (uses references to local operation)">
        <body>
            <tns:set-payload-hardcoded/>
            <mule:set-payload value="#[payload ++ ' Dub Dub']"/>
        </body>
        <output type="string" doc:description="Payload's output"/>
    </operation>

    <operation name="fail-raise-error">
        <parameters>
            <parameter name="customError" type="boolean" defaultValue="true"/>
        </parameters>
        <body>
            <mule:choice>
                <mule:when expression="#[vars.customError]">
                    <mule:raise-error type="MODULE-USING-CORE:XML_SDK_CUSTOM_ERROR" description="A custom error occurred in the module."/>
                </mule:when>
                <mule:otherwise>

```

--------------------------------

TITLE: Initial HTTP Request Config Example
DESCRIPTION: Shows a basic HTTP request configuration using `http:request-config` and `http:request-connection`.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_38

LANGUAGE: xml
CODE:
```
<http:request-config
name="concur-httpreq-config" xmlns:connection="true"
basePath ....>
  <http:request-connection xmlns:tlsEnabled="true"
  host=...>

```

--------------------------------

TITLE: Example Successful GitHub API User Response (JSON)
DESCRIPTION: A sample JSON response body returned by the GitHub API's 'Get the authenticated user' endpoint upon successful authentication and request. Shows typical user profile fields.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_7

LANGUAGE: json
CODE:
```
{
  "login": "fernandezlautaro",
  "id": 4719511,
  "avatar_url": "https://avatars1.githubusercontent.com/u/4719511?v=3",
  "gravatar_id": "",
  "url": "https://api.github.com/users/fernandezlautaro",
  ...
}
```

--------------------------------

TITLE: Logging Example for Source
DESCRIPTION: This example shows typical log messages generated by a Mule Extension Message Source during connection attempts and shutdown.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/troubleshooting.adoc#_snippet_2

LANGUAGE: Log
CODE:
```
org.mule.runtime.module.extension.internal.runtime.source.ExtensionMessageSource: Message source 'listener' on flow 'ftp-troubleshooting-examples' threw exception. Attempting to reconnect...
org.mule.runtime.module.extension.internal.runtime.source.ExtensionMessageSource: Message source 'listener' on flow 'ftp-troubleshooting-examples' successfully reconnected
org.mule.runtime.module.extension.internal.runtime.source.ExtensionMessageSource: Message source 'listener' on flow 'ftp-troubleshooting-examples' could not be reconnected. Will be shutdown.
org.mule.runtime.module.extension.internal.runtime.source.ExtensionMessageSource: Message source 'listener' on flow 'ftp-troubleshooting-examples' is stopping
```

--------------------------------

TITLE: Use Mule XML SDK Module in Mule App
DESCRIPTION: Example of a Mule application using the 'hello with spaces' module, showing the required namespace and schema location configuration in the mule tag.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_10

LANGUAGE: xml
CODE:
```
<mule xmlns="http://www.mulesoft.org/schema/mule/core"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:hello-with-spaces="http://www.mulesoft.org/schema/mule/hello-with-spaces"
      xsi:schemaLocation="
      http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
      http://www.mulesoft.org/schema/mule/hello-with-spaces http://www.mulesoft.org/schema/mule/hello-with-spaces/current/mule-hello-with-spaces.xsd">

    <flow name="some-flow">
        <hello-with-spaces:an-operation/>
    </flow>
</mule>
```

--------------------------------

TITLE: Example Mule Configuration for Custom Module (XML)
DESCRIPTION: This XML snippet provides an example configuration for a Mule application using the custom module. It shows how to define a configuration element `<xyz:config>` with a name and set the `someParameter` value, and how to include connection details like a password within the configuration.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/connections.adoc#_snippet_3

LANGUAGE: XML
CODE:
```
<xyz:config name="a-xyz-config" someParameter="value">
    <xyz:connection password="aVeryDifficultPassword"/>
</xyz:config>
```

--------------------------------

TITLE: Implementing Sample Data Provider in Mule SDK (Java)
DESCRIPTION: Provides an example implementation of the `SampleDataProvider` interface. Demonstrates accessing component parameters, configuration, and connection to fetch sample data and returning a `Result` object. Includes handling for no data available by throwing a `SampleDataException`.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/sample-data.adoc#_snippet_9

LANGUAGE: Java
CODE:
```
public class ObjectSampleDataProvider implements SampleDataProvider<InputStream, ObjectAttributes> {

   @Parameter
   private String objectType;

   @Parameter
   @Optional
   private String status;

   @Connection
   private GitHubConnection connection;

   @Config
   private GitHubConfig config;

   @Override
   public Result<InputStream, ObjectAttributes> getSample() throws SampleDataException {
       String query = "objectType=" + objectType;
       if (status != null) {
           query += "; status=" + status;
       }
       query += ";organization=" + config.getOrganization();

       List<GitHubObject> jsonDocs = connection.query(query);

       if (jsonDocs.isEmpty()) {
           throw new SampleDataException("No data available", NO_DATA_AVAILABLE);
       }

       GitHubObject sample = jsonDocs.get(0);
       String body = sample.getBody();

       return Result.<InputStream, ObjectAttributes>builder()
               .output(new ByteArrayInputStream(body.getBytes()))
               .mediaType(MediaType.APPLICATION_JSON)
               .length(body.length())
               .attributes(sample.getMetadata())
               .attributesMediaType(MediaType.APPLICATION_JAVA)
               .build();
   }

   @Override
   public String getId() {
       return "objectResolver";
   }
}
```

--------------------------------

TITLE: Example TLS Context Configuration in Mule XML
DESCRIPTION: Shows an example XML configuration for a TLS context using the `tls:context` element. It includes settings for enabled protocols, trust store, and key store.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/tls.adoc#_snippet_1

LANGUAGE: xml
CODE:
```
<tls:context enabledProtocols="TLSv1.2,SSLv3">
    <tls:trust-store path="my-trust-store.jks" password="myPassword"/>
    <tls:key-store path="my-key-store.jks" keyPassword="myPassword" password="myPassword"/>
</tls:context>
```

--------------------------------

TITLE: Implementing JsonSampleDataProvider in Java
DESCRIPTION: Provides an example implementation of the SampleDataProvider interface (JsonSampleDataProvider). It demonstrates how to construct static JSON data, inject operation parameters using @Parameter, and return the sample data as an InputStream with appropriate metadata.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/sample-data.adoc#_snippet_5

LANGUAGE: java
CODE:
```
public class JsonSampleDataProvider implements SampleDataProvider<InputStream, Void> {

   private static JsonObject sampleJson = new JsonObject();

   public JsonSampleDataProvider() {
       sampleJson.add("company", "Mulesoft");
       sampleJson.add("email", "maxmule2007@mulesoft.com");
       sampleJson.add("repositories", new JsonArray("mule-api", "data-weave-2"));
   }

   @Parameter
   private String username;

   @Override
   public Result<InputStream, ObjectAttributes> getSample() throws SampleDataException {

       sampleJson.addFirst("username", username);
       String body = sampleJson.getBody();

       return Result.<InputStream, ObjectAttributes>builder()
               .output(new ByteArrayInputStream(body.getBytes()))
               .mediaType(MediaType.APPLICATION_JSON)
               .length(body.length())
               .build();
   }

   @Override
   public String getId() {
       return "jsonResolver";
   }
}
```

--------------------------------

TITLE: Combining Multiple UI Annotations (Java)
DESCRIPTION: Provides an example demonstrating the combined use of @Parameter, @Placement, @Example, @DisplayName, @Summary, and @Text annotations on a single String parameter to customize various UI aspects simultaneously.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/parameter-layout.adoc#_snippet_7

LANGUAGE: Java
CODE:
```
@Parameter
@Placement(order = 3, tab="Additional information")
@Example("My name is Max the Mule and I love MuleSoft!")
@DisplayName("User biography")
@Summary("Information related to the user\'s life")
@Text
private String biography;
```

--------------------------------

TITLE: Example JSON Sample Data Output
DESCRIPTION: Shows the expected JSON output generated by the JsonSampleDataProvider when the username parameter is "John Doe". It illustrates the structure of the sample data provided.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/sample-data.adoc#_snippet_6

LANGUAGE: json5
CODE:
```
{
	"username": "John Doe",
	"company": "Mulesoft",
	"email": "maxmule2007@mulesoft.com",
	"repositories": ["mule-api", "data-weave-2"]
}
```

--------------------------------

TITLE: Configuring Encoding with Default and Override in Java
DESCRIPTION: Example of a Mule SDK configuration class demonstrating how to use @DefaultEncoding to get the default Mule encoding and allow an optional override via a @Parameter, ensuring encoding is configurable.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/general-coding-rules.adoc#_snippet_4

LANGUAGE: java
CODE:
```
public class MyConfig implements Initialisable {

        @DefaultEncoding
        private String defaultEncoding;

        @Parameter
        @Optional
        private String encoding;

        public void initialise() throws InitialisationException {
                if (encoding == null) {
                        encoding = defaultEncoding;
                }
        }

        public String getEncoding() {
                return encoding;
        }

}
```

--------------------------------

TITLE: Implementing Lifecycle Methods for HTTP Connection Provider in Java
DESCRIPTION: This Java snippet demonstrates how an HTTP Connection Provider should implement the Startable and Stoppable interfaces to manage the lifecycle of the underlying HTTP client. The start() method initializes and starts the client, while the stop() method safely stops it.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/HTTP-based-connectors.adoc#_snippet_0

LANGUAGE: java
CODE:
```
public class HttpConnectionProvider implements CachedConnectionProvider<HttpConnection>, Startable, Stoppable {

        @Inject
        private HttpService httpService;

        @Parameter
        private TlsContextFactory tlsContext;

        @Override
   public void start() throws MuleException {
       initialiseIfNeeded(tlsContext);
       httpClient = httpService.getClientFactory().create(getHttpClientConfiguration());
       httpClient.start();
   }

   @Override
   public void stop() throws MuleException {
           if (httpClient != null) {
              httpClient.stop();
           }
   }

   // rest of the implementation removed for example simplicity

}
```

--------------------------------

TITLE: Logging Example for Polling Source
DESCRIPTION: This example shows log messages indicating whether an item processed by a Mule Polling Source was accepted or rejected by a watermark.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/troubleshooting.adoc#_snippet_3

LANGUAGE: Log
CODE:
```
org.mule.runtime.module.extension.internal.runtime.source.poll.PollingSourceWrapper: Item with id:[/ftp-example.json] is accepted
org.mule.runtime.module.extension.internal.runtime.source.poll.PollingSourceWrapper: Item with id:[/ftp-example.json] is rejected with status:[FILTERED_BY_WATERMARK]
```

--------------------------------

TITLE: Maven Compilation Error Example
DESCRIPTION: This example shows a typical Maven compilation error encountered when using `org.mule.sdk.api` classes with certain configurations, indicating classes or symbols are not found.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/troubleshooting.adoc#_snippet_7

LANGUAGE: Log
CODE:
```
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.8.1:compile (default-compile) on project : Compilation failure:

cannot access org.mule.sdk.api.runtime.streaming.StreamingHelper
[ERROR] class file for org.mule.sdk.api.runtime.streaming.StreamingHelper not found

cannot find symbol
[ERROR]   symbol:   method resolveCursors(java.util.HashMap<java.lang.String,java.lang.Object>,boolean)
[ERROR]   location: variable streamingHelper of type org.mule.runtime.extension.api.runtime.streaming.StreamingHelper
```

--------------------------------

TITLE: Mule Flow Using ParameterResolver (XML)
DESCRIPTION: Starts a Mule flow intended to demonstrate the use of a parameter resolver. The snippet is incomplete and does not show the full usage.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/special-parameters.adoc#_snippet_5

LANGUAGE: xml
CODE:
```
<flow name="parameterResolverFlow">

```

--------------------------------

TITLE: Mule SDK Configuration DSL Usage (XML)
DESCRIPTION: Shows an example of how the configuration defined in the Java snippet would be used in a Mule application's XML DSL, assigning a specific name ('exampleConfig') to the configuration instance. This name is then injected into the field annotated with `@RefName` in the corresponding Java class.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/configs.adoc#_snippet_4

LANGUAGE: XML
CODE:
```
<my-extension:config name="exampleConfig" someParameter="aParameter">
```

--------------------------------

TITLE: Metadata Key Parameter Example (XML)
DESCRIPTION: Provides an example of an operation using a metadata key parameter (`searchType`) that is allowed to influence the type of items within a returned list, demonstrating how dynamic types can be handled without violating the rule on non-metadata parameters.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/define-operations.adoc#_snippet_3

LANGUAGE: xml
CODE:
```
<my-connector:search searchType="ORDERS" query="......" />
```

--------------------------------

TITLE: Define XML SDK Data Type Catalog
DESCRIPTION: Example of a module-Hello-catalog.xml file defining a catalog of custom data types (PersonXsdType, PersonJsonType) by referencing external XML and JSON schema files.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_28

LANGUAGE: XML
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>
<catalogs xmlns="http://www.mulesoft.org/schema/mule/types" >
    <catalog name="PersonXsdType" format="application/xml">
        <schema format="application/xml+schema" location="./person-schema.xsd" />
    </catalog>
    <catalog name="PersonJsonType" format="application/json">
        <schema format="application/json+schema" location="./person-schema.json" />
    </catalog>
</catalogs>
```

--------------------------------

TITLE: Defining XML SDK Module with Properties and HTTP Request
DESCRIPTION: Example of an XML SDK module definition for interacting with the GitHub API. Demonstrates defining global properties (username, password), configuring an HTTP request connection with basic authentication using properties, and defining an operation (get-user) that uses the HTTP configuration.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_5

LANGUAGE: xml
CODE:
```
<module name="Github"  ...>
  <property name="username" type="string" doc:description="Username credential."/>
  <property name="password" type="string" password="true" doc:description="Password credential"/>

  <http:request-config name="github-httpreq-config" basePath="/">
    <http:request-connection host="api.github.com" protocol="HTTPS" port="443">
      <http:authentication>
        <http:basic-authentication username="#[vars.username]" password="#[vars.password]"/>
      </http:authentication>
    </http:request-connection>
  </http:request-config>

  <operation name="get-user" doc:description="Lists public and private profile information when authenticated.">
    <body>
      <http:request config-ref="github-httpreq-config" path="#['user/' ++ vars.username]" method="GET"/>
    </body>
    <output type="string" doc:description="User information if logged properly."/>
  </operation>
</module>
```

--------------------------------

TITLE: Example XML Schema Definition
DESCRIPTION: An example XML Schema (XSD) defining a complex type named "Root" representing a user. It includes elements for name, lastName, male (boolean), and age (integer). This schema could be referenced by a data type catalog.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_50

LANGUAGE: xml
CODE:
```
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="Root">
        <xs:complexType>
            <xs:annotation>
                <xs:documentation xml:lang="en">
                    A user with all the information
                </xs:documentation>
            </xs:annotation>
            <xs:sequence>
                <xs:element type="xs:string" name="name"/>
                <xs:element type="xs:string" name="lastName"/>
                <xs:element type="xs:boolean" name="male"/>
                <xs:element type="xs:integer" name="age"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
</xs:schema>
```

--------------------------------

TITLE: Logging Example for Polling Source Watermarking
DESCRIPTION: This example shows a log message indicating that a new watermark maximum value was identified during the processing of an item by a Mule Polling Source.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/troubleshooting.adoc#_snippet_4

LANGUAGE: Log
CODE:
```
org.mule.runtime.module.extension.internal.runtime.source.poll.PollingSourceWrapper: A new watermark maximum has been found when processing item with id /ftp-example.json for source in flow ftp-troubleshooting-examples
```

--------------------------------

TITLE: Example GitHub API Authentication Error Response (JSON)
DESCRIPTION: A sample JSON response body returned by the GitHub API when an authentication error occurs, such as providing incorrect credentials. Indicates that the request requires proper authentication.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_8

LANGUAGE: json
CODE:
```
{
  "message": "Requires authentication",
}
```

--------------------------------

TITLE: Handling Transactions in VM Listener Source (Java)
DESCRIPTION: This example demonstrates transaction handling within the `onStart` method of a transactional source, modeled after a VM listener. It shows how to obtain multiple connections, create a `CallbackContext` for each, bind the connection to the context using `bindConnection()`, process messages within a try-catch block, and rely on the runtime to handle commit/rollback based on the outcome of the `handle` method and the `onSuccess`/`onError` callbacks.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/sources-transactions.adoc#_snippet_1

LANGUAGE: java
CODE:
```
public VMListener extends Source<Serializable, VMMessageAttributes> {

	@Connection
	private ConnectionProvider<QueueSession> sessionProvider;

	@Override
  public void onStart(SourceCallback<Serializable, VMMessageAttributes> sourceCallback) throws MuleException {
		while(notStopped()) {
			QueueSession session =  sessionProvider.connect(); // <1>
      CallbackContext ctx = callback.createContext(); // <2>
			TransactionHandle status = ctx.bindConnection(session); // <3>

			try {
				callback.handle(session.poll(), ctx); // <4>
			} catch (Exception e) {
				status.rollback();
			}
		}
	}

	@OnSuccess
	public void onSuccess(SourceCallbackContext context) {
		handleSuccess(context.getConnection()); // <5>
	}

	@OnError
	public void onError(SourceCallbackContext context, Error error) {
		handleError(context, error);
	}
}
```

--------------------------------

TITLE: Example DataWeave Functions for Resource Export
DESCRIPTION: Contains DataWeave functions (five, echo, toUpper) intended to be exported as a resource with a connector. These functions demonstrate handling simple types, complex types, and arrays of complex types, making them available for use in the main Mule application.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_52

LANGUAGE: dataweave
CODE:
```
%dw 2.0

/******************************************************************************************************************************
 NOTICE:
    This file, `dwModule.dwl`, must be referenced in the META-INF/mule-artifact/mule-artifact.json file to properly export the
    resource so that the functions being consumed (`five()`, `echo(String)`, `toUpper(Person)`, `toUpper(Array<Person)`) in
    the module `module-using-dw.xml` are accessible in the application using it (remember that smart connectors are macro
    expanded, thus the resources must be reached by the main app)
 ******************************************************************************************************************************/

// zero-ary operation
fun five() = 5

// unary operation with simple type
fun echo(name:String): String = name

// unary operation with complex type
type Person = {name: String, lastname: String}
fun toUpper(p: Person): Person =
    {
        name:upper(p.name),
        lastname:upper(p.lastname)
    }

// unary operation with array of complex type
fun toUpper(persons: Array<Person>): Array<Person> =
    persons map toUpper($)
```

--------------------------------

TITLE: Logging Component Location in Mule SDK Source (Java)
DESCRIPTION: This snippet demonstrates how to inject the ComponentLocation parameter into a Mule SDK Source's onStart method to log the component's location and configured path when the source starts. This is useful for debugging and tracing.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/context-information-injection.adoc#_snippet_0

LANGUAGE: java
CODE:
```
@Alias("listener")
public class HttpListener extends Source<InputStream, HttpRequestAttributes> {

  private static final Logger LOGGER = getLogger(HttpListener.class);

  @Connection
  private ConnectionProvider<HttpServer> serverProvider;

  private ComponentLocation location;

  @Parameter
  private String path;

  private HttpServer server;

  @Override
  public void onStart(SourceCallback<InputStream, HttpRequestAttributes> sourceCallback) throws MuleException {
    server = serverProvider.connect();
    if (LOGGER.isDebugEnabled()) {
      LOGGER.debug("Starting HTTP Listener %s on path %s", location.getLocation(), path);
    }
    server.listen(path);
  }
// ...
}
```

--------------------------------

TITLE: Add Connector Dependency in Studio 7 pom.xml
DESCRIPTION: This XML snippet shows how to add a dependency entry in the pom.xml file of a Mule project in Anypoint Studio 7. It references the connector artifact installed in the local Maven repository by specifying its groupId, artifactId, version, and classifier. Adding this dependency makes the connector available in the Studio palette.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/certification-guidelines-for-connectors.adoc#_snippet_10

LANGUAGE: XML
CODE:
```
<dependency>
  <groupId>org.mule.extension</groupId>
  <artifactId>cookbook-connector</artifactId>
  <version>1.0.0</version>
  <classifier>mule-plugin</classifier>
</dependency>
```

--------------------------------

TITLE: Example of Repeated Validation Logic in Mule Operations (Mule XML)
DESCRIPTION: Demonstrates a Mule XML SDK module with two operations, validate-and-insert and validate-and-update, showing duplicated validation logic within their bodies before refactoring.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_19

LANGUAGE: XML
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>
<module name="module-calling-operations-within-module"
        xmlns="http://www.mulesoft.org/schema/mule/module"
        xmlns:mule="http://www.mulesoft.org/schema/mule/core"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="
           http://www.mulesoft.org/schema/mule/module http://www.mulesoft.org/schema/mule/module/current/mule-module.xsd
           http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd">

    <operation name="validate-and-insert">
        <parameters>
            <parameter name="name" type="string"/>
        </parameters>
        <body>
            <!-- validate the 'name' != null -->
            <!-- validate the 'name' wasn't already added -->
            <!-- validate the 'name' matches some criteria -->
            <!-- validate the 'name' ... and so on -->
            <db:insert config-ref="dbConfig..">
                <db:sql>INSERT INTO PLANET(NAME) VALUES (:name)</db:sql>
                <db:input-parameters>#[{ 'name' : vars.name }]</db:input-parameters>
            </db:insert>
        </body>
    </operation>

    <operation name="validate-and-update">
        <parameters>
            <parameter name="originalName" type="string"/>
            <parameter name="newName" type="string"/>
        </parameters>
        <body>
            <!-- validate the 'newName' and 'originalName' != null -->
            <!-- validate the 'newName' and 'originalName' wasn't already added -->
            <!-- validate the 'newName' and 'originalName' matches some criteria -->
            <!-- validate the 'newName' and 'originalName' ... and so on -->
            <db:update config-ref="dbConfig..">
                <db:sql>update PLANET set NAME= :newName where NAME=':originalName'</db:sql>
                <db:input-parameters>#[{'originalName' : vars.originalName, 'newName' : vars.newName}]</db:input-parameters>
            </db:update>
        </body>
    </operation>
</module>
```

--------------------------------

TITLE: Handling Connection Errors During Source Startup in Java
DESCRIPTION: This Java snippet demonstrates how to handle connection errors that occur during the `onStart` method of a Mule SDK Source. It catches exceptions during connection or streaming setup and communicates the failure to the `SourceCallback` using `onConnectionException`, triggering a reconnection attempt.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/reconnection.adoc#_snippet_3

LANGUAGE: java
CODE:
```
@Override
public void onStart(SourceCallback<String, Void> sourceCallback) throws MuleException {
Connection connection = connectionProvider.connect();
  try {
    connection.startStreaming();
  } catch(Exception e){
    sourceCallback.onConnectionException(new ConnectionException(e, connection));
  }
}
```

--------------------------------

TITLE: Using an XML SDK Operation in a Mule Flow (XML)
DESCRIPTION: This example demonstrates how to invoke an operation from an XML SDK module within a standard Mule flow. The `<hello-smart-connector:say-hello>` element represents the operation defined in the 'Hello XML SDK' module, executing its body when the flow runs.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_1

LANGUAGE: xml
CODE:
```
<flow name="random-flow">
  <hello-smart-connector:say-hello>
</flow>
```

--------------------------------

TITLE: Executing a Mule Flow in Test Case - Java
DESCRIPTION: Demonstrates how to execute a specific flow within the configured Mule application from a test case. It uses the `flowRunner()` utility to get a runner for the flow by name and then calls `run()` to execute it, returning an `Event` object.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/testing-writing-your-first-test-case.adoc#_snippet_4

LANGUAGE: java
CODE:
```
Event event = flowRunner("sayHiFlow").run();
```

--------------------------------

TITLE: Implementing a Static Value Provider in Mule SDK
DESCRIPTION: Provides an example of a Java class implementing the `ValueProvider` interface to supply a static set of values for a parameter, offering more flexibility than a simple Enum and supporting custom inputs.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/value-providers.adoc#_snippet_2

LANGUAGE: Java
CODE:
```
public class StaticUserRoleValueProvider implements ValueProvider {

    @Override
    public Set<Value> resolve() {
        return ValueBuilder.getValuesFor("ADMIN", "READER", "WRITER");
    }
}
```

--------------------------------

TITLE: Example POJO for Database Pooling Configuration in Java
DESCRIPTION: Presents a Java class (DbPoolingProfile) designed as a POJO parameter for database connection pooling configuration, showcasing the use of @Parameter, @Optional, and @Placement annotations for defining its properties. It highlights the need for equals and hashCode methods in such classes.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/define-parameters.adoc#_snippet_12

LANGUAGE: java
CODE:
```
/**
* Pooling configuration for JDBC Data Sources capable of pooling connections
*
* @since 1.0
*/
@Alias("pooling-profile")
public class DbPoolingProfile implements DatabasePoolingProfile {

  /**
   * Maximum number of connections a pool maintains at any given time
   */
  @Parameter
  @Optional(defaultValue = "5")
  @Placement(order = 1)
  @Expression(NOT_SUPPORTED)
  private int maxPoolSize = 5;

  /**
   * Minimum number of connections a pool maintains at any given time
   */
  @Parameter
  @Optional(defaultValue = "0")
  @Placement(order = 2)
  @Expression(NOT_SUPPORTED)
  private int minPoolSize = 0;

  /**
   * Determines how many connections at a time to try to acquire when the pool is exhausted
   */
  @Parameter
  @Optional(defaultValue = "1")
  @Placement(order = 3)
  @Expression(NOT_SUPPORTED)
  private int acquireIncrement = 1;

  /**
   * Determines how many statements are cached per pooled connection. Setting this to zero will disable statement caching
   */
  @Parameter
  @Optional(defaultValue = "5")
  @Placement(order = 4)
  @Expression(NOT_SUPPORTED)
  private int preparedStatementCacheSize = 5;

  /**
   * The amount of time a client trying to obtain a connection waits for it to be acquired when the pool is
   * exhausted. Zero (default) means wait indefinitely
   */
  @Parameter
  @Optional(defaultValue = "0")
  @Placement(order = 5)
  @Expression(NOT_SUPPORTED)

```

--------------------------------

TITLE: Example Mule Flow Using Operation with role="CONTENT"
DESCRIPTION: Mule flow demonstrating how to call the `person-xml-to-json` operation when its `content` parameter is defined with `role="CONTENT"`. The XML payload for the parameter is provided directly within the `<module-hello:content>` tag using inline DataWeave.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_36

LANGUAGE: XML
CODE:
```
<mule ...>
  <flow name="person-xml-2-json-using-content-flow">
    <!-- call the operation -->
    <module-hello:person-xml-to-json>
      </module-hello:content><![CDATA[
        %dw 2.0
        %output application/xml
        ---
        person : {
          name : "Lautaro",
          lastName: "Fernandez",
          age : 54
        }]]>
      </module-hello:content>
    </module-hello:person-xml-to-json>
    <!-- at this point, the payload is a JSON Person -->
  </flow>
  ..
</mule>
```

--------------------------------

TITLE: Define Mule SDK Module Using HTTP Connector (XML)
DESCRIPTION: This XML configuration defines a Mule SDK module that integrates with the HTTP Connector. It sets up an HTTP request configuration and exposes a `do-get` operation that performs an HTTP GET request using the configured connection.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_59

LANGUAGE: XML
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>
<module name="module-using-http"
        xmlns="http://www.mulesoft.org/schema/mule/module"
        xmlns:http="http://www.mulesoft.org/schema/mule/http"
        xmlns:xsi="http://www.wulesoft.org/2001/XMLSchema-instance"
        xsi:schemaLocation="
           http://www.mulesoft.org/schema/mule/module http://www.mulesoft.org/schema/mule/module/current/mule-module.xsd
           http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd">

    <property name="host" type="string"/>
    <property name="port" type="string"/>
    <property name="protocol" type="string"/>

    <http:request-config name="httpreq-config" basePath="/">
        <http:request-connection host="#[vars.host]" protocol="#[vars.protocol]" port="#[vars.port]"/>
    </http:request-config>

    <operation name="do-get">
        <parameters>
            <parameter name="path" type="string"/>
        </parameters>
        <body>
            <http:request config-ref="httpreq-config" path="#[vars.path]" method="GET" />
        </body>
        <output type="any"/>
    </operation>

 </module>
```

--------------------------------

TITLE: Declaring a Static Logger with SLF4J (Java)
DESCRIPTION: Provides an example of the correct way to declare a logger using the SLF4J API. Loggers should be declared as private, static, and final for performance reasons.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/general-coding-rules.adoc#_snippet_10

LANGUAGE: java
CODE:
```
public class Operation {

        private static final Logger LOGGER = LoggerFactory.getLogger(Operation.class);

        ...

}
```

--------------------------------

TITLE: Setting Mime Type in Result Object (Java)
DESCRIPTION: Extends the basic Result builder example to show how to set the output mime type using the mediaType() method. The example guesses the mime type based on the file extension.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/result-object.adoc#_snippet_1

LANGUAGE: java
CODE:
```
public Result<InputStream, FileAttributes> read(String path) {
  InputStream content = getContent(path);
  FileAttributes attributes = getAttributes(path);

  MediaType guessedMediaType = MediaType.ANY;
  if (path.endsWith(".json")) {
    guessedMediaType = MediaType.APPLICATION_JSON;
  } else if (path.endsWith("*.xml")) {
    guessedMediaType = MediaType.APPLICATION_XML;
  } else if (path.endsWith("*.bin")) {
    guessedMediaType = MediaType.BINARY;
  }

  return Result.<InputStream, FileAttributes>builder()
        .output(content)
        .attributes(attributes)
        .mediaType(guessedMediaType)
        .build();
}
```

--------------------------------

TITLE: Externalizing Single Configuration Object in Java
DESCRIPTION: This example demonstrates how to separate the configuration definition into a dedicated class (Config) annotated with @Configuration. The main extension class (SingleConfigModule) then references this configuration class using the @Configurations annotation.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/configs.adoc#_snippet_1

LANGUAGE: Java
CODE:
```
@Extension(name="singleConfig")
@Configurations(Config.class) // <1>
public class SingleConfigModule {
}

@Configuration(name="config") // <2>
@Operations(Operations.class)
@Sources(MessageSources.class)
@ConnectionProviders({BasicAuthConnection.class, OAuthConnection.class})
public class Config {

  @Parameter
  private String someParameter;

  @Parameter
  private Integer numericParameter;

  public String getSomeParameter() {
    return someParameter;
  }

  public String getNumericParameter() {
    return numericParameter;
  }
}
```

--------------------------------

TITLE: Defining Multiple Configurations in Java
DESCRIPTION: This snippet illustrates how to define a Mule SDK module with multiple distinct configurations, using the HTTP connector as an example. It shows how the main extension class references multiple configuration classes (HttpListenerConfig, HttpRequesterConfig) using the @Configurations annotation, with each configuration class defining its specific parameters, sources, operations, and connection providers.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/configs.adoc#_snippet_2

LANGUAGE: Java
CODE:
```
@Extension(name="http")
@Configurations({HttpListenerConfig.class, HttpRequesterConfig.class}) // <1>
public class HttpConnector {

}

@Configuration(name="listener") // <2>
@ConnectionProviders(HttpListenerConnection.class)
@Sources(HttpListener.class)
public class HttpListenerConfig {

  /**
   * Base path to use for all requests that reference this config.
   */
  @Parameter
  @Optional
  @Expression(NOT_SUPPORTED)
  private String basePath;

  public String getBasePath() {
    return basePath;
  }
}

@Configuration(name="requester") // <3>
@Operations(HttpRequester.class)
@ConnectionProviders(HttpRequesterConnection.class)
public class HttpRequesterConfig {


```

--------------------------------

TITLE: Example Mule Flows Using Data Transformation Operations
DESCRIPTION: Mule configuration defining two flows demonstrating the usage of custom module operations (`person-xml-to-json` and `person-json-to-xml`). Each flow first creates a sample payload (XML or JSON) using inline DataWeave within `<ee:transform>` and then calls the respective module operation, passing the payload as the `content` parameter.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/xml-sdk.adoc#_snippet_34

LANGUAGE: XML
CODE:
```
<mule ...>
  <flow name="person-xml-2-json-flow">
    <!-- create an XML Person and store it in the payload -->
    <ee:transform>
      <ee:set-payload><![CDATA[
        %dw 2.0
        %output application/xml
        ---
        person : {
          name : "Lautaro",
          lastName: "Fernandez",
          age : 54
        }
        ]]></ee:set-payload>
    </ee:transform>
    <!-- call the operation -->
    <module-hello:person-xml-to-json content="#[payload]"/>
    <!-- at this point, the payload is a JSON Person -->
  </flow>

  <flow name="person-json-2-xml-flow">
    <!-- create a JSON Person and store it in the payload -->
    <ee:transform>
      <ee:set-payload><![CDATA[
        %dw 2.0
        %output application/json
        ---
        {
          name : "Lautaro",
          lastName: "Fernandez",
          age : 54
        }
        ]]></ee:set-payload>
    </ee:transform>
    <!-- call the operation -->
    <module-hello:person-json-to-xml content="#[payload]"/>
    <!-- at this point, the payload is an XML Person -->
  </flow>
</mule>
```

--------------------------------

TITLE: Annotating a POJO for Global Element Definition in Java
DESCRIPTION: Demonstrates the use of @Alias and @TypeDsl(allowTopLevelDefinition = true) annotations on a Java class (LocalFileMatcher) to enable its definition as a top-level global element in the Mule DSL, along with example parameter definitions.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/define-parameters.adoc#_snippet_11

LANGUAGE: java
CODE:
```
@Alias("matcher")
@TypeDsl(allowTopLevelDefinition = true)
public class LocalFileMatcher {

/**
 * Files created before this date are rejected.
 */
@Parameter
@Summary("Files created before this date are rejected.")
@Optional
private LocalDateTime createdSince;

/**
 * Files created after this date are rejected
 */
@Parameter
@Summary("Files created after this date are rejected")
@Optional
private LocalDateTime createdUntil;
...
```

--------------------------------

TITLE: Implementing Multilevel ValueProvider in Mule SDK Java
DESCRIPTION: Provides an example implementation of a ValueProvider interface for multilevel values. It demonstrates how to use newValue and withChild to build a hierarchical set of values based on retrieved workspaces and channels.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/field-level-capabilities.adoc#_snippet_3

LANGUAGE: Java
CODE:
```
public class ChatMultiLevelValueProvider implements ValueProvider {

 @Connection
 private ChatConnection chatConnection;

 @Override
 public Set<Value> resolve() {
   Set<Value> values = new HashSet<>();
   List<String> workspaces = chatConnection.getWorkspaces();
   workspaces.stream().forEach(workspace -> {
     ValueBuilder valueBuilder = newValue(workspace);
     chatConnection.getChannels(workspace).stream().forEach(channel -> valueBuilder.withChild(newValue(channel)));
     values.add(valueBuilder.build());
   });
   return values;
 }

 @Override
 public String getId() {
   return "Chat multilevel value provider";
 }
}
```

--------------------------------

TITLE: Applying Same InputTypeResolver to Multiple Parameters
DESCRIPTION: This example illustrates an operation with multiple parameters that use the same @TypeResolver and @MetadataKeyId. This allows the operation to handle multiple inputs that conform to the same metadata structure, resolved based on a single key.

SOURCE: https://github.com/mulesoft/docs-mule-sdk/blob/latest/modules/ROOT/pages/metadata-input.adoc#_snippet_2

LANGUAGE: java
CODE:
```
  public void merge(@MetadataKeyId(EntityKeysResolver.class) String type,
                    @TypeResolver(InputEntityResolver.class) Map<String, Object> first,
                    @TypeResolver(InputEntityResolver.class) Map<String, Object> second){

    // Code that handles the merge based on the "type" of the "entity"
    if ("BookList_id".equals(type)){
      ((List)first.get("bookIds")).addAll((List) second.get("bookIds"));
    } else {
      //...
    }
  }
```