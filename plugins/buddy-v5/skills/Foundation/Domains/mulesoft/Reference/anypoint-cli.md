================
CODE SNIPPETS
================
TITLE: Install Anypoint CLI Core Package and Default Plugins using npm
DESCRIPTION: This command uses npm to globally install the Anypoint CLI version 4 core package along with all its default plugins. It is the primary command for the initial installation.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/install.adoc#_snippet_0

LANGUAGE: text
CODE:
```
npm install -g anypoint-cli-v4
```

--------------------------------

TITLE: Original Anypoint CLI Command Example
DESCRIPTION: An example of an Anypoint CLI command applying a policy with a configuration object, shown in its original form before considering Windows-specific escaping.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/troubleshooting.adoc#_snippet_3

LANGUAGE: Shell
CODE:
```
api-mgr:policy:apply --config '{"username":"user","password":"test"}'
```

--------------------------------

TITLE: Example: Documenting a Ruleset with Anypoint CLI
DESCRIPTION: Provides a concrete example of using the `governance:document` command to generate documentation for a specified ruleset file and save it to a ZIP file.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_7

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance:document /myrulesetfolder/mynewruleset.yaml /myrulesetfolder/ruleset.doc.zip
```

--------------------------------

TITLE: Anypoint CLI Output JSON Example (Describe)
DESCRIPTION: Example of specifying the output format as JSON using the `--output` flag for the `describe` command.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_27

LANGUAGE: CLI
CODE:
```
--output json
```

--------------------------------

TITLE: Anypoint CLI Tier Description Example (Add Tier)
DESCRIPTION: Example of specifying the SLA tier description using the `--description` flag when adding a tier.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_40

LANGUAGE: CLI
CODE:
```
--description tier example description
```

--------------------------------

TITLE: Starting CloudHub Application CLI
DESCRIPTION: Starts a CloudHub application specified by its name. This command accepts the standard default flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-apps.adoc#_snippet_11

LANGUAGE: cli
CODE:
```
> runtime-mgr:cloudhub-application:start [flags] <name>
```

--------------------------------

TITLE: Example: Setting Anypoint CLI Credentials via Conf (Username/Password/Org)
DESCRIPTION: An example demonstrating how to set the username, password, and organization ID in the Anypoint CLI configuration file using the `conf` command.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/auth.adoc#_snippet_1

LANGUAGE: shell
CODE:
```
$ anypoint-cli-v4 conf username myUserName
$ anypoint-cli-v4 conf password myPassword
$ anypoint-cli-v4 conf organization myOrgId
```

--------------------------------

TITLE: Copy Standalone Application Example (Full Path) (Anypoint CLI)
DESCRIPTION: Example demonstrating how to copy a standalone application named 'application-1' from the 'Services' organization's 'QA' environment to the 'Development' organization's 'QA' environment, targeting the server with ID '123456'. This uses the full source and target path format.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/standalone-apps.adoc#_snippet_2

LANGUAGE: Shell
CODE:
```
> runtime-mgr:standalone-application:copy Services:QA/application-1 Development:QA/application-2 123456
```

--------------------------------

TITLE: Example API Inspect Output (Text)
DESCRIPTION: This is an example of the output produced by the `governance:api:inspect` command, listing the names of the schemas found in the API specification.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_3

LANGUAGE: text
CODE:
```
  'patientmultipleBirthBoolean',
  'PatientBundle',
  'patientmultipleBirthInteger',
  'PatientEntry'
```

--------------------------------

TITLE: Copy Standalone Application Example (Current Context) (Anypoint CLI)
DESCRIPTION: Example demonstrating how to copy a standalone application named 'application-1' from the currently configured organization and environment (assuming 'Services:QA') to the 'Development' organization's 'QA' environment, targeting the server with ID '123456'. This uses a simplified source path.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/standalone-apps.adoc#_snippet_3

LANGUAGE: Shell
CODE:
```
> runtime-mgr:standalone-application:copy application-1 Development/QA/application-2 123456
```

--------------------------------

TITLE: Upload Ruleset with Documentation Example - Anypoint CLI
DESCRIPTION: Example showing how to upload a ruleset asset along with its documentation using a single `--files` flag. The flag contains a JSON string mapping multiple classifier/packaging types to their respective file paths.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/exchange-assets.adoc#_snippet_18

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 exchange asset upload my-auth-best-practices/1.0.0 --name "My Best Practices Ruleset" --description "This ruleset enforces my best practices for APIs." --files'{"ruleset.yaml":"/myRulesetFolder/mynewruleset.yaml","docs.zip":"/myRulesetFolder/ruleset.doc.zip"}'
```

--------------------------------

TITLE: Start Standalone Application - Anypoint CLI
DESCRIPTION: Starts the standalone application specified by its identifier. This command accepts the default Anypoint CLI flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/standalone-apps.adoc#_snippet_10

LANGUAGE: shell
CODE:
```
> runtime-mgr:standalone-application:start [flags] <identifier>
```

--------------------------------

TITLE: Anypoint CLI Tier Limit Flag Example (Add Tier)
DESCRIPTION: Example of the `-l, --limit` flag used when adding an SLA tier to specify the request limit. (Note: The example value is missing in the source text, only the flag is shown).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_41

LANGUAGE: CLI
CODE:
```
-l, --limit
```

--------------------------------

TITLE: Example Output: Documenting a Ruleset
DESCRIPTION: Shows the expected output when running the `governance:document` command, listing the validations processed and confirming the save location of the generated documentation ZIP.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_8

LANGUAGE: text
CODE:
```
validation name [ 'security-fields-operation-empty' ]
validation name [ 'access-tokens-oauth2-cleartext' ]
validation name [ 'insecure-oauth2-grants' ]
validation name [ 'api-keys-in-cookie' ]
validation name [ 'api-keys-in-query' ]
validation name [ 'api-keys-in-header' ]
validation name [ 'api-negotiates-authentication' ]
validation name [ 'insecure-basic-auth' ]
validation name [ 'bearer-token-cleartext' ]
validation name [ 'http-token-cleartext' ]
validation name [ 'oauth1-deprecated' ]
validation name [ 'oauth2-redirections-non-encrypted' ]
validation name [ 'unknown-security-scheme' ]
validation name [ 'valid-server-urltemplate' ]
validation name [ 'valid-oauth2-redirection-urls' ]
Saving to myRulesetFolder/ruleset.doc.zip
```

--------------------------------

TITLE: Starting CloudHub Load Balancer (Anypoint CLI)
DESCRIPTION: Starts the CloudHub load balancer specified by its name. This command accepts the standard Anypoint CLI default flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-dlb.adoc#_snippet_9

LANGUAGE: shell
CODE:
```
> cloudhub:load-balancer:start [flags] <name>
```

--------------------------------

