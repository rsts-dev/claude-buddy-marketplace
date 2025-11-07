---
name: jhipster-development
description: JHipster full-stack application development including Angular, Angular Material, and JHipster-specific patterns. Use when working with JHipster projects, Angular applications, or full-stack Java/Spring Boot + Angular development. Auto-activates for JHipster project files and Angular code.
---

# JHipster Development Skill

Comprehensive guidance for JHipster application development, including Angular frontend, Spring Boot backend, and JHipster-specific conventions and best practices.

## When to Use This Skill

- Developing JHipster applications (monolith or microservices)
- Building Angular frontends with JHipster
- Working with Angular Material in JHipster projects
- Entity generation and database schema management
- Implementing authentication and authorization
- Microservices architecture with JHipster
- API gateway configuration
- Service discovery and registry integration

## Auto-Activation

This skill automatically activates when:
- Project contains .yo-rc.json (JHipster configuration)
- Keywords: JHipster, jhipster, Angular, Spring Boot, entity, gateway
- Working with JHipster-generated files
- Angular project with JHipster structure
- Discussion of full-stack development patterns

## Reference Materials

This skill includes comprehensive documentation:

- **[jhipster.md](jhipster.md)**: Core JHipster concepts and patterns
- **[angular-js.md](angular-js.md)**: Angular framework integration
- **[angular-material.md](angular-material.md)**: Angular Material UI components

## Key Concepts

### JHipster Application Structure

JHipster generates a complete full-stack application with:

**Frontend (Angular)**:
- `/src/main/webapp/app/` - Angular application code
- Component-based architecture
- Lazy-loaded modules
- Reactive forms
- NgRx for state management (optional)

**Backend (Spring Boot)**:
- `/src/main/java/` - Java backend code
- Spring Boot REST APIs
- Spring Security for authentication
- JPA/Hibernate for data access
- Liquibase for database migrations

**Configuration**:
- `.yo-rc.json` - JHipster project configuration
- `/src/main/resources/config/` - Application properties
- Docker Compose configurations

### Entity Management

**Generate Entity**:
```bash
jhipster entity Customer
```

**JDL (JHipster Domain Language)**:
```jdl
entity Customer {
  firstName String required
  lastName String required
  email String pattern(/^[^@\s]+@[^@\s]+\.[^@\s]+$/)
  phoneNumber String
}

entity Order {
  orderDate Instant required
  status OrderStatus required
  totalAmount BigDecimal required min(0)
}

enum OrderStatus {
  PENDING, COMPLETED, CANCELLED
}

relationship OneToMany {
  Customer{orders} to Order{customer(email) required}
}

paginate Order with pagination
service all with serviceImpl
```

**Import JDL**:
```bash
jhipster jdl my-model.jdl
```

### Angular Component Development

**JHipster-Generated Component**:
```typescript
import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { Customer, ICustomer } from '../customer.model';
import { CustomerService } from '../service/customer.service';

@Component({
  selector: 'jhi-customer',
  templateUrl: './customer.component.html',
})
export class CustomerComponent implements OnInit {
  customers?: ICustomer[];
  isLoading = false;

  constructor(protected customerService: CustomerService) {}

  ngOnInit(): void {
    this.loadAll();
  }

  loadAll(): void {
    this.isLoading = true;
    this.customerService.query().subscribe({
      next: (res: HttpResponse<ICustomer[]>) => {
        this.isLoading = false;
        this.customers = res.body ?? [];
      },
      error: () => {
        this.isLoading = false;
      },
    });
  }
}
```

**Component Template**:
```html
<div>
  <h2 id="page-heading">
    <span>Customers</span>
    <div class="d-flex justify-content-end">
      <button class="btn btn-primary" [routerLink]="['/customer/new']">
        <fa-icon icon="plus"></fa-icon>
        <span>Create new Customer</span>
      </button>
    </div>
  </h2>

  <jhi-alert-error></jhi-alert-error>

  <div class="alert alert-warning" *ngIf="customers && customers.length === 0">
    No customers found
  </div>

  <div class="table-responsive" *ngIf="customers && customers.length > 0">
    <table class="table table-striped">
      <thead>
        <tr>
          <th><span>ID</span></th>
          <th><span>First Name</span></th>
          <th><span>Last Name</span></th>
          <th><span>Email</span></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr *ngFor="let customer of customers; trackBy: trackId">
          <td>{{ customer.id }}</td>
          <td>{{ customer.firstName }}</td>
          <td>{{ customer.lastName }}</td>
          <td>{{ customer.email }}</td>
          <td class="text-end">
            <div class="btn-group">
              <button type="submit" [routerLink]="['/customer', customer.id, 'view']" class="btn btn-info btn-sm">
                <fa-icon icon="eye"></fa-icon>
                <span class="d-none d-md-inline">View</span>
              </button>
              <button type="submit" [routerLink]="['/customer', customer.id, 'edit']" class="btn btn-primary btn-sm">
                <fa-icon icon="pencil-alt"></fa-icon>
                <span class="d-none d-md-inline">Edit</span>
              </button>
              <button type="submit" (click)="delete(customer)" class="btn btn-danger btn-sm">
                <fa-icon icon="times"></fa-icon>
                <span class="d-none d-md-inline">Delete</span>
              </button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
```

