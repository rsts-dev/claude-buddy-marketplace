# MuleSoft Architecture & Design Guidelines

**Version:** 1.0
**Last Updated:** October 1, 2025
**Purpose:** Comprehensive reference guide for building well-architected MuleSoft API applications

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Core Architecture Principles](#core-architecture-principles)
3. [API-Led Connectivity Pattern](#api-led-connectivity-pattern)
4. [Design Patterns Reference](#design-patterns-reference)
5. [Configuration Management](#configuration-management)
6. [Security Architecture](#security-architecture)
7. [Error Handling Strategy](#error-handling-strategy)
8. [Development Standards](#development-standards)
9. [DataWeave Best Practices](#dataweave-best-practices)
10. [CI/CD & DevOps](#cicd--devops)
11. [Testing Strategy](#testing-strategy)
12. [Performance & Scalability](#performance--scalability)
13. [Quick Reference](#quick-reference)
14. [Code Review Checklist](#code-review-checklist)
15. [Anti-Patterns](#anti-patterns)

---

## Executive Summary

### Purpose

This document provides **architectural guidelines and best practices** for developing enterprise-grade MuleSoft applications. It synthesizes industry-standard patterns, security practices, and operational excellence into actionable guidance.

### Target Audience

- **MuleSoft Developers** - Implementation standards and patterns
- **Solution Architects** - Architecture decisions and design patterns
- **DevOps Engineers** - Deployment and operational guidelines
- **Tech Leads** - Code review and quality standards

### Key Principles

1. **API-Led Connectivity** - Layered architecture for reusability
2. **Security by Design** - Multi-layer defense-in-depth
3. **Configuration Externalization** - Environment-independent code
4. **Comprehensive Error Handling** - Fail gracefully, recover intelligently
5. **Automation First** - CI/CD for consistency and speed
6. **Design Before Code** - RAML-first development

---

## Core Architecture Principles

### 1. Separation of Concerns

**Principle:** Each component should have a single, well-defined responsibility.

**Implementation:**
```
┌─────────────────────────────────────┐
│  Experience Layer                   │  ← Security, Validation, Client-specific
├─────────────────────────────────────┤
│  Process Layer                      │  ← Business Logic, Orchestration
├─────────────────────────────────────┤
│  System Layer                       │  ← Data Access, Backend Integration
└─────────────────────────────────────┘
```

**Benefits:**
- ✅ Independent scaling of layers
- ✅ Easier maintenance and testing
- ✅ Clear ownership boundaries
- ✅ Reusable system APIs

---

### 2. Reusability Over Duplication

**Principle:** Write once, use many times.

**Techniques:**
- **RAML Fragments** - Reusable data types, traits, security schemes
- **Global Connectors** - Shared database, HTTP configurations
- **Flow References** - Reusable business logic flows
- **Exchange Assets** - Organization-wide components

**Example:**
```xml
<!-- DON'T: Duplicate connector config in every flow -->
<flow name="flow1">
  <db:config name="Database_Config_1">
    <db:my-sql-connection host="localhost" port="3306" user="admin" password="pass"/>
  </db:config>
</flow>

<!-- DO: Use global connector referenced by all flows -->
<db:config name="Database_Config">
  <db:my-sql-connection host="${db.host}" port="${db.port}"
                        user="${db.user}" password="${db.password}"/>
</db:config>

<flow name="flow1">
  <db:select config-ref="Database_Config">
    <!-- SQL query -->
  </db:select>
</flow>
```

---

### 3. Contract-First Design

**Principle:** Design APIs before implementation.

**Workflow:**
```
1. Design RAML Specification
   ↓
2. Publish to Exchange
   ↓
3. Gather Stakeholder Feedback
   ↓
4. Test with Mock Services
   ↓
5. Implement in Anypoint Studio
   ↓
6. Deploy with Auto-Discovery
```

**Benefits:**
- Early feedback from stakeholders
- Clear API contracts
- Automatic flow scaffolding with APIkit
- Reduced rework during implementation

---

### 4. Fail Fast, Recover Smart

**Principle:** Detect errors early, handle them gracefully.

**Strategy:**
- **Validate at entry points** - Check input before processing
- **Use appropriate retry patterns** - Reconnection strategies for transient failures
- **Preserve messages** - Don't lose data during failures
- **Provide meaningful errors** - Help consumers understand what went wrong

---

## API-Led Connectivity Pattern

### Overview

API-Led Connectivity is a **methodical approach** to organizing integrations into three layers, each with distinct responsibilities.

```
┌──────────────────────────────────────────────────────┐
│              EXPERIENCE API LAYER                    │
│  • Mobile-optimized endpoints                        │
│  • Web application endpoints                         │
│  • Partner integration endpoints                     │
│  • Security enforcement (Client ID, OAuth, Rate Limit)│
│  • Input validation                                  │
└──────────────┬───────────────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────────────┐
│               PROCESS API LAYER                      │
│  • Business logic orchestration                      │
│  • Workflow coordination                             │
│  • Data aggregation from multiple systems            │
│  • Business rule application                         │
│  • Data transformation for business needs            │
└──────────────┬───────────────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────────────┐
│                SYSTEM API LAYER                      │
│  • Direct database access (CRUD operations)          │
│  • Legacy system integration                         │
│  • SaaS application connectivity (Salesforce, etc.)  │
│  • Message queue operations                          │
│  • File system access                                │
└──────────────────────────────────────────────────────┘
```

---

### System API Layer

**Purpose:** Provide access to underlying systems without business logic.

**Characteristics:**
- ✅ **Mandatory** for each data source/system
- ✅ Direct CRUD operations on databases
- ✅ Raw data retrieval without transformation
- ❌ **Never exposed directly to consumers**
- ❌ No business logic or orchestration

**Naming Convention:**
- `customer-system-api`
- `order-system-api`
- `inventory-system-api`

**Example Use Case:**
```
GET /customers/{id}  → Returns raw customer record from database
POST /customers      → Creates new customer record
PUT /customers/{id}  → Updates customer record
DELETE /customers/{id} → Deletes customer record
```

**Security:**
- Internal network only
- Basic authentication sufficient
- No rate limiting needed (internal use)

---

### Process API Layer

**Purpose:** Implement business logic and orchestrate multiple system APIs.

**Characteristics:**
- ✅ Combines data from multiple System APIs
- ✅ Applies business rules and transformations
- ✅ Workflow orchestration
- ✅ Can be reused by multiple Experience APIs
- ❌ Not directly consumer-facing

**Naming Convention:**
- `customer-onboarding-process-api`
- `order-fulfillment-process-api`
- `claims-processing-process-api`

**Example Use Case:**
```
POST /customer-onboarding

Orchestrates:
1. Validates customer data
2. Calls customer-system-api to create customer
3. Calls account-system-api to create account
4. Calls notification-system-api to send welcome email
5. Returns unified response
```

**Security:**
- Internal network or secured external access
- Client ID enforcement
- Basic rate limiting

---

### Experience API Layer

**Purpose:** Provide client-optimized, secure endpoints.

**Characteristics:**
- ✅ **Primary security enforcement point**
- ✅ Client-specific data optimization (mobile, web, partner)
- ✅ Input validation
- ✅ Multiple security policies
- ✅ Consumer-facing documentation

**Naming Convention:**
- `mobile-experience-api`
- `web-experience-api`
- `partner-experience-api`

**Example Use Case:**
```
GET /mobile/dashboard

Returns mobile-optimized payload:
{
  "user": { ... },
  "recentOrders": [ ... ],
  "recommendedProducts": [ ... ]
}

Calls:
- customer-process-api for user data
- order-process-api for recent orders
- recommendation-process-api for products
```

**Security:**
- **Multiple policies:**
  - IP Whitelist (if needed)
  - Rate Limiting (per client)
  - Client ID Enforcement
  - OAuth 2.0 (for user context)
  - CORS (for browser clients)
- Comprehensive input validation
- Request/response logging

---

### Layer Interaction Rules

**✅ ALLOWED:**
- Experience API → Process API → System API
- Experience API → Process API (multiple)
- Process API → System API (multiple)
- Process API → Process API (for complex orchestration)

**❌ NOT ALLOWED:**
- Experience API → System API directly (bypasses business logic)
- System API → System API (should be stateless)
- External consumers → System API (security risk)
- External consumers → Process API (should use Experience layer)

---

### Design Decision Tree

**When creating a new API, ask:**

1. **Does it access a database or backend system directly?**
   - Yes → **System API**
   - No → Continue to #2

2. **Does it orchestrate multiple systems or apply business logic?**
   - Yes → **Process API**
   - No → Continue to #3

3. **Is it consumer-facing with client-specific requirements?**
   - Yes → **Experience API**
   - No → Reconsider your API need

---

## Design Patterns Reference

### Routing Patterns

#### 1. Choice Router (Content-Based Routing)

**When to Use:**
- Route based on message content
- Conditional flow execution
- Business rule-based routing

**Example:**
```xml
<choice>
  <when expression="#[payload.priority == 'HIGH']">
    <flow-ref name="high-priority-flow"/>
  </when>
  <when expression="#[payload.priority == 'MEDIUM']">
    <flow-ref name="medium-priority-flow"/>
  </when>
  <otherwise>
    <flow-ref name="low-priority-flow"/>
  </otherwise>
</choice>
```

**Best Practices:**
- ✅ Use for business logic routing
- ✅ Keep conditions simple and readable
- ✅ Always include `<otherwise>` block
- ❌ Avoid deeply nested choice routers

**Performance:** O(n) - evaluates conditions sequentially

---

#### 2. First Successful Router

**When to Use:**
- Failover scenarios
- High availability requirements
- Backup system fallback

**Example:**
```xml
<first-successful>
  <route>
    <http:request config-ref="Primary_System" path="/api/data"/>
  </route>
  <route>
    <http:request config-ref="Backup_System" path="/api/data"/>
  </route>
  <route>
    <flow-ref name="cached-data-flow"/>
  </route>
</first-successful>
```

**Best Practices:**
- ✅ Order routes by preference (primary first)
- ✅ Use for system redundancy
- ✅ Combine with timeout configurations
- ⚠️ **Does NOT preserve original message** - each route gets same input

**Use Cases:**
- Primary database → Backup database
- Live API → Cached response
- Premium service → Standard service

---

#### 3. Round Robin Router

**When to Use:**
- Load balancing across multiple endpoints
- Distributing requests evenly
- Resource utilization optimization

**Example:**
```xml
<round-robin>
  <route>
    <http:request config-ref="Server_1"/>
  </route>
  <route>
    <http:request config-ref="Server_2"/>
  </route>
  <route>
    <http:request config-ref="Server_3"/>
  </route>
</round-robin>
```

**Distribution:**
```
Request 1 → Server 1
Request 2 → Server 2
Request 3 → Server 3
Request 4 → Server 1 (cycle repeats)
```

**Best Practices:**
- ✅ Use for stateless operations
- ✅ Ensure all routes have similar performance
- ✅ Monitor individual route health
- ❌ Don't use for stateful operations requiring affinity

---

#### 4. Scatter-Gather Pattern

**When to Use:**
- Parallel data aggregation from multiple sources
- Customer 360° views
- Price comparison across vendors
- Multi-system data enrichment

**Example:**
```xml
<scatter-gather>
  <route>
    <http:request config-ref="Customer_API" path="/customers/{id}"/>
  </route>
  <route>
    <http:request config-ref="Order_API" path="/orders?customerId={id}"/>
  </route>
  <route>
    <http:request config-ref="Loyalty_API" path="/points/{id}"/>
  </route>
</scatter-gather>

<!-- Aggregate results -->
<ee:transform>
  <ee:message>
    <ee:set-payload><![CDATA[%dw 2.0
output application/json
---
{
  customer: payload."0".payload,
  orders: payload."1".payload,
  loyaltyPoints: payload."2".payload
}]]></ee:set-payload>
  </ee:message>
</ee:transform>
```

**Response Structure:**
```json
{
  "0": { "payload": {...}, "attributes": {...} },
  "1": { "payload": {...}, "attributes": {...} },
  "2": { "payload": {...}, "attributes": {...} }
}
```

**Best Practices:**
- ✅ Use for independent, parallel operations
- ✅ Set appropriate timeout for slowest route
- ✅ Handle partial failures gracefully
- ✅ Index routes clearly (0, 1, 2...)
- ❌ Avoid for sequential dependencies

**Performance:** Executes in parallel - total time = slowest route

---

### Processing Patterns

#### 1. For Each Scope

**When to Use:**
- Order-dependent processing
- Sequential operations required
- Need to track iteration count

**Example:**
```xml
<foreach collection="#[payload.orders]">
  <logger message="Processing order #[vars.counter]: #[payload.orderId]"/>
  <db:insert config-ref="Database_Config">
    <db:sql>INSERT INTO order_items VALUES (:orderId, :item)</db:sql>
    <db:input-parameters><![CDATA[#[{
      orderId: payload.orderId,
      item: payload.item
    }]]]></db:input-parameters>
  </db:insert>
</foreach>
```

**Characteristics:**
- ✅ **Maintains order** of collection
- ✅ Counter variable available (`vars.counter` starts at 1)
- ✅ Predictable execution
- ❌ Slower than parallel processing

**Use Cases:**
- Database batch inserts with dependencies
- File processing where order matters
- Sequential API calls with rate limiting

---

#### 2. Parallel For Each Scope

**When to Use:**
- Independent operations on collection items
- Performance-critical batch processing
- No order dependencies

**Example:**
```xml
<parallel-foreach collection="#[payload.customers]">
  <http:request config-ref="Email_Service" method="POST" path="/send">
    <http:body><![CDATA[#[{
      to: payload.email,
      subject: "Welcome",
      body: "Thank you for joining!"
    }]]]></http:body>
  </http:request>
</parallel-foreach>
```

**Comparison:**

| Feature | For Each | Parallel For Each |
|---------|----------|-------------------|
| **Execution** | Sequential | Parallel |
| **Order** | Maintained | NOT maintained |
| **Performance** | Slower | Faster |
| **Counter** | Available | Not available |
| **Memory** | Lower | Higher |

**Best Practices:**
- ✅ Use for independent operations
- ✅ Monitor system resources (parallel threads)
- ✅ Set max concurrency if needed
- ❌ Don't use when order matters

---

### Retry Patterns

#### 1. Until Successful Scope

**When to Use:**
- Transient network failures
- Temporary service unavailability
- Rate-limited external APIs

**Example:**
```xml
<until-successful maxRetries="3" millisBetweenRetries="2000">
  <http:request config-ref="External_API" path="/data"/>
</until-successful>
```

**Configuration:**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `maxRetries` | Maximum retry attempts | 5 |
| `millisBetweenRetries` | Wait between retries (ms) | 60000 |

**Retry Logic:**
- Total attempts = maxRetries + 1 (initial attempt)
- Example: maxRetries=3 → 4 total attempts

**Best Practices:**
- ✅ Use exponential backoff for rate limiting
- ✅ Set appropriate retry intervals
- ✅ Log each retry attempt
- ⚠️ **Does NOT preserve original message**
- ❌ Don't use for permanent failures (404, 401)

---

#### 2. Reconnection Strategies

**When to Use:**
- Connector-specific connection issues
- Database connection failures
- HTTP connection timeouts

**Example:**
```xml
<http:request-config name="HTTP_Config">
  <http:request-connection host="${api.host}" port="${api.port}">
    <reconnection>
      <reconnect frequency="2000" count="3"/>
    </reconnection>
  </http:request-connection>
</http:request-config>
```

**Advantages over Until Successful:**
- ✅ Connector-aware (knows connection vs application errors)
- ✅ More intelligent retry logic
- ✅ Better error handling
- ✅ Specific to connection-level failures

**Decision Matrix:**

| Scenario | Use |
|----------|-----|
| HTTP connection timeout | Reconnection Strategy |
| API returns 503 Service Unavailable | Until Successful |
| Database connection pool exhausted | Reconnection Strategy |
| External API rate limit (429) | Until Successful with backoff |

---

## Configuration Management

### Property Externalization Strategy

**Principle:** Zero hardcoded values in source code.

**File Structure:**
```
src/main/resources/
├── config/
│   ├── dev.yaml        # Development environment
│   ├── test.yaml       # Testing environment
│   ├── staging.yaml    # Staging environment
│   └── prod.yaml       # Production environment
└── global.xml          # Global connector configs
```

**Example `dev.yaml`:**
```yaml
# Database Configuration
db:
  host: dev-mysql.example.com
  port: 3306
  database: dev_customers
  username: dev_user
  password: "![encrypted_dev_password]"

# External API Configuration
external:
  api:
    host: api.dev.example.com
    port: 443
    timeout: 30000
    client_id: dev_client_123
    client_secret: "![encrypted_dev_secret]"

# Application Configuration
app:
  environment: development
  log_level: DEBUG
  max_connections: 10
```

**Usage in Code:**
```xml
<db:config name="Database_Config">
  <db:my-sql-connection
    host="${db.host}"
    port="${db.port}"
    database="${db.database}"
    user="${db.username}"
    password="${db.password}"/>
</db:config>
```

---

### Secure Properties Encryption

**Encryption Process:**

1. **Install Secure Properties Tool** (if not using Anypoint Platform encryption)

2. **Generate Encryption Key** (16 characters for AES)
```bash
# Example key: mySecureKey12345
```

3. **Encrypt Sensitive Values:**
```bash
secure-properties-tool encrypt Blowfish CBC mySecureKey12345 "myPassword123"
# Output: ![encrypted_value_here]
```

4. **Store in Property File:**
```yaml
db:
  password: "![encrypted_value_here]"
```

5. **Configure Decryption:**
```xml
<secure-properties:config
  name="Secure_Properties"
  key="${encryption.key}"
  file="config/${env}.yaml"
  algorithm="Blowfish"
  mode="CBC"/>
```

**What to Encrypt:**
- ✅ Database passwords
- ✅ API keys and secrets
- ✅ Client credentials
- ✅ OAuth tokens
- ✅ Encryption keys
- ✅ SSL certificates (if stored as properties)

**What NOT to Encrypt:**
- ❌ Hostnames and URLs
- ❌ Port numbers
- ❌ Non-sensitive configuration
- ❌ Environment names

---

### File Organization Standards

**Project Structure:**
```
src/main/mule/
├── global.xml                    # Global configurations
├── api.xml                       # API definition (APIkit)
├── implementation/
│   ├── customer-flows.xml        # Customer-related flows
│   ├── order-flows.xml           # Order-related flows
│   └── notification-flows.xml    # Notification flows
├── error-handlers/
│   └── global-error-handler.xml  # Global error handling
└── util/
    └── common-flows.xml          # Reusable utility flows
```

**`global.xml` Contents:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<mule xmlns="...">
    <!-- Configuration Properties -->
    <configuration-properties file="config/${env}.yaml"/>

    <!-- Global Connector Configurations -->
    <db:config name="Database_Config">...</db:config>
    <http:request-config name="External_API_Config">...</http:request-config>

    <!-- APIkit Router Configuration -->
    <apikit:config name="api-config" raml="api.raml"/>
</mule>
```

**Naming Conventions:**

| Type | Convention | Example |
|------|------------|---------|
| **Flow** | `noun-verb-flow` | `customer-create-flow` |
| **Sub-flow** | `noun-verb-subflow` | `customer-validate-subflow` |
| **Config** | `System_Type_Config` | `Database_Config`, `HTTP_Request_Config` |
| **Variable** | `camelCase` | `customerId`, `transformedData` |
| **Property** | `dot.notation` | `db.host`, `api.timeout` |

---

## Security Architecture

### Defense-in-Depth Strategy

**Security Layers:**
```
┌─────────────────────────────────────────┐
│  1. Network Security (IP Whitelist)     │
├─────────────────────────────────────────┤
│  2. Rate Limiting (DDoS Prevention)     │
├─────────────────────────────────────────┤
│  3. Client ID Enforcement (API Keys)    │
├─────────────────────────────────────────┤
│  4. OAuth 2.0 (User Authentication)     │
├─────────────────────────────────────────┤
│  5. Input Validation (Data Quality)     │
├─────────────────────────────────────────┤
│  6. Authorization (Business Logic)      │
└─────────────────────────────────────────┘
```

**Apply at Experience API Layer:**
- ✅ All policies at consumer-facing layer
- ✅ Defense-in-depth (multiple checkpoints)
- ✅ Fail fast on security violations

---

### API Policy Reference

#### 1. Client ID Enforcement

**Purpose:** Validate API access via application credentials

**Configuration:**
- Applied in API Manager
- Requires headers: `client_id`, `client_secret`

**Request Example:**
```http
GET /api/customers HTTP/1.1
Host: api.example.com
client_id: abc123xyz789
client_secret: secret456def
```

**Error Response (Missing Credentials):**
```json
{
  "error": "Client ID required"
}
```

**Use Cases:**
- Application-level access control
- Usage tracking by application
- Gateway for other policies

---

#### 2. Rate Limiting

**Purpose:** Prevent abuse, ensure fair usage

**Configuration:**
- Requests per time window (minute/hour/day)
- Identifier: Client ID, IP address, or custom
- Response on limit exceeded: HTTP 429

**Example Policy:**
```
Client: abc123
Limit: 100 requests per minute
Quota Remaining: Header X-RateLimit-Remaining
```

**Best Practices:**
- ✅ Different tiers for different clients
- ✅ Include rate limit headers in response
- ✅ Document limits in API documentation
- ✅ Implement graceful degradation

**Response Headers:**
```http
HTTP/1.1 200 OK
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 47
X-RateLimit-Reset: 1625097600
```

---

#### 3. OAuth 2.0

**Purpose:** Token-based user authentication and authorization

**Flow:**
```
1. User → Login → Authorization Server
2. Authorization Server → Issues Token → User
3. User → API Request + Token → Experience API
4. Experience API → Validates Token → OAuth Server
5. Experience API → Returns Data → User
```

**Best Practices:**
- ✅ Use for user-context APIs
- ✅ Implement token refresh
- ✅ Set appropriate token expiration
- ✅ Store tokens securely

---

#### 4. IP Whitelist/Blacklist

**Purpose:** Network-level access control

**Use Cases:**
- Partner integrations (known IPs)
- Internal APIs (corporate network only)
- Blocking malicious IPs

**Configuration:**
```yaml
ip_whitelist:
  - 192.168.1.0/24
  - 10.0.0.0/8
  - partner.ip.address
```

---

### Database Security

**SQL Injection Prevention:**

**❌ VULNERABLE:**
```sql
SELECT * FROM customers WHERE id = #[payload.customerId]
```

**✅ SECURE (Parameterized Query):**
```sql
SELECT * FROM customers WHERE id = :customerId
```

**Input Parameters:**
```dataweave
{
  customerId: payload.id
}
```

**Benefits:**
- Prevents SQL injection attacks
- Proper type handling
- Query plan caching
- Better performance

---

### Secure Coding Practices

**1. Never Log Sensitive Data**

**❌ DON'T:**
```xml
<logger message="User credentials: #[payload]"/>
```

**✅ DO:**
```xml
<logger message="User login attempt for: #[payload.username]"/>
```

---

**2. Validate All Inputs**

```xml
<validation:is-not-null value="#[payload.customerId]" message="Customer ID required"/>
<validation:is-email email="#[payload.email]" message="Invalid email format"/>
<validation:is-number value="#[payload.amount]" message="Amount must be numeric"/>
```

---

**3. Sanitize Error Messages**

**❌ DON'T (Exposes Internal Details):**
```json
{
  "error": "Database connection failed: Connection to mysql://admin@10.0.1.5:3306 refused"
}
```

**✅ DO (Generic Error):**
```json
{
  "error": "Service temporarily unavailable. Please try again later.",
  "errorCode": "DB_CONN_001",
  "timestamp": "2025-10-01T12:34:56Z"
}
```

---

## Error Handling Strategy

### Three-Level Error Handling

**Hierarchy:**
```
1. Try-Catch (Processor Level)     ← Most specific
   ↓
2. Flow Error Handler               ← Flow-specific
   ↓
3. Global Error Handler             ← Application-wide fallback
```

---

### 1. Processor-Level (Try-Catch)

**When to Use:**
- Around critical operations that may fail
- When you want to handle error locally
- When you need to provide fallback behavior

**Example:**
```xml
<try>
  <http:request config-ref="External_API" path="/data"/>
  <error-handler>
    <on-error-continue type="HTTP:TIMEOUT">
      <logger level="WARN" message="API timeout, using cached data"/>
      <flow-ref name="get-cached-data-flow"/>
    </on-error-continue>
    <on-error-continue type="HTTP:CONNECTIVITY">
      <logger level="ERROR" message="API unreachable, returning error"/>
      <set-payload value='#[{error: "Service unavailable"}]'/>
    </on-error-continue>
  </error-handler>
</try>
```

**Best Practices:**
- ✅ Use for expected, recoverable errors
- ✅ Provide fallback behavior
- ✅ Log error details
- ✅ Transform errors into business responses

---

### 2. Flow-Level Error Handler

**When to Use:**
- Handle errors specific to a flow
- Different error handling per flow
- When processor-level is too granular

**Example:**
```xml
<flow name="customer-create-flow">
  <http:listener config-ref="HTTP_Listener" path="/customers" method="POST"/>

  <!-- Flow logic -->
  <db:insert config-ref="Database_Config">...</db:insert>

  <error-handler>
    <on-error-continue type="DB:DUPLICATE_KEY">
      <set-variable variableName="httpStatus" value="409"/>
      <set-payload value='#[{error: "Customer already exists"}]'/>
    </on-error-continue>

    <on-error-continue type="VALIDATION:INVALID">
      <set-variable variableName="httpStatus" value="400"/>
      <set-payload value='#[{error: error.description}]'/>
    </on-error-continue>

    <on-error-propagate type="DB:CONNECTIVITY">
      <logger level="ERROR" message="Database connection failed"/>
    </on-error-propagate>
  </error-handler>
</flow>
```

**Error Handler Types:**

| Type | Behavior | Use Case |
|------|----------|----------|
| `on-error-continue` | Handle error, continue flow | Recoverable errors |
| `on-error-propagate` | Handle error, stop flow | Critical errors |

---

### 3. Global Error Handler

**When to Use:**
- Default error handling for entire application
- Catch unhandled errors
- Consistent error response format

**Configuration (`global-error-handler.xml`):**
```xml
<error-handler name="global-error-handler">
  <on-error-continue type="HTTP:NOT_FOUND">
    <set-variable variableName="httpStatus" value="404"/>
    <ee:transform>
      <ee:message>
        <ee:set-payload><![CDATA[%dw 2.0
output application/json
---
{
  error: "Resource not found",
  errorCode: "NOT_FOUND",
  timestamp: now(),
  path: attributes.requestPath
}]]></ee:set-payload>
      </ee:message>
    </ee:transform>
  </on-error-continue>

  <on-error-continue type="ANY">
    <set-variable variableName="httpStatus" value="500"/>
    <ee:transform>
      <ee:message>
        <ee:set-payload><![CDATA[%dw 2.0
output application/json
---
{
  error: "Internal server error",
  errorCode: "INTERNAL_ERROR",
  timestamp: now(),
  requestId: correlationId
}]]></ee:set-payload>
      </ee:message>
    </ee:transform>
  </on-error-continue>
</error-handler>
```

**Reference in Flow:**
```xml
<flow name="main-flow">
  <!-- Flow logic -->
  <error-handler ref="global-error-handler"/>
</flow>
```

---

### Error Object Properties

**Available Fields:**
```dataweave
error.description        // Human-readable message
error.errorType         // Error type (e.g., HTTP:TIMEOUT)
error.detailDescription // Technical details
error.cause             // Root cause exception
```

**Usage Example:**
```dataweave
%dw 2.0
output application/json
---
{
  error: error.description,
  errorType: error.errorType.identifier,
  timestamp: now(),
  details: if (environment == "dev") error.detailDescription else null
}
```

---

### Standardized Error Response Format

**Recommended Structure:**
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "timestamp": "2025-10-01T12:34:56.789Z",
    "path": "/api/customers",
    "requestId": "abc-123-def-456",
    "details": [
      {
        "field": "email",
        "issue": "Invalid email format"
      },
      {
        "field": "age",
        "issue": "Must be a positive number"
      }
    ]
  }
}
```

---

## Development Standards

### Naming Conventions

#### Flow Naming

**Pattern:** `resource-action-flow`

**Examples:**
```xml
<!-- ✅ GOOD -->
<flow name="customer-create-flow">
<flow name="order-get-by-id-flow">
<flow name="payment-process-flow">

<!-- ❌ BAD -->
<flow name="flow1">
<flow name="createCustomer">
<flow name="getOrderByID">
```

---

#### Variable Naming

**Rules:**
- Use `camelCase`
- Descriptive names
- Avoid reserved keywords (`payload`, `attributes`, `vars`)

**Examples:**
```xml
<!-- ✅ GOOD -->
<set-variable variableName="customerId" value="#[payload.id]"/>
<set-variable variableName="transformedResponse" value="#[...]"/>
<set-variable variableName="isValidRequest" value="#[...]"/>

<!-- ❌ BAD -->
<set-variable variableName="var1" value="#[payload.id]"/>
<set-variable variableName="payload" value="#[...]"/>  <!-- Reserved! -->
<set-variable variableName="x" value="#[...]"/>
```

---

#### Display Names

**Always provide meaningful `doc:name` attributes:**

**❌ BAD:**
```xml
<set-variable variableName="customerId"/>
<logger/>
<db:select/>
```

**✅ GOOD:**
```xml
<set-variable variableName="customerId" doc:name="Store Customer ID"/>
<logger doc:name="Log Customer Creation"/>
<db:select doc:name="Fetch Customer by ID"/>
```

**Benefits:**
- Easier debugging in Studio
- Better flow diagram readability
- Self-documenting code

---

### Logging Strategy

#### Log Levels

| Level | Use Case | Example |
|-------|----------|---------|
| **ERROR** | Critical failures | Database connection lost |
| **WARN** | Recoverable issues | API timeout, using cache |
| **INFO** | Important events | Flow started/completed, major milestones |
| **DEBUG** | Detailed tracing | Payload transformations, variable values |
| **TRACE** | Very detailed | Every processor execution |

---

#### Strategic Logging Pattern

**Template:**
```xml
<flow name="customer-create-flow">
  <!-- 1. Start of flow -->
  <logger level="INFO" message="Flow started: customer-create-flow"
          doc:name="Log Flow Start"/>

  <!-- 2. Before external call -->
  <logger level="DEBUG" message="Calling customer validation API with payload: #[payload]"
          doc:name="Log Before Validation"/>
  <http:request config-ref="Validation_API" path="/validate"/>

  <!-- 3. After external call -->
  <logger level="DEBUG" message="Validation response: #[payload]"
          doc:name="Log After Validation"/>

  <!-- 4. Before transformation -->
  <logger level="DEBUG" message="Transforming payload for database insert"
          doc:name="Log Before Transform"/>
  <ee:transform>...</ee:transform>

  <!-- 5. After transformation -->
  <logger level="DEBUG" message="Transformed payload: #[payload]"
          doc:name="Log After Transform"/>

  <!-- 6. Before database operation -->
  <logger level="INFO" message="Inserting customer into database"
          doc:name="Log Before DB Insert"/>
  <db:insert config-ref="Database_Config">...</db:insert>

  <!-- 7. End of flow -->
  <logger level="INFO" message="Flow completed successfully: customer-create-flow. Customer ID: #[payload.generatedKeys.id]"
          doc:name="Log Flow Complete"/>
</flow>
```

**Benefits:**
- Complete audit trail
- Easy troubleshooting
- Performance monitoring
- Request tracing

---

#### What to Log

**✅ DO LOG:**
- Flow start/end
- External API calls (request/response)
- Database operations
- Errors and warnings
- Business milestones
- Correlation IDs

**❌ DON'T LOG:**
- Passwords or credentials
- Credit card numbers
- Social Security Numbers
- Personal Identifiable Information (PII)
- Full payloads with sensitive data

---

#### Production Logging Configuration

**`log4j2.xml` Example:**
```xml
<Configuration>
  <Appenders>
    <RollingFile name="file" fileName="${sys:mule.home}/logs/app.log"
                 filePattern="${sys:mule.home}/logs/app-%d{yyyy-MM-dd}-%i.log">
      <PatternLayout>
        <Pattern>[%d{yyyy-MM-dd HH:mm:ss.SSS}] [%t] %-5level %logger{36} - %msg%n</Pattern>
      </PatternLayout>
      <Policies>
        <TimeBasedTriggeringPolicy />
        <SizeBasedTriggeringPolicy size="100 MB"/>
      </Policies>
    </RollingFile>
  </Appenders>

  <Loggers>
    <AsyncLogger name="com.mycompany" level="INFO"/>
    <AsyncLogger name="org.mule" level="WARN"/>
    <Root level="INFO">
      <AppenderRef ref="file"/>
    </Root>
  </Loggers>
</Configuration>
```

---

### Code Organization

#### File Size Guidelines

**Maximum Lines per File:**
- **Configuration files:** 200-300 lines
- **Flow files:** 500 lines
- **Single flow:** 100-150 lines

**If exceeding limits:**
- Split into multiple files by domain/functionality
- Use flow references for reusable logic
- Consider refactoring into sub-flows

---

#### Reusable Sub-Flows

**When to Create a Sub-Flow:**
- Logic used in multiple flows
- Complex transformation logic
- Common validation routines
- Standard error transformations

**Example:**
```xml
<!-- Reusable sub-flow -->
<sub-flow name="validate-customer-subflow">
  <validation:is-not-null value="#[payload.name]" message="Name required"/>
  <validation:is-email email="#[payload.email]" message="Invalid email"/>
  <validation:is-true expression="#[payload.age >= 18]" message="Must be 18+"/>
</sub-flow>

<!-- Use in multiple flows -->
<flow name="customer-create-flow">
  <flow-ref name="validate-customer-subflow"/>
  <!-- Continue processing -->
</flow>

<flow name="customer-update-flow">
  <flow-ref name="validate-customer-subflow"/>
  <!-- Continue processing -->
</flow>
```

---

## DataWeave Best Practices

### Performance Optimization

#### 1. Streaming vs In-Memory

**Use Streaming for Large Payloads:**

**✅ GOOD (Streaming):**
```dataweave
%dw 2.0
output application/json deferred=true
---
payload map ((item) -> {
  id: item.id,
  name: item.name
})
```

**❌ BAD (In-Memory for Large Data):**
```dataweave
%dw 2.0
output application/json
---
payload map ((item) -> {
  id: item.id,
  name: item.name
})
```

**When to Stream:**
- Files > 10MB
- Large database result sets
- Processing collections with 1000+ items

---

#### 2. Use DataWeave Functions

**✅ GOOD (Built-in Functions):**
```dataweave
%dw 2.0
output application/json
import * from dw::core::Strings
---
{
  fullName: capitalize(payload.firstName) ++ " " ++ capitalize(payload.lastName),
  email: lower(payload.email)
}
```

**❌ BAD (Manual Implementation):**
```dataweave
%dw 2.0
output application/json
---
{
  fullName: (payload.firstName[0] ++ payload.firstName[1 to -1]) ++ " " ++
            (payload.lastName[0] ++ payload.lastName[1 to -1])
}
```

---

### Common Patterns

#### 1. Null-Safe Navigation

**Problem:** Prevent null pointer errors

**✅ SOLUTION:**
```dataweave
%dw 2.0
output application/json
---
{
  customerName: payload.customer.name default "Unknown",
  orderCount: sizeOf(payload.orders default []),
  primaryPhone: payload.contacts[0].phone default null
}
```

---

#### 2. Filtering Collections

```dataweave
%dw 2.0
output application/json
---
payload.orders filter ($.status == "ACTIVE" and $.amount > 100)
```

---

#### 3. Grouping Data

```dataweave
%dw 2.0
output application/json
---
payload.orders groupBy $.customerId
```

**Output:**
```json
{
  "CUST001": [
    { "orderId": "ORD1", "customerId": "CUST001", "amount": 100 },
    { "orderId": "ORD2", "customerId": "CUST001", "amount": 200 }
  ],
  "CUST002": [
    { "orderId": "ORD3", "customerId": "CUST002", "amount": 150 }
  ]
}
```

---

#### 4. Flattening Nested Arrays

```dataweave
%dw 2.0
output application/json
---
flatten(payload.customers map $.orders)
```

---

#### 5. Type Conversion

```dataweave
%dw 2.0
output application/json
---
{
  amount: payload.amount as Number,
  date: payload.date as Date {format: "yyyy-MM-dd"},
  isActive: payload.status == "ACTIVE"
}
```

---

### DataWeave Testing

**Use DataWeave Playground:**
1. Navigate to https://dataweave.mulesoft.com/
2. Paste sample input
3. Write transformation
4. Validate output
5. Copy to Anypoint Studio

**Benefits:**
- Fast iteration
- No deployment needed
- Built-in examples
- Syntax highlighting

---

## CI/CD & DevOps

### Git Workflow

#### Branching Strategy

**Branches:**
```
main/master          ← Production-ready code
  ├── staging        ← Pre-production testing
  ├── development    ← Integration branch
      ├── feature/customer-api
      ├── feature/order-processing
      └── bugfix/validation-error
```

**Rules:**
- ✅ **Never commit directly to main/master**
- ✅ Create feature branch from `development`
- ✅ Merge feature → development → staging → main
- ✅ Use pull requests for code review
- ✅ Delete feature branches after merge

---

#### Daily Workflow

**Morning:**
```bash
# 1. Switch to development branch
git checkout development

# 2. Pull latest changes
git pull origin development

# 3. Create feature branch
git checkout -b feature/customer-validation
```

**During Development:**
```bash
# 4. Make changes, test locally

# 5. Stage changes
git add .

# 6. Commit with meaningful message
git commit -m "Add email validation for customer creation"

# 7. Push to remote (daily!)
git push origin feature/customer-validation
```

**Completion:**
```bash
# 8. Create pull request (via Azure DevOps/GitHub)

# 9. After approval and merge, delete feature branch
git checkout development
git pull origin development
git branch -d feature/customer-validation
```

---

#### Commit Message Guidelines

**Format:**
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code refactoring
- `docs`: Documentation
- `test`: Tests
- `chore`: Build/config changes

**Examples:**

**✅ GOOD:**
```
feat(customer-api): Add email validation for customer creation

- Implemented validation module for email format
- Added unit tests for validation logic
- Updated error messages for better clarity

Closes #123
```

**✅ GOOD:**
```
fix(order-processing): Resolve null pointer on empty order items

- Added null check before processing order items
- Improved error handling for edge cases

Fixes #456
```

**❌ BAD:**
```
updated stuff
```

**❌ BAD:**
```
fixed bug
```

---

### CI/CD Pipeline Architecture

#### Build Pipeline

**Purpose:** Compile, test, package

**Stages:**
```yaml
trigger:
  branches:
    include:
      - development
      - staging
      - main

pool:
  vmImage: 'ubuntu-latest'

stages:
  - stage: Build
    jobs:
      - job: CompileAndPackage
        steps:
          # 1. Checkout code
          - checkout: self

          # 2. Set up Maven
          - task: Maven@3
            inputs:
              mavenPomFile: 'pom.xml'
              goals: 'clean package'
              options: '-DskipTests=false'

          # 3. Run unit tests
          - task: Maven@3
            inputs:
              goals: 'test'

          # 4. Publish test results
          - task: PublishTestResults@2
            inputs:
              testResultsFiles: '**/target/surefire-reports/*.xml'

          # 5. Publish artifact
          - task: PublishBuildArtifacts@1
            inputs:
              pathToPublish: 'target/*.jar'
              artifactName: 'mule-app'
```

---

#### Release Pipeline

**Purpose:** Deploy to environments

**Stages:**
```
Build Artifact
    ↓
Deploy to DEV (automatic)
    ↓
Integration Tests
    ↓
Deploy to STAGING (manual approval)
    ↓
Smoke Tests
    ↓
Deploy to PRODUCTION (manual approval)
    ↓
Health Checks
```

**Configuration:**
```yaml
stages:
  - stage: DeployDev
    jobs:
      - deployment: DeployToDev
        environment: development
        strategy:
          runOnce:
            deploy:
              steps:
                - task: DownloadBuildArtifacts@0
                - task: AnyPointCLI@1
                  inputs:
                    command: 'deploy'
                    environment: 'dev'
                    runtime: '4.4.0'
                    workers: 1
                    workerSize: '0.1'
                    properties: |
                      env=dev
                      anypoint.platform.client_id=$(DEV_CLIENT_ID)
                      anypoint.platform.client_secret=$(DEV_CLIENT_SECRET)

  - stage: DeployStaging
    dependsOn: DeployDev
    condition: succeeded()
    jobs:
      - deployment: DeployToStaging
        environment: staging
        strategy:
          runOnce:
            deploy:
              steps:
                - task: DownloadBuildArtifacts@0
                - task: ManualValidation@0
                  inputs:
                    notifyUsers: 'tech-lead@example.com'
                - task: AnyPointCLI@1
                  inputs:
                    command: 'deploy'
                    environment: 'staging'
                    runtime: '4.4.0'
                    workers: 2
                    workerSize: '0.2'
```

---

### Environment Configuration

**Variable Groups (Azure DevOps):**

**Development:**
```yaml
env: dev
db.host: dev-mysql.example.com
db.port: 3306
api.timeout: 30000
log.level: DEBUG
```

**Staging:**
```yaml
env: staging
db.host: staging-mysql.example.com
db.port: 3306
api.timeout: 30000
log.level: INFO
```

**Production:**
```yaml
env: prod
db.host: prod-mysql-cluster.example.com
db.port: 3306
api.timeout: 60000
log.level: WARN
```

---

## Testing Strategy

### Test Pyramid

```
        /\
       /  \
      / UI \
     /______\
    /        \
   /Integration\
  /____________\
 /              \
/   Unit Tests   \
/________________\
```

**Distribution:**
- **70% Unit Tests** - Fast, isolated, deterministic
- **20% Integration Tests** - API contracts, database interactions
- **10% End-to-End Tests** - Complete user flows

---

### Unit Testing with MUnit

**Example Test:**
```xml
<munit:test name="customer-create-flow-test" description="Test customer creation flow">
  <!-- Set up -->
  <munit:behavior>
    <set-payload value='#[{
      "name": "John Doe",
      "email": "john@example.com",
      "age": 30
    }]'/>
  </munit:behavior>

  <!-- Execute -->
  <munit:execution>
    <flow-ref name="customer-create-flow"/>
  </munit:execution>

  <!-- Verify -->
  <munit:validation>
    <munit-tools:assert-equals
      actual="#[payload.status]"
      expected="#['SUCCESS']"/>
    <munit-tools:assert-that
      expression="#[payload.customerId]"
      is="#[MunitTools::notNullValue()]"/>
  </munit:validation>
</munit:test>
```

---

### Integration Testing

**Postman Collection Structure:**
```
Customer API Tests
├── Create Customer
│   ├── Valid Customer (200)
│   ├── Missing Required Field (400)
│   ├── Invalid Email Format (400)
│   └── Duplicate Customer (409)
├── Get Customer by ID
│   ├── Existing Customer (200)
│   └── Non-existent Customer (404)
└── Update Customer
    ├── Valid Update (200)
    └── Invalid Customer ID (404)
```

**Automated Test Script:**
```javascript
// Postman Test Script
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Response has customerId", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData.customerId).to.exist;
});

pm.test("Response time is less than 500ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(500);
});
```

---

### Validation Module Testing

**Test All Validations:**
```xml
<!-- Validation Sub-flow -->
<sub-flow name="validate-customer-input">
  <validation:is-not-null
    value="#[payload.name]"
    message="Name is required"/>

  <validation:is-email
    email="#[payload.email]"
    message="Invalid email format"/>

  <validation:is-true
    expression="#[payload.age >= 18]"
    message="Customer must be 18 or older"/>
</sub-flow>
```

**MUnit Test:**
```xml
<munit:test name="validation-test-invalid-email">
  <munit:behavior>
    <set-payload value='#[{
      "name": "John Doe",
      "email": "invalid-email",
      "age": 25
    }]'/>
  </munit:behavior>

  <munit:execution>
    <try>
      <flow-ref name="validate-customer-input"/>
      <error-handler>
        <on-error-continue type="VALIDATION:INVALID">
          <set-variable variableName="validationError" value="#[error.description]"/>
        </on-error-continue>
      </error-handler>
    </try>
  </munit:execution>

  <munit:validation>
    <munit-tools:assert-that
      expression="#[vars.validationError]"
      is="#[MunitTools::containsString('Invalid email format')]"/>
  </munit:validation>
</munit:test>
```

---

## Performance & Scalability

### Parallel Processing Guidelines

**Decision Matrix:**

| Scenario | Pattern | Reason |
|----------|---------|--------|
| **Order-dependent processing** | For Each | Maintains sequence |
| **Independent API calls** | Parallel For Each | Better performance |
| **Small collections (< 100)** | For Each | Lower overhead |
| **Large collections (> 1000)** | Parallel For Each | Significant speedup |
| **Database batch inserts** | For Each | Prevents connection pool exhaustion |

---

### Connection Pooling

**Database Configuration:**
```xml
<db:config name="Database_Config">
  <db:my-sql-connection
    host="${db.host}"
    port="${db.port}"
    database="${db.database}"
    user="${db.user}"
    password="${db.password}">

    <db:pooling-profile
      maxPoolSize="20"
      minPoolSize="5"
      acquireIncrement="1"
      preparedStatementCacheSize="50"/>
  </db:my-sql-connection>
</db:config>
```

**Best Practices:**
- ✅ Set `maxPoolSize` based on expected concurrent requests
- ✅ Set `minPoolSize` for baseline performance
- ✅ Enable prepared statement caching
- ✅ Monitor pool usage in production

---

### Caching Strategy

**Use Cases:**
- Reference data (countries, states)
- Infrequently changing data
- Expensive API calls

**Example (Object Store):**
```xml
<!-- Cache Configuration -->
<os:object-store
  name="Cache_Store"
  maxEntries="1000"
  entryTtl="1"
  entryTtlUnit="HOURS"/>

<!-- Check cache first -->
<os:retrieve key="#[payload.customerId]" objectStore="Cache_Store" target="cachedCustomer">
  <os:default-value>#[null]</os:default-value>
</os:retrieve>

<choice>
  <when expression="#[vars.cachedCustomer != null]">
    <logger message="Cache hit for customer #[payload.customerId]"/>
    <set-payload value="#[vars.cachedCustomer]"/>
  </when>
  <otherwise>
    <logger message="Cache miss, fetching from database"/>
    <db:select config-ref="Database_Config">...</db:select>
    <os:store key="#[payload.id]" objectStore="Cache_Store">
      <os:value>#[payload]</os:value>
    </os:store>
  </otherwise>
</choice>
```

---

### CloudHub Worker Sizing

**Guidelines:**

| Worker Size | vCores | Memory | Use Case |
|-------------|--------|--------|----------|
| **0.1** | 0.1 | 500 MB | Development, light testing |
| **0.2** | 0.2 | 1 GB | Low-traffic APIs |
| **1** | 1 | 1.5 GB | Standard production APIs |
| **2** | 2 | 3 GB | High-traffic APIs |
| **4** | 4 | 7.5 GB | Very high traffic, large payloads |

**Considerations:**
- Start with smaller workers
- Monitor CPU and memory usage
- Scale up based on actual metrics
- Use multiple workers for high availability

---

## Quick Reference

### HTTP Status Codes

**Success (2xx):**
- `200 OK` - Successful GET, PUT, PATCH
- `201 Created` - Successful POST (resource created)
- `202 Accepted` - Request accepted (async processing)
- `204 No Content` - Successful DELETE

**Client Errors (4xx):**
- `400 Bad Request` - Invalid input data
- `401 Unauthorized` - Missing/invalid authentication
- `403 Forbidden` - Authenticated but not authorized
- `404 Not Found` - Resource doesn't exist
- `409 Conflict` - Resource already exists (duplicate)
- `422 Unprocessable Entity` - Validation failed
- `429 Too Many Requests` - Rate limit exceeded

**Server Errors (5xx):**
- `500 Internal Server Error` - Unexpected server error
- `502 Bad Gateway` - Upstream service error
- `503 Service Unavailable` - Service temporarily down
- `504 Gateway Timeout` - Upstream service timeout

---

### DataWeave Quick Reference

**Operators:**
```dataweave
// Concatenation
payload.firstName ++ " " ++ payload.lastName

// Null Coalescing
payload.email default "noemail@example.com"

// Conditional
if (payload.age > 18) "Adult" else "Minor"

// Map
payload.items map ((item) -> item.price)

// Filter
payload.items filter ($.status == "ACTIVE")

// Reduce
payload.items reduce ((item, acc) -> acc + item.price)
```

**Functions:**
```dataweave
import * from dw::core::Strings
import * from dw::core::Arrays

// String functions
upper("hello")                 // "HELLO"
lower("HELLO")                 // "hello"
capitalize("hello world")      // "Hello World"
substring("hello", 0, 2)       // "he"

// Array functions
sizeOf([1, 2, 3])             // 3
flatten([[1, 2], [3, 4]])     // [1, 2, 3, 4]
distinctBy(items, $.id)        // Remove duplicates by id

// Date functions
now()                          // Current timestamp
now() as String {format: "yyyy-MM-dd"}
```

---

### Cron Expression Examples

**Format:** `second minute hour day month dayOfWeek`

**Examples:**
```cron
0 0 9 * * ?           # Every day at 9:00 AM
0 */15 * * * ?        # Every 15 minutes
0 0 0 1 * ?           # First day of every month at midnight
0 0 18 * * MON-FRI    # Weekdays at 6:00 PM
0 0 2 * * SAT         # Every Saturday at 2:00 AM
0 30 8 1-7 * MON      # First Monday of month at 8:30 AM
```

**Online Tool:** https://www.freeformatter.com/cron-expression-generator-quartz.html

---

### Common Error Types

**HTTP Errors:**
- `HTTP:TIMEOUT` - Request timeout
- `HTTP:CONNECTIVITY` - Connection failed
- `HTTP:NOT_FOUND` - 404 response
- `HTTP:UNAUTHORIZED` - 401 response
- `HTTP:FORBIDDEN` - 403 response

**Database Errors:**
- `DB:CONNECTIVITY` - Connection failed
- `DB:DUPLICATE_KEY` - Unique constraint violation
- `DB:QUERY_EXECUTION` - SQL syntax error
- `DB:BAD_SQL_GRAMMAR` - Invalid SQL

**Validation Errors:**
- `VALIDATION:INVALID` - Validation failed
- `VALIDATION:NULL` - Null value not allowed

**MuleSoft Errors:**
- `MULE:EXPRESSION` - Expression evaluation failed
- `MULE:TRANSFORMATION` - Transformation error
- `MULE:RETRY_EXHAUSTED` - All retry attempts failed

---

## Code Review Checklist

### Pre-Deployment Checklist

**Configuration:**
- [ ] All credentials externalized to property files
- [ ] Sensitive properties encrypted
- [ ] Environment-specific property files created (dev, test, staging, prod)
- [ ] No hardcoded values in XML files
- [ ] Global connectors configured in `global.xml`

**Security:**
- [ ] API policies applied (Client ID, Rate Limiting)
- [ ] Input validation implemented
- [ ] Parameterized database queries used
- [ ] No sensitive data in logs
- [ ] Error messages don't expose internal details
- [ ] Auto-discovery configured for Experience APIs

**Error Handling:**
- [ ] Global error handler implemented
- [ ] Flow-level error handlers for specific errors
- [ ] Try-catch around critical operations
- [ ] Meaningful error messages provided
- [ ] HTTP status codes appropriate

**Code Quality:**
- [ ] Meaningful display names for all components
- [ ] Descriptive variable names (no `var1`, `temp`, etc.)
- [ ] Flows organized by functionality
- [ ] Reusable logic extracted to sub-flows
- [ ] No duplicate connector configurations
- [ ] Comments for complex business logic

**Logging:**
- [ ] Flow start/end logged (INFO level)
- [ ] External API calls logged (DEBUG level)
- [ ] Errors logged with context
- [ ] No sensitive data in logs
- [ ] Correlation IDs used for tracing

**Testing:**
- [ ] Unit tests for business logic
- [ ] Integration tests for APIs
- [ ] Negative test cases covered
- [ ] Validation rules tested
- [ ] Error handling tested

**Performance:**
- [ ] Connection pooling configured
- [ ] Appropriate worker size selected
- [ ] Parallel processing used where applicable
- [ ] Large payloads streamed (not in-memory)
- [ ] Caching implemented for reference data

**Documentation:**
- [ ] RAML specification up-to-date
- [ ] API examples provided
- [ ] README with deployment instructions
- [ ] Change log updated

**Version Control:**
- [ ] Meaningful commit messages
- [ ] Feature branch created from development
- [ ] Pull request created
- [ ] Code reviewed by peer
- [ ] Conflicts resolved

---

## Anti-Patterns

### What NOT to Do

#### 1. ❌ Hardcoding Configuration

**BAD:**
```xml
<db:config name="Database_Config">
  <db:my-sql-connection
    host="prod-db.example.com"
    port="3306"
    user="admin"
    password="password123"/>
</db:config>
```

**WHY BAD:**
- Can't change environments without code changes
- Security risk (credentials in code)
- Difficult to manage across teams

**GOOD:**
```xml
<configuration-properties file="config/${env}.yaml"/>

<db:config name="Database_Config">
  <db:my-sql-connection
    host="${db.host}"
    port="${db.port}"
    user="${db.user}"
    password="${db.password}"/>
</db:config>
```

---

#### 2. ❌ Exposing System APIs Directly

**BAD Architecture:**
```
Mobile App → System API → Database
```

**WHY BAD:**
- No security layer
- No business logic separation
- Tight coupling to data model
- Can't reuse business logic

**GOOD Architecture:**
```
Mobile App → Experience API → Process API → System API → Database
```

---

#### 3. ❌ Logging Sensitive Data

**BAD:**
```xml
<logger message="User login: #[payload]"/>
<!-- Logs: { "username": "john", "password": "secret123", "ssn": "123-45-6789" } -->
```

**WHY BAD:**
- Security violation
- Compliance issues (GDPR, PCI-DSS)
- Risk of credential theft

**GOOD:**
```xml
<logger message="User login attempt for username: #[payload.username]"/>
<!-- Logs: User login attempt for username: john -->
```

---

#### 4. ❌ Ignoring Error Handling

**BAD:**
```xml
<flow name="risky-flow">
  <http:request config-ref="External_API" path="/data"/>
  <!-- What if this fails? -->
</flow>
```

**WHY BAD:**
- Unpredictable behavior on failure
- No recovery mechanism
- Poor user experience
- Difficult to troubleshoot

**GOOD:**
```xml
<flow name="resilient-flow">
  <try>
    <http:request config-ref="External_API" path="/data"/>
    <error-handler>
      <on-error-continue type="HTTP:TIMEOUT">
        <logger level="WARN" message="API timeout, using fallback"/>
        <flow-ref name="fallback-data-flow"/>
      </on-error-continue>
    </error-handler>
  </try>
</flow>
```

---

#### 5. ❌ Using `payload` as Variable Name

**BAD:**
```xml
<set-variable variableName="payload" value="#[{status: 'processed'}]"/>
<!-- This overwrites the special 'payload' keyword! -->
```

**WHY BAD:**
- `payload` is a reserved keyword
- Causes confusion and bugs
- Breaks flow execution

**GOOD:**
```xml
<set-variable variableName="processedData" value="#[{status: 'processed'}]"/>
```

---

#### 6. ❌ Duplicate Connector Configurations

**BAD:**
```xml
<flow name="flow1">
  <db:config name="DB_Config_1">...</db:config>
  <db:select config-ref="DB_Config_1">...</db:select>
</flow>

<flow name="flow2">
  <db:config name="DB_Config_2">...</db:config>
  <db:select config-ref="DB_Config_2">...</db:select>
</flow>
```

**WHY BAD:**
- Duplicate configuration
- Harder to maintain
- Connection pool fragmentation

**GOOD:**
```xml
<!-- In global.xml -->
<db:config name="Database_Config">...</db:config>

<!-- In flow1 -->
<flow name="flow1">
  <db:select config-ref="Database_Config">...</db:select>
</flow>

<!-- In flow2 -->
<flow name="flow2">
  <db:select config-ref="Database_Config">...</db:select>
</flow>
```

---

#### 7. ❌ SQL Injection Vulnerability

**BAD:**
```sql
SELECT * FROM users WHERE username = '#[payload.username]'
```

**WHY BAD:**
- SQL injection attack risk
- Malicious input: `admin' OR '1'='1`
- Data breach potential

**GOOD:**
```sql
SELECT * FROM users WHERE username = :username
```
```dataweave
{
  username: payload.username
}
```

---

#### 8. ❌ No Input Validation

**BAD:**
```xml
<flow name="create-user-flow">
  <http:listener path="/users" method="POST"/>
  <db:insert>...</db:insert>  <!-- Inserts whatever was sent! -->
</flow>
```

**WHY BAD:**
- Garbage data in database
- Potential security issues
- Poor data quality

**GOOD:**
```xml
<flow name="create-user-flow">
  <http:listener path="/users" method="POST"/>

  <!-- Validate input -->
  <validation:is-not-null value="#[payload.name]"/>
  <validation:is-email email="#[payload.email]"/>
  <validation:is-true expression="#[payload.age >= 18]"/>

  <db:insert>...</db:insert>
</flow>
```

---

#### 9. ❌ Missing Auto-Discovery

**BAD:**
```xml
<!-- Experience API without auto-discovery -->
<flow name="api-main-flow">
  <http:listener path="/api/*"/>
  <!-- No auto-discovery = No policies! -->
</flow>
```

**WHY BAD:**
- API Manager policies don't apply
- No rate limiting, security policies
- Can't manage API centrally

**GOOD:**
```xml
<flow name="api-main-flow">
  <http:listener path="/api/*"/>
  <apikit:router config-ref="api-config"/>
  <api-gateway:autodiscovery
    apiId="${api.id}"
    flowRef="api-main-flow"/>
</flow>
```

---

#### 10. ❌ In-Memory Processing of Large Files

**BAD:**
```dataweave
%dw 2.0
output application/json
---
payload map ((item) -> {
  // Processing 10 GB file in memory!
})
```

**WHY BAD:**
- Out of memory errors
- Poor performance
- Application crashes

**GOOD:**
```dataweave
%dw 2.0
output application/json deferred=true  // Enable streaming
---
payload map ((item) -> {
  // Streaming processing
})
```

---

## Conclusion

### Summary

This guideline document provides a comprehensive framework for building **well-architected MuleSoft applications** that are:

- ✅ **Secure** - Multi-layer security, encrypted properties
- ✅ **Scalable** - Layered architecture, parallel processing
- ✅ **Maintainable** - Clear structure, reusable components
- ✅ **Reliable** - Comprehensive error handling, retry patterns
- ✅ **Automated** - CI/CD pipelines, automated testing
- ✅ **Performant** - Connection pooling, caching, streaming

---

### Key Takeaways

1. **API-Led Connectivity** - Always use the three-layer pattern
2. **Security by Design** - Apply policies at Experience layer
3. **Externalize Everything** - No hardcoded values
4. **Fail Gracefully** - Comprehensive error handling at all levels
5. **Automate Deployment** - CI/CD for consistency
6. **Test Thoroughly** - Unit, integration, and E2E tests
7. **Monitor Performance** - Logging, alerts, metrics

---

### Next Steps

1. **Review existing applications** against this guideline
2. **Create project templates** with these standards
3. **Train team members** on best practices
4. **Establish code review process** using checklist
5. **Continuously improve** based on lessons learned

---

### References

- **Anypoint Platform Documentation:** https://docs.mulesoft.com/
- **DataWeave Reference:** https://docs.mulesoft.com/dataweave/latest/
- **MUnit Testing:** https://docs.mulesoft.com/munit/latest/
- **API Manager Policies:** https://docs.mulesoft.com/api-manager/latest/policies
- **CloudHub Documentation:** https://docs.mulesoft.com/runtime-manager/cloudhub

---

**Document Version:** 1.0
**Last Updated:** October 1, 2025
**Maintained By:** MuleSoft Architecture Team
