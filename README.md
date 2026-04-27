\# Hospital Management System ERD



This project designs a database structure for a Hospital Management System.



The system manages patients, doctors, departments, appointments, services, medical records, billing, insurance, payments, schedules, and service categories.



Key design decisions:

\- Appointment is the center of the system.

\- Appointment and Service have a many-to-many relationship.

\- Quantity is stored in the Appointment-Service relationship.

\- Billing supports multiple payments.

\- Age is derived from date of birth.

\- Phone is multi-valued.

\- Service Category is an entity, not an attribute.



Challenges:

\- Deciding where payment belongs.

\- Handling partial payments.

\- Handling service price changes.

\- Deciding mandatory and optional participation.

