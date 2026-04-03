================
CODE SNIPPETS
================
TITLE: Define a Simple Hello World API Specification in RAML
DESCRIPTION: This RAML snippet defines a basic API specification for a 'hello world' service. It includes a title, version, description, a custom data type 'greeting', a GET endpoint '/greeting', and defines 200 and 404 responses with JSON bodies and examples.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/api-led-design.adoc#_snippet_0

LANGUAGE: RAML
CODE:
```
#%RAML 1.0
title: hello world
version: v1
description: A greeting for the world

types:
 greeting:
   properties:
     todays-greeting: string

/greeting:
     get:
       responses:
         200:
           body:
             application/json:
               type: greeting
               example:
                 {todays-greeting: "test-greeting"}
         404:
           body:
             application/json:
               properties:
                 message: string
               example: |
                 {
                   "message" : "Greeting not found"
                 }
```

--------------------------------

TITLE: Run MTF Tests Directly with Java 17 (Bash)
DESCRIPTION: Example bash script to execute MTF tests using Maven, explicitly setting the `MUNIT_JVM` to a Java 17 installation. This runs the tests directly on Java 17 to check for compatibility. Includes parameters to skip certain validations relevant to Java 17 testing.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_14

LANGUAGE: bash
CODE:
```
#!/bin/bash
RUNTIME_VERSION=4.6.0
MUNIT_JVM=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin/java
mvn clean
mkdir target
mvn verify \
   -DruntimeProduct=MULE_EE \
   -DruntimeVersion=$RUNTIME_VERSION \
   -Dmunit.jvm=$MUNIT_JVM \
   -Dmule.module.tweaking.validation.skip=true \
   -Dmule.jvm.version.extension.enforcement=LOOSE > ./target/test.log
```

--------------------------------

TITLE: Example CPU Limit Aggregation Calculation
DESCRIPTION: Illustrates how CPU limits are aggregated daily and monthly for applications in Runtime Fabric, considering redeployments and autoscaling events.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_27

LANGUAGE: APIDOC
CODE:
```
Here is an example with two apps:

App1 has a CPU limit of one each and a worker count range of 1 - 3.
App2 has a CPU limit of one each and a worker count range of 2 - 5.

Data captured at 00:00 minutes:
* App1: sum(1,1,1) = 3
* App2: sum(1,1,1,1,1) = 5
* Max metric captured = 8 CPU limit aggregated

Redeployment of App1 with a CPU limit of 2 and worker range of 1 - 6 at 00:45 minutes:
* App1: sum(1,1,1,2,2,2) = 9
* App2: sum(1,1,1,1,1) = 5

Time 01:00 min:
* App1: sum(2,2,2,2,2,2) = 12
* App2: sum(1,1,1,1,1) = 5
* Max metric captured = 17 CPU limit aggregated
* For the root organization in a given hour (not reported on the usage dashboard):
  Max concurrent limit CPU = 17
* For the root organization in a given day:
  Max concurrent limit CPU = 17
* For the root organization in a given month:
  Max concurrent limit CPU = 17

App2 auto scales down to three workers after 02:00 min:
* App1: sum(2,2,2,2,2,2) = 12
* App2: sum(1,1,1) = 3
* Max metric = 15 CPU limit aggregate
* For the root organization in a given hour (not reported on the usage dashboard):
  Max concurrent limit CPU = 15
* For the root organization in a given day:
  Max concurrent limit CPU = 17
* For the root organization in a given month:
  Max concurrent limit CPU = 17
```

--------------------------------

TITLE: Example Mule Flow with HTTP Listener Event Source
DESCRIPTION: Illustrates a Mule flow configuration in XML that includes an HTTP listener as its event source. This type of flow, containing an event source, counts towards Anypoint Platform package allotment when deployed and running.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_23

LANGUAGE: XML
CODE:
```
<flow name="test-flow" >
        <http:listener config-ref="cocheras-puerto-madero-api-httpListenerConfig" path="/daily-report"/>
         <logger level="INFO" message="#[output json --- attributes.queryParams]" />	
</flow>
```

--------------------------------

TITLE: API Documentation
DESCRIPTION: API documentation helps consumers understand and use the API. It includes content such as examples, use cases, and tutorials.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_11

LANGUAGE: APIDOC
CODE:
```
API documentation::
Helps consumers understand and use the API, with content such as examples, use cases, and tutorials.
```

--------------------------------

TITLE: Example Mule Flow for Code Modularization (Non-Billable)
DESCRIPTION: This Mule flow illustrates a non-billable scenario where a flow lacks an event source and is not used for APIkit routing. Such flows are primarily used for modularizing code within an application and do not count against your Anypoint Platform package allotment. The example shows a simple flow containing only a logger component.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_26

LANGUAGE: XML
CODE:
```
<flow name="just-logging">
        <logger level="INFO" message="#[output json --- attributes.queryParams]" />
</flow>
```

--------------------------------

TITLE: Non-Billable Logging Flow in XML
DESCRIPTION: This Mule flow serves as an example of a flow that does not have an event source and is not used for routing APIkit requests. Such flows are typically used for modularizing code and do not count against the Anypoint Platform package allotment. This specific example only contains a logger component.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/mule-runtime-metrics.adoc#_snippet_2

LANGUAGE: xml
CODE:
```
<flow name="just-logging">
        <logger level="INFO" message="#[output json --- attributes.queryParams]" />
</flow>
```

--------------------------------

