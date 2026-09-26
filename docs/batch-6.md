# GRAFT — BATCH 6

## REAL AUTHENTICATION, OTP & DATABASE FOUNDATION

> **Project:** GRAFT — Ndezve basa.
>
> **Batch:** 6
>
> **Objective:** Move GRAFT from prototype/local/mock state into a real persistent marketplace with real phone-number authentication, real-time OTP verification, persistent user accounts, and a real database-backed job system.
>
> **IMPORTANT:** This batch must preserve all working functionality from Batches 1–5.

---

# 1. PRIMARY OBJECTIVE

GRAFT must now become a **real multi-user application**.

At the end of this batch:

1. A real user can register using their phone number.
2. A real OTP can be sent to that phone number.
3. The user can enter the OTP.
4. The backend verifies the OTP.
5. A real account is created.
6. The user remains authenticated after closing/reopening the app.
7. User/profile data is stored in a real database.
8. Jobs are stored in the database.
9. Customers can create and view their own jobs.
10. Workers can retrieve available jobs from the database.
11. Workers can apply/bid on jobs.
12. Customers can see applications/bids for their own jobs.
13. Users cannot access another user's private data.
14. Existing Batch 1–5 functionality continues to work.

This is the transition from:

```text
PROTOTYPE
↓
LOCAL / MOCK DATA
↓
REAL BACKEND
↓
REAL DATABASE
↓
REAL USERS
```

---

# 2. BEFORE WRITING CODE — INSPECT THE PROJECT

DO NOT immediately start coding.

First inspect the entire existing project.

Understand:

* Flutter architecture
* routing/navigation
* authentication currently implemented
* customer flow
* worker flow
* PostJobFlow
* job models
* job screens
* profile screens
* state management
* API/network layer if one exists
* local/mock repositories
* storage
* existing models
* existing services
* existing tests
* existing environment configuration
* Batch 1–5 implementation
* current database/backend situation

Run appropriate commands such as:

```bash
flutter analyze
flutter test
flutter pub get
```

Also inspect:

```text
pubspec.yaml
lib/
test/
android/
ios/
```

and any backend/server directories already present.

### IMPORTANT

Do not replace the current architecture simply because you prefer another architecture.

Reuse existing patterns where they are sound.

Do not rewrite working Batch 1–5 functionality unnecessarily.

---

# 3. ESTABLISH THE ARCHITECTURE

Before implementing authentication, determine whether the current project already contains a backend.

The target architecture is:

```text
                 GRAFT Flutter App
                         |
                         v
                  Backend/API
                         |
          +--------------+--------------+
          |                             |
          v                             v
     OTP/SMS Provider              PostgreSQL
                                      |
                                      v
                               Persistent Data
```

The Flutter application must NOT connect directly to PostgreSQL.

The client communicates with the backend/API.

The backend handles:

* authentication
* OTP verification
* database access
* authorization
* validation
* job ownership
* role permissions
* security

---

# 4. DATABASE

Use **PostgreSQL** as the primary persistent database unless the existing project already contains a production-ready database architecture that is clearly better suited.

The database must support relational data.

At minimum create the equivalent of:

## User

```text
User
- id
- phoneNumber
- role
- name
- profilePhoto
- location
- createdAt
- updatedAt
```

Role:

```text
CUSTOMER
WORKER
```

Do not duplicate users for different roles.

A single account has one role.

---

# 5. PROFILE DATA

Support the profile information required by the current GRAFT UX.

Customer profile should be associated with the authenticated user.

Worker profile should be associated with the authenticated user.

Do not create fake profile records.

The database becomes the source of truth.

---

# 6. JOB MODEL

Create a persistent Job entity containing the information already required by the existing PostJobFlow.

At minimum:

```text
Job
- id
- customerId
- title
- description
- category
- budget
- location
- status
- createdAt
- updatedAt
```

Use the existing GRAFT job fields where they already exist.

Do not unnecessarily change the UX just to fit the database.

Job statuses should be represented using a proper enum or equivalent:

```text
OPEN
IN_PROGRESS
COMPLETED
CANCELLED
```

Only implement statuses that are actually supported by the current product.

---

# 7. JOB APPLICATION / BID

Create a persistent relationship between workers and jobs.

