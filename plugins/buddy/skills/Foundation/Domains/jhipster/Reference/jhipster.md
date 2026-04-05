================
CODE SNIPPETS
================
TITLE: Install JHipster Core
DESCRIPTION: Shows how to install the 'jhipster-core' package locally using npm, saving it to the package.json file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_2

LANGUAGE: shell
CODE:
```
npm install jhipster-core --save
```

--------------------------------

TITLE: Install JHipster and Create a New Project
DESCRIPTION: This snippet demonstrates the command-line steps to install JHipster globally using npm, create a new application directory, navigate into it, and then run JHipster to generate a new project based on user prompts.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/getting-started.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster
mkdir myApp && cd myApp
jhipster
```

--------------------------------

TITLE: Basic Microservice Application JDL
DESCRIPTION: A basic JDL example defining a microservice application named 'jhipster'. This serves as a starting point for generating applications.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_4

LANGUAGE: jdl
CODE:
```
application {
  config {
    baseName jhipster
    applicationType microservice
  }
}
```

--------------------------------

TITLE: Generate Application with Gradle Build Tool
DESCRIPTION: An extended JDL example for generating an application, specifying configuration details such as base name, application type, server port, and build tool (Gradle).

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_7

LANGUAGE: jdl
CODE:
```
application {
  config {
    baseName jhipster
    applicationType microservice
    serverPort 4242
    buildTool gradle
  }
}
```

--------------------------------

TITLE: Start JHipster Local Development Server
DESCRIPTION: Starts a local development server for JHipster. It automatically opens the application in a browser and enables live reloading for most changes.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/README.md#_snippet_1

LANGUAGE: bash
CODE:
```
npm start
```

--------------------------------

TITLE: JHipster JDL: Kubernetes Deployment
DESCRIPTION: Defines a Kubernetes deployment configuration for JHipster applications using JDL. This example includes custom options such as service discovery type, Istio injection, Kubernetes service type, namespace, and ingress domain.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_21

LANGUAGE: JDL
CODE:
```
deployment {
  deploymentType kubernetes
  appsFolders [store, invoice, notification, product]
  dockerRepositoryName "yourDockerLoginName"
  serviceDiscoveryType no
  istio autoInjection
  kubernetesServiceType Ingress
  kubernetesNamespace jhipster
  ingressDomain "jhipster.192.168.99.100.nip.io"
}
```

--------------------------------

TITLE: Install Jenkins on Red Hat/CentOS
DESCRIPTION: Installs Jenkins on Red Hat-based Linux distributions by downloading the repository configuration, importing the GPG key, installing the Jenkins package, and starting the Jenkins service.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/setting-up-ci-linux.mdx#_snippet_0

LANGUAGE: shell
CODE:
```
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins

sudo service jenkins start
```

--------------------------------

TITLE: Generate Application with Inline JDL
DESCRIPTION: Demonstrates generating an application using an inline JDL code snippet directly in the CLI command.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_3

LANGUAGE: shell
CODE:
```
jhipster jdl --inline "application { config { baseName jhipster, applicationType microservice } }"
```

--------------------------------

TITLE: Generate Application from JHipster JDL Samples
DESCRIPTION: Shows how to generate an application by specifying a filename from the JHipster JDL samples repository, which the CLI automatically resolves.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_6

LANGUAGE: shell
CODE:
```
jhipster jdl default.jdl
```

--------------------------------

TITLE: Generate Application with Remote JDL URL
DESCRIPTION: Illustrates how to use the JHipster CLI to generate an application by providing a URL to a remote JDL file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_5

LANGUAGE: shell
CODE:
```
jhipster jdl https://my-site.com/my.jdl
jhipster jdl https://gist.githubusercontent.com/user/id/raw/id/myapp.jdl
```

--------------------------------

TITLE: Generate Entities with JHipster JDL
DESCRIPTION: This command shows how to import a JHipster JDL (JHipster Domain Language) file to generate entities and their configurations for a JHipster project.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/getting-started.mdx#_snippet_1

LANGUAGE: bash
CODE:
```
jhipster import-jdl jhipster-jdl.jdl
```

--------------------------------

TITLE: Generate Entities with JDL Files
DESCRIPTION: Demonstrates how to generate entities using one or more JDL files with the JHipster CLI. It also shows how to skip entity creation and only generate JSON files using the `--json-only` flag.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_0

LANGUAGE: shell
CODE:
```
jhipster jdl my_file.jdl
jhipster jdl my_file1.jdl my_file2.jdl
jhipster jdl ./my-jdl-file.jdl --json-only
```

--------------------------------

TITLE: Generate Basic Entity
DESCRIPTION: Demonstrates the simplest way to declare an entity in JDL without any fields or explicit table names.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_8

LANGUAGE: jdl
CODE:
```
entity A
```

--------------------------------

TITLE: Run JHipster Application with Maven
DESCRIPTION: Execute the Maven wrapper script to run the generated JHipster application. This command starts the application server.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/installation.mdx#_snippet_12

LANGUAGE: bash
CODE:
```
./mvnw
```

--------------------------------

TITLE: Regenerate Entities with JHipster JDL
DESCRIPTION: Explains how to regenerate entities using JDL files with the JHipster CLI. It covers regenerating all entities with the `--force` flag, which overwrites local changes.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
jhipster jdl ./my-jdl-file.jdl --force
```

--------------------------------

TITLE: Install JHipster Beta using NPM
DESCRIPTION: This command installs the beta version of JHipster using npm. It's the primary method to get this pre-release version for testing.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2023-06-11-jhipster-release-8.0.0-beta.1.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Install JHipster Dependencies
DESCRIPTION: Installs all necessary project dependencies using npm. This is typically the first step after cloning a JHipster project.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/README.md#_snippet_0