TITLE: Run MTF Tests with Illegal Access Deny (Bash)
DESCRIPTION: Example bash script to execute MTF tests using Maven, specifically setting the `mtf.javaopts` system property to `--illegal-access=deny`. This forces the tests to fail on illegal reflective access, simulating Java 17 behavior when running on Java 11. Requires Maven and a specified Java 11 JVM.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_11

LANGUAGE: bash
CODE:
```
#!/bin/bash
RUNTIME_VERSION=4.6.0
MUNIT_JVM=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/bin/java
mvn clean
mkdir target 
mvn verify \
    -DruntimeProduct=MULE_EE \
    -DruntimeVersion=$RUNTIME_VERSION \
    -Dmunit.jvm=$MUNIT_JVM \
    -Dmtf.javaopts="--illegal-access=deny" > ./target/test.log
```

--------------------------------

TITLE: Mule Flow for APIkit GET /reservation Request Routing
DESCRIPTION: This Mule flow is automatically generated by APIkit to route HTTP GET requests for the `/reservation` path. It demonstrates how APIkit creates flows without an event source, specifically designed to handle API method and path routing. The flow includes a logger component to output query parameters.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_25

LANGUAGE: XML
CODE:
```
<flow name="get:\reservation:cocheras-puerto-madero-api-config">
        <logger level="INFO" message="#[output json --- attributes.queryParams]" />
</flow>
```

--------------------------------

TITLE: Routing APIkit GET Request in XML
DESCRIPTION: This Mule flow is automatically generated by APIkit based on an API specification. It is designed to handle incoming HTTP GET requests specifically for the `/reservation` path defined in the API. The flow logs the query parameters received in the request attributes.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/mule-runtime-metrics.adoc#_snippet_1

LANGUAGE: xml
CODE:
```
<flow name="get:\reservation:cocheras-puerto-madero-api-config">
        <logger level="INFO" message="#[output json --- attributes.queryParams]" />
</flow>
```

--------------------------------

TITLE: Sending GET Request to MuleSoft API Endpoint (XML)
DESCRIPTION: This snippet represents the HTTP GET request URL used to interact with the `/api/greeting` endpoint of the MuleSoft application running locally. It is used throughout the validation and debugging steps to test the API's response under different conditions, including successful validation and triggering validation errors.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/api-led-test.adoc#_snippet_0

LANGUAGE: XML
CODE:
```
http://localhost:8081/api/greeting
```

--------------------------------

TITLE: API Aspects
DESCRIPTION: API aspects are the individual parts that constitute an API. Examples include specifications, instances, catalog information, and documentation.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_7

LANGUAGE: APIDOC
CODE:
```
API aspects::
Parts of an API. Examples of API aspects include specifications, instances, catalog information, and documentation.
```

--------------------------------

TITLE: Test Rate Limit Policy with GET Request
DESCRIPTION: Send multiple GET requests to the API proxy endpoint using a REST client (like Advanced Rest Client) to test the configured rate limiting policy. Continue sending requests until a '429 Too Many Requests' response is received.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/api-led-deploy.adoc#_snippet_1

LANGUAGE: HTTP
CODE:
```
http://hello-world-greeting-proxy.us-e2.cloudhub.io/greeting
```

--------------------------------

TITLE: Testing Deployed API - HTTP Request
DESCRIPTION: This HTTP GET request is used to test the API successfully deployed to CloudHub. It targets the application's public URL followed by the API endpoint '/api/greeting'. A successful response indicates the API is running and accessible.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/api-led-deploy.adoc#_snippet_0

LANGUAGE: http
CODE:
```
GET http://hello-world-greeting.sandy-kim.us-e2.cloudhub.io/api/greeting
```

--------------------------------

TITLE: DataGraph: DataGraph orchestration
DESCRIPTION: An API request made by Anypoint DataGraph to the source APIs to get data for the GraphQL API request made to Anypoint DataGraph.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_11

LANGUAGE: APIDOC
CODE:
```
Reporting Status: Orchestrations are not currently aggregated on usage reports.
```

--------------------------------

TITLE: Mule Application Deployment Status (Console Output)
DESCRIPTION: This console output block shows the status message displayed in Anypoint Studio after successfully deploying the 'hello-world-app' to the embedded Mule runtime engine, indicating that the application is 'DEPLOYED'.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/api-led-develop.adoc#_snippet_0

LANGUAGE: Plain Text
CODE:
```
*******************************************************************************************************
*            - - + APPLICATION + - -            *       - - + DOMAIN + - -       * - - + STATUS + - - *
*******************************************************************************************************
* hello-world-app                                  * default                        * DEPLOYED           *
*******************************************************************************************************
```

--------------------------------

TITLE: Define Runtime Fabric Pricing Table - AsciiDoc
DESCRIPTION: Defines an AsciiDoc table listing different MuleSoft Runtime Fabric offering sizes (mule.nano, mule.micro, etc.) and their corresponding resource allocations including vCore size, total memory, heap memory, and storage.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/pricing.adoc#_snippet_0

LANGUAGE: asciidoc
CODE:
```
[%header,cols="5*a"]
|===
|Offering          | Equivalent vCore Size | Total Memory | Heap Memory | Storage
|mule.nano         | 0.05                  | 1 GB         | 0.5 GB      | 8 GB
|mule.micro        | 0.1                   | 1 GB         | 0.5 GB      | 8 GB
|mule.micro.mem    | 0.1                   | 2 GB         | 1 GB        | 8 GB
|mule.small        | 0.2                   | 2 GB         | 1 GB        | 8 GB
|mule.medium       | 0.5                   | 3 GB         | 1.5 GB      | 10 GB
|mule.medium.mem   | 0.5                   | 5 GB         | 2.5 GB      | 10 GB
|mule.large        | 1                     | 4 GB         | 2 GB        | 12 GB
|mule.large.mem    | 1                     | 8 GB         | 4 GB        | 12 GB
|mule.xlarge       | 2                     | 7 GB         | 3.5 GB      | 20 GB
|mule.xlarge.mem   | 2                     | 12 GB        | 6 GB        | 20 GB
|mule.2xlarge.mem  | 4                     | 15 GB        | 7.5 GB      | 20 GB
|===
```

