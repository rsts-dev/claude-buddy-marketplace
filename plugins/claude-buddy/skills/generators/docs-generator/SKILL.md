---
name: docs-generator
description: Generate comprehensive technical documentation from codebase analysis. Use when user requests documentation, API docs, technical guides, or system documentation. Auto-activates for "docs", "documentation", "technical docs", "API documentation", or documentation generation tasks.
---

# Documentation Generator Skill

This skill assists in generating comprehensive technical documentation for completed features and systems, analyzing the codebase to create architecture overviews, API references, user guides, and developer documentation following project-specific templates.

## When to Use This Skill

- User has completed a feature and needs documentation
- Creating technical documentation for a system or API
- Generating developer guides and setup instructions
- Documenting architecture and design decisions
- Creating API reference documentation
- Building user guides and tutorials

## Auto-Activation

This skill automatically activates when:
- Keywords: "docs", "documentation", "technical docs", "API docs", "developer guide", "user guide", "document the code"
- User requests documentation for completed work
- Documentation phase after feature implementation
- Creating README or technical guides

## How It Works

### 1. Foundation Detection
First, check if `directive/foundation.md` exists:
- If missing: Inform user to run `/buddy:foundation` first
- If exists: Load to understand project type (default, jhipster, mulesoft, etc.)

### 2. Codebase Analysis
Analyze the target code/feature:
- Identify entry points and main components
- Extract API endpoints and interfaces
- Find configuration requirements
- Discover integration points
- Map dependencies
- Extract code examples
- Understand data models

### 3. Template Selection
Based on foundation type, load the appropriate template:
- **Default projects**: `templates/default-docs.md`
- **JHipster projects**: `templates/jhipster-docs.md`
- **MuleSoft projects**: `templates/mulesoft-docs.md`

### 4. Documentation Generation
Transform code analysis into comprehensive documentation:
- Write clear overview and purpose
- Document architecture and components
- Create API reference with examples
- Provide setup and configuration guides
- Include usage examples and tutorials
- Document data models and schemas
- Add troubleshooting guidance
- Create diagrams where helpful

### 5. Quality Assurance
- Verify all major components are documented
- Ensure code examples are accurate
- Check API documentation is complete
- Validate setup instructions are clear
- Confirm examples are runnable
- Test links and references

### 6. File Management
- Create in project docs directory or feature directory
- Write docs to: `docs/[feature-name].md` or `specs/[date-slug]/docs.md`
- Link to related specifications and plans
- Update main README if needed

## Template Structure

All templates follow this general structure:

```markdown
# [FEATURE/SYSTEM NAME] Documentation

**Version**: [Version Number]
**Last Updated**: [Date]
**Status**: [Draft/Review/Published]

## Overview
### Purpose
### Key Features
### Architecture Diagram

## Getting Started
### Prerequisites
### Installation
### Configuration

## Architecture
### Components
### Data Flow
### Integration Points

## API Reference
### Endpoints
### Authentication
### Error Codes

## Usage Guide
### Basic Usage
### Advanced Features
### Code Examples

## Configuration
### Environment Variables
### Configuration Files

## Data Models
### Entities
### Relationships
### Validation Rules

## Testing
### Running Tests
### Test Coverage

## Deployment
### Requirements
### Deployment Steps
### Environment Setup

## Troubleshooting
### Common Issues
### Debug Guide

## Contributing
## Changelog
```

### Default Template
General-purpose documentation template for most projects.
Located at: [templates/default-docs.md](templates/default-docs.md)

Includes:
- Standard documentation structure
- Generic API documentation format
- Common troubleshooting patterns
- Development workflow guides

### JHipster Template
Tailored for JHipster full-stack application documentation.
Located at: [templates/jhipster-docs.md](templates/jhipster-docs.md)

Includes:
- Entity relationship documentation
- Angular component documentation
- Spring Boot service documentation
- JHipster-specific configuration
- Generator usage instructions

### MuleSoft Template
Optimized for MuleSoft integration documentation.
Located at: [templates/mulesoft-docs.md](templates/mulesoft-docs.md)

Includes:
- DataWeave transformation documentation
- Mule flow documentation
- Connector configuration guide
- Anypoint Platform deployment
- Integration pattern documentation

## Best Practices

### Documentation Principles
- **Audience-First**: Write for the target reader (developer, user, operator)
- **Clear Structure**: Logical organization with good navigation
- **Complete**: Cover all necessary information
- **Concise**: No unnecessary verbosity
- **Current**: Keep documentation up-to-date
- **Examples**: Include working code examples
- **Visual**: Use diagrams where helpful

### DO:
- Start with clear overview and purpose
- Include working code examples
- Provide step-by-step instructions
- Document edge cases and limitations
- Add troubleshooting section
- Use consistent terminology
- Include version information
- Link to related documentation

### DON'T:
- Assume knowledge the reader may not have
- Skip setup and prerequisites
- Forget error handling documentation
- Leave out configuration requirements
- Use jargon without explanation
- Provide outdated examples
- Neglect maintenance documentation

## Documentation Types