LANGUAGE: bash
CODE:
```
npm install
```

--------------------------------

TITLE: Verify Bower and Gulp Installation
DESCRIPTION: Verifies the installation of Bower and Gulp by checking their respective versions. This confirms that the global npm packages were installed correctly and are available in the system's PATH.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/setting-up-ci-windows.mdx#_snippet_2

LANGUAGE: shell
CODE:
```
bower --version
gulp --version
```

--------------------------------

TITLE: Start JHipster Docker Container
DESCRIPTION: Starts a previously stopped Docker container named 'jhipster'. This command resumes the JHipster application without needing to re-create the container.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/installation.mdx#_snippet_7

LANGUAGE: shell
CODE:
```
docker container start jhipster
```

--------------------------------

TITLE: JHipster CLI: Export JDL
DESCRIPTION: Command to export an existing JHipster application's configuration, including applications, entities, relationships, and options, into a single JDL file. The file name can be specified or will default to the application's base name.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_23

LANGUAGE: bash
CODE:
```
jhipster export-jdl <FILE_NAME>
```

--------------------------------

TITLE: Verify PhantomJS Installation
DESCRIPTION: Checks if PhantomJS is installed and displays its version. This is a crucial step after installing PhantomJS binaries to ensure it's accessible from the command line.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/setting-up-ci-windows.mdx#_snippet_0

LANGUAGE: shell
CODE:
```
phantomjs --version
2.1.1
```

--------------------------------

TITLE: JHipster JDL: Docker Compose Deployment
DESCRIPTION: Defines a Docker Compose deployment configuration for JHipster applications using JDL. It specifies the deployment type, application folders, and Docker repository name. This configuration is compatible with JHipster v5.7 and above.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_20

LANGUAGE: JDL
CODE:
```
deployment {
  deploymentType docker-compose
  appsFolders [foo, bar]
  dockerRepositoryName "yourDockerLoginName"
}
```

--------------------------------

TITLE: Use Annotations for Entity Options in JHipster JDL
DESCRIPTION: Alternatively, apply entity options using annotation syntax, similar to Java or TypeScript decorators. This provides a clear and concise way to configure options for individual entities.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_19

LANGUAGE: JDL
CODE:
```
@readOnly
@dto(mapstruct)
@service(serviceImpl)
@paginate(pager)
entity A

@dto(mapstruct)
@service(serviceImpl)
@paginate(pager)
entity B

@dto(mapstruct)
@service(serviceImpl)
entity C
```

--------------------------------

TITLE: Local NodeJS Installation and Configuration
DESCRIPTION: Installs a specific version of NodeJS locally on a Linux system, builds and installs it, and configures the PATH environment variable to use the local installation. It also installs global npm packages like Bower and Gulp.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/setting-up-ci-linux.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
# specify which version we want
export NODE_VERSION=4.3.1

# download
cd /tmp
wget http://nodejs.org/dist/v$NODE_VERSION/node-v4.3.1.tar.gz
tar xvfz node-v$NODE_VERSION.tar.gz

# build it and install it only locally
cd node-v$NODE_VERSION
./configure --prefix=/var/lib/jenkins/node-v$NODE_VERSION && make && make install

# Check versions of node and  npm
export PATH=/var/lib/jenkins/node-v$NODE_VERSION/bin:$PATH
node --version
# v4.3.1
npm --version
# 3.7.5

# install tools
npm install -g bower gulp
bower --version
# 1.7.7
gulp --version
# 3.9.1
```

--------------------------------

TITLE: Apply Options to Entities in JHipster JDL
DESCRIPTION: Configure entity-level options like readOnly, DTO generation (e.g., with mapstruct), service implementation, and pagination directly within the JDL. Options can be applied to specific entities or all entities using '*'.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_18

LANGUAGE: JDL
CODE:
```
entity A
entity B
entity C

readOnly A
dto * with mapstruct
service * with serviceImpl
paginate A, B with pager
```

--------------------------------

TITLE: Install JHipster Beta using NPM
DESCRIPTION: This command installs the JHipster beta version globally using NPM. It's the recommended way to get the latest beta release for testing.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2023-07-12-jhipster-release-8.0.0-beta.2.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Define Entities in JHipster JDL
DESCRIPTION: Specify which entities to generate within an application using the 'entities' keyword. This is particularly useful in microservice architectures for selective entity generation.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_11

LANGUAGE: JDL
CODE:
```
application {
  config {}
  entities A, B
}

application {
  config {}
  entities C
}

entity A
entity B
entity C
```

--------------------------------

TITLE: Generate Entity with Table Name
DESCRIPTION: Shows how to declare an entity with an explicit table name and braces, which are necessary for declaring fields.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_9

LANGUAGE: jdl
CODE:
```
entity A(a) {}
```

--------------------------------

TITLE: Install Bower and Gulp Globally
DESCRIPTION: Installs the Bower and Gulp command-line tools globally using npm. These are essential for front-end development workflows managed by Jenkins.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/setting-up-ci-windows.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
npm install -g bower gulp
```

--------------------------------

TITLE: Run JHipster Docker Container
DESCRIPTION: Starts a JHipster Docker container with specified configurations. It maps ports for the application and BrowserSync, mounts local directories for project files and Maven dependencies, and runs in detached mode.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/installation.mdx#_snippet_4

LANGUAGE: shell
CODE:
```
docker container run --name jhipster -v ~/jhipster:/home/jhipster/app -v ~/.m2:/home/jhipster/.m2 -p 8080:8080 -p 9000:9000 -p 3001:3001 -d -t jhipster/jhipster
```

--------------------------------