Example:

```text
JobApplication
- id
- jobId
- workerId
- amount
- message
- status
- createdAt
- updatedAt
```

Possible statuses:

```text
PENDING
ACCEPTED
REJECTED
WITHDRAWN
```

Use only the states that make sense for the current GRAFT workflow.

A worker must not be able to submit duplicate applications for the same job unless the existing product explicitly supports that behavior.

---

# 8. DATABASE RELATIONSHIPS

The basic relationship should be:

```text
User
 |
 +---- Customer
 |       |
 |       +---- Jobs
 |               |
 |               +---- Applications
 |
 +---- Worker
         |
         +---- Applications
```

More concretely:

```text
User 1 ---- * Job
User 1 ---- * JobApplication
Job  1 ---- * JobApplication
```

Enforce foreign keys.

Do not store relationships only as strings.

---

# 9. PHONE AUTHENTICATION

Implement REAL phone authentication.

The flow must be:

```text
User
 ↓
Enter phone number
 ↓
Request OTP
 ↓
Backend
 ↓
SMS/OTP provider
 ↓
Real SMS arrives
 ↓
User enters OTP
 ↓
Backend verifies OTP
 ↓
Account created / authenticated
 ↓
Session established
 ↓
User enters GRAFT
```

There must NOT be a fake OTP in production logic.

Do not implement:

```text
OTP = 123456
```

as the actual authentication mechanism.

Development-only bypasses must be clearly isolated and must never accidentally run in production.

---

# 10. OTP PROVIDER

Use a real SMS/OTP provider that supports Zimbabwe phone numbers.

Before choosing a provider:

* inspect whether an OTP/SMS provider already exists in the project
* inspect existing environment variables
* determine what provider integration best fits the backend
* keep the provider behind an abstraction/service layer

Example architecture:

```text
OtpService
    |
    +-- SmsProvider
```

Do not scatter provider-specific code throughout the application.

Environment variables/secrets must NOT be hardcoded.

Example:

```text
SMS_PROVIDER_API_KEY
SMS_PROVIDER_SECRET
SMS_PROVIDER_SENDER
```

Use the exact variables appropriate to the chosen provider.

---

# 11. OTP SECURITY

Implement:

### OTP expiry

OTP codes must expire after a short period.

### Attempt limits

Limit incorrect OTP attempts.

### Resend cooldown

Prevent users from continuously requesting OTPs.

### Rate limiting

Prevent abuse of the OTP endpoint.

### One-time use

A successfully verified OTP must not be reusable.

### Server-side verification

The Flutter application must never be trusted to decide whether an OTP is correct.

The backend is authoritative.

---

# 12. PHONE NUMBER NORMALIZATION

Zimbabwe phone numbers must be normalized consistently.

For example:

```text
0771234567
```

and

```text
+263771234567
```

should not accidentally become two separate accounts.

Choose one canonical storage format.

Prefer:

```text
+263771234567
```

or another internationally recognized E.164 representation.

Validate phone numbers before sending OTPs.

---

# 13. REGISTRATION FLOW

The registration UX should be:

```text
Welcome
   ↓
Phone Number
   ↓
Send OTP
   ↓
Verify OTP
   ↓
Choose Role
   ↓
Create Profile
   ↓
GRAFT Home
```

However, inspect the existing GRAFT onboarding flow first.

If role selection already occurs earlier, preserve that UX.

Do not create unnecessary screens.

The final account must contain:

```text
phoneNumber
role
profile information
```

---

# 14. LOGIN FLOW

Existing users should be able to authenticate using their phone number.

Flow:

```text
Enter phone
 ↓
Request OTP
 ↓
Receive OTP
 ↓
Verify OTP
 ↓
Create authenticated session
 ↓
Enter application
```

If the phone number already exists:

```text
DO NOT create a duplicate account.
```

Authenticate the existing account.

---

# 15. SESSION PERSISTENCE

After successful authentication, the user should remain logged in.

Example:

```text
Install
 ↓
Login
 ↓
Close app
 ↓
Open app
 ↓
Still authenticated
```

Use secure storage appropriate for Flutter/mobile credentials.

Do not store authentication secrets in plain SharedPreferences unless the architecture explicitly makes that safe.