TITLE: Example: Setting Anypoint CLI Credentials via Conf (Client ID/Secret/Org)
DESCRIPTION: An example demonstrating how to set the client ID, client secret, and organization ID in the Anypoint CLI configuration file using the `conf` command, typically used with Connected Apps.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/auth.adoc#_snippet_2

LANGUAGE: shell
CODE:
```
$ anypoint-cli-v4 conf client_id myClientID
$ anypoint-cli-v4 conf client_secret myCLientSecret
$ anypoint-cli-v4 conf organization myOrgId
```

--------------------------------

TITLE: Examples for api-catalog autocomplete Command
DESCRIPTION: Illustrates various ways to use the api-catalog autocomplete command, including basic usage, specifying Bash or Zsh shells, and using the --refresh-cache flag to clear the current configuration.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-catalog.adoc#_snippet_1

LANGUAGE: Shell
CODE:
```
$ api-catalog autocomplete
$ api-catalog autocomplete bash
$ api-catalog autocomplete zsh
$ api-catalog autocomplete --refresh-cache
```

--------------------------------

TITLE: Anypoint CLI Policy Version Example (Describe)
DESCRIPTION: Example of specifying the Mule 4 policy version using the `--policyVersion` flag within the context of the `describe` command.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_26

LANGUAGE: CLI
CODE:
```
--policyVersion 1.0.2
```

--------------------------------

TITLE: Example API Validate Output (Text)
DESCRIPTION: These examples show the different output messages from the `governance:api:validate` command, indicating whether the API specification conforms to the specified rulesets and providing details if non-conformant.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_5

LANGUAGE: text
CODE:
```
 Spec conforms with Ruleset
```

LANGUAGE: text
CODE:
```
Conforms: false 
Number of results: 3 <1>

Functional Validations 
```

--------------------------------

TITLE: Example Output for Valid Ruleset Validation
DESCRIPTION: Example console output demonstrating a successful validation of a governance ruleset using the `governance:ruleset:validate` command, indicating conformance with the dialect.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_27

LANGUAGE: Text
CODE:
```
Ruleset User/myuser/myrulesetfolder/myruleset.yaml
Ruleset conforms with Dialect
```

--------------------------------

TITLE: Anypoint CLI Output JSON Example (Edit)
DESCRIPTION: Example of specifying the output format as JSON using the `--output` flag for the `edit` command.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_32

LANGUAGE: CLI
CODE:
```
--output json
```

--------------------------------

TITLE: Anypoint CLI Policy Version Example
DESCRIPTION: Example of specifying the Mule 4 policy version using the `--policyVersion` flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_21

LANGUAGE: CLI
CODE:
```
--policyVersion 1.0.2
```

--------------------------------

TITLE: Anypoint CLI Upstream ID Example
DESCRIPTION: Example of configuring an upstream ID using the `--upstreamId` flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_22

LANGUAGE: CLI
CODE:
```
--upstreamId 550e8400-e29b-41d4-a716-446655440000
```

--------------------------------

TITLE: Anypoint CLI Tier Name Example (Add Tier)
DESCRIPTION: Example of specifying the SLA tier name using the `--name` flag when adding a tier.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_39

LANGUAGE: CLI
CODE:
```
--name muleSLAtier
```

--------------------------------

TITLE: Anypoint CLI Policy Config File Example (Edit)
DESCRIPTION: Example of passing policy configuration data from a file using the `--configFile` flag for the `edit` command.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_31

LANGUAGE: CLI
CODE:
```
--configFile ./config.json
```

--------------------------------

TITLE: Start Anypoint Application (CLI)
DESCRIPTION: Starts the Anypoint application specified by its application ID. Use the `runtime-mgr application list` command to obtain the application ID.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_26

LANGUAGE: Shell
CODE:
```
> runtime-mgr:application:start [flags] <appid>
```

--------------------------------

TITLE: Example Output: Governance Profile List
DESCRIPTION: Shows the expected output format when listing governance profiles using the Anypoint CLI, displaying profile names and IDs in a table.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_14

LANGUAGE: text
CODE:
```
Profile Name                 	Profile Id

Minimum Security Requirements	1f418cf4-b870-4b31-8734-f55f28d45f8f
Best Practices               	19fb211b-8775-43cc-865a-46228921d6ed
New Best Practices           	4eaf9176-3ef9-4021-a67c-6e4bc10d3763
OAS Standards                	51ae8795-2278-407e-942f-becba29af986
```

--------------------------------

TITLE: Upload Asset with Multiple Files Example - Anypoint CLI
DESCRIPTION: Example demonstrating how to use the `--files` flag multiple times to upload different files (like POM and RAML) for a single asset upload command. Each flag instance specifies a classifier/packaging and its corresponding file path.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/exchange-assets.adoc#_snippet_17

LANGUAGE: Shell
CODE:
```
--files'{"pom.xml": "directory/pom-file.xml"}' --files='{"raml.raml": "./my-api.raml"}'
```

--------------------------------

TITLE: Specifying Version Strategy Criteria for Anypoint CLI Publish (Shell)
DESCRIPTION: Example demonstrating how to use multiple `--version-strategy-criteria` flags to define conditions that determine the version strategy for the `api-catalog publish-asset` command. These criteria are compared against `versionStrategyConditions` in the descriptor file.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-catalog.adoc#_snippet_7

LANGUAGE: shell
CODE:
```
--version-strategy-criteria=branch:main --version-strategy-criteria=anytag:release/ --version-strategy-criteria=user:admin
```

--------------------------------

TITLE: Anypoint CLI v4 Command Syntax Examples (Shell)
DESCRIPTION: Anypoint CLI 4.x allows using either a colon (:) or a space as a separator between command parameters.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/diff-earlier-ver.adoc#_snippet_1

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 exchange:asset:resource:list
```

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 exchange asset resource list
```

--------------------------------

TITLE: Example API Specification Schema (YAML)
DESCRIPTION: This snippet shows an example structure of schema definitions within an API specification file (like RAML or OpenAPI) that the `governance:api:inspect` command would process.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_2

LANGUAGE: yaml
CODE:
```
types:
  patientmultipleBirthBoolean:
    properties:
      multipleBirthBoolean:
        description: Whether patient is part of a multiple birth
        type: boolean
  patientmultipleBirthInteger:
    properties:
      multipleBirthInteger:
        description: Whether patient is part of a multiple birth
        type: integer
  
        .
        .
        .

  PatientEntry:
    type: FHIR_commons.Entry
    properties:
      resource: Patient

  PatientBundle:
    type: FHIR_commons.Bundle
    properties:
      entry?: PatientEntry[]
```

--------------------------------

TITLE: Example: Authenticating Anypoint CLI via Command Line (Username/Password)
DESCRIPTION: Authenticate and run an Anypoint CLI command by providing the username, password, and optionally the organization ID directly as command-line parameters.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/auth.adoc#_snippet_4