--------------------------------

TITLE: API Manager: API instances
DESCRIPTION: API instances in production, preproduction, and unclassified APIs (not associated with an environment) that are managed by API Manager after they are created using add, promote, or import options.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_6

LANGUAGE: APIDOC
CODE:
```
Management Duration: API instances remain under management until they are deleted.
Aggregation Model: Max Concurrent model with three separate metrics for production, preproduction, and unclassified (APIs that aren't associated with an environment).
Note: Data for API Manager is available starting in October 2024.
```

--------------------------------

TITLE: Mule Event Sources and Corresponding Connectors
DESCRIPTION: Lists various Mule connectors and the specific event sources they provide. Flows containing these event sources are counted towards Anypoint Platform usage allotment.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_24

LANGUAGE: APIDOC
CODE:
```
Connector | Source
aggregators | aggregator-listener
amqp | listener
apikit-odata | request-entity-collection-listener | request-entity-listener
as2-mule4 | as2-listener | as2-mdn-listener | non-repudiation-listener
azure-service-bus-messaging | message-listener
core | scheduler
db | listener
email | listener-imap | listener-pop3
file | listener
ftp | listener
ftps | listener
google-sheets | new-row-listener | new-spreadsheet-listener | updated-row-listener
http | listener
ibm-mq| listener
jms | listener
kafka | batch-message-listener | message-listener
mllp | mllp-listener
netsuite | deleted-object-listener | modified-object-listener | modified-record-listener | new-record-listener
pubsub | message-listener
```

--------------------------------

TITLE: Mule Flow with HTTP Listener Event Source (XML)
DESCRIPTION: This XML snippet defines a Mule flow named 'test-flow'. It demonstrates a billable flow scenario where an 'http:listener' is used as the event source, making the flow count towards the Anypoint Platform allotment. The flow also includes a logger component to output query parameters.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/mule-runtime-metrics.adoc#_snippet_0

LANGUAGE: xml
CODE:
```
<flow name="test-flow" >
        <http:listener config-ref="cocheras-puerto-madero-api-httpListenerConfig" path="/daily-report"/>
         <logger level="INFO" message="#[output json --- attributes.queryParams]" />	
</flow>
```

--------------------------------

TITLE: Mule Runtime Usage Data Capture Overview
DESCRIPTION: Provides a comprehensive overview of how MuleSoft captures usage data for Mule flows, Mule messages (triggered by event sources), and data throughput (network I/O bytes), detailing the metering and aggregation processes for daily and monthly reports.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_19

LANGUAGE: APIDOC
CODE:
```
MuleSoft captures usage data for Mule flows, Mule messages, and data throughput, but not all of this data is aggregated in usage reports.  

To track Mule message usage, the runtime report counts the number of times a Mule event source triggers a Mule message. You can view the number of these messages in a given day or month by business group, environment, and application. 

To calculate usage, MuleSoft meters and aggregates the number of messages daily and monthly. After a message is triggered, the report doesn't track changes to the message because the message is processed within the application’s flows.

Data throughput is the total network I/O bytes produced by the infrastructure of the Mule runtime engine running the Mule application. 

To calculate usage, MuleSoft tracks usage and aggregates the total daily and monthly GBs.

For some customers in the US control plane, MuleSoft offers a pricing and packaging model for Anypoint Platform that allots a number of Mule flows, Mule messages, and data throughput (measured as network I/O bytes). Not all types of Mule flows and messages count toward the allotments in a package.
```

--------------------------------

TITLE: Configuring MUnit Maven Plugin for Java 17 Compatibility (XML)
DESCRIPTION: This XML snippet shows the configuration for the `munit-maven-plugin` in a Mule application's pom.xml file. It includes settings for running tests, generating coverage reports, and specifying the runtime version and dynamic ports, essential for testing Java 17 compatibility.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_15

LANGUAGE: XML
CODE:
```
	<plugin>
		<groupId>com.mulesoft.munit.tools</groupId>
		<artifactId>munit-maven-plugin</artifactId>
		<version>${munit.version}</version>
		<executions>
			<execution>
				<id>test</id>
				<phase>test</phase>
				<goals>
					<goal>test</goal>
					<goal>coverage-report</goal>
				</goals>
			</execution>
		</executions>
		<configuration>
			<coverage>
				<runCoverage>true</runCoverage>
				<formats>
					<format>html</format>
				</formats>
			</coverage>
			<runtimeVersion>${app.runtime}</runtimeVersion>
			<dynamicPorts>
				<dynamicPort>http.port</dynamicPort>
			</dynamicPorts>
		</configuration>
	</plugin>
```

--------------------------------

TITLE: Running MUnit Tests with Specific Versions (Bash)
DESCRIPTION: This Bash command executes the Maven test phase for a Mule project. It specifies the pom.xml and settings.xml files, and overrides properties like `app.runtime`, `munit.version`, and `mule.maven.plugin.version` to test compatibility with specific Java 17-compatible versions.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_16