The application must restore the authentication state during startup.

---

# 16. AUTHORIZATION

Authentication answers:

> Who are you?

Authorization answers:

> What are you allowed to do?

Implement both.

Example:

```text
CUSTOMER

Can:
- view own profile
- edit own profile
- create jobs
- view own jobs
- manage own jobs
- view applications on own jobs

Cannot:
- modify another customer's job
- access another user's private profile
- submit worker applications
```

Worker:

```text
WORKER

Can:
- view own profile
- edit own profile
- browse open jobs
- submit applications
- view own applications

Cannot:
- modify another worker's profile
- modify another customer's job
- access private customer data
```

Enforce these rules on the backend.

Never rely only on Flutter UI hiding buttons.

---

# 17. JOB CREATION

Connect the existing:

```text
Work/Post Job Flow
```

to the real backend.

Existing flow:

```text
Customer
 ↓
Post Job
 ↓
Steps
 ↓
Success
```

must become:

```text
Customer
 ↓
Post Job
 ↓
Steps
 ↓
Submit
 ↓
Backend validation
 ↓
PostgreSQL
 ↓
Job created
 ↓
Success
```

The Success screen should only appear after the backend confirms successful creation.

Do not show success merely because the local UI finished.

---

# 18. WORKER JOB FEED

Replace mock/hardcoded jobs with database-backed jobs.

Flow:

```text
Worker
 ↓
Work
 ↓
Available Jobs
 ↓
GET /jobs
 ↓
Backend
 ↓
PostgreSQL
 ↓
Open jobs
```

Only show jobs appropriate for workers.

Do not expose cancelled/completed/private jobs unless the product requirements explicitly require them.

---

# 19. CUSTOMER MY JOBS

Customer:

```text
Customer
 ↓
My Jobs
 ↓
GET /my/jobs
 ↓
Backend
 ↓
Only authenticated customer's jobs
```

A customer must never receive another customer's private job list.

The backend should determine the customer ID from the authenticated session/token.

Do NOT trust:

```text
customerId
```

sent blindly from the Flutter client.

---

# 20. WORKER APPLICATIONS

Connect the worker application/bidding flow to the database.

Flow:

```text
Worker
 ↓
Open Job
 ↓
Apply/Bid
 ↓
Backend
 ↓
JobApplication created
 ↓
Success
```

Validate:

* authenticated user
* worker role
* job exists
* job is open
* worker isn't the job owner
* worker hasn't already applied
* required application data is valid

---

# 21. CUSTOMER APPLICATION VIEW

Customers must be able to retrieve applications for their own jobs.

Example:

```text
Customer
 ↓
My Job
 ↓
Applications
 ↓
Backend
 ↓
Applications belonging to this customer's job
```

Do not expose applications for another customer's jobs.

---

# 22. API DESIGN

If a backend already exists, extend it.

Do not create duplicate competing APIs.

Use clear endpoints or equivalent RPC/service methods.

Examples:

```text
POST   /auth/request-otp
POST   /auth/verify-otp
POST   /auth/logout
GET    /auth/me

GET    /profile
PATCH  /profile

POST   /jobs
GET    /jobs
GET    /jobs/mine
GET    /jobs/:id
PATCH  /jobs/:id

POST   /jobs/:id/applications
GET    /jobs/:id/applications
GET    /applications/mine
```

Adapt these to the existing architecture.

---

# 23. VALIDATION

Validate data on BOTH:

```text
Flutter
+
Backend
```

Flutter validation improves UX.

Backend validation provides security.

Never trust client-side validation alone.

---

# 24. ERROR HANDLING

Create useful errors for:

```text
Invalid phone number
OTP expired
Incorrect OTP
Too many attempts
OTP resend cooldown
Phone already registered
Network unavailable
Server unavailable
Database failure
Unauthorized
Forbidden
Job not found
Job already closed
Duplicate application
Invalid job data
```

Do not expose raw database errors to users.

---

# 25. OFFLINE / POOR NETWORK CONSIDERATIONS

GRAFT is intended for real users, including users who may have poor connectivity.

The app should handle:

```text
No internet
Slow internet
Request timeout
Temporary server failure
```

Gracefully.

Do not make the UI appear frozen.

Show appropriate loading/error states.