TITLE: Install JHipster Beta via NPM
DESCRIPTION: This command installs the beta version of JHipster using NPM. It's the recommended way to get the latest beta release for testing purposes.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2019-04-04-jhipster-release-6.0.0-beta.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Jenkins Initial Admin Password Retrieval
DESCRIPTION: This example demonstrates how to retrieve the initial administrator password for Jenkins from the container logs. This password is required for the initial setup and configuration of Jenkins.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/setting-up-ci-jenkins2.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
docker logs jenkins2
```

--------------------------------

TITLE: JHipster JDL: Constants for Entity Fields
DESCRIPTION: Demonstrates the use of numerical constants in JHipster's JDL to define constraints for entity fields, such as minimum and maximum lengths and values. This promotes reusability and maintainability of JDL configurations.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_22

LANGUAGE: JDL
CODE:
```
DEFAULT_MIN_LENGTH = 1
DEFAULT_MAX_LENGTH = 42
DEFAULT_MIN_BYTES = 20
DEFAULT_MAX_BYTES = 40
DEFAULT_MIN = 0
DEFAULT_MAX = 41

entity A {
  name String minlength(DEFAULT_MIN_LENGTH) maxlength(DEFAULT_MAX_LENGTH)
  content TextBlob required
  count Integer min(DEFAULT_MIN) max(DEFAULT_MAX)
}
```

--------------------------------

TITLE: Add Javadoc Comment to Entity
DESCRIPTION: Illustrates how to add a Javadoc comment to an entity declaration in JDL, which will be included in the generated code if the backend is Java.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_10

LANGUAGE: jdl
CODE:
```
/**
 * This is a simple entity
 */
entity A
```

--------------------------------

TITLE: Install JHipster Beta with NPM
DESCRIPTION: This snippet shows the command to globally install the beta version of JHipster using NPM. Ensure you have Node.js and NPM installed.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2018-04-03-jhipster-release-5.0.0-beta.0.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Start Keycloak with npm
DESCRIPTION: An alternative method to start the Keycloak server using npm scripts. This command is a convenient way to manage the Keycloak Docker container lifecycle.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/options/security.mdx#_snippet_3

LANGUAGE: shell
CODE:
```
npm run docker:keycloak:up
```

--------------------------------

TITLE: OpenAPI Schema Example for Pet
DESCRIPTION: An example OpenAPI schema snippet defining a 'Pet' component, including its structure and an example response body. This is used by the OpenAPI Generator to produce response bodies.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/options/doing-api-first-development.mdx#_snippet_7

LANGUAGE: yaml
CODE:
```
# ...
# trimmed for brevity
components:
  schemas:
    Pet:
      allOf:
        - $ref: '#/components/schemas/NewPet'
        # trimmed for brevity
      example:
        name: Chessie Cat
        id: 1
        tag: cat
```

--------------------------------

TITLE: JHipster Kotlin Blueprint Example
DESCRIPTION: Demonstrates the JHipster blueprint system, allowing for extension and replacement of JHipster templates. JHipster Kotlin serves as an example of this functionality.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2018-04-03-jhipster-release-5.0.0-beta.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
jhipster-kotlin
```

--------------------------------

TITLE: Install JHipster Locally with NPM
DESCRIPTION: Installs the JHipster generator globally using NPM. This is the recommended method for most users. It also includes an optional step to install Yeoman for module and blueprint usage.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/installation.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster
```

LANGUAGE: bash
CODE:
```
npm install -g yo
```

--------------------------------

TITLE: Start MySQL with Specific Options
DESCRIPTION: Starts the MySQL server with configurations for case-insensitive table names, skipping SSL, and setting character set and timestamp defaults.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/development/development.mdx#_snippet_12

LANGUAGE: shell
CODE:
```
mysqld --lower_case_table_names=1 --skip-ssl --character_set_server=utf8 --explicit_defaults_for_timestamp
```

--------------------------------

TITLE: Declare Fields for Entities in JHipster JDL
DESCRIPTION: Define fields for entities by specifying their name and type within the entity declaration. Supports various data types, with more details available on the entities & fields page.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_12

LANGUAGE: JDL
CODE:
```
entity MyEntity {
  name String
  closed Boolean
}
```

--------------------------------

TITLE: JDL Mixed Example
DESCRIPTION: Demonstrates a mixed JDL example with entity definitions, read-only properties, DTOs, services, and search engine configurations using both regular and annotation-based syntax.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/options.mdx#_snippet_8

LANGUAGE: jdl
CODE:
```
entity A
entity B
entity C

readOnly B, C
dto * with mapstruct except C
service * with serviceClass except C
search A with elasticsearch
```

LANGUAGE: jdl
CODE:
```
@dto(mapstruct)
@search(elastisearch)
@service(serviceClass)
entity A

@readOnly
@dto(mapstruct)
@service(serviceClass)
entity B

@readOnly
entity C
```

--------------------------------

TITLE: Install JHipster Beta with NPM
DESCRIPTION: Installs the beta version of JHipster globally using NPM. This command fetches the 'beta' tag from the NPM registry.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2018-06-18-jhipster-release-5.0.0-beta.3.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Add Comments and Validations to Fields in JHipster JDL
DESCRIPTION: Enhance fields with comments and validations directly within the entity declaration. Validations are type-dependent and further explained on the entities & fields page.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_13

LANGUAGE: JDL
CODE:
```
entity MyEntity {
  /** My field */
  name String required minlength(2) maxlength(50)
}
```

--------------------------------

TITLE: Install JHipster Beta with Yarn
DESCRIPTION: Installs the beta version of JHipster globally using Yarn. This command fetches the 'beta' tag from the NPM registry.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2018-06-18-jhipster-release-5.0.0-beta.3.mdx#_snippet_0

LANGUAGE: shell
CODE:
```
yarn global add generator-jhipster@beta
```

--------------------------------

TITLE: Install JHipster v5.0.0-beta.1 with NPM
DESCRIPTION: This snippet shows how to install the JHipster v5.0.0-beta.1 release globally using NPM. It specifies the beta tag to ensure the correct version is installed.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2018-05-03-jhipster-release-5.0.0-beta.1.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Build and Start JHipster Application with Docker
DESCRIPTION: These commands demonstrate how to build a Docker image for your JHipster application using Maven or Gradle, and then start the application container using Docker Compose. This is typically done after setting up the database.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/docker-compose.mdx#_snippet_11

LANGUAGE: bash
CODE:
```
./mvnw -Pprod clean verify jib:dockerBuild
```

LANGUAGE: bash
CODE:
```
./gradlew -Pprod clean bootJar jibDockerBuild
```

LANGUAGE: bash
CODE:
```
docker-compose -f src/main/docker/app.yml up -d <name_of_your_app>-app
```

--------------------------------

TITLE: Install and Run JHipster Migrate Blueprint
DESCRIPTION: Installs and runs the JHipster migrate blueprint for more advanced upgrade features. This involves installing the blueprint globally and then executing it.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-06-24-jhipster-release-8.6.0.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
jhipster-migrate
```

