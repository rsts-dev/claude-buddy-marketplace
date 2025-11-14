================
CODE SNIPPETS
================
TITLE: Mule Application Structure Example
DESCRIPTION: This snippet illustrates a basic Mule application structure for integrating with Microsoft Dynamics 365, showing how to configure the connector and define operations.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/microsoft-dynamics-365/2.3/modules/ROOT/pages/index.adoc#_snippet_5

LANGUAGE: Mule
CODE:
```
%dw 2.0
output application/json
---
{
  // Mule flow definition would go here
  // Example: Using the Dynamics 365 connector
  // <dynamics365:config name="Dynamics_365_Config" ... />
  // <dynamics365:get-entity config-ref="Dynamics_365_Config" entityName="account" doc:name="Get Account"/>
}
```

--------------------------------

TITLE: Google BigQuery Connector Configuration
DESCRIPTION: Guides users through configuring the Google BigQuery Connector, including creating property files, setting up global elements for connections (JWT or OAuth2), and enabling HTTPS. This section covers essential setup steps for using the connector within Mule applications.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/google-bigquery/1.1/modules/ROOT/pages/google-bigquery-connector-examples.adoc#_snippet_0

LANGUAGE: APIDOC
CODE:
```
Connector Setup:

Prerequisites:
- Java 8 or 11
- Anypoint Studio 7.5 and later
- Mule runtime engine (Mule) 4.3.0 and later
- DataWeave
- OAuth credentials for the Google API

Configuration Steps:
1. Create a configuration file (e.g., `mule-app.properties`) in `/src/main/resources/` with connection properties like `config.consumerKey` and `config.consumerSecret`.
2. Configure the Google BigQuery Connector global element in Anypoint Studio:
   - Search for 'google bigquery' in Exchange and add the connector.
   - Go to Global Elements, click Create, select 'Google BigQuery Config'.
   - Enter JWT or OAuth2 credentials.
   - Use 'Test Connection' to verify connectivity.
3. Configure HTTPS Listener:
   - Open HTTPS Listener config in Global Element Configuration.
   - Go to the TLS tab, select TLS Configuration > Edit inline.
   - Specify Key Store Configuration for HTTPS.
4. Configure a global element for the properties file:
   - Go to Global Elements, click Create.
   - Select 'Configuration properties', enter `mule.app.properties` in the File field.
```

--------------------------------

TITLE: Mule Application Startup Log Example
DESCRIPTION: An example of the console output when a Mule application starts successfully, indicating deployment status.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/sap-successfactors/4.0/modules/ROOT/pages/sap-successfactors-connector-studio.adoc#_snippet_6

LANGUAGE: text
CODE:
```
************************************************************
INFO  2019-07-14 22:12:42,003 [main] org.mule.module.launcher.DeploymentDirectoryWatcher:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Mule is up and kicking (every 5000ms)                    +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
INFO  2019-07-14 22:12:42,006 [main] org.mule.module.launcher.StartupSummaryDeploymentListener:
**********************************************************
*  - - + DOMAIN + - -               * - - + STATUS + - - *
**********************************************************
* default                           * DEPLOYED           *
**********************************************************

************************************************************************
* - - + APPLICATION + - -   * - - + DOMAIN + - -  * - - + STATUS + - - *
************************************************************************
* myapp                     * default             * DEPLOYED           *
************************************************************************
```

--------------------------------

TITLE: Mule XML Example for Insert Job
DESCRIPTION: Complete Mule XML configuration for an example flow that inserts a job. This includes secure properties, HTTP configurations, and the BigQuery connector setup.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/google-bigquery/1.0/modules/ROOT/pages/google-bigquery-connector-examples.adoc#_snippet_5

LANGUAGE: xml
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>

<mule xmlns:ee="http://www.mulesoft.org/schema/mule/ee/core"
	  xmlns:os="http://www.mulesoft.org/schema/mule/os"
	  xmlns:http="http://www.mulesoft.org/schema/mule/http"
	  xmlns:bigquery="http://www.mulesoft.org/schema/mule/bigquery"
	  xmlns="http://www.mulesoft.org/schema/mule/core"
	  xmlns:doc="http://www.mulesoft.org/schema/mule/documentation"
	  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	  xmlns:secure-properties="http://www.mulesoft.org/schema/mule/secure-properties"
	  xsi:schemaLocation="