### API Documentation
```markdown
## POST /api/users

Creates a new user account.

### Request
**Headers:**
- `Content-Type: application/json`
- `Authorization: Bearer <token>`

**Body:**
\`\`\`json
{
  "email": "user@example.com",
  "name": "John Doe",
  "role": "user"
}
\`\`\`

### Response
**Success (201 Created):**
\`\`\`json
{
  "id": "123",
  "email": "user@example.com",
  "name": "John Doe",
  "role": "user",
  "created_at": "2025-10-29T10:00:00Z"
}
\`\`\`

**Error (400 Bad Request):**
\`\`\`json
{
  "error": "Invalid email format",
  "code": "INVALID_EMAIL"
}
\`\`\`

### Example
\`\`\`bash
curl -X POST https://api.example.com/api/users \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{"email":"user@example.com","name":"John Doe","role":"user"}'
\`\`\`
```

### Setup Guide
```markdown
## Installation

### Prerequisites
- Node.js v18 or higher
- PostgreSQL 14+
- npm or yarn

### Steps
1. **Clone the repository**
   \`\`\`bash
   git clone https://github.com/example/project.git
   cd project
   \`\`\`

2. **Install dependencies**
   \`\`\`bash
   npm install
   \`\`\`

3. **Configure environment**
   \`\`\`bash
   cp .env.example .env
   # Edit .env and set your configuration
   \`\`\`

4. **Setup database**
   \`\`\`bash
   npm run db:setup
   \`\`\`

5. **Start development server**
   \`\`\`bash
   npm run dev
   \`\`\`

The application should now be running at `http://localhost:3000`
```

### Architecture Documentation
```markdown
## Architecture Overview

### System Design
The system follows a microservices architecture with the following components:

\`\`\`
┌─────────────┐
│   Frontend  │
│   (React)   │
└──────┬──────┘
       │
       │ HTTPS
       │
┌──────▼──────┐
│  API Gateway│
└──────┬──────┘
       │
   ┌───┴───┐
   │       │
┌──▼──┐ ┌──▼──┐
│Auth │ │User │
│Svc  │ │Svc  │
└──┬──┘ └──┬──┘
   │       │
   └───┬───┘
       │
  ┌────▼────┐
  │Database │
  └─────────┘
\`\`\`

### Components
- **Frontend**: React SPA for user interface
- **API Gateway**: Request routing and authentication
- **Auth Service**: User authentication and authorization
- **User Service**: User management and profiles
- **Database**: PostgreSQL for data persistence
```

## Example Usage

**Input**:
> "Generate documentation for the user authentication feature we just implemented"

**Docs Generator Process**:
1. Detects foundation type: default
2. Analyzes implemented code:
   - Finds auth endpoints: `/register`, `/login`, `/logout`, `/reset-password`
   - Discovers JWT middleware
   - Identifies User model with fields
   - Locates password hashing utilities
   - Finds rate limiting configuration
3. Loads default-docs.md template
4. Generates documentation with:
   - **Overview**: Authentication system purpose and features
   - **Getting Started**: Setup and configuration
   - **Architecture**: JWT-based stateless auth
   - **API Reference**: All auth endpoints with examples
   - **Usage Guide**: Registration, login, password reset flows
   - **Security**: Token management, password policies
   - **Configuration**: Environment variables, JWT settings
   - **Troubleshooting**: Common issues and solutions
5. Writes docs to: `docs/authentication.md`

## Integration with Other Skills

This skill works well with:
- **spec-generator**: Links to original requirements
- **plan-generator**: References implementation approach
- **tasks-generator**: Documents completed tasks
- **persona-scribe**: For professional documentation writing
- **persona-architect**: For architecture documentation
- **persona-security**: For security documentation
- **domain skills**: For technology-specific documentation patterns

## Workflow Integration

```
spec.md (requirements)
    ↓
plan.md (implementation approach)
    ↓
tasks.md (granular tasks)
    ↓
[Implementation] (code)
    ↓
[docs-generator] ← You are here
    ↓
docs.md (comprehensive documentation)
```

## Output Format

