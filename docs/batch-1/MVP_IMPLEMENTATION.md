# GRAFT — Batch 1: Flutter MVP Foundation

You are the implementation agent for **GRAFT**, a Zimbabwean hyperlocal services marketplace.

GRAFT is a multi-platform product. The primary mobile application MUST be built with Flutter/Dart. The web application and administrative dashboard MUST use React with Next.js/TypeScript. Flutter is not the web technology. Both clients should eventually communicate with the same backend/API and PostgreSQL database. Batch 1 is focused on establishing the Flutter mobile foundation, but the architecture must not prevent the later Next.js web application from consuming the same backend.


Your task is to **actually implement Batch 1 of the GRAFT MVP in the existing repository**.

Do not merely explain what should be built. Inspect the repository, make the necessary changes, run the appropriate checks, fix problems, and report what was completed.

---

# 1. PRODUCT CONTEXT

## What is GRAFT?

**GRAFT** is a Zimbabwean hyperlocal services marketplace.

The word "graft" is Zimbabwean slang for **work / a job**.

GRAFT connects:

### Customers

People who need small jobs done around their home or business.

Examples:

- Gardening
- Grass cutting
- Cleaning
- Plumbing
- Electrical work
- Painting
- Moving assistance
- Handyman work
- Errands
- Small repairs

### Workers

Unemployed, informal, freelance, or independent workers who want to find nearby jobs and earn money from their skills.

The core experience will eventually resemble the **proximity and matching concept of inDrive**, but GRAFT is specifically designed for Zimbabwe's local informal-services economy.

---

# 2. PRIMARY PLATFORM DECISION

## Flutter is the primary GRAFT client.

Do NOT convert the project into a Next.js application.

Do NOT use React Native unless the existing repository absolutely requires it and there is a documented reason.

The primary application should be:

- Flutter
- Dart
- Android-first
- Mobile-first
- Lightweight
- Responsive to different Android screen sizes
- Designed for low-end/older Android devices

The architecture should also leave room for an eventual iOS build.

A web/admin application may be introduced separately in a later phase. **Do not build it as part of Batch 1 unless the existing repository already contains one and it is necessary for the foundation.**

---

# 3. FIRST: INSPECT THE REPOSITORY

Before writing code, inspect the existing project thoroughly.

Check:

- repository structure
- `pubspec.yaml`
- `lib/`
- `test/`
- Android configuration
- iOS configuration if present
- assets
- existing screens
- existing widgets
- existing services
- state-management setup
- networking/API setup
- database/backend setup
- authentication setup
- environment/configuration files
- README
- Git status

Determine whether the repository is:

1. Empty/new
2. A partially scaffolded Flutter application
3. An existing GRAFT implementation

Do not destroy existing working functionality.

Do not rewrite the project unnecessarily.

If something already exists and is sound, build on it.

---

# 4. BATCH 1 OBJECTIVE

The objective of Batch 1 is to establish the **production-quality Flutter foundation for GRAFT**.

At the end of Batch 1, we should have:

- A working Flutter application
- GRAFT branding
- A clean application architecture
- Mobile-first navigation
- Customer and worker role concepts
- Core domain models
- Initial marketplace screens/placeholders
- Zimbabwe-specific foundations
- Lightweight UI foundations
- Proper error/loading/empty states
- Environment/configuration foundations
- Basic tests
- Documentation
- A project that builds successfully

Do NOT implement the entire marketplace yet.

Batch 1 is the foundation.

---

# 5. FLUTTER ARCHITECTURE

Use a clean, scalable Flutter architecture.

Prefer a feature-oriented structure rather than putting everything into one giant `lib/` directory.

A sensible starting structure could resemble:

```text
lib/
├── app/
│   ├── app.dart
│   ├── router/
│   ├── theme/
│   └── config/
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── jobs/
│   ├── profile/
│   └── onboarding/
│
├── models/
│
└── main.dart
```

You may adjust this structure if the existing repository already follows a better established architecture.