LANGUAGE: shell
CODE:
```
$ anypoint-cli-v4 account:environment:list --username myUserName --password myPassword --organization myOrgId
```

--------------------------------

TITLE: Anypoint CLI Pointcut Example
DESCRIPTION: Example of passing pointcut data as a JSON string using the `--pointcut` flag. This defines criteria for applying a policy based on HTTP method and URI template.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_20

LANGUAGE: CLI
CODE:
```
--pointcut '[{\"methodRegex\":\"GET\\|PUT\",\"uriTemplateRegex\":\"/users*\"}]'
```

--------------------------------

TITLE: Anypoint CLI Auto Approve Flag Example (Add Tier)
DESCRIPTION: Example of including the `--autoApprove` flag when adding an SLA tier to indicate it should be auto-approved.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_38

LANGUAGE: CLI
CODE:
```
--autoApprove
```

--------------------------------

TITLE: Anypoint CLI Pointcut Example (Edit)
DESCRIPTION: Example of passing pointcut data as a JSON string using the `--pointcut` flag for the `edit` command. This defines criteria for applying a policy based on HTTP method and URI template.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_33

LANGUAGE: CLI
CODE:
```
-p '[{\"methodRegex\":\"GET\\|PUT\",\"uriTemplateRegex\":\"/users*\"}]'
```

--------------------------------

TITLE: Get Ruleset Info from File (Anypoint CLI)
DESCRIPTION: Lists the rules defined in a local governance ruleset file specified by its path.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_20

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance:ruleset:info myrulesetfolder/myruleset.yaml
```

--------------------------------

TITLE: Initialize Governance Ruleset using Anypoint CLI
DESCRIPTION: Example command to initialize a governance ruleset using the `governance:ruleset:init` command. This command takes a schema as input and can specify target types and a custom ruleset name using flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_23

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 governance:ruleset:init --types patientmultipleBirthBoolean,patientBundle,patientmultipleBirthInteger --name=my-ruleset mydataschema
```

--------------------------------

TITLE: Example Output for Invalid Ruleset Validation
DESCRIPTION: Example console output demonstrating a failed validation of a governance ruleset using the `governance:ruleset:validate` command, including details about the violation such as constraint, message, severity, and location.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_28

LANGUAGE: Text
CODE:
```
Ruleset does not conform with Dialect
ModelId: file:///Users/myuser/myrulesetfolder/prof-1-bad.yaml
Profile: Validation Profile 1.0
Conforms: false
Number of results: 1

Level: Violation

- Constraint: http://a.ml/amf/default_document#/declarations/profileNode_profile_required_validation
  Message: Property 'profile' is mandatory
  Severity: Violation
  Target: file:///Users/myuser/myrulesetfolder/prof-1-bad.yaml#/encodes
  Property: http://schema.org/name
  Range: [(3,0)-(11,19)]
  Location: file:///Users/myuser/myrulesetfolder/prof-1-bad.yaml
```

--------------------------------

TITLE: Anypoint CLI Policy Config JSON Example (Edit)
DESCRIPTION: Example of passing policy configuration data as a JSON string using the `--config` flag for the `edit` command. Note the escaped double quotes within the JSON string.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_30

LANGUAGE: CLI
CODE:
```
--config '{\"username\":\"user\",\"password\":\"teste\"}'
```

--------------------------------

TITLE: Upload API Asset Specifying Main File
DESCRIPTION: Example showing how to upload an API asset and explicitly define the main file using the `--mainFile` option.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/exchange-assets.adoc#_snippet_21

LANGUAGE: Shell
CODE:
```
exchange:asset:upload --mainFile 'api.yml'
```

--------------------------------

TITLE: Upload Custom Asset with Version, Name, and Classifier
DESCRIPTION: Example demonstrating how to upload a custom asset using specific API version, asset name, and classifier options.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/exchange-assets.adoc#_snippet_20

LANGUAGE: Shell
CODE:
```
exchange:asset:upload --apiVersion 1.0 --name testProject --classifier custom
```

--------------------------------

TITLE: Updating Governance Profile (Anypoint CLI)
DESCRIPTION: Provides various examples of using the Anypoint CLI governance:profile:update command. Examples show updating the profile name, filter criteria, notification settings, and rulesets. Requires the profile ID.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_15

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance:profile:update 4eaf9176-3ef9-4021-a67c-6e4bc10d3763 --profile-name "MyOrg Best Practices"
```

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance:profile:update 19fb211b-8775-43cc-865a-46228921d6ed --criteria `tag:best,category:API Type:Experience API,scope:rest-api`
```

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance profile update 67eff44a-28a3-43d4-93d9-bddedb92c711 --notify-publisher  --notify-contact --notify-others a@a.a,b@b.com
```

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance profile update 67eff44a-28a3-43d4-93d9-bddedb92c711 --notify-off
```

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance profile update 19fb211b-8775-43cc-865a-46228921d6ed --criteria `tag:best,category:API Type:Experience API,scope:rest-api,env-type:production` --ruleset-gavs 68ef9520-24e9-4cf2-b2f5-620025690913/open-api-best-practices/latest,68ef9520-24e9-4cf2-b2f5-620025690913/myorg-best-practices/latest
```

--------------------------------

TITLE: Specifying Trigger Criteria for Anypoint CLI Publish (Shell)
DESCRIPTION: Example demonstrating how to use multiple `--trigger-criteria` flags to define conditions that must be met for the `api-catalog publish-asset` command to publish assets. These criteria are compared against `triggerConditions` in the descriptor file.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-catalog.adoc#_snippet_6

LANGUAGE: shell
CODE:
```
--trigger-criteria=branch:main --trigger-criteria=anytag:release/ --trigger=user:admin
```

--------------------------------

TITLE: Anypoint CLI Policy Group ID Example
DESCRIPTION: Example of specifying the Mule 4 policy group ID using the `--groupId` flag. Defaults to the MuleSoft group ID if not provided.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_25

LANGUAGE: CLI
CODE:
```
--groupId 1fec0a49-1551-4199-bfcc-cf0352d0f29d
```

--------------------------------

TITLE: Anypoint Platform CLI: Basic Command Syntax (Console)
DESCRIPTION: Provides the fundamental structure for constructing Anypoint Platform CLI commands, showing the executable name followed by the command, parameters, and optional flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/intro.adoc#_snippet_0

LANGUAGE: console
CODE:
```
$ anypoint-cli-v4 [command]  [parameters] [flags]
```

--------------------------------

TITLE: Example Output: Governance Profile Update
DESCRIPTION: Shows the confirmation message received after successfully updating a governance profile using the Anypoint CLI.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_16

LANGUAGE: text
CODE:
```
 Profile updated 51f9f94c-fb0c-43d4-9895-22c9e64f1537