```markdown
# User Authentication System Documentation

**Version**: 1.0.0
**Last Updated**: October 29, 2025
**Status**: Published

## Overview

### Purpose
The User Authentication System provides secure user registration, login, and authorization functionality using JWT tokens. It supports role-based access control and includes password reset capabilities.

### Key Features
- User registration with email validation
- Secure login with JWT token generation
- Password reset via email
- Role-based authorization (Admin, User)
- Rate limiting on authentication endpoints
- Password strength requirements

### Architecture Diagram
\`\`\`
┌──────────┐
│  Client  │
└────┬─────┘
     │ HTTPS
┌────▼──────────┐
│ Auth Endpoints│
│ /register     │
│ /login        │
│ /reset-pwd    │
└────┬──────────┘
     │
┌────▼─────┐
│JWT Verify│
└────┬─────┘
     │
┌────▼─────┐
│Protected │
│Resources │
└──────────┘
\`\`\`

## Getting Started

### Prerequisites
- Node.js 18+ installed
- PostgreSQL 14+ running
- SMTP server for password reset emails

### Installation
1. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

2. Configure environment variables (see Configuration section)

3. Run database migrations:
   \`\`\`bash
   npm run migrate
   \`\`\`

4. Start the server:
   \`\`\`bash
   npm start
   \`\`\`

### Quick Start
\`\`\`javascript
// Register a new user
const response = await fetch('/api/auth/register', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    email: 'user@example.com',
    password: 'SecurePassword123!',
    name: 'John Doe'
  })
});

// Login
const loginResponse = await fetch('/api/auth/login', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    email: 'user@example.com',
    password: 'SecurePassword123!'
  })
});

const { token } = await loginResponse.json();

// Use token for authenticated requests
const userData = await fetch('/api/users/me', {
  headers: { 'Authorization': `Bearer ${token}` }
});
\`\`\`

---

## Architecture

### Components
1. **Authentication Routes** (`/routes/auth.js`)
   - Handles registration, login, logout, password reset
   - Input validation and sanitization
   - Rate limiting (5 attempts per 15 minutes)

2. **JWT Middleware** (`/middleware/jwt.js`)
   - Token verification
   - User identity extraction
   - Protected route enforcement

3. **User Model** (`/models/User.js`)
   - User entity definition
   - Password hashing (bcrypt, 10 rounds)
   - Validation rules

4. **Email Service** (`/services/email.js`)
   - Password reset email sending
   - Email templates

### Data Flow
1. User submits credentials
2. Server validates input
3. Password is hashed (registration) or verified (login)
4. JWT token generated and returned
5. Client includes token in subsequent requests
6. Middleware verifies token and extracts user identity

---

## API Reference

### POST /api/auth/register
Create a new user account.

**Request Body:**
\`\`\`json
{
  "email": "user@example.com",
  "password": "SecurePassword123!",
  "name": "John Doe"
}
\`\`\`

**Response (201 Created):**
\`\`\`json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "email": "user@example.com",
  "name": "John Doe",
  "role": "user",
  "created_at": "2025-10-29T10:00:00Z"
}
\`\`\`

**Errors:**
- `400`: Invalid email format or weak password
- `409`: Email already registered

---

### POST /api/auth/login
Authenticate a user and receive JWT token.

**Request Body:**
\`\`\`json
{
  "email": "user@example.com",
  "password": "SecurePassword123!"
}
\`\`\`

**Response (200 OK):**
\`\`\`json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "name": "John Doe",
    "role": "user"
  }
}
\`\`\`

**Errors:**
- `401`: Invalid credentials
- `429`: Too many login attempts

---

## Configuration

### Environment Variables
\`\`\`bash
# JWT Configuration
JWT_SECRET=your-secret-key-here
JWT_EXPIRES_IN=7d

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/dbname

# Email (for password reset)
SMTP_HOST=smtp.example.com
SMTP_PORT=587
SMTP_USER=noreply@example.com
SMTP_PASSWORD=smtp-password

# Rate Limiting
RATE_LIMIT_WINDOW=15m
RATE_LIMIT_MAX=5
\`\`\`

---

## Data Models

### User
| Field | Type | Constraints | Description |
|-------|------|-------------|-------------|
| id | UUID | Primary Key | Unique user identifier |
| email | String | Unique, Not Null | User email (login) |
| password_hash | String | Not Null | Hashed password (bcrypt) |
| name | String | Not Null | User display name |
| role | Enum | Not Null | User role (admin, user) |
| created_at | Timestamp | Not Null | Account creation time |
| updated_at | Timestamp | Not Null | Last update time |

---

## Troubleshooting

### "Invalid token" error
**Cause**: Token expired or JWT_SECRET changed
**Solution**: Login again to get a new token

### "Too many login attempts"
**Cause**: Rate limiting triggered (>5 attempts in 15 minutes)
**Solution**: Wait 15 minutes or use password reset

### Password reset email not received
**Cause**: SMTP configuration issue
**Solution**: Check SMTP environment variables and server connectivity

---

## Security Considerations

- Passwords hashed with bcrypt (10 rounds)
- JWT tokens expire after 7 days
- Rate limiting prevents brute force attacks
- HTTPS required in production
- Input validation on all endpoints
- SQL injection prevention (parameterized queries)

---

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines.

## Changelog
See [CHANGELOG.md](CHANGELOG.md) for version history.
```

## Documentation Best Practices

### Code Examples
- Provide working, copy-paste-able examples
- Include error handling
- Show both success and error cases
- Use realistic data
- Comment complex parts

### Diagrams
- Keep diagrams simple and focused
- Use consistent notation
- Label all components
- Show data flow direction
- Update diagrams when system changes

### API Documentation
- Document all endpoints
- Include all parameters
- Show request and response examples
- List all error codes
- Provide authentication examples

### Maintenance
- Review docs with each release
- Mark deprecated features
- Update examples for new versions
- Remove obsolete information
- Keep changelog current

## Resources

- See [templates/](templates/) for all available documentation templates
- Each template is foundation-specific and includes domain patterns
- Templates provide structure for complete documentation
- Link to specifications and plans for implementation context