LANGUAGE: Bash
CODE:
```
mvn -f pom.xml -s ~/.m2/settings.xml -Dapp.runtime=4.6.0 -Dmunit.version=3.1.0 -Dmule.maven.plugin.version=4.1.0 -fae test
```

--------------------------------

TITLE: Mule Application Details Fields
DESCRIPTION: Provides a comprehensive list of fields available under the Application Details tab, describing various aspects of a deployed Mule application. These fields offer insights into deployment type, resource allocation, and usage metrics.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_22

LANGUAGE: APIDOC
CODE:
```
Application: Name of the Mule application
Business Group: Business group that owns the resources. For Runtime Fabric, it's the business group used when creating the Runtime Fabric instance.
Deployment Type: Runtime plane the Mule app is deployed to: CloudHub (abbreviated as CH), CloudHub 2.0 (abbreviated as CH2), or Runtime Fabric (abbreviated as RTF)
Environment Type: Preproduction (sandbox) or production environment the Mule app is deployed to.
Cluster: The Runtime Fabric instance that contains the nodes and applications
CPU Limit (Millicores): Maximum amount of CPU allocated by the user that the application can burst to within the shared cluster or Runtime Fabric instance
CPU Reserve (Millicores): Amount of CPU allocated by the user to reserve for applications within the Runtime Fabric cluster or instance
Mule Flows: Total number of flows in the Mule app, calculated by multiplying flows by the number of workers (CloudHub) or replicas (CloudHub 2.0 and Runtime Fabric)
Mule Messages: Total number of inbound and outbound Mule messages in the Mule app
Data Throughput (GB): Total amount of inbound and outbound data in gigabytes (GB) transmitted by the Mule app
```

--------------------------------

TITLE: Configure MUnit Extension Plugin for JVM Options (XML)
DESCRIPTION: Configures the `munit-extensions-maven-plugin` in the `pom.xml` to include the `_JAVA_OPTIONS` environment variable. This variable incorporates the `mtf.javaopts` property, allowing JVM parameters like `--illegal-access=deny` to be passed to the MUnit JVM.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_10

LANGUAGE: xml
CODE:
```
<environmentVariables>
   <!-- Toggles the JDK17 style flag -->
   <_JAVA_OPTIONS>-XX:+PrintCommandLineFlags ${mtf.javaopts}</_JAVA_OPTIONS>
</environmentVariables>
```

--------------------------------

TITLE: Intelligent Document Processing (IDP) Document Pages Concept
DESCRIPTION: Explains the concept of 'Document Pages' within Intelligent Document Processing (IDP), clarifying that each page in a multi-page document is counted individually and that RPA executions also contribute to this count, consuming RPA Bot Minutes.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_12

LANGUAGE: APIDOC
CODE:
```
Intelligent Document Processing (IDP) Document Pages: A single page processed by IDP
IDP document actions might process documents that have more than one page, with each page counting separately. When RPA executes document actions, it also counts towards document pages and additionally consumes the corresponding RPA Bot Minutes, accounting for the time the RPA process runs.
```

--------------------------------

TITLE: Flex Gateway Usage Report Metrics
DESCRIPTION: Indicates that Flex Gateway usage reports provide metrics in both table and card formats, with the specific data definitions referenced from external partial files.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_17

LANGUAGE: APIDOC
CODE:
```
Metrics for Flex Gateway are available in tables and cards, as defined in external partial files:
- include::partial$flex-gateway-metrics.adoc[tag=table]
- include::partial$flex-gateway-metrics.adoc[tag=cards]
```

--------------------------------

TITLE: API Experience Hub Usage Report Metrics
DESCRIPTION: Indicates that API Experience Hub usage reports present metrics in both table and card formats, with the detailed data definitions sourced from external partial files.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_14

LANGUAGE: APIDOC
CODE:
```
Metrics for API Experience Hub are available in tables and cards, as defined in external partial files:
- include::partial$api-eh-metrics.adoc[tag=table]
- include::partial$api-eh-metrics.adoc[tag=cards]
```

--------------------------------

TITLE: Composer: Composer task
DESCRIPTION: Any action executed on a Composer connector, including but not limited to read, create, update, and delete.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_9

LANGUAGE: APIDOC
CODE:
```
Aggregation Model: Total of all actions during a month.
```

--------------------------------

TITLE: Runtime Fabric Cluster Capacity Details
DESCRIPTION: Describes key metrics related to Runtime Fabric cluster capacity, including the cluster name and allocatable CPU capacity. This information is relevant for understanding resource allocation within a Runtime Fabric instance.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_21

LANGUAGE: APIDOC
CODE:
```
Cluster: Name of the cluster or Runtime Fabric instance containing the applications, workers, and nodes.
Cluster Capacity (Millicores): Allocatable CPU capacity of each node within the Runtime Fabric instance.
```

--------------------------------

TITLE: RPA: Robotic Process Automation (“RPA”) bot minutes
DESCRIPTION: The number of minutes running process automations across all bot sessions.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_10

LANGUAGE: APIDOC
CODE:
```
Parallel Sessions: A single bot can run multiple parallel sessions, with RPA bot minutes counting for each parallel session.
Multiple Bots: You can configure multiple bots to run the same process, with RPA bot minutes counting for each of these separate bot sessions.
Test Runs: Test runs or process runs in the test phase are also counted towards RPA bot minutes.
```

--------------------------------

TITLE: Intelligent Document Processing (IDP) Usage Report Metrics
DESCRIPTION: Lists the key metrics available in IDP usage reports, including Business Group, Action ID, Action Version, Execution Type, and Processed Pages, providing detailed insights into document processing activities.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_18