```

--------------------------------

TITLE: Example: Running Anypoint CLI Command Using Conf File Credentials
DESCRIPTION: After setting credentials in the configuration file using `anypoint-cli-v4 conf`, subsequent commands like `account:environment:list` will automatically use those stored credentials for authentication.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/auth.adoc#_snippet_3

LANGUAGE: shell
CODE:
```
$ anypoint-cli-v4 account:environment:list
```

--------------------------------

TITLE: Uninstalling Anypoint CLI Plugin (Text Command)
DESCRIPTION: This command demonstrates how to uninstall a specific plugin from the Anypoint CLI using the `plugins:uninstall` command. It targets the `anypoint-cli-account-plugin`.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/install.adoc#_snippet_1

LANGUAGE: text
CODE:
```
anypoint-cli-v4 plugins:uninstall anypoint-cli-account-plugin
```

--------------------------------

TITLE: Upload Exchange Asset with New Version (409 Error)
DESCRIPTION: Example command to upload an Exchange asset using `anypoint-cli-v4`, demonstrating how to resolve a 409 Conflict error by incrementing the asset version in the GAV identifier.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/troubleshooting.adoc#_snippet_0

LANGUAGE: bash
CODE:
```
anypoint-cli-v4 exchange asset upload my-auth-best-practices/1.0.1 --name "My Best Practices Ruleset" --description "This ruleset enforces my best practices for APIs." --files='{"ruleset.yaml":"/myRulesetFolder/mynewruleset.yaml","docs.zip":"/myRulesetFolder/ruleset.doc.zip"}'
```

--------------------------------

TITLE: Example: Authenticating Anypoint CLI via Command Line (Client ID/Secret)
DESCRIPTION: Authenticate and run an Anypoint CLI command by providing the client ID, client secret, and optionally the organization ID directly as command-line parameters, suitable for Connected Apps.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/auth.adoc#_snippet_5

LANGUAGE: shell
CODE:
```
$ anypoint-cli-v4 account:environment:list --client_id myClientID --client_secret myClientSecret --organization myOrgId
```

--------------------------------

TITLE: Get Anypoint Runtime Manager Server Registration Token (CLI)
DESCRIPTION: Retrieves a registration token required to register a new local server with Anypoint Runtime Manager.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/servers.adoc#_snippet_4

LANGUAGE: CLI
CODE:
```
> runtime-mgr:server:token [flags]
```

--------------------------------

TITLE: Creating Governance Profiles with Anypoint CLI
DESCRIPTION: Demonstrates how to create new governance profiles using the `anypoint-cli-v4 governance:profile:create` command. Examples show variations with different criteria, descriptions, and notification settings. The command requires a profile name, ruleset GAV coordinates, and optional flags like `--criteria`, `--description`, `--notify-publisher`, `--notify-contact`, and `--notify-others`.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_10

LANGUAGE: cli
CODE:
```
anypoint-cli-v4 governance:profile:create "OAS Best Practices" 68ef9520-24e9-4cf2-b2f5-620025690913/open-api-best-practices/1.0.1 --criteria "tag:oas,category:API Type:Experience API,scope:rest-api" --description "Profile for OAS Best Practices"

anypoint-cli-v4 governance:profile:create "Open API Best Practices" 68ef9520-24e9-4cf2-b2f5-620025690913/open-api-best-practices/1.0.1 --criteria "tag:oas,category:API Type:Experience API,scope:rest-api" --description "Profile for OAS Best Practices"

anypoint-cli-v4 governance:profile:create "Anypoint Best Practices" 68ef9520-24e9-4cf2-b2f5-620025690913/anypoint-api-best-practices/1.0.1 --criteria "tag:raml tag:oas category:API Type:Experience API,scope:rest-api" --description "Profile for REST API Best Practices" --notify-publisher  --notify-contact --notify-others a@a.a,b@b.com

anypoint-cli-v4 governance:profile:create "Primary API Standards" 68ef9520-24e9-4cf2-b2f5-620025690913/open-api-best-practices/latest,68ef9520-24e9-4cf2-b2f5-620025690913/myorg-best-practices/1.0.2 --criteria "tag:prim,category:API Type:Experience API,scope:rest-api" --description "Profile for Primary API Standards"
```

--------------------------------

TITLE: Get Ruleset Info from Exchange (Anypoint CLI)
DESCRIPTION: Lists the rules defined in a governance ruleset published in Exchange using its specific asset identifier and the `--remote` flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_21

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance:ruleset:info 68ef9520-24e9-4cf2-b2f5-620025690913/anypoint-best-practices/1.0.2 --remote
```

--------------------------------

TITLE: Uninstalling Anypoint CLI (npm)
DESCRIPTION: This command uses npm to globally uninstall the Anypoint CLI package. The `-g` flag ensures it is removed from the global npm packages.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/install.adoc#_snippet_2

LANGUAGE: text
CODE:
```
npm uninstall -g anypoint-cli-v4
```

--------------------------------

TITLE: Download API Proxy with Gateway Version - Anypoint CLI - Shell
DESCRIPTION: Provides an example of using the `api-mgr:api:download-proxy` command with the `--gatewayVersion` flag to specify the desired gateway version for the downloaded proxy.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_10

LANGUAGE: shell
CODE:
```
api-mgr:api:download-proxy --gatewayVersion: 4.0.1  643404 /tmp/
```

--------------------------------

TITLE: Listing CloudHub Runtimes CLI
DESCRIPTION: Lists all supported CloudHub runtimes. This command accepts the standard default flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-apps.adoc#_snippet_15

LANGUAGE: cli
CODE:
```
> cloudhub:runtime:list [flags]
```

--------------------------------

TITLE: Set Asset Version Flag (CLI)
DESCRIPTION: Example of setting the version of the Exchange application to use using the `--assetVersion` flag with the Anypoint CLI modify command.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_18

LANGUAGE: shell
CODE:
```
--assetVersion 2.0.4
```

--------------------------------

TITLE: List Projects: Anypoint CLI CLI
DESCRIPTION: Lists all your Design Center projects. Supports pagination flags (`--pageIndex`, `--pageSize`) and output format specification (`--output`).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/design-center.adoc#_snippet_3

LANGUAGE: CLI
CODE:
```
> designcenter:project:list [flags] [searchText]
```

--------------------------------

TITLE: Upload Exchange Asset with New ID (409 Error)
DESCRIPTION: Example command to upload an Exchange asset using `anypoint-cli-v4`, demonstrating how to resolve a 409 Conflict error by changing the asset ID in the GAV identifier.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/troubleshooting.adoc#_snippet_1

