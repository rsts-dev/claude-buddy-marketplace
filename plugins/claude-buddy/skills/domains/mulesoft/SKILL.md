---
name: mulesoft-development
description: MuleSoft development expertise including DataWeave, Anypoint Platform, Mule SDK, and connector development. Use when working with Mule applications, DataWeave transformations, Anypoint CLI, or building Mule connectors. Auto-activates for .dwl files and MuleSoft-specific tasks.
---

# MuleSoft Development Skill

Comprehensive guidance for MuleSoft development, including Data Weave transformations, Anypoint Platform integration, Mule application development, and connector creation.

## When to Use This Skill

- Writing DataWeave transformations
- Building Mule 4 applications and flows
- Developing custom Mule connectors
- Using Anypoint CLI for deployment and management
- Implementing integration patterns with MuleSoft
- API-led connectivity architecture
- Error handling and logging in Mule applications
- Performance optimization for Mule flows

## Auto-Activation

This skill automatically activates when:
- Working with .dwl (DataWeave) files
- Keywords: DataWeave, Mule, Anypoint, connector, MuleSoft, transformation
- Project contains pom.xml with Mule dependencies
- Discussion of integration patterns or API management

## Reference Materials

This skill includes comprehensive documentation and examples:

- **[dataweave.md](dataweave.md)**: Complete DataWeave code snippets, transformations, and function examples
- **[mule-sdk.md](mule-sdk.md)**: Mule SDK documentation for building custom modules
- **[mule-connector.md](mule-connector.md)**: Connector development best practices
- **[mule-guidelines.md](mule-guidelines.md)**: General MuleSoft development guidelines
- **[anypoint-cli.md](anypoint-cli.md)**: Anypoint CLI commands and usage
- **[docs-general.md](docs-general.md)**: General MuleSoft documentation patterns

## Key Concepts

### DataWeave Fundamentals

DataWeave is MuleSoft's expression language for data transformation.

**Basic Transformation**:
```dataweave
%dw 2.0
output application/json
---
{
  user: {
    firstName: payload.first_name,
    lastName: payload.last_name,
    email: payload.email
  }
}
```

**Array Mapping**:
```dataweave
%dw 2.0
output application/json
---
payload.users map (user, index) -> {
  id: user.userId,
  name: user.firstName ++ " " ++ user.lastName,
  index: index
}
```

**Filtering Data**:
```dataweave
%dw 2.0
output application/json
---
payload.orders filter (order) -> order.status == "COMPLETED"
```

### Mule Application Structure

**Flow Configuration**:
```xml
<flow name="api-main-flow">
  <http:listener config-ref="HTTP_Listener_config" path="/api/users"/>
  <ee:transform doc:name="Transform Message">
    <ee:message>
      <ee:set-payload><![CDATA[%dw 2.0
output application/json
---
payload
      ]]></ee:set-payload>
    </ee:message>
  </ee:transform>
  <logger level="INFO" message="#[payload]"/>
</flow>
```

**Error Handling**:
```xml
<error-handler>
  <on-error-continue type="HTTP:NOT_FOUND">
    <ee:transform>
      <ee:message>
        <ee:set-payload><![CDATA[%dw 2.0
output application/json
---
{
  error: "Resource not found",
  timestamp: now()
}
        ]]></ee:set-payload>
      </ee:message>
      <ee:variables>
        <ee:set-variable variableName="httpStatus">404</ee:set-variable>
      </ee:variables>
    </ee:transform>
  </on-error-continue>
</error-handler>
```

### API-Led Connectivity

MuleSoft promotes a three-tier API architecture:

1. **System APIs**: Connect to core systems (databases, SaaS apps)
2. **Process APIs**: Orchestrate and aggregate data from System APIs
3. **Experience APIs**: Provide tailored experiences for specific channels

### DataWeave Best Practices

1. **Use Type Coercion Carefully**:
```dataweave
%dw 2.0
output application/json
---
{
  // Explicit coercion
  age: payload.age as Number,
  timestamp: payload.created as DateTime
}
```

2. **Leverage Built-in Functions**:
```dataweave
%dw 2.0
output application/json
import * from dw::core::Strings
---
{
  upperName: upper(payload.name),
  isValid: payload.email contains "@"
}
```

3. **Use Variables for Reusability**:
```dataweave
%dw 2.0
output application/json
var fullName = payload.firstName ++ " " ++ payload.lastName
---
{
  name: fullName,
  greeting: "Hello, " ++ fullName
}
```

4. **Handle Null Values**:
```dataweave
%dw 2.0
output application/json
---
{
  name: payload.name default "Unknown",
  email: payload.email,
  // Only include phone if it exists
  (phone: payload.phone) if (payload.phone != null)
}
```