--------------------------------

TITLE: Launch Application
DESCRIPTION: Starts the JHipster application using Maven, allowing for manual testing of the generated entities.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/core-tasks/creating-an-entity.mdx#_snippet_14

LANGUAGE: bash
CODE:
```
mvn
```

--------------------------------

TITLE: Install and Run Migrate Blueprint
DESCRIPTION: Installs the JHipster migrate blueprint globally and then runs it for advanced upgrade features.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-10-28-jhipster-release-8.7.2.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
jhipster-migrate
```

--------------------------------

TITLE: Enable GCP APIs and Install kubectl
DESCRIPTION: Enables necessary Google Cloud Platform APIs for container services and installs the kubectl command-line tool for interacting with Kubernetes clusters.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/gcp.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
gcloud services enable container.googleapis.com containerregistry.googleapis.com
gcloud components install kubectl
```

--------------------------------

TITLE: Install and run JHipster UML
DESCRIPTION: Installs the JHipster UML generator globally using npm and then runs it with a specified JHipster JDL file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/core-tasks/creating-an-entity.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
npm install -g jhipster-uml
jhipster-uml yourFileName.jh
```

--------------------------------

TITLE: Start Docker Machine and Set Environment
DESCRIPTION: These commands start the default Docker machine and set up the environment variables to use it. This is done after configuring port forwarding in VirtualBox.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tips/020_tip_using_docker_containers_as_localhost_on_mac_and_windows.mdx#_snippet_2

LANGUAGE: shell
CODE:
```
docker-machine start default
eval $(docker-machine env default)
```

--------------------------------

TITLE: Get Help with JHipster-UML
DESCRIPTION: This command displays the help information for the jhipster-uml tool, providing details on available options and usage.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tools/jhipster-uml.mdx#_snippet_11

LANGUAGE: bash
CODE:
```
jhipster-uml --help
```

--------------------------------

TITLE: Install and Run Migrate Blueprint
DESCRIPTION: Installs the JHipster migrate blueprint and runs it for advanced upgrade features.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-12-23-jhipster-release-8.8.0.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
jhipster-migrate
```

--------------------------------

TITLE: Install and Run JHipster Migrate Blueprint
DESCRIPTION: Installs the JHipster migrate blueprint globally and then runs it for advanced upgrade features.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2025-05-06-jhipster-release-8.11.0.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
jhipster-migrate
```

--------------------------------

TITLE: Install JHipster v8.6.0 using npm
DESCRIPTION: This snippet shows the command to install the JHipster v8.6.0 version globally using npm. It's the standard way to get the latest JHipster CLI on your system.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-06-24-jhipster-release-8.6.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster
```

--------------------------------

TITLE: Start Keycloak with Docker Compose
DESCRIPTION: This snippet shows how to start the Keycloak service using its specific Docker Compose configuration file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/docker-compose.mdx#_snippet_20

LANGUAGE: shell
CODE:
```
docker-compose -f src/main/docker/keycloak.yml up
```

--------------------------------

TITLE: Install and Run JHipster Migrate Blueprint
DESCRIPTION: Installs the JHipster migrate blueprint globally and then runs it for advanced upgrade features.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2025-03-31-jhipster-release-8.10.0.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
jhipster-migrate
```

--------------------------------

TITLE: Install and Run Migrate Blueprint
DESCRIPTION: Installs the JHipster migrate blueprint globally and then runs it for advanced upgrade features.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-04-29-jhipster-release-8.4.0.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
jhipster-migrate
```

--------------------------------

TITLE: Install JHipster 5.0.0-beta.2 with NPM
DESCRIPTION: Installs the beta version of JHipster using the NPM package manager globally.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2018-06-13-jhipster-release-5.0.0-beta.2.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Install JHipster v8.3.0
DESCRIPTION: Installs the JHipster v8.3.0 version globally using npm. This command is the primary method for new installations.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-04-08-jhipster-release-8.3.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster
```

--------------------------------

TITLE: Install kubectl using gcloud
DESCRIPTION: Installs the kubectl command-line tool, used for managing Kubernetes clusters, via the gcloud SDK.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tips/018_tip_kubernetes_and_google_cloud_sql.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
gcloud components install kubectl
```

--------------------------------

TITLE: Installing JHipster from Git for Blueprint Development
DESCRIPTION: Shows how to install a specific version of JHipster directly from a Git repository into your blueprint project. This is an alternative to linking a local JHipster development version.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/modules/extending-and-customizing.mdx#_snippet_5

LANGUAGE: shell
CODE:
```
cd generator-jhipster-my-blueprint
npm install jhipster/generator-jhipster
```

--------------------------------