LANGUAGE: bash
CODE:
```
anypoint-cli-v4 exchange asset upload my-new-auth-best-practices/1.0.0 --name "My Best Practices Ruleset" --description "This ruleset enforces my best practices for APIs." --files='{"ruleset.yaml":"/myRulesetFolder/mynewruleset.yaml","docs.zip":"/myRulesetFolder/ruleset.doc.zip"}'
```

--------------------------------

TITLE: Set Instance Type Flag (CLI)
DESCRIPTION: Example of setting the instance type using the `--instanceType` flag with the Anypoint CLI modify command. This flag is only available for UBP organizations.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_23

LANGUAGE: shell
CODE:
```
--instanceType mule.nano
```

--------------------------------

TITLE: Set Replica Size Flag (CLI)
DESCRIPTION: Example of setting the size of replicas in Vcores using the `--replicaSize` flag with the Anypoint CLI modify command. This flag is used for non-UBP organizations.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_13

LANGUAGE: shell
CODE:
```
--replicaSize 0.5
```

--------------------------------

TITLE: Set Replicas Flag (CLI)
DESCRIPTION: Example of setting the number of replicas for an application using the `--replicas` flag with the Anypoint CLI modify command. The value must be greater than 0.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_12

LANGUAGE: shell
CODE:
```
--replicas 2
```

--------------------------------

TITLE: Set Property Flag (CLI)
DESCRIPTION: Example of setting a custom property for an application using the `--property` flag with the Anypoint CLI modify command. The format is `name:value`.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_8

LANGUAGE: shell
CODE:
```
--property testproperty:true
```

--------------------------------

TITLE: List Anypoint Environments - CLI
DESCRIPTION: Lists all your environments in Anypoint Platform. It returns your environment name, Id and whether it's sandboxed or not. Supports specifying output format (`table` or `json`).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/account.adoc#_snippet_5

LANGUAGE: Shell
CODE:
```
> account:environment:list [flags]
```

--------------------------------

TITLE: Using api-catalog publish-asset Command
DESCRIPTION: Provides the syntax for the api-catalog publish-asset command, which publishes assets to Exchange based on a descriptor file. It accepts general and authentication flags, as well as specific flags for asynchronous publishing, specifying the descriptor file, dry run, or force publishing.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-catalog.adoc#_snippet_5

LANGUAGE: Shell
CODE:
```
> api-catalog publish-asset [flags]
```

--------------------------------

TITLE: Set Artifact ID Flag (CLI)
DESCRIPTION: Example of setting the artifact ID of the application retrieved from Exchange using the `--artifactId` flag with the Anypoint CLI modify command.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_17

LANGUAGE: shell
CODE:
```
--artifactId mule-maven-plugin
```

--------------------------------

TITLE: Get Latest Ruleset Info from Exchange (Anypoint CLI)
DESCRIPTION: Lists the rules defined in the latest version of a governance ruleset published in Exchange using its asset identifier with 'latest' version and the `--remote` flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_22

LANGUAGE: shell
CODE:
```
anypoint-cli-v4  governance:ruleset:info 68ef9520-24e9-4cf2-b2f5-620025690913/anypoint-best-practices/latest --remote
```

--------------------------------

TITLE: Syntax: governance:profile:create Command
DESCRIPTION: Defines the command-line syntax for the `governance:profile:create` command, showing the required arguments (`profile-name`, `ruleset-asset-identifiers`) and optional `flags`.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_9

LANGUAGE: text
CODE:
```
> governance:profile:create [flags] <profile-name> <ruleset-asset-identifiers>
```

--------------------------------

TITLE: Viewing Governance Profile Information with Anypoint CLI
DESCRIPTION: Provides an example of using the `anypoint-cli-v4 governance:profile:info` command to retrieve detailed information for a specific governance profile. The command requires the profile ID and supports an optional `--output` flag to specify the format (table or json).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_12

LANGUAGE: cli
CODE:
```
anypoint-cli-v4 governance:profile:info 19fb211b-8775-43cc-865a-46228921d6ed
```

--------------------------------

TITLE: Describe Standalone Application - Anypoint CLI
DESCRIPTION: Shows detailed information for a standalone application specified by its identifier. Supports output formats like table (default) and JSON using the --output flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/standalone-apps.adoc#_snippet_6

LANGUAGE: shell
CODE:
```
> runtime-mgr:standalone-application:describe [flags] <identifier>
```

--------------------------------

TITLE: Set Java Version Flag (CLI)
DESCRIPTION: Example of setting the Java version for an application using the `--javaVersion` flag with the Anypoint CLI modify command. Supported values are '8' and '17'.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_6

LANGUAGE: shell
CODE:
```
--javaVersion 8
```

--------------------------------

TITLE: Disable Clustered Flag (CLI)
DESCRIPTION: Example of disabling clustered nodes using the `--no-clustered` flag with the Anypoint CLI modify command. By default, clustering is disabled.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_19

LANGUAGE: shell
CODE:
```
--no-clustered
```

--------------------------------

TITLE: Upload Exchange Asset with New ID (Generic Publish Error)
DESCRIPTION: Example command to upload an Exchange asset using `anypoint-cli-v4`, demonstrating how to resolve a generic 'unable to publish' error by changing the asset ID in the GAV identifier.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/troubleshooting.adoc#_snippet_2

LANGUAGE: bash
CODE:
```
anypoint-cli-v4 exchange asset upload my-new-auth-best-practices/1.0.0 --name "My Best Practices Ruleset" --description "This ruleset enforces my best practices for APIs." --files='{"ruleset.yaml":"/myRulesetFolder/mynewruleset.yaml","docs.zip":"/myRulesetFolder/ruleset.doc.zip"}'
```

--------------------------------

TITLE: Authenticate & List Environments using Bearer Token (Anypoint CLI)
DESCRIPTION: Demonstrates authenticating to Anypoint Platform using a bearer token passed directly as a command-line argument to the Anypoint CLI, and then listing the environments for a specified organization.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/auth.adoc#_snippet_6

LANGUAGE: bash
CODE:
```
$ anypoint-cli-v4 account:environment:list --bearer myBearerToken --organization myOrgId
```

--------------------------------

TITLE: Anypoint CLI Rate Limit Policy Configuration JSON
DESCRIPTION: Example JSON configuration for a rate limit policy, defining the maximum requests and time period. This structure is used when applying or editing policies that require configuration data.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_23

LANGUAGE: JSON
CODE:
```
{
        "rateLimits": [{
            "maximumRequests": 1,
            "timePeriodInMilliseconds": 10000
        }],
        "clusterizable": true,
        "exposeHeaders": false
    }
```

--------------------------------

TITLE: Anypoint Platform CLI: Multi-Option Flags Before Parameters (Console)
DESCRIPTION: Demonstrates how to specify multiple values for a flag by repeating the flag name before the command's parameters.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/intro.adoc#_snippet_1