Do not silently create duplicate jobs because a request appears to have failed.

Where appropriate, use idempotency or request identifiers for critical operations.

---

# 26. ENVIRONMENT CONFIGURATION

Never commit:

```text
API keys
SMS secrets
database passwords
JWT secrets
production credentials
```

to Git.

Create/update appropriate environment configuration.

Document required variables.

Example categories:

```text
DATABASE_URL
AUTH_SECRET
SMS_PROVIDER_KEY
SMS_PROVIDER_SECRET
SMS_PROVIDER_SENDER
API_BASE_URL
```

Use actual provider-specific names in the implementation.

---

# 27. DATABASE MIGRATIONS

Database schema changes must be reproducible.

Do not manually create tables only in a GUI.

Use the project's migration system.

The repository must contain the schema/migration definitions required to recreate the database.

Document:

```text
How to create database
How to configure DATABASE_URL
How to run migrations
How to start backend
How to configure SMS provider
```

---

# 28. SEED / DEVELOPMENT DATA

If development seed data is required, create clearly separated development seed data.

Example:

```text
seed/dev
```

Do not mix fake development users with real production accounts.

Do not allow seed scripts to accidentally delete production data.

---

# 29. REPLACE MOCK DATA

Search the entire project for:

```text
mock
dummy
fake
sample
hardcoded jobs
test users
temporary users
static job lists
fake OTP
```

Identify every occurrence.

Replace production-path mock behavior with the real backend/database.

Tests may continue to use controlled mocks where appropriate.

---

# 30. UI PRESERVATION

Do NOT redesign GRAFT in Batch 6.

The goal is:

```text
Existing UX
+
Real authentication
+
Real backend
+
Real database
```

not:

```text
New UX
+
New architecture
+
New authentication
+
New database
```

Preserve the established:

* GRAFT branding
* colors
* typography
* navigation
* customer experience
* worker experience
* PostJobFlow
* existing layouts
* existing responsive behavior

Only modify UI where necessary to support real authentication/data states.

---

# 31. LOADING STATES

Every network-backed operation must have proper states:

```text
Idle
Loading
Success
Error
```

Examples:

```text
Sending OTP...
Verifying...
Creating account...
Loading jobs...
Posting job...
Submitting application...
```

Prevent accidental double submissions.

Disable relevant actions while critical requests are processing.

---

# 32. TESTING

Create/update automated tests.

At minimum test:

### Authentication

```text
Invalid phone
OTP request
OTP verification
Expired OTP
Wrong OTP
Too many attempts
Existing account login
New account creation
Session restoration
Logout
```

### Authorization

```text
Customer cannot perform worker actions
Worker cannot perform customer actions
User cannot access another user's private data
```

### Jobs

```text
Create job
Retrieve jobs
Retrieve own jobs
Retrieve job details
Update own job
Reject unauthorized job update
```

### Applications

```text
Worker applies
Duplicate application rejected
Customer sees applications on own job
Unauthorized application access rejected
```

---

# 33. END-TO-END TEST

The following scenario MUST work against the real backend/database.

## CUSTOMER

```text
1. Install/open GRAFT
2. Register with a real Zimbabwe phone number
3. Receive real SMS OTP
4. Enter OTP
5. Account is created
6. Select/confirm Customer role
7. Complete profile
8. Reach customer home
9. Close application
10. Reopen application
11. Still logged in
12. Post a job
13. Job is successfully stored
14. Job appears in My Jobs
```

## WORKER

Use a second real phone number.

```text
1. Open GRAFT
2. Register with second phone number
3. Receive real SMS OTP
4. Verify OTP
5. Select/confirm Worker role
6. Complete profile
7. Reach worker home
8. Open available jobs
9. Customer's newly created job appears
10. Open job
11. Apply/bid
12. Application is stored
```

## CUSTOMER AGAIN

```text
1. Return to customer account
2. Open My Jobs
3. Open the job
4. View worker application
```

This proves that:

```text
ACCOUNT
 ↓
DATABASE
 ↓
JOB
 ↓
DATABASE
 ↓
WORKER
 ↓
APPLICATION
 ↓
DATABASE
 ↓
CUSTOMER
```

is actually working.

---

# 34. DATA PERSISTENCE TEST