### Mule Connector Development

**Define Operations**:
```java
@Operations(value = {MyConnectorOperations.class})
@ConnectionProviders(MyConnectionProvider.class)
public class MyConnectorExtension {
  // Extension configuration
}
```

**Implement Operation**:
```java
public class MyConnectorOperations {
  @MediaType(MediaType.APPLICATION_JSON)
  public Result<String, Void> getData(String id) {
    // Implementation
    return Result.<String, Void>builder()
      .output(jsonData)
      .build();
  }
}
```

### Anypoint CLI Usage

**Deploy Application**:
```bash
anypoint-cli runtime-mgr cloudhub-application deploy \
  --runtime 4.4.0 \
  --workers 1 \
  --workerSize 0.1 \
  my-app target/my-app-1.0.0.jar
```

**List Applications**:
```bash
anypoint-cli runtime-mgr cloudhub-application list
```

**Manage APIs**:
```bash
anypoint-cli api-mgr api create \
  --name "My API" \
  --version "1.0.0"
```

## Common Patterns

### Request-Response Pattern
```xml
<flow name="request-response-flow">
  <http:listener config-ref="HTTP_Listener_config" path="/api/resource"/>
  <http:request method="GET" config-ref="HTTP_Request_config" path="/external-api"/>
  <ee:transform doc:name="Transform Response">
    <!-- DataWeave transformation -->
  </ee:transform>
</flow>
```

### Async Processing with VM Queues
```xml
<flow name="async-publisher">
  <vm:publish queueName="orders" config-ref="VM_Config"/>
</flow>

<flow name="async-consumer">
  <vm:listener queueName="orders" config-ref="VM_Config"/>
  <!-- Process message asynchronously -->
</flow>
```

### Batch Processing
```xml
<batch:job name="batchJob">
  <batch:process-records>
    <batch:step name="processRecords">
      <!-- Process each record -->
    </batch:step>
  </batch:process-records>
  <batch:on-complete>
    <!-- Batch completion logic -->
  </batch:on-complete>
</batch:job>
```

## Performance Optimization

1. **Streaming**: Use streaming for large payloads
2. **Connection Pooling**: Configure proper connection pool sizes
3. **Caching**: Implement caching for frequently accessed data
4. **Async Processing**: Use VM queues for non-blocking operations
5. **Batch Processing**: Process large datasets efficiently
6. **DataWeave Optimization**: Avoid unnecessary iterations

## Testing

### MUnit Test Example
```xml
<munit:test name="test-main-flow">
  <munit:execution>
    <flow-ref name="api-main-flow"/>
  </munit:execution>
  <munit:validation>
    <munit-tools:assert-that expression="#[payload.status]" is="#[MunitTools::equalTo('success')]"/>
  </munit:validation>
</munit:test>
```

### DataWeave Testing
```dataweave
%dw 2.0
output application/json
import * from dw::test::Tests
import * from dw::test::Asserts
---
"test transformation" describedBy [
  "should transform user data" in do {
    // Test implementation
  }
]
```

## Common Issues & Solutions

### Issue: Payload Consumed
**Solution**: Store payload in variable before consuming:
```xml
<set-variable variableName="originalPayload" value="#[payload]"/>
```

### Issue: DataWeave Performance
**Solution**: Optimize with indexing:
```dataweave
var usersById = payload.users groupBy $.id
---
usersById[requestedId]  // Fast lookup
```

### Issue: Memory Issues with Large Files
**Solution**: Use streaming:
```xml
<file:read path="largefile.csv" outputMimeType="application/csv; streaming=true"/>
```

## Integration Patterns

- **Scatter-Gather**: Parallel processing and aggregation
- **Content-Based Routing**: Route based on message content
- **Message Enrichment**: Add data from external sources
- **Idempotent Processing**: Prevent duplicate processing
- **Circuit Breaker**: Fail fast for unavailable services

## Security Best Practices

1. **Secure Properties**: Use secure property placeholders
2. **TLS/SSL**: Enable HTTPS for all HTTP listeners
3. **OAuth 2.0**: Implement proper authentication
4. **API Policies**: Apply rate limiting, throttling, and security policies
5. **Encryption**: Encrypt sensitive data in DataWeave

## Resources

For detailed code examples, function references, and comprehensive documentation, see the accompanying files:
- [dataweave.md](dataweave.md) - DataWeave examples and patterns
- [mule-sdk.md](mule-sdk.md) - SDK documentation
- [mule-connector.md](mule-connector.md) - Connector development
- [mule-guidelines.md](mule-guidelines.md) - Development guidelines
- [anypoint-cli.md](anypoint-cli.md) - CLI reference
- [docs-general.md](docs-general.md) - General documentation