LANGUAGE: console
CODE:
```
anypoint-cli-v4 governance:api:validate param1 param2 --rulesets value1 --rulesets value2 --rulesets value3
```

--------------------------------

TITLE: Validate Governance Ruleset ZIP using Anypoint CLI
DESCRIPTION: Example command to validate a governance ruleset packaged within a ZIP file using the `governance:ruleset:validate` command. The ZIP should contain an API project with an `exchange.json` file referencing the ruleset.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_25

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 governance:ruleset:validate ~/myrulesetfolder/myruleset.zip
```

--------------------------------

TITLE: Using api-catalog create-descriptor Command
DESCRIPTION: Presents the syntax for the api-catalog create-descriptor command, which generates a catalog descriptor file. It accepts flags to specify the output file name/location or to generate external exchange.json files.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-catalog.adoc#_snippet_3

LANGUAGE: Shell
CODE:
```
> api-catalog create-descriptor [flags]
```

--------------------------------

TITLE: Set Update Strategy Flag (CLI)
DESCRIPTION: Example of setting the update strategy used for application deployment using the `--updateStrategy` flag with the Anypoint CLI modify command. The default strategy is `rolling`.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_16

LANGUAGE: shell
CODE:
```
--updateStrategy recreate
```

--------------------------------

TITLE: Promote API Instance (Anypoint CLI)
DESCRIPTION: Promotes the specified API instance from the source environment. Use flags to copy alerts, policies, or tiers, specify output format, or provide a provider ID.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_14

LANGUAGE: shell
CODE:
```
> api-mgr:api:promote [flags] <apiInstanceId> <sourceEnvId>
```

--------------------------------

TITLE: Set Public Endpoints Flag (CLI)
DESCRIPTION: Example of supplying endpoints reachable via the public internet using the `--publicEndpoints` flag with the Anypoint CLI modify command. Endpoints should be separated by commas with no spaces.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_10

LANGUAGE: shell
CODE:
```
--publicEndpoints my-superapp-example/status?limit=10
```

--------------------------------

TITLE: Validate Governance Ruleset YAML using Anypoint CLI
DESCRIPTION: Example command to validate a governance ruleset defined in a YAML file using the `governance:ruleset:validate` command. The command checks if the ruleset conforms to the expected dialect.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_24

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 governance:ruleset:validate ~/myrulesetfolder/myruleset.yaml
```

--------------------------------

TITLE: Set Path Rewrite Flag (CLI)
DESCRIPTION: Example of setting the base path expected by the HTTP listener using the `--pathRewrite` flag with the Anypoint CLI modify command. The format must begin with a forward slash.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_7

LANGUAGE: shell
CODE:
```
--pathRewrite /http://localhost:3000
```

--------------------------------

TITLE: Set Application Property with Escaped Value (Shell)
DESCRIPTION: Example demonstrating how to use the `--property` flag to set an application property when deploying or copying an application. Shows how to escape special characters like '=' within the value.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-apps.adoc#_snippet_5

LANGUAGE: Shell
CODE:
```
--property "salesforce.password:qa\=34534"
```

--------------------------------

TITLE: Validate Governance Ruleset Folder using Anypoint CLI
DESCRIPTION: Example command to validate a governance ruleset located within a project folder using the `governance:ruleset:validate` command. The folder should contain an API project with an `exchange.json` file referencing the ruleset.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_26

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 governance:ruleset:validate ~/myrulesetfolder/myrulesetfolder
```

--------------------------------

TITLE: runtime-mgr:cloudhub-application:copy
DESCRIPTION: Copies the CloudHub application passed in source to the target passed in target. Arguments source and target should be formatted as follows: ([group_id]/)<asset_id>/<version>. If group_id is not specified, it defaults to the currently selected Organization ID. Running this command requires your user to have read/write access to the /tmp directory of the OS where CLI is installed. In addition to the default flags, this command accepts additional flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-apps.adoc#_snippet_2

LANGUAGE: Shell
CODE:
```
> runtime-mgr:cloudhub-application:copy <source> <target> [flags]
```

--------------------------------

TITLE: Disable Forward SSL Session Flag (CLI)
DESCRIPTION: Example of disabling SSL session forwarding using the `--no-forwardSslSession` flag with the Anypoint CLI modify command. By default, forwarding is disabled.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_21

LANGUAGE: shell
CODE:
```
--no-forwardSslSession
```

--------------------------------

TITLE: Disable Object Store V2 Flag (CLI)
DESCRIPTION: Example of disabling Object Store V2 using the `--no-objectStoreV2` flag with the Anypoint CLI modify command. By default, Object Store V2 is disabled.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_25

LANGUAGE: shell
CODE:
```
--no-objectStoreV2
```

--------------------------------

TITLE: Get Autodiscovery Properties: Anypoint CLI API Manager: shell
DESCRIPTION: Retrieves autodiscovery properties for a given API instance, required for gateway tracking. Allows specifying gateway version and output format.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_2

LANGUAGE: shell
CODE:
```
> api-mgr:api:autodiscovery [flags] <apiInstanceId> <name>
```

--------------------------------

TITLE: Create Anypoint Environment - CLI
DESCRIPTION: Creates a new environment with the specified name. The environment type can be set using the `--type` flag, supporting 'design', 'production', or 'sandbox'. Defaults to 'sandbox' if no type is specified. Supports specifying output format (`table` or `json`).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/account.adoc#_snippet_2

LANGUAGE: Shell
CODE:
```
> account:environment:create [flags] <name>
```

--------------------------------

TITLE: Set Scope Logging Config File Flag (CLI)
DESCRIPTION: Example of uploading a file to define scope logging using the `--scopeLoggingConfigFile` flag with the Anypoint CLI modify command. The file should contain tuples in a specified format.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_15

LANGUAGE: shell
CODE:
```
--scopeLoggingConfigFile /Users/mule/Documents/cert.txt
```

--------------------------------

TITLE: Set Group ID Flag (CLI)
DESCRIPTION: Example of setting the Group ID of the asset to deploy using the `--groupId` flag with the Anypoint CLI modify command. Defaults to the selected organization ID.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_22

LANGUAGE: shell
CODE:
```
--groupId org.mule.testgroup
```

--------------------------------

TITLE: Set Scope Logging Config Flag (CLI)
DESCRIPTION: Example of defining scope logging configurations using the `--scopeLoggingConfig` flag with the Anypoint CLI modify command. The format is `scopeName: logLevel`, separated by commas.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_14

LANGUAGE: shell
CODE:
```
--scopeLoggingConfig testscope1:WARN,testscope2:DEBUG
```

--------------------------------

TITLE: List CloudHub Applications (CLI)
DESCRIPTION: Lists all applications available in your Anypoint Platform CLI context. The output includes the application name, status, assigned vCores, and last update time. The `--output` flag allows specifying the response format as table (default) or json.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-apps.adoc#_snippet_8

LANGUAGE: bash
CODE:
```
> runtime-mgr:cloudhub-application:list [flags]
```

--------------------------------

TITLE: Set Release Channel Flag (CLI)
DESCRIPTION: Example of setting the release channel for the selected Mule version using the `--releaseChannel` flag with the Anypoint CLI modify command. Supported values are `NONE`, `EDGE`, and `LTS`.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_11

LANGUAGE: shell
CODE:
```
--releaseChannel LTS
```

--------------------------------

TITLE: Set Properties File Flag (CLI)
DESCRIPTION: Example of replacing all properties with values from a selected file using the `--propertiesFile` flag with the Anypoint CLI modify command. The file should contain properties in `name: value` format, one per line.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_9

LANGUAGE: shell
CODE:
```
--propertiesFile /Users/mule/Documents/properties.txt
```

--------------------------------

TITLE: Downloading Exchange Asset Page (CLI)
DESCRIPTION: Downloads a specific description page, or all pages if no page name is provided, for an Exchange asset to a local directory. The pages are downloaded in Markdown format and this command only supports published pages.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/exchange-assets.adoc#_snippet_5

LANGUAGE: cli
CODE:
```
> exchange:asset:page:download [flags] <assetIdentifier> <directory> [pageName]
```

--------------------------------

TITLE: Disable AM Log Forwarding Flag (CLI)
DESCRIPTION: Example of disabling forwarding application logs to Anypoint Monitoring using the `--disableAmLogForwarding` flag with the Anypoint CLI modify command. By default, forwarding is enabled.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_20

LANGUAGE: shell
CODE:
```
--disableAmLogForwarding
```

--------------------------------

TITLE: Download Standalone Application Artifact (Anypoint CLI)
DESCRIPTION: Downloads the application artifact binary for a standalone application identified by its ID or name to a specified local directory. This command requires the application identifier and the destination directory path.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/standalone-apps.adoc#_snippet_0

LANGUAGE: Shell
CODE:
```
> runtime-mgr:standalone-application:artifact [flags] <identifier> <directory>
```

--------------------------------

TITLE: Disable Last Mile Security Flag (CLI)
DESCRIPTION: Example of disabling Last Mile Security using the `--no-lastMileSecurity` flag with the Anypoint CLI modify command. By default, Last Mile Security is disabled.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub2-apps.adoc#_snippet_24

LANGUAGE: shell
CODE:
```
--no-lastMileSecurity
```

--------------------------------

TITLE: Anypoint CLI Upload Command with Escaped JSON
DESCRIPTION: An example of the exchange asset upload command demonstrating how to escape JSON content within the --files argument for use in environments where the JSON string needs protection from shell interpretation, specifically showing escaping of double quotes (\\") and forward slashes (\/).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/troubleshooting.adoc#_snippet_5

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 exchange asset upload my-auth-best-practices/1.0.0 --name "My Best Practices Ruleset" --description "This ruleset enforces my best practices for APIs." --files='{\"ruleset.yaml\":\"\/myRulesetFolder\/mynewruleset.yaml\",\"docs.zip\":\"\/myRulesetFolder\/ruleset.doc.zip\"}'
```