TITLE: Install JHipster Quarkus Blueprint
DESCRIPTION: Installs the JHipster Quarkus blueprint globally using npm. This command is essential for enabling JHipster to generate Quarkus-based applications.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/blueprints/quarkus/installing-jhipster-quarkus.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster-quarkus
```

--------------------------------

TITLE: Install Migrate Blueprint
DESCRIPTION: Command to install the JHipster migrate blueprint globally using npm.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-11-01-jhipster-release-8.7.3.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
```

--------------------------------

TITLE: Jenkins Pipeline Script Example
DESCRIPTION: This is a placeholder for a Jenkins pipeline script, typically defined in a Jenkinsfile. It outlines the structure for defining CI/CD stages, such as building, testing, and deploying an application using Source Code Management (SCM) like Git.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/setting-up-ci-jenkins2.mdx#_snippet_2

LANGUAGE: groovy
CODE:
```
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}
```

--------------------------------

TITLE: Install JHipster v8.7.0
DESCRIPTION: Installs the JHipster v8.7.0 globally using npm. This is the primary command for new installations.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-08-26-jhipster-release-8.7.0.mdx#_snippet_15

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster
```

--------------------------------

TITLE: Build JHipster Project for Deployment
DESCRIPTION: Generates the static content for the JHipster website into the 'build' directory. This output can be hosted on any static hosting service.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/README.md#_snippet_2

LANGUAGE: bash
CODE:
```
npm run build
```

--------------------------------

TITLE: Install JHipster 5.0.0-beta.2 with Yarn
DESCRIPTION: Installs the beta version of JHipster using the Yarn package manager globally.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2018-06-13-jhipster-release-5.0.0-beta.2.mdx#_snippet_0

LANGUAGE: shell
CODE:
```
yarn global add generator-jhipster@beta
```

--------------------------------

TITLE: Install JHipster Beta via NPM
DESCRIPTION: Installs the beta version of JHipster globally using NPM. This command is necessary to use the pre-release version of JHipster.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2020-12-21-jhipster-release-7.0.0-beta.0.mdx#_snippet_1

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Initialize JHipster App in Docker
DESCRIPTION: Navigate to the application directory within the Docker container and initiate the JHipster project creation process.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/installation.mdx#_snippet_11

LANGUAGE: shell
CODE:
```
cd /home/jhipster/app

jhipster
```

--------------------------------

TITLE: Validate JHipster Quarkus Installation
DESCRIPTION: Verifies the successful installation of the JHipster Quarkus blueprint by checking for the presence of the 'jhipster-quarkus' command. This command is used to generate Quarkus applications.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/blueprints/quarkus/installing-jhipster-quarkus.mdx#_snippet_1

LANGUAGE: bash
CODE:
```
which jhipster-quarkus
```

--------------------------------

TITLE: Launch JHipster Sample App (Production Profile)
DESCRIPTION: Starts the JHipster sample application using docker-compose for the production profile, including a MySQL database. This command requires a 'prod.yml' file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/production/docker-hub.mdx#_snippet_5

LANGUAGE: shell
CODE:
```
docker-compose -f jhipster-sample-app/prod.yml up
```

--------------------------------

TITLE: Install JHipster Fisher Plugin
DESCRIPTION: This command installs the JHipster Fisher plugin, which adds shortcuts for JHipster development within the fish shell environment. Ensure you have Fisher and fish shell installed.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/shell-plugins/fisher.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
fisher install jhipster/jhipster-fisher-plugin
```

--------------------------------

TITLE: Install JHipster Beta Release via NPM
DESCRIPTION: This command installs the beta version of JHipster using NPM. It's necessary for users who want to test the latest beta features before the stable release.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2023-09-05-jhipster-release-8.0.0-beta.3.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Install JHipster v8.7.2
DESCRIPTION: Installs the specified version of JHipster globally using npm.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-10-28-jhipster-release-8.7.2.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@8.7.2
```

--------------------------------

TITLE: Install JHipster v8.5.0
DESCRIPTION: Installs the JHipster v8.5.0 version globally using npm.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-05-30-jhipster-release-8.5.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster
```

--------------------------------

TITLE: Install JHipster v8.9.0
DESCRIPTION: Installs the specified version of JHipster globally using npm.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2025-02-08-jhipster-release-8.9.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@8.9.0
```

--------------------------------

TITLE: Run JHipster-UML Tests
DESCRIPTION: This snippet shows how to run tests for JHipster-UML using npm and Mocha. It includes commands for installing dependencies and executing the test suite, with options for global or local installations.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tools/jhipster-uml.mdx#_snippet_21

LANGUAGE: Shell
CODE:
```
npm test
mocha
npm install -g mocha
./node_modules/mocha/bin/mocha
```

--------------------------------

TITLE: Install JHipster v8.10.0
DESCRIPTION: Installs the specified version of JHipster globally using npm.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2025-03-31-jhipster-release-8.10.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@8.10.0
```

--------------------------------

TITLE: Start Sonar with Docker Compose
DESCRIPTION: This snippet demonstrates how to start the Sonar service using its dedicated Docker Compose configuration.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/docker-compose.mdx#_snippet_17

LANGUAGE: shell
CODE:
```
docker-compose -f src/main/docker/sonar.yml up
```

--------------------------------

TITLE: Run JHipster Maven Project (Installed Maven)
DESCRIPTION: Launches the JHipster Java server using a locally installed Maven instance. This command executes the default Maven tasks.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/development/development.mdx#_snippet_3

LANGUAGE: shell
CODE:
```
mvn
```

--------------------------------

TITLE: Add Comments and Validations to Relationships in JHipster JDL
DESCRIPTION: Incorporate comments and validations, such as 'required', directly into relationship declarations. This helps enforce constraints on entity associations.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_17

LANGUAGE: JDL
CODE:
```
relationship OneToOne {
  A{a} to B{b required}
}
```

--------------------------------