http://www.mulesoft.org/schema/mule/ee/core http://www.mulesoft.org/schema/mule/ee/core/current/mule-ee.xsd http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/bigquery http://www.mulesoft.org/schema/mule/bigquery/current/mule-bigquery.xsd
http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd
http://www.mulesoft.org/schema/mule/os http://www.mulesoft.org/schema/mule/os/current/mule-os.xsd
		http://www.mulesoft.org/schema/mule/secure-properties http://www.mulesoft.org/schema/mule/secure-properties/current/mule-secure-properties.xsd">
	<secure-properties:config name="Secure_Properties_Config_demo" doc:name="Secure Properties Config"  file="mule-artifact.properties" key="mulesoft" >
		<secure-properties:encrypt algorithm="Blowfish" />
	</secure-properties:config>

	<configuration-properties
			file="mule-artifact.properties" />
	<http:request-config
			name="HTTP_Request_configuration"
			doc:name="HTTP Request configuration"
			>
		<http:request-connection host="127.0.0.1"
								 port="8087"/>
	</http:request-config>
	<http:listener-config name="HTTP_Listener_config"
						  doc:name="HTTP Listener config"
						  >
		<http:listener-connection host="0.0.0.0"
								  port="8082" />
	</http:listener-config>
	<http:listener-config
			name="HTTP_Listener_config1_Test" doc:name="HTTP Listener config">
		<http:listener-connection host="127.0.0.1"
								  port="8087" usePersistentConnections="false"
								  connectionIdleTimeout="4000" />
	</http:listener-config>
	<bigquery:config name="BigQuery__Configuration"
					 doc:name="BigQuery  Configuration"
					 >
		<bigquery:oauth2-connection projectId="${config.projectId}">
			<bigquery:oauth-authorization-code
					consumerKey="${secure::config.consumerKey}"
					consumerSecret="${secure::config.consumerSecret}"
					resourceOwnerId="demo" />
			<bigquery:oauth-callback-config
					listenerConfig="HTTP_Listener_config1_Test" callbackPath="/callback"
					authorizePath="/authorize" />
		</bigquery:oauth2-connection>
	</bigquery:config>
	<flow name="Insert_Job_Flow">
		<http:listener doc:name="Listener"
					   config-ref="HTTP_Listener_config"
					   path="/insert"/>
		<bigquery:insert-job doc:name="Insert Job"
									 config-ref="BigQuery__Configuration">
			<bigquery:job-values>
				#[payload]
			</bigquery:job-values>
		</bigquery:insert-job>
		<logger level="INFO" doc:name="Logger"/>
	</flow>
</mule>
```

--------------------------------

TITLE: Console Log Output Example
DESCRIPTION: This snippet shows an example of the log output from a running Mule application configured with the HTTP Listener and Logger components. It demonstrates that the 'Hello' message is successfully logged by the Logger component after the HTTP Listener receives a request.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/http/1.7/modules/ROOT/pages/http-start-app-brows-task.adoc#_snippet_1

LANGUAGE: console
CODE:
```
INFO  2020-01-02 13:00:00,438 [[MuleRuntime].cpuLight.15: [http].httpFlow.CPU_LITE @169a1097]
  [event: id] org.mule.runtime.core.internal.processor.LoggerMessageProcessor: Hello
```

--------------------------------

TITLE: MSMQ Gateway Request Example
DESCRIPTION: Demonstrates an example HTTP GET request to the MSMQ Gateway. It includes essential headers like Authorization, Mule-Msmq-Queue-Name, and Mule-Api-Version for authenticating and directing requests to the correct queue.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/connectors-home/modules/ROOT/pages/windows-gateway-services/windows-gateway-services-guide-mule4.adoc#_snippet_2

LANGUAGE: text
CODE:
```
GET: https://localhost:9333/msmq?count=50
Authorization: mule 3nGdw7W+G1fSO2YBEHDmpo4N1Tg=
Mule-Msmq-Queue-Name: .\private$\out
Mule-Api-Version: 1.0
```

--------------------------------

TITLE: Verify Mule App Startup and Logger Output
DESCRIPTION: This console output confirms that the Mule application has started successfully and shows the 'Hello' message logged by the HTTP Listener flow when triggered.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/http/1.9/modules/ROOT/pages/http-start-app-brows-task.adoc#_snippet_1

LANGUAGE: console
CODE:
```
INFO  2020-01-02 13:00:00,438 [[MuleRuntime].cpuLight.15: [http].httpFlow.CPU_LITE @169a1097]\n  [event: id] org.mule.runtime.core.internal.processor.LoggerMessageProcessor: Hello
```

--------------------------------

TITLE: Verify Mule App Startup and Logger Output
DESCRIPTION: This console output confirms that the Mule application has started successfully and shows the 'Hello' message logged by the HTTP Listener flow when triggered.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/http/1.6/modules/ROOT/pages/http-start-app-brows-task.adoc#_snippet_1

LANGUAGE: console
CODE:
```
INFO  2020-01-02 13:00:00,438 [[MuleRuntime].cpuLight.15: [http].httpFlow.CPU_LITE @169a1097]\n  [event: id] org.mule.runtime.core.internal.processor.LoggerMessageProcessor: Hello
```

--------------------------------

TITLE: Verify Mule App Startup and Logger Output
DESCRIPTION: This console output confirms that the Mule application has started successfully and shows the 'Hello' message logged by the HTTP Listener flow when triggered.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/http/1.8/modules/ROOT/pages/http-start-app-brows-task.adoc#_snippet_1

LANGUAGE: console
CODE:
```
INFO  2020-01-02 13:00:00,438 [[MuleRuntime].cpuLight.15: [http].httpFlow.CPU_LITE @169a1097]\n  [event: id] org.mule.runtime.core.internal.processor.LoggerMessageProcessor: Hello
```

--------------------------------

TITLE: Mule Application Startup Log Example
DESCRIPTION: Example output from the console when a Mule application starts successfully. It indicates the status of deployed domains and applications.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/sap-successfactors/4.1/modules/ROOT/pages/sap-successfactors-connector-studio.adoc#_snippet_4

LANGUAGE: text
CODE:
```
************************************************************
INFO  2019-07-14 22:12:42,003 [main] org.mule.module.launcher.DeploymentDirectoryWatcher:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Mule is up and kicking (every 5000ms)                    +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
INFO  2019-07-14 22:12:42,006 [main] org.mule.module.launcher.StartupSummaryDeploymentListener:
**********************************************************
*  - - + DOMAIN + - -               * - - + STATUS + - - *
**********************************************************
* default                           * DEPLOYED           *
**********************************************************