--------------------------------

TITLE: Authenticate & List Environments using Client ID/Secret Env Vars (Anypoint CLI)
DESCRIPTION: Illustrates authenticating the Anypoint CLI by setting the ANYPOINT_CLIENT_ID, ANYPOINT_CLIENT_SECRET, and ANYPOINT_ORG environment variables before running a command to list environments.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/auth.adoc#_snippet_8

LANGUAGE: bash
CODE:
```
$ export ANYPOINT_CLIENT_ID=myClientID
$ export ANYPOINT_CLIENT_SECRET=myCLientSecret
$ export ANYPOINT_ORG=myOrgId
$ anypoint-cli-v4 account:environment:list
```

--------------------------------

TITLE: Upload Project: Anypoint CLI CLI
DESCRIPTION: Uploads content from a local directory into an existing Design Center project specified by name.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/design-center.adoc#_snippet_5

LANGUAGE: CLI
CODE:
```
> designcenter:project:upload [flags] <name> <projDir>
```

--------------------------------

TITLE: Describe Anypoint Runtime Manager Server (CLI)
DESCRIPTION: Describes the details of a specific server identified by its serverId. Supports output formats like table (default) and json using the --output flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/servers.adoc#_snippet_0

LANGUAGE: CLI
CODE:
```
> runtime-mgr:server:describe [flags] <serverId>
```

--------------------------------

TITLE: List Standalone Applications - Anypoint CLI
DESCRIPTION: Lists all standalone (on-premises) applications. Supports flags for limiting results (--limit), offsetting (--offset), and specifying output format (--output).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/standalone-apps.adoc#_snippet_7

LANGUAGE: shell
CODE:
```
> runtime-mgr:standalone-application:list [flags]
```

--------------------------------

TITLE: Describe Anypoint VPC Firewall Rules (Shell)
DESCRIPTION: Lists all configured firewall rules for a specified Anypoint VPC. Supports `table` (default) and `json` output formats via the --output flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-vpc.adoc#_snippet_10

LANGUAGE: Shell
CODE:
```
> cloudhub:vpc:firewall-rules:describe <vpc>
```

--------------------------------

TITLE: Anypoint Platform CLI: Multi-Option Flags Before Parameters with Separator (Console)
DESCRIPTION: Shows an alternative syntax for handling multi-option flags by placing them before a double dash (--) separator, which precedes the command's parameters.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/intro.adoc#_snippet_2

LANGUAGE: console
CODE:
```
anypoint-cli-v4 governance:api:validate --rulesets value1 --rulesets value2 --rulesets value3 -- param1 param2
```

--------------------------------

TITLE: Authenticate & List Environments using Username/Password Env Vars (Anypoint CLI)
DESCRIPTION: Shows how to authenticate the Anypoint CLI by setting the ANYPOINT_USERNAME, ANYPOINT_PASSWORD, and ANYPOINT_ORG environment variables before executing a command to list environments.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/auth.adoc#_snippet_7

LANGUAGE: bash
CODE:
```
$ export ANYPOINT_USERNAME=myUserName
$ export ANYPOINT_PASSWORD=myPassword
$ export ANYPOINT_ORG=myOrgId
$ anypoint-cli-v4 account:environment:list
```

--------------------------------

TITLE: Describe Anypoint Environment - CLI
DESCRIPTION: Returns information about the environment specified in `<name>`. If no `<name>` is provided, this command returns information about the current session's environment. Supports specifying output format (`table` or `json`).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/account.adoc#_snippet_4

LANGUAGE: Shell
CODE:
```
> account:environment:describe [flags] <name>
```

--------------------------------