Perform this test:

```text
Create account
 ↓
Close app
 ↓
Restart app
 ↓
Verify account still exists

Create job
 ↓
Restart backend
 ↓
Restart app
 ↓
Verify job still exists
```

The data must survive application restarts and backend restarts.

---

# 35. SECURITY CHECK

Before declaring Batch 6 complete, test attempts to:

```text
Access another user's profile
Modify another user's job
Delete another user's job
Read another customer's jobs
Read another customer's applications
Apply as a customer
Create a job as a worker
Reuse an OTP
Reuse an expired OTP
Spam OTP requests
Submit duplicate applications
```

All unauthorized operations must be rejected server-side.

---

# 36. PERFORMANCE

Do not over-engineer.

For this batch prioritize:

```text
Correctness
Security
Persistence
Reliability
```

over premature optimization.

However:

* avoid unnecessary database queries
* paginate job feeds where appropriate
* avoid loading every job forever
* index important foreign keys
* use appropriate database indexes

---

# 37. DATABASE INDEXES

Add indexes for common queries.

At minimum consider:

```text
User.phoneNumber
Job.customerId
Job.status
Job.createdAt
JobApplication.jobId
JobApplication.workerId
```

Use uniqueness constraints where appropriate.

For example:

```text
User.phoneNumber UNIQUE
```

and potentially:

```text
JobApplication(jobId, workerId) UNIQUE
```

if one application per worker per job is the intended rule.

---

# 38. OBSERVABILITY

Backend failures must be diagnosable.

Use structured logging where appropriate.

Never log:

```text
OTP codes
passwords
authentication tokens
SMS secrets
database passwords
```

Useful logs include:

```text
OTP request
OTP verification success/failure
account creation
job creation
application creation
authorization failure
database errors
```

without exposing sensitive information.

---

# 39. DOCUMENTATION

Update the project documentation with:

```text
Architecture
Database setup
Environment variables
SMS/OTP provider setup
Running backend
Running migrations
Running Flutter app
Running tests
Development seed data
Production considerations
```

Create a concise developer setup document if one does not already exist.

---

# 40. GIT SAFETY

Before making changes:

```bash
git status
```

Create a clear checkpoint if appropriate.

After implementation:

```bash
git status
git diff
```

Do not commit secrets.

Do not delete unrelated user work.

Do not reset the project to an earlier state.

---

# 41. REQUIRED VERIFICATION GATES

Batch 6 is NOT complete until all applicable checks pass.

Run:

```bash
flutter analyze
flutter test
```

Run the backend's equivalent:

```bash
<backend package manager> test
<backend package manager> build
```

Run database migration validation.

Run the actual application.

Perform the complete real-device authentication test.

---

# 42. FINAL ACCEPTANCE CRITERIA

Batch 6 can only be declared COMPLETE when ALL of the following are true:

### Authentication

* [ ] Real phone registration works.
* [ ] Real OTP SMS is received.
* [ ] OTP verification works.
* [ ] OTP expiry works.
* [ ] OTP attempt limits work.
* [ ] OTP resend cooldown works.
* [ ] Existing users can log in.
* [ ] Duplicate accounts are prevented.
* [ ] Session persists after app restart.
* [ ] Logout works.

### Database

* [ ] PostgreSQL is configured.
* [ ] Migrations work.
* [ ] Users persist.
* [ ] Profiles persist.
* [ ] Jobs persist.
* [ ] Applications persist.
* [ ] Relationships are enforced.
* [ ] Appropriate indexes exist.

### Customer

* [ ] Customer can register.
* [ ] Customer can create profile.
* [ ] Customer can post job.
* [ ] Job is saved to database.
* [ ] Customer can view own jobs.
* [ ] Customer can view applications.
* [ ] Customer cannot access another customer's private data.

### Worker

* [ ] Worker can register.
* [ ] Worker can create profile.
* [ ] Worker can see real available jobs.
* [ ] Worker can open a job.
* [ ] Worker can apply/bid.
* [ ] Application is saved.
* [ ] Worker can view own applications.
* [ ] Worker cannot access unauthorized customer data.

### Security