LANGUAGE: APIDOC
CODE:
```
Business Group::
  Business group the document is processed in

Action ID::
  ID associated with the processed action

Action Version::
  Version associated with the processed action

Execution Type::
  Execution types associated with the processed action

Processed Pages::
  Total pages processed
```

--------------------------------

TITLE: Configure MUnit Plugin Minimum Runtime Version (XML)
DESCRIPTION: Configures the `munit-plugin` in the `pom.xml` to specify a minimum Mule runtime version (`minMuleVersion`). This ensures that the MTF tests only validate against supported runtime versions (4.3.0 and later for MUnit 3.1), preventing compatibility issues with older runtimes.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_13

LANGUAGE: xml
CODE:
```
<configuration>
	[...]
<runtimeConfiguration>
    <discoverRuntimes>
        <minMuleVersion>${minVersion}</minMuleVersion>
        <includeSnapshots>false</includeSnapshots>
        <product>EE</product>
    </discoverRuntimes>
</runtimeConfiguration>
</configuration>
```

--------------------------------

TITLE: Add mtf.javaopts Property (XML)
DESCRIPTION: Adds an empty `mtf.javaopts` property to the `pom.xml` file, which will be used later to pass JVM options to the MTF tests. This is a prerequisite for configuring illegal reflective access checks.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_9

LANGUAGE: xml
CODE:
```
<mtf.javaopts></mtf.javaopts>
```

--------------------------------

TITLE: Mule Runtime Java Support Timeline
DESCRIPTION: This table outlines the Java versions supported by different Mule Runtime versions, indicating the transition from Java 8/11 to Java 17 LTS and highlighting end-of-standard-support dates for older Java versions.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/java-support.adoc#_snippet_0

LANGUAGE: APIDOC
CODE:
```
Mule Runtime Java Support:
| Mule Version | Java Version
| 4.9 LTS      | 17
| 4.9 Edge     | 17
| 4.8 Edge     | 8, 11, and 17
| 4.7 Edge     | 8, 11, and 17
| 4.6 LTS      | 8, 11, and 17
| 4.6 Edge     | 8, 11, and 17
| 4.5 Edge     | 8 and 11

Note: Standard support for Java 8 and 11 ends in March 2025 for Mule 4.8 Edge and February 2026 for 4.6 LTS.
```

--------------------------------

TITLE: API Implementation
DESCRIPTION: An API implementation is the realization of an API specification, making the API functional and operational.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_9

LANGUAGE: APIDOC
CODE:
```
API implementation::
A realization of the API specification to make the API functional.
```

--------------------------------

TITLE: API Instance
DESCRIPTION: An API instance is an instantiation of the API implementation. An API can have multiple instances across different environments and gateways, which clients use to make API calls. Instances can be either a proxy serving the upstream or an application endpoint.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_10

LANGUAGE: APIDOC
CODE:
```
API instance::
An instantiation of the API implementation. An API can have multiple instances across different environments and gateways, which can be used by clients to make API calls. Instances that are configured but not deployed are also captured as part of this aspect.
+
An instance can be either a proxy of an API that serves the upstream or an application endpoint.
```

--------------------------------

TITLE: Run JDeps Maven Plugin Without Tests (Bash)
DESCRIPTION: Use this Maven command to execute the JDeps Maven plugin analysis without running the full test suite. This is useful for quickly checking for JDK internal API usage specifically, separate from other test phases.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_8

LANGUAGE: bash
CODE:
```
mvn clean install -Dtest=none -DfailIfNoTests=false -DskipTests=true
```

--------------------------------

TITLE: Mule Runtime: Mule message
DESCRIPTION: Container of the core information processed by the runtime.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_1

LANGUAGE: APIDOC
CODE:
```
Unit Count: A Mule message counts as a single unit when an event source triggers it.
Aggregation Model: Total of all messages sent during a month.
```

--------------------------------

TITLE: Anypoint MQ Usage Report Metrics
DESCRIPTION: Details the various metrics reported for Anypoint MQ usage, including business group, environment, region, object type, object name, message units, message bytes, API requests, and messages received, along with their aggregated totals.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_13

LANGUAGE: APIDOC
CODE:
```
Business Group::
  Business group that owns the resources where the app with the queue is deployed
Environment::
  Environment within the business group where the app with the queue is deployed
Region id:: 
  Region where the app with the queue is deployed
Object type::
  Queue or message exchange
Object name::
  Name of the queue or message exchange
Message units::
  Number of encoded characters in a message, used to determine the size of message data in the response for rate limiting (not billing)
Messages bytes::
  Size of the message data in the response, based on message units
API requests::
  Number of API calls via the connector or API, used to calculate monthly quota for billing
Messages received::
  Number of messages received
Total Message units::
  Sum of message units across all queues in the organization
Total Messages bytes::
  Sum of message data across all queues in the organization
Total API requests::
  Sum of API calls across all queues in the organization
Total Messages received::
  Sum of messages received across all queues in the organization
```

--------------------------------

TITLE: Add JavaVersionSupport Annotation (Manual Configuration)
DESCRIPTION: If you manually created your connector's configuration class using the REST SDK override feature, add the @JavaVersionSupport annotation to declare explicit support for Java 8, 11, and 17 when upgrading to REST SDK 0.8.0-RC4.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/partner-connector-upgrade.adoc#_snippet_1

LANGUAGE: java
CODE:
```
import org.mule.sdk.api.annotation.JavaVersionSupport;
import org.mule.sdk.api.meta.JavaVersion;

@JavaVersionSupport({JavaVersion.JAVA_8, JavaVersion.JAVA_11, JavaVersion.JAVA_17})

public class YourConnectorConfiguration
```