TITLE: Describe Anypoint VPC - Anypoint CLI
DESCRIPTION: Displays detailed information about the specified Anypoint VPC. Requires the VPC name as an argument. Accepts default flags and supports table (default) or json output formats using the --output flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-vpc.adoc#_snippet_4

LANGUAGE: shell
CODE:
```
cloudhub:vpc:describe [flags] <name>
```

--------------------------------

TITLE: Cloning Governance Ruleset Syntax (Anypoint CLI)
DESCRIPTION: Displays the command syntax for cloning a governance ruleset using the Anypoint CLI. It shows the required arguments: the source ruleset, new title, and new description.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_17

LANGUAGE: shell
CODE:
```
> governance:ruleset:clone [flags] <ruleset> <new_title> <new_description>
```

--------------------------------

TITLE: runtime-mgr:cloudhub-alert:list
DESCRIPTION: Lists all alerts associated with your current environment. Use the --output flag to specify the response format. Supported values are table (default) and json. This command accepts the default flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-apps.adoc#_snippet_1

LANGUAGE: Shell
CODE:
```
> runtime-mgr:cloudhub-alert:list [flags]
```

--------------------------------

TITLE: Describe Anypoint User Account - CLI
DESCRIPTION: Returns your account information, including your username, your full name, your email address, and the creation date of your account. Supports specifying output format (`table` or `json`).

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/account.adoc#_snippet_6

LANGUAGE: Shell
CODE:
```
> account:user:describe  [flags]
```

--------------------------------

TITLE: Describe CloudHub Load Balancer Mappings (CLI)
DESCRIPTION: Lists the mapping rules for a specified CloudHub load balancer. Optionally filter by certificate name. Supports table and JSON output formats.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-dlb.adoc#_snippet_3

LANGUAGE: shell
CODE:
```
> cloudhub:load-balancer:mappings:describe <name> [certificateName]
```

--------------------------------

TITLE: runtime-mgr:cloudhub-alert-history:describe
DESCRIPTION: Describes the history of the alarm passed in <name>. Use the --output flag to specify the response format. Supported values are table (default) and json. This command accepts the default flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-apps.adoc#_snippet_0

LANGUAGE: Shell
CODE:
```
> runtime-mgr:cloudhub-alert-history:describe [flags] <name>
```

--------------------------------

TITLE: Publish Project: Anypoint CLI CLI
DESCRIPTION: Publishes the specified Design Center project to Exchange. Flags not explicitly provided are extracted from `exchange.json`. Supports specifying API version, asset ID, group ID, main file, name, status, tags, and version.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/design-center.adoc#_snippet_4

LANGUAGE: CLI
CODE:
```
> designcenter:project:publish [flags] <projectName>
```

--------------------------------

TITLE: Using api-catalog conf Command
DESCRIPTION: Shows the syntax for the api-catalog conf command, used to manage authentication credentials in the config.json file. It requires an authentication key name and its corresponding value, and accepts flags for deleting, showing keys, or showing values.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-catalog.adoc#_snippet_2

LANGUAGE: Shell
CODE:
```
> api-catalog conf <authkey> <authkeyvalue> [flags]
```

--------------------------------

TITLE: List Anypoint Runtime Manager Servers (CLI)
DESCRIPTION: Lists all local servers registered within your Anypoint environment. Supports output formats like table (default) and json using the --output flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/servers.adoc#_snippet_2

LANGUAGE: CLI
CODE:
```
> runtime-mgr:server:list [flags]
```

--------------------------------

TITLE: Setting Credentials with Anypoint CLI v4 (Shell)
DESCRIPTION: Anypoint CLI 4.x requires setting credentials using the `conf` command. Authentication is exclusively via Connected Apps.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/diff-earlier-ver.adoc#_snippet_0

LANGUAGE: Shell
CODE:
```
anypoint-cli-v4 conf
```

--------------------------------

TITLE: Listing CloudHub Regions CLI
DESCRIPTION: Lists all supported CloudHub regions. The output format can be specified using the --output flag (table or json). This command accepts the standard default flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-apps.adoc#_snippet_14

LANGUAGE: cli
CODE:
```
> cloudhub:region:list [flags]
```

--------------------------------

TITLE: List Server Groups - Anypoint CLI
DESCRIPTION: Lists all server groups currently configured within the environment. The output format can be specified using the --output flag, supporting 'table' (default) and 'json'. This command accepts standard default flags.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/server-groups.adoc#_snippet_4

LANGUAGE: Shell
CODE:
```
> runtime-mgr:serverGroup:list [flags]
```

--------------------------------

TITLE: List Anypoint VPCs (Shell)
DESCRIPTION: Lists all available Anypoint VPCs in the organization, showing ID, region, environment, and default status. Supports `table` (default) and `json` output formats via the --output flag.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/cloudhub-vpc.adoc#_snippet_12

LANGUAGE: Shell
CODE:
```
> cloudhub:vpc:list [flags]
```

--------------------------------

TITLE: Describe API Instance - Anypoint CLI - Shell
DESCRIPTION: Shows the command signature for displaying details of an API instance using the Anypoint CLI. It requires the API instance ID and accepts standard flags, including `--output` for format specification.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-mgr.adoc#_snippet_8

LANGUAGE: shell
CODE:
```
> api-mgr:api:describe [flags] <apiInstanceId>
```

--------------------------------

TITLE: Download Project: Anypoint CLI CLI
DESCRIPTION: Downloads the content of a Design Center project specified by name to a local directory. An optional flag `--resolveDependenciesTimeout` can set a timeout for dependency resolution.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/design-center.adoc#_snippet_2

LANGUAGE: CLI
CODE:
```
> designcenter:project:download [flags] <name> <targetDir>
```

--------------------------------

TITLE: Clone Ruleset from File (Anypoint CLI)
DESCRIPTION: Clones a local governance ruleset file, sets a new title and description, applies rule severity updates (warning), and redirects the output to a new file.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/api-governance.adoc#_snippet_18

LANGUAGE: shell
CODE:
```
anypoint-cli-v4 governance:ruleset:clone ~/Downloads/ruleset.yaml 'New Ruleset from Clone' 'Cloned from ruleset.yaml' --warning=operation-default-response,operation-operationId > mynewruleset.yaml
```

--------------------------------

TITLE: Deploy Standalone Application (Anypoint CLI)
DESCRIPTION: Deploys or redeploys a standalone application from a local ZIP file to a specified on-premises target (server, server group, or cluster) identified by its ID or name. Requires the target identifier, the desired application name, and the path to the application ZIP file.

SOURCE: https://github.com/mulesoft/docs-anypoint-cli/blob/v4.x/modules/ROOT/pages/_partials/standalone-apps.adoc#_snippet_5

LANGUAGE: Shell
CODE:
```
> runtime-mgr:standalone-application:deploy [flags] <targetIdentifier> <name> <zipfile>
```