TITLE: Define Enumerations in JHipster JDL
DESCRIPTION: Create enumerations with fixed values, which can be used as types for entity fields. Enumeration values are optional, and they support the 'required' validation.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_14

LANGUAGE: JDL
CODE:
```
enum Type {
  A,
  B(b)
}

entity E {
  name Type
}
```

--------------------------------

TITLE: Make Gradle Wrapper Executable
DESCRIPTION: Ensures the Gradle wrapper script is executable for CI/CD pipelines. This involves changing the file permissions and updating Git's index.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/index.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
chmod +x gradlew
git update-index --chmod=+x gradlew
```

--------------------------------

TITLE: Install JHipster v8.8.0
DESCRIPTION: Installs the specified version of JHipster globally using npm.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-12-23-jhipster-release-8.8.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@8.8.0
```

--------------------------------

TITLE: Define Unidirectional Relationships in JHipster JDL
DESCRIPTION: Create unidirectional relationships by omitting the injected field on one or both sides of the entity declaration. This allows for more flexible model design.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_16

LANGUAGE: JDL
CODE:
```
relationship OneToOne {
  A{a} to B
}
```

LANGUAGE: JDL
CODE:
```
relationship OneToOne {
  A to B
}
```

--------------------------------

TITLE: Launch JHipster Sample App Elasticsearch (Production)
DESCRIPTION: Starts the JHipster sample application with Elasticsearch and MySQL in the production profile using docker-compose. This command requires a 'prod.yml' file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/production/docker-hub.mdx#_snippet_8

LANGUAGE: shell
CODE:
```
docker-compose -f jhipster-sample-app-elasticsearch/prod.yml up
```

--------------------------------

TITLE: Start JHipster Control Center Client Hot Reload
DESCRIPTION: Command to start the client-side hot reload for the JHipster Control Center using npm.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/microservices/jhipster-control-center.mdx#_snippet_1

LANGUAGE: bash
CODE:
```
npm start

```

--------------------------------

TITLE: Make Maven Wrapper Executable
DESCRIPTION: Ensures the Maven wrapper script is executable for CI/CD pipelines. This involves changing the file permissions and updating Git's index.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tests-and-qa/setting-up-ci/index.mdx#_snippet_2

LANGUAGE: bash
CODE:
```
chmod +x mvnw
git update-index --chmod=+x mvnw
```

--------------------------------

TITLE: Install JHipster UML Globally
DESCRIPTION: Installs the latest version of JHipster UML globally using npm. This command is used for system-wide access to the tool.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tools/jhipster-uml.mdx#_snippet_0

LANGUAGE: shell
CODE:
```
npm install -g jhipster-uml
```

--------------------------------

TITLE: Install JHipster CLI
DESCRIPTION: Installs the JHipster command-line interface globally using npm. This command is essential for generating and managing JHipster applications.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-09-21-jhipster-release-8.7.1.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster
```

--------------------------------

TITLE: AsciiDoc Index File for Documentation
DESCRIPTION: An AsciiDoc file that includes the generated documentation sections (overview, paths, definitions) into a single document. This file serves as the main entry point for the static documentation.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tips/008_tips_static_swagger_docs.mdx#_snippet_6

LANGUAGE: AsciiDoc
CODE:
```
include::{generated}/overview.adoc[]
include::{generated}/paths.adoc[]
include::{generated}/definitions.adoc[]
```

--------------------------------

TITLE: Install JHipster Beta Version via NPM
DESCRIPTION: This command installs the beta version of JHipster (v7.0.0-beta.1) globally using npm. It's necessary for users who want to test the latest beta features before the stable release.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2021-01-17-jhipster-release-7.0.0-beta.1.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster@beta
```

--------------------------------

TITLE: Launch JHipster Sample App (Development Profile)
DESCRIPTION: Starts the JHipster sample application using docker-compose for the development profile. This command requires a 'dev.yml' file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/production/docker-hub.mdx#_snippet_4

LANGUAGE: shell
CODE:
```
docker-compose -f jhipster-sample-app/dev.yml up
```

--------------------------------

TITLE: Install JHipster v8.0.0 with NPM
DESCRIPTION: Installs the latest version of JHipster (v8.0.0) globally using npm.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2023-11-02-jhipster-release-8.0.0.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
npm install -g generator-jhipster
```

--------------------------------

TITLE: Start Elasticsearch with Docker Compose
DESCRIPTION: This snippet shows how to start the Elasticsearch service using its specific Docker Compose configuration file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/docker-compose.mdx#_snippet_16

LANGUAGE: shell
CODE:
```
docker-compose -f src/main/docker/elasticsearch.yml up
```

--------------------------------

TITLE: Start Microsoft SQL Server with Docker Compose
DESCRIPTION: This command starts a Microsoft SQL Server instance using Docker Compose. It requires increasing Docker's RAM allocation and manually creating the database with a SQL client after the container is running.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/docker-compose.mdx#_snippet_15

LANGUAGE: bash
CODE:
```
docker-compose -f src/main/docker/mssql.yml up -d
```

--------------------------------

TITLE: Run JHipster Gradle Project (Installed Gradle)
DESCRIPTION: Launches the JHipster Java server using a locally installed Gradle instance. This command executes the default Gradle tasks.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/development/development.mdx#_snippet_7

LANGUAGE: shell
CODE:
```
gradle
```

--------------------------------

TITLE: Launch JHipster Sample App (Production with ELK)
DESCRIPTION: Starts the JHipster sample application in production with a MySQL database and the ELK stack for monitoring, using docker-compose. This command requires a 'prod-elk.yml' file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/production/docker-hub.mdx#_snippet_6

LANGUAGE: shell
CODE:
```
docker-compose -f jhipster-sample-app/prod-elk.yml up
```

--------------------------------

TITLE: Declare Relationships Between Entities in JHipster JDL
DESCRIPTION: Establish relationships between entities using the 'relationship' keyword, specifying the type (e.g., OneToOne, OneToMany) and injected fields. Supports bidirectional and unidirectional relationships.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/getting-started.mdx#_snippet_15

LANGUAGE: JDL
CODE:
```
entity A
entity B

