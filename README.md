# Hospital Management System ERD

## Description

This project presents the design and implementation of a Hospital Management System database. The system was developed using database design principles, ERD modeling, logical design mapping, and SQL implementation.

The database manages patients, doctors, departments, appointments, services, medical records, billing, insurance, payments, schedules, and service categories.

## Project Components

### Analysis
- Business requirements
- System requirements
- Entity identification

### ERD Design
- Entity Relationship Diagram
- Relationship analysis
- Cardinality and participation rules

### Logical Design
- Mapping ERD to relational tables
- Primary keys and foreign keys
- Relationship implementation

### Scenarios
- Real-world hospital use cases
- Business process examples

### SQL Implementation
- Table creation
- Constraints
- Relationships
- Sample data

## Key Design Decisions

- Appointment is the central entity of the system.
- Appointment and Service have a many-to-many relationship.
- Quantity is stored in the Appointment-Service relationship.
- Billing supports multiple payments.
- Age is derived from date of birth.
- Phone is treated as a multi-valued attribute.
- Service Category is implemented as an entity rather than an attribute.

## Challenges Faced

- Determining the relationship between Billing and Payment.
- Supporting partial payments.
- Managing service price changes over time.
- Defining mandatory and optional participation constraints.

## Technologies Used

- SQL Server
- Database Design
- ERD Modeling
- Relational Database Concepts
- SQL

## Learning Outcomes

- Database analysis and design
- ERD creation
- Relationship mapping
- SQL implementation
- Constraint management