************************************************************************
* - - + APPLICATION + - -   * - - + DOMAIN + - -  * - - + STATUS + - - *
************************************************************************
* myapp                     * default             * DEPLOYED           *
************************************************************************
```

--------------------------------

TITLE: Mule Studio Flow XML for Get Item Example
DESCRIPTION: This XML code can be pasted directly into the Mule Studio XML editor to import the 'Get an Item' example flow. It configures the HTTP Listener and Get Entity operations for retrieving data.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/microsoft-dynamics-365-business-central/1.0/modules/ROOT/pages/microsoft-dynamics-365-business-central-connector-examples.adoc#_snippet_10

LANGUAGE: xml
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>


```

--------------------------------

TITLE: SQL Schema and Data Setup
DESCRIPTION: SQL statements to create the DEMO database, CUSTOMERS and PRODUCTS tables, and insert initial data into the PRODUCTS table. This sets up the environment for bulk database operations.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/db/1.12/modules/ROOT/pages/database-execute-bulk.adoc#_snippet_0

LANGUAGE: sql
CODE:
```
CREATE DATABASE DEMO;

USE DEMO;

CREATE TABLE CUSTOMERS (
ID bigint AUTO_INCREMENT PRIMARY KEY,
NAME varchar(30) NOT NULL,
LAST_NAME varchar(30) NOT NULL
);

CREATE TABLE PRODUCTS (
ID bigint AUTO_INCREMENT PRIMARY KEY,
PRICE numeric(8, 2) NOT NULL,
ITEM varchar(30) NOT NULL
);

INSERT INTO PRODUCTS (PRICE, ITEM) values (50.0, 'shampoo');
INSERT INTO PRODUCTS (PRICE, ITEM) values (150.5, 'olive oil');
INSERT INTO PRODUCTS (PRICE, ITEM) values (11, 'coconut oil');
INSERT INTO PRODUCTS (PRICE, ITEM) values (133, 'wine');
```

--------------------------------

TITLE: MuleSoft Full XML Configuration Example
DESCRIPTION: A comprehensive Mule XML configuration including secure properties, HTTP request/listener configurations, BigQuery integration, and a flow for rendering an HTML form. This snippet provides a complete setup for a Mule application.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/google-bigquery/1.1/modules/ROOT/pages/google-bigquery-connector-examples.adoc#_snippet_27

LANGUAGE: xml
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>

<mule xmlns:ee="http://www.mulesoft.org/schema/mule/ee/core"
	  xmlns:os="http://www.mulesoft.org/schema/mule/os"
	  xmlns:http="http://www.mulesoft.org/schema/mule/http"
	  xmlns:bigquery="http://www.mulesoft.org/schema/mule/bigquery"
	  xmlns="http://www.mulesoft.org/schema/mule/core"
	  xmlns:doc="http://www.mulesoft.org/schema/mule/documentation"
	  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	  xmlns:secure-properties="http://www.mulesoft.org/schema/mule/secure-properties"
	  xsi:schemaLocation="