Do not introduce unnecessary architectural complexity.

---

# 6. STATE MANAGEMENT

Inspect whether the repository already uses a state-management solution.

If one already exists and is appropriate, keep it.

If no state-management approach exists, choose a lightweight and maintainable approach appropriate for the MVP.

Do not introduce a large number of packages simply for architecture.

The priority is:

- simplicity
- maintainability
- testability
- performance

---

# 7. ROUTING / NAVIGATION

Establish proper navigation.

The application should be architected around the following eventual areas:

### Customer

- Home
- Find/post jobs
- My jobs
- Job details
- Profile

### Worker

- Home
- Nearby jobs
- Job details
- My applications/bids
- Earnings
- Profile

### Shared

- Authentication
- Notifications
- Settings
- Help
- Verification

For Batch 1, these do NOT all need full functionality.

Create the appropriate navigation foundation and only implement the screens necessary to demonstrate the foundation.

---

# 8. INITIAL USER ROLES

Establish the core user roles:

```text
CUSTOMER
WORKER
ADMIN
```

A user should eventually be able to operate as either:

- Customer
- Worker

Do not assume that every person is permanently locked into one role.

The architecture should allow role-aware experiences later.

Do not implement full role management or KYC yet unless already present.

---

# 9. CORE DOMAIN MODELS

Create appropriate Dart models/entities for the core GRAFT concepts.

At minimum establish models for:

## User

Potential fields:

- id
- name
- phone number
- role
- profile image
- location
- verification status
- createdAt

## Job

Potential fields:

- id
- customerId
- workerId
- title
- description
- category
- budget
- currency
- latitude
- longitude
- area
- status
- createdAt
- updatedAt

## JobCategory

Examples:

- Gardening
- Cleaning
- Plumbing
- Electrical
- Painting
- Moving
- Handyman
- Errands
- Other

## Location

Support:

- latitude
- longitude
- city
- suburb/area
- address where appropriate

These models should be designed so that future API/database integration is straightforward.

Do not create an unnecessarily complicated domain model.

---

# 10. ZIMBABWE-FIRST FOUNDATION

GRAFT is designed for Zimbabwe.

Reflect this in the application foundation.

The app should account for:

### Country

Zimbabwe should be the default country.

### Phone numbers

The architecture should support Zimbabwean phone numbers and the `+263` country code.

Do not hard-code a phone number into the application.

### Currency

The monetary model should not assume only one currency.

GRAFT's MVP should be capable of representing:

- USD
- ZWL

Use a currency abstraction rather than scattering `"USD"` throughout the codebase.

### Locations

The architecture should support Zimbabwean:

- cities
- suburbs
- areas
- coordinates

Do not populate the app with a giant fake Zimbabwe database during Batch 1.

A small set of development/sample data is acceptable if needed for the UI.

---

# 11. ECOCASH FOUNDATION

EcoCash is the intended payment method for the GRAFT MVP.

However:

## DO NOT implement live EcoCash payments in Batch 1.

Do not integrate a payment gateway yet.

Do not pretend a payment has actually occurred.

Instead, make sure the architecture can eventually support:

```text
Payment
├── id
├── jobId
├── payerId
├── recipientId
├── amount
├── currency
├── provider
├── status
├── reference
└── timestamps
```

The payment provider should be extensible, but **EcoCash is the MVP provider**.

Later batches will handle the actual payment integration.

---

# 12. LOCATION / PROXIMITY FOUNDATION

One of GRAFT's most important features will eventually be:

> Show customers nearby workers and workers nearby jobs.

This is similar conceptually to the proximity experience of inDrive.

For Batch 1:

DO NOT build the complete matching algorithm.

DO NOT build live location tracking.

DO NOT build a production map experience unless the repository already contains one.

Instead:

- establish a location model
- establish location-related services/interfaces where appropriate
- ensure latitude/longitude can be represented
- ensure jobs can have geographic coordinates
- keep the architecture ready for distance calculations later