relationship OneToOne {
  A{a} to B{b}
}
```

--------------------------------

TITLE: JDL Docker Compose Deployment Example
DESCRIPTION: Provides an example of a JHipster Domain Language (JDL) deployment configuration for Docker Compose. It includes options for application folders and the Docker repository name.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/deployments.mdx#_snippet_1

LANGUAGE: jdl
CODE:
```
deployment {
  deploymentType docker-compose
  appsFolders [foo, bar]
  dockerRepositoryName "yourDockerLoginName"
}
```

--------------------------------

TITLE: Install JHipster Migrate Blueprint
DESCRIPTION: Installs the JHipster migrate blueprint globally using npm for advanced upgrade features.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2025-02-08-jhipster-release-8.9.0.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
```

--------------------------------

TITLE: Enum Declaration with Explicit Values in JDL
DESCRIPTION: Illustrates how to declare an enum in JDL with explicit values assigned to each enumeration key. This feature is available starting from JHipster Core v6. Examples include string and non-string values.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/jdl/enums.mdx#_snippet_2

LANGUAGE: JDL
CODE:
```
enum Country {
  BELGIUM (Belgium),
  FRANCE (France),
  ITALY (Italy),
  CHINA ("中国")
}
```

--------------------------------

TITLE: Install JHipster Migrate Blueprint
DESCRIPTION: Installs the JHipster Migrate blueprint globally using npm, which can be used for more advanced upgrade features.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-05-30-jhipster-release-8.5.0.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
```

--------------------------------

TITLE: Start All Databases with Docker Compose
DESCRIPTION: This command starts all configured database services defined in the app.yml Docker Compose file. It's a convenient way to bring up the entire application stack, including the database, for development.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/environment/docker-compose.mdx#_snippet_8

LANGUAGE: bash
CODE:
```
docker-compose -f src/main/docker/app.yml up
```

--------------------------------

TITLE: Okta CLI Setup for JHipster
DESCRIPTION: This section provides shell commands to set up an Okta application for JHipster using the Okta CLI. It includes registering with Okta, creating a JHipster app, and sourcing environment variables for Okta settings.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/options/security.mdx#_snippet_12

LANGUAGE: shell
CODE:
```
okta register
okta apps create jhipster
source .okta.env
```

--------------------------------

TITLE: Launch JHipster Sample App Cassandra (Production)
DESCRIPTION: Starts the JHipster sample application with a Cassandra cluster in the production profile using docker-compose. This command requires a 'prod.yml' file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/production/docker-hub.mdx#_snippet_10

LANGUAGE: shell
CODE:
```
docker-compose -f jhipster-sample-app-cassandra/prod.yml up
```

--------------------------------

TITLE: Install JHipster Migrate Blueprint
DESCRIPTION: Installs the JHipster Migrate blueprint globally using npm. This blueprint provides advanced features for migrating JHipster applications.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-09-21-jhipster-release-8.7.1.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
npm i -g generator-jhipster-migrate
```

--------------------------------

TITLE: Clever Cloud Addon Providers
DESCRIPTION: Lists the available addon providers on Clever Cloud, including their descriptions, such as databases and storage solutions.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/production/clever-cloud.mdx#_snippet_2

LANGUAGE: shell
CODE:
```
cellar-addon      Cellar S3 storage       S3-like online file storage web service
config-provider   Configuration provider  Expose configuration to your applications  (via environment variables)
es-addon          Elastic Stack           Elasticsearch with Kibana and APM server as options
fs-bucket         FS Buckets              Persistent file system for your application
mongodb-addon     MongoDB                 A noSQL document-oriented database
mysql-addon       MySQL                   An open source relational database management system
postgresql-addon  PostgreSQL              A powerful, open source object-relational database system
redis-addon       Redis                   Redis by Clever Cloud is an in-memory key-value data store, powered by Clever Cloud
```

--------------------------------

TITLE: Create and Navigate to Application Directory
DESCRIPTION: This snippet demonstrates the initial steps to create a new directory for your Quarkus application and navigate into it using bash commands.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/blueprints/quarkus/creating-an-application.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
mkdir my-quarkus-application
cd my-quarkus-application
```

--------------------------------

TITLE: Create New REST Endpoint in Web Tier
DESCRIPTION: This Java Spring Boot example illustrates how to create a new REST endpoint in the web tier of a JHipster application. It defines a new controller 'ExtendedFooController' with a GET mapping for '/new-feature' that utilizes the extended service.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tips/035_tip_combine_generation_and_custom_code.mdx#_snippet_6

LANGUAGE: Java
CODE:
```
@RestController
@RequestMapping("/api/extended/foo")
public class ExtendedFooController {
    private final ExtendedFooService extendedFooService;
    
    public ExtendedFooController(ExtendedFooService extendedFooService) {
        this.extendedFooService = extendedFooService;
    }