### Angular Material Integration

**Import Material Modules**:
```typescript
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';

@NgModule({
  imports: [
    MatButtonModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
  ],
})
export class SharedModule {}
```

**Material Form**:
```html
<mat-card>
  <mat-card-header>
    <mat-card-title>Customer Form</mat-card-title>
  </mat-card-header>
  <mat-card-content>
    <form [formGroup]="customerForm" (ngSubmit)="save()">
      <mat-form-field appearance="fill">
        <mat-label>First Name</mat-label>
        <input matInput formControlName="firstName" required>
        <mat-error *ngIf="customerForm.get('firstName')?.hasError('required')">
          First name is required
        </mat-error>
      </mat-form-field>

      <mat-form-field appearance="fill">
        <mat-label>Email</mat-label>
        <input matInput type="email" formControlName="email" required>
        <mat-error *ngIf="customerForm.get('email')?.hasError('email')">
          Invalid email format
        </mat-error>
      </mat-form-field>
    </form>
  </mat-card-content>
  <mat-card-actions>
    <button mat-raised-button color="primary" (click)="save()">Save</button>
    <button mat-button (click)="cancel()">Cancel</button>
  </mat-card-actions>
</mat-card>
```

### Backend API Development

**REST Controller**:
```java
@RestController
@RequestMapping("/api")
public class CustomerResource {

    private final CustomerService customerService;

    public CustomerResource(CustomerService customerService) {
        this.customerService = customerService;
    }

    @PostMapping("/customers")
    public ResponseEntity<CustomerDTO> createCustomer(@Valid @RequestBody CustomerDTO customerDTO) {
        CustomerDTO result = customerService.save(customerDTO);
        return ResponseEntity.created(new URI("/api/customers/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert("customer", result.getId().toString()))
            .body(result);
    }

    @GetMapping("/customers")
    public ResponseEntity<List<CustomerDTO>> getAllCustomers(Pageable pageable) {
        Page<CustomerDTO> page = customerService.findAll(pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/customers");
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    @GetMapping("/customers/{id}")
    public ResponseEntity<CustomerDTO> getCustomer(@PathVariable Long id) {
        Optional<CustomerDTO> customerDTO = customerService.findOne(id);
        return ResponseUtil.wrapOrNotFound(customerDTO);
    }

    @DeleteMapping("/customers/{id}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable Long id) {
        customerService.delete(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert("customer", id.toString()))
            .build();
    }
}
```

**Service Layer**:
```java
@Service
@Transactional
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final CustomerMapper customerMapper;

    public CustomerService(CustomerRepository customerRepository, CustomerMapper customerMapper) {
        this.customerRepository = customerRepository;
        this.customerMapper = customerMapper;
    }

    public CustomerDTO save(CustomerDTO customerDTO) {
        Customer customer = customerMapper.toEntity(customerDTO);
        customer = customerRepository.save(customer);
        return customerMapper.toDto(customer);
    }

    @Transactional(readOnly = true)
    public Page<CustomerDTO> findAll(Pageable pageable) {
        return customerRepository.findAll(pageable)
            .map(customerMapper::toDto);
    }

    @Transactional(readOnly = true)
    public Optional<CustomerDTO> findOne(Long id) {
        return customerRepository.findById(id)
            .map(customerMapper::toDto);
    }

    public void delete(Long id) {
        customerRepository.deleteById(id);
    }
}
```

### Authentication & Security

**JWT Authentication**:
- JHipster uses JWT tokens for stateless authentication
- Tokens stored in localStorage or sessionStorage
- Automatic token refresh