Do not request location permissions unnecessarily during Batch 1.

---

# 13. KYC / TRUST FOUNDATION

Trust and safety are core GRAFT requirements.

Eventually GRAFT should support strong worker verification.

Potential verification states:

```text
UNVERIFIED
PENDING
VERIFIED
REJECTED
```

Create the appropriate model/enum foundation where useful.

Do NOT implement full KYC document processing in Batch 1.

Do NOT collect sensitive identity documents simply to demonstrate the UI.

The architecture should be ready for KYC to be implemented later.

---

# 14. GRAFT BRAND / UI

Create a distinctive but simple GRAFT visual identity.

The interface should feel:

- Zimbabwean
- trustworthy
- practical
- modern
- community-oriented
- accessible
- energetic
- professional without feeling corporate

Avoid:

- generic SaaS dashboards
- excessive gradients
- excessive animations
- unnecessary glassmorphism
- heavy image backgrounds
- visually expensive effects

The product should feel like a useful everyday service.

---

# 15. MOBILE-FIRST UX

Design primarily for Android phones.

Assume that some users may have:

- small screens
- older phones
- limited RAM
- slow processors
- poor network connections
- expensive mobile data

Therefore:

- minimize unnecessary rebuilds
- avoid excessive animations
- avoid huge images
- avoid video
- avoid unnecessary network requests
- avoid giant dependency packages
- avoid complicated navigation
- keep tap targets accessible
- keep typography readable
- use sensible loading states
- design for one-handed use where practical

Performance is a product requirement, not an optional optimization.

---

# 16. INITIAL SCREENS

Create a minimal but polished foundation containing at least:

## Splash / startup

A simple GRAFT startup experience.

## Onboarding or welcome

Explain:

> Need a job done?

and

> Looking for work?

Allow the user to understand the two sides of the marketplace.

## Home

Provide an appropriate starting experience.

The home experience should make the two core actions obvious:

### Customer

**Post a Job**

### Worker

**Find Nearby Jobs**

These do not need to be fully functional yet if those features belong to later batches.

Use clear placeholder/navigation behavior rather than fake backend functionality.

## Profile

Create the basic profile foundation.

## Jobs

Create a foundation for job listings/details.

Again, do not implement the complete marketplace yet.

---

# 17. LOADING / ERROR / EMPTY STATES

Create reusable Flutter components for:

- loading
- error
- empty results
- retry
- unavailable/offline state

These should be reusable across future GRAFT features.

For example:

```text
No nearby jobs yet.

We'll let you know when work becomes available in your area.
```

Avoid generic developer-style error messages in the UI.

---

# 18. OFFLINE / NETWORK-AWARE FOUNDATION

GRAFT must eventually work reasonably well in unreliable network environments.

For Batch 1, establish the foundation for network awareness.

The app should be able to distinguish conceptually between:

- loading
- connected
- disconnected
- server error

Do not attempt to build a complete offline-sync engine in Batch 1.

Do not over-engineer this.

---

# 19. SAMPLE DATA

If necessary to demonstrate the UI, create clearly identifiable development/sample data.

Example:

```text
Sample Gardening Job
Bulawayo
USD 15–25
```

Make sure sample/demo data cannot accidentally be mistaken for production data.

Do not hard-code fake users or fake completed transactions into production logic.

---

# 20. DEPENDENCIES

Keep dependencies minimal.

Before adding a package, ask:

1. Is it actually needed?
2. Does Flutter already provide this capability?
3. Will it negatively affect performance?
4. Is it actively maintained?
5. Does it make the architecture substantially better?

Do not add dependencies simply because they are popular.

---

# 21. ENVIRONMENT CONFIGURATION

Inspect the existing environment/configuration approach.

Create or update an appropriate configuration strategy.

At minimum, prepare placeholders for things such as:

```text
API_BASE_URL
ENVIRONMENT
```

If other services are already configured, preserve them.

Never commit:

- API keys
- secrets
- passwords
- private credentials
- production tokens