http://www.mulesoft.org/schema/mule/ee/core http://www.mulesoft.org/schema/mule/ee/core/current/mule-ee.xsd http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/bigquery http://www.mulesoft.org/schema/mule/bigquery/current/mule-bigquery.xsd
http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd
http://www.mulesoft.org/schema/mule/os http://www.mulesoft.org/schema/mule/os/current/mule-os.xsd
		http://www.mulesoft.org/schema/mule/secure-properties http://www.mulesoft.org/schema/mule/secure-properties/current/mule-secure-properties.xsd">
	<secure-properties:config name="Secure_Properties_Config_demo" doc:name="Secure Properties Config"  file="mule-artifact.properties" key="mulesoft" >
		<secure-properties:encrypt algorithm="Blowfish" />
	</secure-properties:config>

	<configuration-properties
			file="mule-artifact.properties" />
	<http:request-config
			name="HTTP_Request_configuration"
			doc:name="HTTP Request configuration"
			>
		<http:request-connection host="127.0.0.1"
								 port="8087"/>
	</http:request-config>
	<http:listener-config name="HTTP_Listener_config"
						  doc:name="HTTP Listener config"
						  >
		<http:listener-connection host="0.0.0.0"
								  port="8082" />
	</http:listener-config>
	<http:listener-config
			name="HTTP_Listener_config1_Test" doc:name="HTTP Listener config">
		<http:listener-connection host="127.0.0.1"
								  port="8087" usePersistentConnections="false"
								  connectionIdleTimeout="4000" />
	</http:listener-config>
	<bigquery:config name="BigQuery__Configuration"
					 doc:name="BigQuery  Configuration"
					 >
		<bigquery:oauth2-connection projectId="${config.projectId}">
			<bigquery:oauth-authorization-code
					consumerKey="${secure::config.consumerKey}"
					consumerSecret="${secure::config.consumerSecret}"
					resourceOwnerId="demo" />
			<bigquery:oauth-callback-config
					listenerConfig="HTTP_Listener_config1_Test" callbackPath="/callback"
					authorizePath="/authorize" />
		</bigquery:oauth2-connection>
	</bigquery:config>
	<flow name="html-form-flow">
		<http:listener doc:name="/"
					   config-ref="HTTP_Listener_config" path="/">
			<http:response>
				<http:headers><![CDATA[#[{'content-type' : 'text/html'}]]]></http:headers>
			</http:response>
		</http:listener>

```

--------------------------------

TITLE: Get Party Site Configuration Example
DESCRIPTION: Configuration parameters for the 'Get Party Site' operation in Anypoint Studio. This includes identifiers for the Party Site business object and its original system.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/oracle-ebs/5.1/modules/ROOT/pages/index.adoc#_snippet_5

LANGUAGE: APIDOC
CODE:
```
Get Party Site Operation Configuration:
  Id:
    Type: String
    Description: TCA identifier for the Party Site business object.
  Orig Sys:
    Type: String
    Description: Party Site original system name.
  Orig Sys Ref:
    Type: String
    Description: Party Site original system reference.
```

--------------------------------

TITLE: Mule XML for HTTP Listener and Logger
DESCRIPTION: This XML configuration defines a Mule flow that uses an HTTP Listener to receive incoming requests on path '/trigger' and port '8081'. It also includes a Logger component that outputs the message 'Hello' when triggered. This setup allows the Mule application to be started or invoked via a web browser.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/http/1.7/modules/ROOT/pages/http-start-app-brows-task.adoc#_snippet_0

LANGUAGE: xml
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>

<mule xmlns:http="http://www.mulesoft.org/schema/mule/http" xmlns="http://www.mulesoft.org/schema/mule/core"
	xmlns:doc="http://www.mulesoft.org/schema/mule/documentation"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd">
	<http:listener-config name="HTTP_Listener_config" >
		<http:listener-connection host="0.0.0.0" port="8081" />
	</http:listener-config>
	<flow name="flow" >
		<http:listener doc:name="Listener" config-ref="HTTP_Listener_config" path="/trigger"/>
		<logger level="INFO" doc:name="Logger" message="Hello"/>
	</flow>
</mule>
```

--------------------------------

TITLE: Initialize MUSICIANS Database Table
DESCRIPTION: SQL script to create and populate the MUSICIANS table in an Oracle database, used for testing the Sockets Connector examples.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/sockets/1.1/modules/ROOT/pages/sockets-connector-examples.adoc#_snippet_1

LANGUAGE: xml
CODE:
```
    CREATE TABLE SYSTEM.MUSICIANS(
        id INTEGER GENERATED BY DEFAULT AS IDENTITY,
        age INTEGER,
        first_name VARCHAR2(100),
        last_name VARCHAR2(100),
        PRIMARY KEY(id)
    );

    INSERT INTO SYSTEM.MUSICIANS(age, first_name, last_name) VALUES(37, 'Farrokh', 'Bulsara');
    INSERT INTO SYSTEM.MUSICIANS(age, first_name, last_name) VALUES(36, 'Brian Harold', 'May');
    INSERT INTO SYSTEM.MUSICIANS(age, first_name, last_name) VALUES(35, 'Roger', 'Meddows Taylor');
    INSERT INTO SYSTEM.MUSICIANS(age, first_name, last_name) VALUES(32, 'John', 'Deacon');
```

--------------------------------

TITLE: Box Connector Operations: Create, Get, Delete Folder
DESCRIPTION: Demonstrates the configuration for Box Connector operations within Anypoint Studio: creating a folder, retrieving a folder by ID, and deleting a folder.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/box/5.3/modules/ROOT/pages/box-connector-examples.adoc#_snippet_3

LANGUAGE: APIDOC
CODE:
```
Box Connector Operations:

Create Folder:
  - Configures the Box Connector to create a new folder.
  - Parameters:
    - Connector configuration: Select the global Box Connector element.
    - Create folder request data: Payload containing folder details (e.g., parent ID, name).
  - Example Usage:
    - Input payload: `#[payload]` (referencing the DataWeave output).

Get Folder:
  - Retrieves information for a specific folder using its ID.
  - Parameters:
    - Connector configuration: Select the global Box Connector element.
    - Folder id: The ID of the folder to retrieve (e.g., `#[payload.id]`).
  - Returns:
    - Folder information payload.

Delete Folder:
  - Deletes a specified folder.
  - Parameters:
    - Connector configuration: Select the global Box Connector element.
    - Folder id: The ID of the folder to delete (e.g., `#[payload.id]`).
```

--------------------------------

TITLE: Minimal JMS Connector Configuration
DESCRIPTION: This example demonstrates a minimal configuration for the JMS connector, setting up a connection to an in-memory ActiveMQ broker. This is the most basic setup required to start using the connector.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/jms/1.4/modules/ROOT/pages/index.adoc#_snippet_1

LANGUAGE: xml
CODE:
```
<jms:config name="JMS_Config">
  <jms:active-mq-connection/>
</jms:config>
```

--------------------------------

TITLE: Salesforce CDP Insights Get Metadata API
DESCRIPTION: This API documentation describes the process of retrieving metadata for Salesforce CDP Calculated Insights. It details the HTTP listener setup, the 'get-all-calculated-insight-metadata' operation, and authentication methods. Refer to the Salesforce CDP API Developer Guide for comprehensive details.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/salesforce-cdp/1.1/modules/ROOT/pages/salesforce-cdp-connector-examples.adoc#_snippet_23

LANGUAGE: APIDOC
CODE:
```
Salesforce CDP Insights Get Metadata API:

This API allows retrieval of metadata, including dimensions and filters, for a calculated insight within Salesforce CDP.

Operations:
1. HTTP Listener:
   - Method: GET
   - Path: /insight/metadata
   - Config: HTTP_Listener_config (host: 0.0.0.0, port: 8081)
   - Purpose: Accepts incoming HTTP GET requests.

2. Insights - List Metadata (sdc:get-all-calculated-insight-metadata):
   - Config Reference: Salesforce_CDP_OAuth_JWT_config or Salesforce_CDP_OAuth_UsernamePassword_config
   - Purpose: Calls the Salesforce CDP API to return metadata for the requested calculated insight.
   - Authentication:
     - OAuth JWT Connection:
       - consumerKey: Salesforce connected app consumer key.
       - keyStorePath: Path to the keystore file.
       - storePassword: Password for the keystore.
       - subject: User's email address.
       - audienceUrl: Audience URL for the JWT assertion.
       - keyAlias: Alias of the certificate in the keystore.
     - OAuth Username/Password Connection:
       - clientId: Salesforce connected app client ID.
       - clientSecret: Salesforce connected app client secret.
       - username: Salesforce username.
       - password: Salesforce password.
       - audienceUrl: Audience URL for the token request.

Dependencies:
- Mule HTTP Connector
- Mule Salesforce CDP Connector (sdc)
- Mule Configuration Properties (for externalizing credentials)

Input:
- HTTP Request: GET /insight/metadata

Output:
- Metadata for the specified calculated insight.

Example Usage:
Send a GET request to http://localhost:8081/insight/metadata to trigger the flow.

Further Details:
Refer to the https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/c360a_api_insights_meta_ci_name.htm[Salesforce CDP API Developer Guide].
```

--------------------------------

TITLE: Anypoint Connector Configuration Methods
DESCRIPTION: Anypoint Connectors can be configured using either Anypoint Studio's visual interface or directly via XML configuration files. This section outlines the primary methods for setting up connector configurations.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/connectors-home/modules/ROOT/pages/introduction/intro-connector-configuration-overview.adoc#_snippet_0

LANGUAGE: mulesoft
CODE:
```
Configure using Anypoint Studio
Configure using XML
```

--------------------------------

TITLE: MuleSoft S3 Connector Flow Example
DESCRIPTION: This XML snippet demonstrates a complete MuleSoft flow utilizing the S3 connector. It includes HTTP listener configuration, S3 connection setup, and a sequence of S3 operations: creating a bucket, putting an object, getting an object, deleting an object, and deleting the bucket. It also shows an HTTP request for fetching an image from an external URL.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/amazon-s3/7.1/modules/ROOT/pages/amazon-s3-connector-examples.adoc#_snippet_8

LANGUAGE: xml
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>

<mule xmlns:s3="http://www.mulesoft.org/schema/mule/s3"
	xmlns:http="http://www.mulesoft.org/schema/mule/http"
	xmlns="http://www.mulesoft.org/schema/mule/core"
	xmlns:doc="http://www.mulesoft.org/schema/mule/documentation"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd
http://www.mulesoft.org/schema/mule/s3 http://www.mulesoft.org/schema/mule/s3/current/mule-s3.xsd">
	<http:listener-config name="HTTP_Listener_config"
		doc:name="HTTP Listener config"
		doc:id="DOC_ID">
		<http:listener-connection host="0.0.0.0"
			port="8081" />
	</http:listener-config>
	<configuration-properties doc:name="Configuration properties" doc:id="DOC_ID" file="mule-artifact.properties" />
	<s3:config name="Amazon_S3_Configuration" doc:name="Amazon S3 Configuration" doc:id="DOC_ID" >
		<s3:connection accessKey="${config.accessKey}" secretKey="${config.secretKey}" />
	</s3:config>
	<http:request-config name="HTTP_Request_configuration" doc:name="HTTP Request configuration" doc:id="DOC_ID">
		<http:request-connection protocol="HTTPS" host="developer.mulesoft.com"/>
	</http:request-config>
	<flow name="docu-demoFlow" doc:id="DOC_ID" >
		<http:listener doc:name="Listener" doc:id="DOC_ID" config-ref="HTTP_Listener_config" path="/"/>
		<s3:create-bucket doc:name="Create new bucket" doc:id="DOC_ID" config-ref="Amazon_S3_Configuration" bucketName="${bucket.name}" acl="PRIVATE"/>
		<http:request method="GET" doc:name="Get Mulesoft logo" doc:id="DOC_ID" path="/sites/all/themes/muletheme/images/mulesoft_dev_logo_v2.svg" config-ref="HTTP_Request_configuration"/>
		<s3:put-object doc:name="Create logo object in S3 bucket" doc:id="DOC_ID" config-ref="Amazon_S3_Configuration" bucketName="${bucket.name}" key="${file.name}" objectACL="PRIVATE"/>
		<s3:get-object doc:name="Get image" doc:id="DOC_ID" config-ref="Amazon_S3_Configuration" bucketName="${bucket.name}" key="${file.name}"/>
		<s3:delete-object doc:name="Delete created object" doc:id="DOC_ID" config-ref="Amazon_S3_Configuration" bucketName="${bucket.name}" key="${file.name}"/>
		<s3:delete-bucket doc:name="Delete created bucket" doc:id="DOC_ID" config-ref="Amazon_S3_Configuration" bucketName="${bucket.name}"/>
	</flow>
</mule>
```

--------------------------------

TITLE: MuleSoft HTTP Listener Console Output
DESCRIPTION: Shows the expected console output when a Mule application configured with an HTTP Listener starts successfully. It includes the 'Hello' message logged by the application after receiving a request.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/http/1.10/modules/ROOT/pages/http-start-app-brows-task.adoc#_snippet_1

LANGUAGE: console
CODE:
```
INFO  2020-01-02 13:00:00,438 [[MuleRuntime].cpuLight.15: [http].httpFlow.CPU_LITE @169a1097]
  [event: id] org.mule.runtime.core.internal.processor.LoggerMessageProcessor: Hello
```

--------------------------------

TITLE: Mule Application Startup Log Output (Console)
DESCRIPTION: This console output shows the successful startup of a Mule application. It includes a log message from the Logger component, confirming the 'Hello' message was processed after the HTTP request.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/http/1.5/modules/ROOT/pages/http-start-app-brows-task.adoc#_snippet_1

LANGUAGE: console
CODE:
```
INFO  2020-01-02 13:00:00,438 [[MuleRuntime].cpuLight.15: [http].httpFlow.CPU_LITE @169a1097]
  [event: id] org.mule.runtime.core.internal.processor.LoggerMessageProcessor: Hello
```

--------------------------------

TITLE: Apply Discounts with Bulk Update via Foreach
DESCRIPTION: Illustrates how to apply different discount rates to products based on their prices using a combination of a `<foreach>` loop and the `<db:update>` operation. This pattern is useful when individual updates need to be parameterized based on payload data.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/db/1.10/modules/ROOT/pages/database-connector-examples.adoc#_snippet_1

LANGUAGE: xml
CODE:
```
<foreach>
  <db:update config-ref="dbConfig">
    <db:input-parameters>
     #[ 
      {
        'discountRate' : payload.discountRate,
        'price' : payload.price,
      }
    ]
    </db:input-parameters>
    <db:sql>
      UPDATE PRODUCTS set PRICE = PRICE * :discountRate where PRICE > :price
    </db:sql>
  </db:update>
</foreach>
```

LANGUAGE: dw
CODE:
```
%dw 2.0
output application/json
--- 
[{"price": 100, "discountRate": 0.9}, {"price": 200, "discountRate": 0.85}]
```

--------------------------------

TITLE: Salesforce Data Cloud Profile Get Metadata API
DESCRIPTION: This section details the Salesforce Data Cloud Profile Get Metadata API, outlining the HTTP listener endpoint and the SDC connector operation for retrieving metadata. It references the Salesforce Data Cloud API Developer Guide for comprehensive details.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/salesforce-cdp/1.3/modules/ROOT/pages/salesforce-data-cloud-connector-examples.adoc#_snippet_43

LANGUAGE: APIDOC
CODE:
```
Salesforce Data Cloud Profile Get Metadata API

Description: Retrieves metadata for a data model object from Salesforce Data Cloud.
Reference: https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/c360a_api_profile_meta_dmname.htm

Operations:

1. HTTP Listener
   - Method: GET
   - Path: /profile/metadata/{dataModelName}
   - Description: Accepts HTTP GET requests. The data model name is provided as a required URI parameter.
   - Parameters:
     - dataModelName (URI Parameter): The name of the data model object for which to retrieve metadata.

2. Profile - Get Metadata (sdc:get-meta)
   - Description: Calls the Salesforce Data Cloud API to fetch the metadata for the specified data model object.
   - Authentication: Authenticates using configured credentials (e.g., OAuth JWT, OAuth Username/Password).
   - Input:
     - dataModelName: Passed from the HTTP listener's URI parameter.
   - Configuration: Requires a configured SDC connector (e.g., Salesforce_Data_Cloud_OAuth_JWT_config).
   - Returns: Metadata for the requested data model object.
```

--------------------------------

TITLE: Mule XML: Delete Permission Flow Configuration (Partial)
DESCRIPTION: This XML snippet represents a partial configuration for a MuleSoft flow designed to delete a permission. It includes the necessary HTTP listener configuration and the start of the Azure Cosmos DB connector setup. This example is intended to be pasted into the Studio XML editor to load the flow.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/azure-cosmos-db/1.0/modules/ROOT/pages/azure-cosmos-db-connector-examples.adoc#_snippet_24

LANGUAGE: xml
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>
<mule
        xmlns:doc="http://www.mulesoft.org/schema/mule/documentation"
        xmlns:azure-cosmos-db-connector-mule-4="http://www.mulesoft.org/schema/mule/azure-cosmos-db-connector-mule-4"
        xmlns:ee="http://www.mulesoft.org/schema/mule/ee/core" xmlns:http="http://www.mulesoft.org/schema/mule/http"
        xmlns="http://www.mulesoft.org/schema/mule/core" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd
http://www.mulesoft.org/schema/mule/ee/core http://www.mulesoft.org/schema/mule/ee/core/current/mule-ee.xsd
http://www.mulesoft.org/schema/mule/azure-cosmos-db-connector-mule-4 http://www.mulesoft.org/schema/mule/azure-cosmos-db-connector-mule-4/current/mule-azure-cosmos-db-connector-mule-4.xsd">

    <configuration-properties file="mule-app.properties"/>

    <http:listener-config name="HTTP_Listener_config">
        <http:listener-connection host="0.0.0.0" port="8081"/>
    </http:listener-config>
    <azure-cosmos-db-connector-mule-4:key-token-config name="Cosmos_Db_Connector_Config">

```

--------------------------------

TITLE: Account Basic Search Flow Configuration (XML)
DESCRIPTION: Provides the complete Mule XML configuration for the Account Basic Search flow. This includes the HTTP Listener, NetSuite Search operation, and Transform Message components, allowing for quick setup of the example.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/netsuite/10.0/modules/ROOT/pages/netsuite-examples.adoc#_snippet_2

LANGUAGE: xml
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>

<mule xmlns:ee="http://www.mulesoft.org/schema/mule/ee/core"
	xmlns:netsuite="http://www.mulesoft.org/schema/mule/netsuite"
	xmlns:http="http://www.mulesoft.org/schema/mule/http" xmlns="http://www.mulesoft.org/schema/mule/core"
	xmlns:doc="http://www.mulesoft.org/schema/mule/documentation"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd
http://www.mulesoft.org/schema/mule/netsuite http://www.mulesoft.org/schema/mule/netsuite/current/mule-netsuite.xsd
http://www.mulesoft.org/schema/mule/ee/core http://www.mulesoft.org/schema/mule/ee/core/current/mule-ee.xsd">

	<http:listener-config name="HTTP_Listener_config" doc:name="HTTP Listener config" doc:id="00000000" />
	<netsuite:config name="NetSuite_Config" doc:name="NetSuite Config" doc:id="00000000" />

	<flow name="netsuite-account-basic-search-flow" doc:id="00000000" >
		<http:listener doc:name="/account" doc:id="00000000" path="/account" config-ref="HTTP_Listener_config"/>
		<ee:transform doc:name="Search Criteria" doc:id="00000000" >
			<ee:message>
				<ee:set-payload><![CDATA[%dw 2.0
output application/java
---
{
	internalIdNumber: {
		operator: "LESS_THAN",
		searchValue: attributes.queryParams["internalId"]
	}
} as Object {
	class : "org.mule.module.netsuite.extension.api.AccountSearchBasic"
}]]></ee:set-payload>
			</ee:message>
		</ee:transform>
		<netsuite:search doc:name="Search Account" doc:id="00000000" config-ref="NetSuite_Config" searchKey="ACCOUNT_BASIC" pageSize="500"/>
		<ee:transform doc:name="Response to JSON" doc:id="00000000" >
			<ee:message>
				<ee:set-payload><![CDATA[%dw 2.0
output application/json
---
payload]]></ee:set-payload>
			</ee:message>
		</ee:transform>
	</flow>

</mule>
```

--------------------------------

TITLE: Example Embedding Get Info Response JSON
DESCRIPTION: Presents an example of the main JSON payload returned by the 'Embedding get info from store' operation, containing the LLM-generated response and a list of source documents with their file path, name, and relevant text segment.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/mulesoft-ai-chain/1.0/modules/ROOT/pages/configuring-embeddings-operations.adoc#_snippet_14

LANGUAGE: JSON
CODE:
```
{
  "response": "Runtime Manager is a feature within CloudHub that provides scalability, workload distribution, and added reliability to applications.",
  "sources": [
      {
          "absoluteDirectoryPath": "/Users/john.wick/Documents/Downloads/patch 8",
          "fileName": "docs-runtime-manager__cloudhub_modules_ROOT_pages_cloudhub-fabric.adoc",
          "textSegment": "= CloudHub High Availability Features..."
      }
  ]
}
```

--------------------------------

TITLE: SAP Concur Connector Get List of Lists Response Example
DESCRIPTION: Example JSON response when retrieving a list of lists using the SAP Concur Connector. This demonstrates the structure of the data returned by the 'Get list of lists' operation.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/sap-concur/4.1/modules/ROOT/pages/index.adoc#_snippet_1

LANGUAGE: json
CODE:
```
{"list":[{"batchLink":"https://www.concursolutions.com/api/expense/list/v1.0/gWqXO46r6GsRt9CeqUjOAfZXRTmGyyVczqg/batch","id":"https://www.concursolutions.com/api/expense/list/v1.0/gWqXO46r6GsRt9CeqUjOAfZXRTmGyyVczqg","isVendor":false,"itemsLink":"https://www.concursolutions.com/api/expense/list/v1.0/gWqXO46r6GsRt9CeqUjOAfZXRTmGyyVczqg/items","levels":1,"name":"AT Tax Form List 1"},
{"batchLink":"https://www.concursolutions.com/api/expense/list/v1.0/gWqXO46r6GsRsUIXmIbg3iUc6qE9AlKEVxA/batch","id":"https://www.concursolutions.com/api/expense/list/v1.0/gWqXO46r6GsRsUIXmIbg3iUc6qE9AlKEVxA","isVendor":false,"itemsLink":"https://www.concursolutions.com/api/expense/list/v1.0/gWqXO46r6GsRsUIXmIbg3iUc6qE9AlKEVxA/items","levels":1,"name":"BE Tax Form List 1"}]}
```

--------------------------------

TITLE: Get Folder Operation Configuration
DESCRIPTION: Configuration for the Box Connector's 'Get folder' operation, using the ID of the previously created folder.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/box/5.2/modules/ROOT/pages/box-connector-examples.adoc#_snippet_5

LANGUAGE: text
CODE:
```
Connector configuration: Select the global Box Connector element.
Folder id: `#[payload.id]`
```

--------------------------------

TITLE: Mule Application Startup Log Output
DESCRIPTION: Example console output demonstrating a successful startup of a Mule application. It includes deployment status messages and domain information.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/microsoft-dynamics-365/2.3/modules/ROOT/pages/microsoft-dynamics-365-connector-studio.adoc#_snippet_4

LANGUAGE: text
CODE:
```
************************************************************
INFO  2019-10-14 22:12:42,003 [main] org.mule.module.launcher.DeploymentDirectoryWatcher:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Mule is up and kicking (every 5000ms)                    +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
INFO  2019-10-14 22:12:42,006 [main] org.mule.module.launcher.StartupSummaryDeploymentListener:
**********************************************************
*  - - + DOMAIN + - -               * - - + STATUS + - - *
**********************************************************
* default                           * DEPLOYED           *
**********************************************************

************************************************************************
* - - + APPLICATION + - -   * - - + DOMAIN + - -  * - - + STATUS + - - *
************************************************************************
* myapp                     * default             * DEPLOYED           *
************************************************************************
```

--------------------------------

TITLE: Outlook365 Get Message Flow Configuration
DESCRIPTION: This Mule XML configuration defines a flow to retrieve a single message from Outlook365. It includes HTTP listener configuration, Outlook365 client credentials setup using OAuth, and the 'get-message' operation with specified user ID and message ID.

SOURCE: https://github.com/mulesoft/docs-connectors/blob/latest/microsoft-outlook-365/1.1/modules/ROOT/pages/microsoft-outlook-365-connector-examples.adoc#_snippet_3

LANGUAGE: XML
CODE:
```
<?xml version="1.0" encoding="UTF-8"?>
<mule xmlns:outlook365="http://www.mulesoft.org/schema/mule/outlook365"
	xmlns:http="http://www.mulesoft.org/schema/mule/http"
	xmlns="http://www.mulesoft.org/schema/mule/core"
	xmlns:doc="http://www.mulesoft.org/schema/mule/documentation"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd
http://www.mulesoft.org/schema/mule/outlook365 http://www.mulesoft.org/schema/mule/outlook365/current/mule-outlook365.xsd">
	<http:listener-config name="HTTP_Listener_config" doc:name="HTTP Listener config" doc:id="7b5e348d-2f1c-4a09-b73a-7b1f84d89060" >
		<http:listener-connection host="0.0.0.0" port="8083" />
	</http:listener-config>

	<outlook365:outlook365-config name="outlook365_client_credentials" doc:name="Outlook365 Outlook365 Config" doc:id="ab1353ac-79b8-4718-a96c-a2c9e9d1d996" >
		<outlook365:oauth-client-credentials-connection >
			<outlook365:oauth-client-credentials clientId="${oauth-client-credentials.clientId}" clientSecret="${oauth-client-credentials.clientSecret}" tokenUrl="${oauth-client-credentials.tokenUrl}" scopes="${oauth-client-credentials.scopes}" />
		</outlook365:oauth-client-credentials-connection>
	</outlook365:outlook365-config>

	<flow name="get-message" doc:id="f4d095f0-3841-4b6e-b8ab-73986a37339d" >
		<http:listener doc:name="Listener" doc:id="744e331c-a530-41b2-b6a1-a7b251248578" config-ref="HTTP_Listener_config" path="/get-msg"/>
		<outlook365:get-message doc:name="Get message" doc:id="67f75fea-3c1a-4dbc-a4fe-00503d68565b" config-ref="outlook365_client_credentials" userId="88f176b2-84ca-4cfe-828c-954db0096efa" messageId="AAMkADg5NjIxODNkLWRkNzAtNGFkNC04YjUwLWFjOTEyMzg0YzA5NgBGAAAAAADzzlN7RptORYu7QgvFkvQJBwCthX8I2XTFT5_USx5R95fIAAAAAAEPAACthX8I2XTFT5_USx5R95fIAAFXpn4vAAA=" getMIMEContent="true"/>
		<logger level="INFO" doc:name="Logger" doc:id="191b1e4b-1acf-452c-b1af-62c7d14fc06d" message="#[payload]"/>
	</flow>
</mule>
```