**Security Configuration**:
```java
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .authorizeRequests()
            .antMatchers("/api/authenticate").permitAll()
            .antMatchers("/api/**").authenticated()
            .and()
            .apply(securityConfigurerAdapter());
    }
}
```

**Role-Based Access**:
```typescript
// In Angular
<button *jhiHasAnyAuthority="'ROLE_ADMIN'" [routerLink]="['/admin']">
  Admin Panel
</button>
```

```java
// In Spring Boot
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
@GetMapping("/admin/users")
public List<UserDTO> getAllUsers() {
    return userService.findAll();
}
```

### Microservices Architecture

**JHipster Registry** (Service Discovery):
```yaml
# application-dev.yml
eureka:
  client:
    service-url:
      defaultZone: http://admin:${jhipster.registry.password}@localhost:8761/eureka/
```

**API Gateway**:
```yaml
# application.yml (gateway)
zuul:
  routes:
    customer-service:
      path: /services/customer/**
      serviceId: customer
    order-service:
      path: /services/order/**
      serviceId: order
```

### Database Management

**Liquibase Changelog**:
```xml
<changeSet id="20231001000001" author="jhipster">
    <createTable tableName="customer">
        <column name="id" type="bigint" autoIncrement="true">
            <constraints primaryKey="true" nullable="false"/>
        </column>
        <column name="first_name" type="varchar(50)">
            <constraints nullable="false"/>
        </column>
        <column name="last_name" type="varchar(50)">
            <constraints nullable="false"/>
        </column>
        <column name="email" type="varchar(100)">
            <constraints nullable="false" unique="true"/>
        </column>
    </createTable>
</changeSet>
```

## Common Commands

```bash
# Generate new entity
jhipster entity Product

# Import JDL file
jhipster jdl my-model.jdl

# Run development server
./mvnw  # Backend
npm start  # Frontend

# Run tests
./mvnw test  # Backend tests
npm test  # Frontend tests

# Build for production
./mvnw -Pprod package
npm run build

# Generate Docker configuration
jhipster docker-compose

# Upgrade JHipster
jhipster upgrade
```

## Best Practices

1. **Use JDL for Entity Modeling**: Maintain entities in JDL files for consistency
2. **Follow Generated Patterns**: Stick to JHipster conventions for maintainability
3. **Customize Carefully**: Override templates only when necessary
4. **Test Thoroughly**: Use generated test scaffolding
5. **Version Control**: Commit `.yo-rc.json` and JDL files
6. **Environment Configuration**: Use Spring profiles for different environments
7. **API Versioning**: Plan for API evolution
8. **Performance**: Use pagination and lazy loading
9. **Security**: Review and customize security configuration
10. **Documentation**: Use Swagger/OpenAPI for API documentation

## Testing

### Angular Testing
```typescript
describe('CustomerComponent', () => {
  let component: CustomerComponent;
  let fixture: ComponentFixture<CustomerComponent>;
  let service: CustomerService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CustomerComponent],
      imports: [HttpClientTestingModule],
      providers: [CustomerService],
    });

    fixture = TestBed.createComponent(CustomerComponent);
    component = fixture.componentInstance;
    service = TestBed.inject(CustomerService);
  });

  it('should load customers on init', () => {
    const customers = [{ id: 1, firstName: 'John', lastName: 'Doe' }];
    jest.spyOn(service, 'query').mockReturnValue(of(new HttpResponse({ body: customers })));

    component.ngOnInit();

    expect(component.customers).toEqual(customers);
  });
});
```

### Spring Boot Testing
```java
@SpringBootTest(classes = MyApp.class)
@AutoConfigureMockMvc
@WithMockUser
public class CustomerResourceIT {

    @Autowired
    private MockMvc restCustomerMockMvc;

    @Autowired
    private CustomerRepository customerRepository;

    @Test
    @Transactional
    public void createCustomer() throws Exception {
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setFirstName("John");
        customerDTO.setLastName("Doe");
        customerDTO.setEmail("john@example.com");

        restCustomerMockMvc.perform(post("/api/customers")
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(customerDTO)))
            .andExpect(status().isCreated());

        List<Customer> customerList = customerRepository.findAll();
        assertThat(customerList).hasSize(1);
    }
}
```

## Resources

For detailed examples and comprehensive documentation, see:
- [jhipster.md](jhipster.md) - Core JHipster patterns
- [angular-js.md](angular-js.md) - Angular integration
- [angular-material.md](angular-material.md) - Material UI components