Create/update `.env.example` or the project's equivalent configuration documentation where appropriate.

---

# 22. TESTING

Create a basic testing foundation.

At minimum test important Batch 1 domain behavior such as:

- user role parsing
- job model serialization/deserialization
- currency handling
- verification status handling

If the repository already has a testing strategy, follow it.

Do not chase arbitrary test coverage numbers.

Test the important foundation.

---

# 23. ACCESSIBILITY

Make the initial UI reasonably accessible.

Consider:

- readable font sizes
- sufficient contrast
- semantic labels where appropriate
- accessible buttons
- reasonable touch targets
- avoiding color as the only indication of state

Do not over-engineer accessibility in Batch 1, but do not ignore it.

---

# 24. README

Update the README.

It should explain:

## GRAFT

What GRAFT is and who it serves.

## Technology

Mention:

- Flutter
- Dart
- chosen state-management solution, if any
- chosen routing solution, if any
- other important dependencies

## Running locally

Explain the commands required to run the application.

## Configuration

Explain required environment/configuration variables.

## Current MVP status

Clearly state what Batch 1 contains.

## Deferred functionality

Clearly state what is intentionally not implemented yet.

---

# 25. VERIFICATION

Before declaring Batch 1 complete, run the appropriate Flutter checks.

At minimum, where applicable:

```bash
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

If a command is not possible because of the local environment, explain exactly why.

Do not hide errors.

If `flutter analyze` reports issues introduced by your work, fix them.

If tests fail because of your implementation, fix them.

If the APK build fails because of your implementation, fix it.

---

# 26. GIT SAFETY

Before making changes:

```bash
git status
```

After implementation:

```bash
git status
git diff --stat
```

Do not delete unrelated work.

Do not reset the repository.

Do not overwrite existing user changes.

Do not commit secrets.

Do not create unnecessary generated files.

---

# 27. STRICT SCOPE — DO NOT IMPLEMENT YET

The following are intentionally OUT OF SCOPE for Batch 1 unless they already exist and are required for the foundation:

- Full authentication
- OTP verification
- Full KYC
- Identity document uploads
- Live GPS tracking
- Real-time worker matching
- Production map integration
- Job bidding system
- In-app chat
- Push notifications
- Live EcoCash payments
- Payment settlement
- Ratings/reviews
- Worker earnings system
- Admin dashboard
- Fraud detection
- Advanced search
- Production analytics

These belong to later implementation batches.

Create foundations where appropriate, but do not turn Batch 1 into the entire product.

---

# 28. EXECUTION PROCESS

Follow this process:

### Step 1 — Inspect

Understand the current repository before changing it.

### Step 2 — Plan

Create a short internal implementation plan based on what actually exists.

### Step 3 — Implement

Build Batch 1.

### Step 4 — Verify

Run:

```bash
flutter analyze
flutter test
flutter build apk --debug
```

and any other relevant checks.

### Step 5 — Fix

Resolve errors caused by your implementation.

### Step 6 — Review

Check that the implementation follows the GRAFT requirements and did not accidentally implement later-batch functionality.

### Step 7 — Report

Give me a concise final report containing:

## Implemented

What was actually built.

## Files changed

Important files/directories created or modified.

## Verification

Commands executed and their results.

## Deferred

What was intentionally left for later batches.

## Notes

Any architectural decisions or assumptions you made.

## Next batch

State the logical next MVP batch.

---

# FINAL INSTRUCTION

**Do not stop at analysis.**

**Do not give me instructions for how I could implement Batch 1.**

**You are the coding agent. Implement it.**

Inspect → plan → code → test → fix → verify → report.

Keep the implementation focused on **Batch 1 only**.

The primary platform is **Flutter**.

The product is **GRAFT**.

The target market is **Zimbabwe**.

The product must be **mobile-first, lightweight, low-bandwidth conscious, and designed to eventually support hyperlocal worker/job matching and EcoCash payments.**

Do not proceed into Batch 2 until Batch 1 is complete and verified.