--------------------------------

TITLE: Draft Profiles
DESCRIPTION: Draft profiles allow users to test governance settings before revealing their targeted APIs' conformance information across Anypoint Platform. APIs targeted by draft profiles are governed, but their conformance information is not shown outside the draft profile view unless also targeted by an active profile.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_2

LANGUAGE: APIDOC
CODE:
```
draft profiles::
Use draft profiles to test settings before revealing their targeted APIs' conformance information across Anypoint Platform. APIs targeted by draft profiles are governed, but their conformance information isn't shown outside of the draft profile view unless they're also targeted by an active profile.
```

--------------------------------

TITLE: Flex Gateway: Flex Gateway API call
DESCRIPTION: Any access request received by Anypoint Flex Gateway regardless of whether the response to the request is successful.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_8

LANGUAGE: APIDOC
CODE:
```
Aggregation Model: Total of all requests during a month.
```

--------------------------------

TITLE: Defining MySQL Connection Provider in Java
DESCRIPTION: This Java code defines a class that implements the ConnectionProvider interface, specifically for a MySQL database connection. It includes configuration properties required for the JDBC driver.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_2

LANGUAGE: Java
CODE:
```
description = "A JDBC driver that supports connection to the MySQL Database",
nameRegexpMatcher = "(.*)\\.jar",
requiredClassName = "com.mysql.jdbc.Driver",
coordinates = "mysql:mysql-connector-java:5.1.44")
public class MySqlConnectionProvider implements ConnectionProvider<Connection> {
  //
}
```

--------------------------------

TITLE: API (Entire)
DESCRIPTION: This term refers to the entire API, encompassing all its aspects. In Anypoint Platform, the meaning of 'API' can vary depending on the product context, such as referring to the specification, documentation, and catalog in Exchange, or just the specification in API Designer.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_6

LANGUAGE: APIDOC
CODE:
```
API::
The entire API, including all its aspects. In Anypoint Platform, aspects of an API might also be called just API in context with the product that is managing them. For example, in Exchange, API might refer to the API specification, documentation, and catalog. In API Designer, API might refer to the API specification. In API Catalog, API might refer to the API instance, policies, and contracts.
```

--------------------------------

TITLE: Active Profiles
DESCRIPTION: Active profiles are used to share API conformance information with developers and notify them of conformance issues. APIs targeted by active profiles are governed, and their conformance information is displayed across Anypoint Platform.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_1

LANGUAGE: APIDOC
CODE:
```
active profiles::
Use active profiles to share API conformance information with developers and notify them of conformance issues. APIs targeted by active profiles are governed APIs and their conformance information is shown across Anypoint Platform.
```

--------------------------------

TITLE: Mule Runtime Usage Report: Business Group Details Table Fields
DESCRIPTION: Describes the specific fields displayed in the 'Business Group Details' tab of Mule Runtime usage reports, including 'Business Group' (identifying the resource owner) and 'Environment Type' (indicating the associated environment).

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_20

LANGUAGE: APIDOC
CODE:
```
[%header%autowidth.spread]
|===
|Field | Description

|Business Group |Business group that owns the resources. For Runtime Fabric, it's the business group used when creating the Runtime Fabric instance.

|Environment Type a|Environment the resources are associated with. 
```

--------------------------------

TITLE: Filter Illegal Access Log (Bash)
DESCRIPTION: Bash command to process the `target/illegal-access.log` file generated by the previous test run. It sorts, finds unique lines, and filters out known warnings from Mule internal modules to help identify issues specific to the custom connector.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_12

LANGUAGE: bash
CODE:
```
cat target/illegal-access.log | sort | uniq | grep -Ev "org.mule.module.artifact|org.mule.metadata|org.mule.runtime|org.mule.service"
```

--------------------------------

TITLE: API Governance: API under Governance
DESCRIPTION: APIs identified by the selection criteria of at least one of the governance profiles.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_7

LANGUAGE: APIDOC
CODE:
```
Versioning: If an API is governed, all versions of that API are considered one governed API.
Aggregation Model: Max Concurrent model.
Usage Calculation: The usage for a month is the highest number of APIs governed in a single given hour during a month.
```

--------------------------------

TITLE: API Manager Usage Report Metrics
DESCRIPTION: Outlines the 'Maximum Number of Managed APIs' metric for API Manager usage reports, encompassing API instances in production, preproduction, and unclassified states. Notes that data availability begins in October 2024.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_16

LANGUAGE: APIDOC
CODE:
```
include::partial$apim-metrics.adoc[tag=table]

Maximum Number of Managed APIs::
  API instances in production, preproduction, and unclassified APIs (not associated with an environment)
```

--------------------------------

TITLE: Mule Runtime: Data throughput
DESCRIPTION: Total amount of data transferred in and out of the infrastructure that runs Mule where the Mule app is deployed.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_2

LANGUAGE: APIDOC
CODE:
```
Counting Criteria: Data throughput counts when the deployed application transfers data to execute its business logic, including but not limited to internal operational network traffic for monitoring, logs, and health checks.
Aggregation Model: Sum of all bytes during a month.
```

--------------------------------

TITLE: Mule Runtime: Mule flow
DESCRIPTION: Flow within a deployed and running Mule app that contains a Mule event source or route APIKit request.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_0

LANGUAGE: APIDOC
CODE:
```
Aggregation Model: Max Concurrent
Usage Calculation: The usage for a month is the highest number of flows that exist in a single given hour during a month.
```

--------------------------------