    // New endpoints
    @GetMapping("/new-feature")
    public ResponseEntity<?> newFeature() {
        // Implementation
    }
```

--------------------------------

TITLE: Run Application with Maven
DESCRIPTION: Instructions for running the generated JHipster application using Maven wrapper scripts. The `-Pwebapp` flag is recommended for Maven users to see the latest front-end changes after the first run.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/core-tasks/creating-an-app.mdx#_snippet_2

LANGUAGE: bash
CODE:
```
./mvnw
./mvnw -Pwebapp
```

--------------------------------

TITLE: Start Elasticsearch with Docker Compose
DESCRIPTION: This command starts an Elasticsearch instance using a provided Docker Compose configuration file. It's typically used in development environments to quickly set up Elasticsearch.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/options/using-elasticsearch.mdx#_snippet_0

LANGUAGE: shell
CODE:
```
docker-compose -f src/main/docker/elasticsearch.yml up -d
```

--------------------------------

TITLE: Start Memcached with Docker Compose
DESCRIPTION: This command starts a Memcached server using Docker Compose. It requires a `memcached.yml` configuration file in the `src/main/docker/` directory.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/options/using-cache.mdx#_snippet_3

LANGUAGE: bash
CODE:
```
docker-compose -f src/main/docker/memcached.yml up -d
```

--------------------------------

TITLE: Install JHipster UML Locally
DESCRIPTION: Installs JHipster UML as a development dependency for a specific project using npm. This is useful if you need a version that matches your JHipster generator or want to keep it project-specific.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/tools/jhipster-uml.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
npm install jhipster-uml --save-dev
```

--------------------------------

TITLE: Start Consul with Docker Compose
DESCRIPTION: This command starts a Consul server in development mode using a Docker Compose file. Consul will be accessible on port 8500 of the Docker host.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/microservices/consul.mdx#_snippet_0

LANGUAGE: bash
CODE:
```
docker-compose -f src/main/docker/consul.yml up
```

--------------------------------

TITLE: Run JHipster Migrate
DESCRIPTION: Executes the JHipster Migrate command, likely to initiate migration processes using the installed blueprint.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2024-05-30-jhipster-release-8.5.0.mdx#_snippet_4

LANGUAGE: bash
CODE:
```
jhipster-migrate
```

--------------------------------

TITLE: Generating a New JHipster Blueprint
DESCRIPTION: This sequence of commands shows how to initialize a new JHipster blueprint project. It involves creating a directory, navigating into it, and then running the built-in `generate-blueprint` generator.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/modules/creating-a-blueprint.mdx#_snippet_1

LANGUAGE: shell
CODE:
```
mkdir my-blueprint && cd my-blueprint

jhipster generate-blueprint
```

--------------------------------

TITLE: Install JHipster v5.0.0-beta.1 with Yarn
DESCRIPTION: This snippet demonstrates how to install the JHipster v5.0.0-beta.1 release globally using Yarn. It uses the '@beta' tag to target the specific beta version.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2018-05-03-jhipster-release-5.0.0-beta.1.mdx#_snippet_1

LANGUAGE: bash
CODE:
```
yarn global add generator-jhipster@beta
```

--------------------------------

TITLE: Webpack Configuration Example
DESCRIPTION: Illustrates a basic Webpack configuration file, commonly used with Angular 2+ projects for bundling and optimizing assets.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/releases/2017-02-02-jhipster-release-4.0.0.mdx#_snippet_2

LANGUAGE: JavaScript
CODE:
```
const path = require('path');

module.exports = {
  entry: './src/main.ts',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  },
  module: {
    rules: [
      { test: /\.ts$/, loader: 'ts-loader' },
      { test: /\.html$/, loader: 'html-loader' },
      { test: /\.css$/, use: ['style-loader', 'css-loader'] }
    ]
  },
  resolve: {
    extensions: ['.ts', '.js']
  }
};
```

--------------------------------

TITLE: Launch JHipster Sample App MongoDB (Production)
DESCRIPTION: Starts the JHipster sample application with MongoDB in the production profile using docker-compose. This command requires a 'prod.yml' file.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/production/docker-hub.mdx#_snippet_9

LANGUAGE: shell
CODE:
```
docker-compose -f jhipster-sample-app-mongodb/prod.yml up
```

--------------------------------

TITLE: JSON: Translation File Example
DESCRIPTION: This example shows a typical JSON structure for storing translations in a JHipster application. The keys in this file correspond to the `jhiTranslate` attributes used in the HTML templates.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/development/development.mdx#_snippet_17

LANGUAGE: json
CODE:
```
{
  "settings.form.firstname": "First Name",
  "settings.form.firstname.label": "Enter your first name"
}
```

--------------------------------

TITLE: JHipster Blueprint Client Generator Example
DESCRIPTION: This JavaScript code snippet illustrates the structure of a JHipster blueprint extending the `ClientGenerator`. It shows how to import necessary modules, handle constructor arguments, and access JHipster context, including overriding initialization priorities.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/modules/creating-a-blueprint.mdx#_snippet_2

LANGUAGE: javascript
CODE:
```
import chalk from 'chalk';
import ClientGenerator from 'generator-jhipster/generators/client';

export default class extends ClientGenerator {
  constructor(args, opts, features) {
    super(args, opts, features);

    if (this.options.help) return;

    if (!this.options.jhipsterContext) {
      throw new Error(`This is a JHipster blueprint and should be used only like ${chalk.yellow('jhipster --blueprints myBlueprint')}`);
    }
  }

  get [ClientGenerator.INITIALIZING]() {
    return {
      // async preInitializingTemplateTask() {},
      ...super._initializing(),
      // async postInitializingTemplateTask() {},
    };
  }

  // Others priorities omitted for brevity
}
```

--------------------------------

TITLE: Test Pet API Endpoint with Curl
DESCRIPTION: Demonstrates how to start the JHipster server using Maven wrapper and then use `curl` to fetch a specific pet by its ID from the API.

SOURCE: https://github.com/jhipster/jhipster.github.io/blob/main/docs/options/doing-api-first-development.mdx#_snippet_6

LANGUAGE: shell
CODE:
```
./mvnw # start the server, also try 'npm run app:start', see the package.json for more scripts!
curl -H "Accept: application/json" http://localhost:8081/api/pets/1
{
  "name" : "Chessie Cat",
  "tag" : "cat",
  "id" : 1
}
```