* [ ] Backend authentication is enforced.
* [ ] Backend authorization is enforced.
* [ ] OTPs are secure.
* [ ] Secrets are not committed.
* [ ] Users cannot manipulate ownership using client-supplied IDs.
* [ ] Unauthorized API requests are rejected.

### Existing product

* [ ] Batch 1 functionality still works.
* [ ] Batch 2 functionality still works.
* [ ] Batch 3 functionality still works.
* [ ] Batch 4 functionality still works.
* [ ] Batch 5 functionality still works.
* [ ] Customer PostJobFlow still works.
* [ ] Worker-side PostJobFlow still works.
* [ ] Existing GRAFT UI/branding remains intact.

### Quality

* [ ] `flutter analyze` passes.
* [ ] All automated tests pass.
* [ ] Backend tests pass.
* [ ] Production build succeeds.
* [ ] Real-device OTP test passes.
* [ ] Real customer → job → worker → application → customer journey passes.

---

# 43. IMPORTANT IMPLEMENTATION RULES

## DO

* Inspect first.
* Reuse existing architecture.
* Preserve existing UX.
* Use PostgreSQL.
* Use real OTP infrastructure.
* Use server-side authorization.
* Use secure session storage.
* Validate on client and server.
* Write tests.
* Run the full verification suite.
* Fix problems you encounter instead of hiding them.
* Document setup requirements.

## DO NOT

* Do not use fake OTP in production.
* Do not hardcode SMS credentials.
* Do not hardcode database credentials.
* Do not connect Flutter directly to PostgreSQL.
* Do not trust client-supplied user IDs for authorization.
* Do not expose private customer data to workers.
* Do not expose private worker data unnecessarily.
* Do not delete working Batch 1–5 functionality.
* Do not redesign the application.
* Do not introduce unnecessary technologies.
* Do not declare success because compilation passes.
* Do not skip real-device OTP verification.

---

# 44. EXECUTION STRATEGY

Implement incrementally.

Recommended order:

```text
STEP 1
Inspect existing project
        ↓
STEP 2
Choose/confirm backend architecture
        ↓
STEP 3
Configure PostgreSQL
        ↓
STEP 4
Create database schema
        ↓
STEP 5
Create migrations
        ↓
STEP 6
Implement authentication backend
        ↓
STEP 7
Integrate real SMS/OTP provider
        ↓
STEP 8
Connect Flutter authentication UI
        ↓
STEP 9
Implement persistent sessions
        ↓
STEP 10
Implement profiles
        ↓
STEP 11
Connect customer jobs
        ↓
STEP 12
Connect worker job feed
        ↓
STEP 13
Connect applications/bids
        ↓
STEP 14
Implement authorization/security
        ↓
STEP 15
Remove production mock data
        ↓
STEP 16
Automated tests
        ↓
STEP 17
Real-device E2E test
        ↓
STEP 18
Final regression test
```

Do not attempt to build everything blindly in one step.

After each major phase, verify the application still works.

---

# 45. FINAL REPORT

When finished, provide a concise implementation report containing:

## What was implemented

List the major features.

## Architecture

Show:

```text
Flutter
 ↓
Backend
 ↓
PostgreSQL
 ↓
SMS/OTP Provider
```

## Database

List the tables/models created.

## Authentication

Explain the actual OTP flow.

## API

List the major endpoints/services implemented.

## Security

List authorization protections.

## Tests

Report:

```text
flutter analyze: PASS/FAIL
flutter test: PASS/FAIL
backend tests: PASS/FAIL
build: PASS/FAIL
real OTP: PASS/FAIL
E2E: PASS/FAIL
```

## Known issues

List anything that remains unresolved.

Do NOT hide failures.

## Environment setup

Clearly state anything I still need to configure manually, such as:

```text
Database URL
SMS provider account
SMS API credentials
Production environment variables
```

---

# 46. DEFINITION OF DONE

The most important definition of done is:

> **Two real people using two real phones must be able to register with real Zimbabwean phone numbers, receive real OTP SMS messages, create persistent GRAFT accounts, have those accounts stored in PostgreSQL, create a real job as a customer, see that job from a worker account, submit an application, and have the customer see that application — with authorization preventing users from accessing data they do not own.**

If that complete journey works, Batch 6 has achieved its primary objective.

If it does not work, **do not declare Batch 6 complete.**