TITLE: Configuring External Library with @ExternalLib (Java)
DESCRIPTION: Illustrates the use of the @ExternalLib annotation to declare an external third-party library, such as a JDBC driver, that is not bundled with the custom connector. This configuration helps Mule Runtime manage the external dependency.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_1

LANGUAGE: java
CODE:
```
@ExternalLib(name = "MySQL JDBC Driver",
```

--------------------------------

TITLE: API Conformance
DESCRIPTION: API conformance indicates whether a validated API passes all required rules in one or more governance rulesets. If multiple profiles target an API, it must pass all rulesets in all profiles to be conformant. This applies only to supported API types like REST API and AsyncAPI.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_5

LANGUAGE: APIDOC
CODE:
```
API conformance::
API conformance indicates whether a validated API passes all of the required rules in one or more governance rulesets. If multiple profiles target an API, the API must pass all of the rulesets in all of those profiles to be conformant.
+
API conformance applies only to API types supported by API Governance, such as REST API and AsyncAPI.
```

--------------------------------

TITLE: Skip Java Version Enforcement Check (Bash)
DESCRIPTION: Pass this argument when running a quick check on your custom connector or if all dependencies are not ready. It skips the hard checks on the Java support declaration, allowing the test run to proceed even if compatibility isn't fully declared.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_5

LANGUAGE: bash
CODE:
```
-M-Dmule.jvm.version.extension.enforcement=LOOSE
```

--------------------------------

TITLE: Add JDeps Maven Plugin Configuration (Maven XML)
DESCRIPTION: Add this plugin configuration to your custom connector’s pom.xml file. The JDeps Maven plugin uses the JDeps tool to analyze your code for usage of JDK internal APIs, which might be removed or inaccessible in Java 17. The configuration is set to fail the build if such usage is detected.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_7

LANGUAGE: xml
CODE:
```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-jdeps-plugin</artifactId>
    <version>3.1.2</version>
    <executions>
        <execution>
            <goals>
               <goal>jdkinternals</goal> <!-- verify main classes -->
               <goal>test-jdkinternals</goal> <!-- verify test classes -->
            </goals>
        </execution>
    </executions>
    <configuration>
        <failOnWarning>true</failOnWarning>
    </configuration>
</plugin>
```

--------------------------------

TITLE: Mule Runtime: Cluster capacity
DESCRIPTION: A set of workers or nodes that act as a single deployment target for a given Runtime Fabric instance.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_3

LANGUAGE: APIDOC
CODE:
```
Metric: Allocatable CPU capacity of each node within the Runtime Fabric instance.
```

--------------------------------

TITLE: Configure JaCoCo Agent for MTF Coverage (Maven XML)
DESCRIPTION: Update the munit-extensions-maven-plugin configuration in your custom connector's pom.xml file. This configuration includes the JaCoCo agent, which is necessary to generate a code coverage report when running tests with the Module Testing Framework (MTF). Ensure your jacoco.version property is 0.8.10 or later.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_6

LANGUAGE: xml
CODE:
```
<argLines>
         <argLine>                      -javaagent:${settings.localRepository}/org/jacoco/org.jacoco.agent/${jacoco.version}/org.jacoco.agent-${jacoco.version}-runtime.jar=destfile=${session.executionRootDirectory}/target/jacoco-munit.exec</argLine>
</argLines>
```

--------------------------------

TITLE: Add Mule SDK API Dependency (XML)
DESCRIPTION: Add or upgrade the `mule-sdk-api` dependency in your custom connector's `pom.xml` to generate metadata for Java compatibility, specifically for Java 17 support.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_3

LANGUAGE: xml
CODE:
```
<dependency>
   <groupId>org.mule.sdk</groupId>
   <artifactId>mule-sdk-api</artifactId>
   <version>0.10.1</version>
</dependency>
```

--------------------------------

TITLE: Mule Runtime: CPU Reserve (Millicores)
DESCRIPTION: A guaranteed minimum amount of CPU resources allocated to a worker node in the Runtime Fabric instance.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_5

LANGUAGE: APIDOC
CODE:
```
Aggregation Method: CPU reserve is aggregated by calculating the total amount of CPU resources allocated by the user to reserve for applications within the cluster or Runtime Fabric instance.
```

--------------------------------

TITLE: Upgrade REST SDK Maven Dependencies (Existing Connector)
DESCRIPTION: Update the parent POM and specific REST SDK dependency versions in your connector's pom.xml file to 0.8.0-RC4. This step is necessary to make an existing REST SDK connector compatible with Java 17.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/partner-connector-upgrade.adoc#_snippet_0

LANGUAGE: xml
CODE:
```
<parent>
   <groupId>com.mulesoft.connectivity</groupId>
   <artifactId>rest-sdk-connector-parent-pom</artifactId>
   <version>0.8.0-RC4</version>
</parent>

<rest.sdk.commons.version>0.8.0-RC4</rest.sdk.commons.version>
<rest.sdk.mojo.version>0.8.0-RC4</rest.sdk.mojo.version>
```

--------------------------------

TITLE: Upgrade REST SDK Maven Dependencies (New Connector)
DESCRIPTION: Update the parent POM and specific REST SDK dependency versions in the pom.xml file to 0.8.0-RC4 when generating a new REST SDK connector. This ensures the new connector is built with Java 17 compatibility.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/partner-connector-upgrade.adoc#_snippet_2

LANGUAGE: xml
CODE:
```
<parent>
   <groupId>com.mulesoft.connectivity</groupId>
   <artifactId>rest-sdk-connector-parent-pom</artifactId>
   <version>0.8.0-RC4</version>
</parent>

<rest.sdk.commons.version>0.8.0-RC4</rest.sdk.commons.version>
<rest.sdk.mojo.version>0.8.0-RC4</rest.sdk.mojo.version>
```

--------------------------------

TITLE: API Specification
DESCRIPTION: An API specification details the functional and expected behavior of an API, along with its fundamental design philosophy and supported data types. It combines documentation and API definitions to create a contract readable by both people and software.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_8

LANGUAGE: APIDOC
CODE:
```
API specification::
Details the functional and expected behavior of an API, as well as the fundamental design philosophy and supported data types. It contains both documentation and API definitions to create a contract that people and software can read.
```

--------------------------------

TITLE: Adding Java EE BOM Dependency to Maven POM (Java)
DESCRIPTION: Demonstrates how to add the mule-javaee-runtime-bom dependency to the pom.xml using dependencyManagement. This is required for handling Java EE libraries in Mule 4.6.x and later versions, ensuring proper dependency management and avoiding conflicts.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_0

LANGUAGE: java
CODE:
```
<properties>
 <muleJavaEeBomVersion>4.6.0</muleJavaEeBomVersion>
</properties>
<dependencyManagement>
 <dependencies>
   <dependency>
     <groupId>org.mule</groupId>
     <artifactId>mule-javaee-runtime-bom</artifactId>
     <version>${muleJavaEeBomVersion}</version>
     <type>pom</type>
     <scope>import</scope>
   </dependency>
 </dependencies>
</dependencyManagement>
```

--------------------------------

TITLE: API Governance Usage Report Metrics
DESCRIPTION: Describes the 'Maximum Number of Governed APIs' metric in API Governance usage reports, which represents the peak number of APIs governed in any single hour during a month.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_15

LANGUAGE: APIDOC
CODE:
```
Maximum Number of Governed APIs::
  Highest number of APIs governed in a single given hour during a month
```

--------------------------------

TITLE: Add JavaVersionSupport Annotation (Java)
DESCRIPTION: Add the `@JavaVersionSupport` annotation to the main extension class (annotated with `@Extension`) in your Java SDK-based custom connector to declare compatibility with specific Java versions, such as Java 8, 11, and 17.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/partner-and-customer-guide.adoc#_snippet_4

LANGUAGE: java
CODE:
```
@Extension(name = "Database")
@Operations(...)
@JavaVersionSupport({JAVA_8, JAVA_11, JAVA_17})
public class DatabaseConnector {
..
}
```

--------------------------------

TITLE: Governance Profiles
DESCRIPTION: A governance profile applies selected governance rulesets to a filtered group of APIs. API Governance then validates these APIs against the rulesets to determine their conformance.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_0

LANGUAGE: APIDOC
CODE:
```
governance profiles::
A governance profile applies selected governance rulesets to a filtered group of APIs. API Governance then validates the APIs
against the rulesets to determine governance conformance.
```

--------------------------------

TITLE: API Catalog Information
DESCRIPTION: API catalog information refers to properties related to an API's entry in an API catalog. This includes details such as the API's name, version, owner (contact), tags, and categories.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_12

LANGUAGE: APIDOC
CODE:
```
API catalog information::
Properties related to an API's entry in an API catalog, such as name, version, owner (contact), tags, and categories.
```

--------------------------------

TITLE: Mule Runtime: CPU Limit (Millicores)
DESCRIPTION: Maximum amount of CPU resources a worker node in Runtime Fabric can use.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/usage-metrics.adoc#_snippet_4

LANGUAGE: APIDOC
CODE:
```
Aggregation Period: The amount of CPU usage is aggregated over a specific period of time, such as an hour or a day.
Summary Hierarchy: The CPU limit configuration of each application is summarized at each environment ID, then at each business group, and then at the root organization ID for preproduction (sandbox) and production environment types separately.
```

--------------------------------

TITLE: Governance Rulesets
DESCRIPTION: Governance rulesets are collections of rules or guidelines applied over metadata extracted from APIs in Anypoint Platform. They help enforce internal best practices, naming conventions, and industry-specific government standards like HTTPS for sensitive data.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_3

LANGUAGE: APIDOC
CODE:
```
governance rulesets::
Governance rulesets are collections of rules, or guidelines, that can be applied over the metadata extracted from APIs in Anypoint Platform. Examples of things you can use governance rulesets to help enforce are:
+
--
* Internal and external best
practice guidelines, such as naming conventions
* Industry-specific government standards, such as encryption for  sensitive API data (HTTPS)
--
+
MuleSoft provides several rulesets in Exchange, such as Anypoint API Best Practices, OpenAPI Best Practices, Authentication Security Best Practices, and Mule API Management Best Practices. Discover rulesets in Exchange by filtering the search by the *Rulesets* type. See xref:exchange::to-find-info.adoc[Search for Assets].
```

--------------------------------

TITLE: Governed APIs
DESCRIPTION: APIs are considered governed if they are identified by the selection criteria of at least one governance profile. All versions of such an API are treated as one governed API, with subscription limits based on purchased capacity.

SOURCE: https://github.com/mulesoft/docs-general/blob/latest/modules/ROOT/pages/_partials/api-gov-concepts.adoc#_snippet_4

LANGUAGE: APIDOC
CODE:
```
governed APIs::
APIs are governed if they're identified by the selection criteria of at least one governance profile. If an API is governed, all versions of that API are considered one governed API. Subscription limits are set based on your organization's purchased capacity. The UI gives information about usage and shows alerts when you near or exceed your subscription capacity.
```