# GRAFT — BATCH 3 IMPLEMENTATION PROMPT
## Customer Job Creation, Job Data Foundation & Job Publishing

You are continuing development of **GRAFT**, a Zimbabwean hyperlocal services marketplace.

Batch 1 and Batch 2 have been completed and runtime-verified.

Your task is to execute **BATCH 3 ONLY**.

Do not start Batch 4 or implement features belonging to later batches.

---

# 1. CURRENT VERIFIED STATE

Batch 1 established the project foundation.

Batch 2 established and verified:

- GRAFT branding
- Young Serif typography
- Zimbabwean-inspired colour system
- GRAFT logo
- Customer Home
- Worker Home
- Role selection
- Navigation
- Core reusable UI components
- Loading state
- Error state
- Empty state
- Offline state
- Confirmation dialog
- Snackbar

The currently verified entry flow is:

```text
Welcome
   ↓
Get Started
   ↓
Phone
   ↓
Role Selection
   ├── Customer → Customer Home
   └── Worker   → Worker Home
```

Do NOT break this existing flow.

---

# 2. SOURCE OF TRUTH

Before writing code, inspect the current repository and read:

```text
docs/BUSINESS_REQUIREMENTS.md
docs/PRODUCT_VISION.md
docs/USER_PERSONAS.md
docs/USER_FLOWS.md
docs/UX_UI_REQUIREMENTS.md
docs/TECHNICAL_ARCHITECTURE.md
```

Also inspect:

```text
lib/
pubspec.yaml
existing models
existing enums
existing repositories/services
existing navigation
existing design system
existing Batch 1 and Batch 2 implementations
```

The documents are the source of truth.

Do not invent product behaviour that contradicts them.

If there is an unresolved product/technical decision, do not silently make it permanent.

---

# 3. BATCH 3 OBJECTIVE

The objective of Batch 3 is to turn the Customer Home "Post a Job" concept into a real, usable MVP workflow.

By the end of Batch 3, a customer must be able to:

```text
Customer Home
      ↓
Post Job
      ↓
Category
      ↓
Job Details
      ↓
Optional Photos
      ↓
Location
      ↓
Preferred Date/Time
      ↓
Budget / Pricing
      ↓
Review
      ↓
Publish
      ↓
Job Posted
      ↓
Job appears in customer's jobs
```

This is the first major marketplace transaction flow.

The implementation must work on a real Android device.

---

# 4. MVP REQUIREMENTS FOR A JOB

A customer job must support the MVP information defined in the project documentation.

At minimum:

```text
Job
├── Title
├── Category
├── Description
├── Location
├── Preferred date/time
├── Optional photos
└── Budget / pricing preference
```

The system should also maintain appropriate metadata such as:

```text
ID
Customer ID
Status
Created timestamp
Updated timestamp
```

Do not omit ownership information.

A job belongs to the customer who created it.

---

# 5. JOB LIFECYCLE FOUNDATION

Create or verify a typed job status system.

The MVP lifecycle begins with:

```text
DRAFT
   ↓
POSTED
   ↓
BIDDING
```

The broader product lifecycle may eventually include:

```text
WORKER_SELECTED
PAYMENT_PENDING
PAYMENT_CONFIRMED
WORKER_EN_ROUTE
WORK_STARTED
WORK_COMPLETED
CUSTOMER_CONFIRMED
PAYMENT_RELEASED
COMPLETED
```

and alternative states such as:

```text
CANCELLED
EXPIRED
PAYMENT_FAILED
DISPUTED
NO_SHOW
SUSPENDED
```

However:

## IMPORTANT

Batch 3 does NOT need to implement the complete lifecycle.

Only establish the data foundation cleanly enough that later batches can extend it.

Do not implement worker selection, payment or completion logic in this batch.

---

# 6. JOB DATA MODEL

Inspect the existing project models before creating a new Job model.

If a Job model already exists from Batch 1, extend it rather than creating a duplicate.

The model should support, as appropriate:

```text
id
customerId
title
category
description
photos
location
preferredDate
preferredTime
budget
pricingPreference
status
createdAt
updatedAt
```

Use the project's existing architectural conventions.

Prefer strongly typed values and enums over arbitrary strings.

Do not create duplicate models representing the same concept.

---

# 7. LOCATION MODEL

The MVP requires job location.

However, do NOT implement a production map provider in Batch 3.

The project documentation contains unresolved decisions around:

- Map provider
- Exact location privacy model
- Location update frequency
- Background tracking
- Service radius

Do not make those decisions permanent in this batch.

For Batch 3, establish a clean location representation that can later support:

```text
Approximate area
Latitude
Longitude
Address/description where appropriate
```

The exact customer address must not be unnecessarily exposed to workers.

Respect progressive location disclosure.

---

# 8. LOCATION PRIVACY

Before a worker is selected, the system should be capable of showing:

```text
Approximate area
Distance
General location
```

rather than exposing the customer's exact home location unnecessarily.

Do not build exact live worker/customer tracking.

Do not expose sensitive location information simply because it is technically available.

---

# 9. CATEGORY SYSTEM

Create or use a typed category system.

The initial categories should support the categories already shown in Customer Home, including:

```text
Gardening
Plumbing
Electrical
Cleaning
Carpentry
Painting
```

Design the category model so more categories can be added later without rewriting the UI.

Do not hard-code category logic into dozens of widgets.

---

# 10. POST JOB ENTRY POINT

Customer Home must have a clear primary action:

```text
Post a Job
```

The action should be visually prominent.

When the customer taps it:

```text
Customer Home
      ↓
Post Job
```

The user must not have to discover this action through an obscure menu.

---

# 11. POST JOB — CATEGORY

Create the first step of the posting flow.

The customer should select a category.

Example:

```text
What kind of help do you need?

[ Gardening ]
[ Plumbing ]
[ Electrical ]
[ Cleaning ]
[ Carpentry ]
[ Painting ]
```

The selected category must be stored as part of the job draft.

Do not proceed unless a valid category is selected.

Use the existing GRAFT design system.

---

# 12. POST JOB — DETAILS

Create the job details step.

The customer should provide:

### Job title

Example:

```text
Fix leaking kitchen tap
```

### Description

Example:

```text
The kitchen tap has been leaking since yesterday.
I need someone to inspect and repair it.
```

The interface should clearly explain what information is useful.

Keep the form concise.

Do not create unnecessary fields.

---

# 13. FORM VALIDATION

Implement appropriate validation.

At minimum:

### Title

- Required
- Cannot be blank
- Reasonable maximum length

### Description

- Required
- Cannot be blank
- Reasonable maximum length

### Category

- Required

Validation messages must be user-friendly.

Do not expose technical validation errors.

---

# 14. OPTIONAL PHOTOS

Allow the customer to optionally attach photos.

The MVP requirement allows optional photos.

The implementation should support:

```text
Add photo
Remove photo
Preview selected photo
```

Do not require a photo.

Do not introduce an unnecessarily heavy image-processing pipeline.

Use an appropriate lightweight Flutter package only if required.

If image permissions are required, handle them correctly.

If image selection cannot be fully implemented because of environment limitations, establish the correct abstraction and clearly report the limitation.

Do not pretend a photo was uploaded when it was not.

---

# 15. PHOTO LIMIT

Establish a sensible MVP limit on the number of photos.

Prefer a small number appropriate for a lightweight marketplace.

Do not allow unlimited uploads.

The limit should be centralized/configurable rather than scattered through the UI.

---

# 16. POST JOB — LOCATION

Create a location step.

The customer should be able to provide/select the job location.

For Batch 3, the UI may use:

- Current location
- Manually selected area
- Location description
- Placeholder/mock location provider where necessary

However:

## DO NOT

Commit the project to a permanent map provider.

Do not implement live tracking.

Do not expose exact location unnecessarily.

---

# 17. LOCATION UX

The customer should understand what location is being used.

For example:

```text
Job location

George CBD
Approximate location

[ Change location ]
```

Do not imply GPS accuracy if the location is only approximate.

The location component should be reusable for later batches.

---

# 18. POST JOB — DATE AND TIME

Create a preferred date/time step.

The customer should be able to indicate when they want the job done.

Support:

```text
Preferred date
Preferred time
```

Use native Flutter date/time controls where appropriate.

Do not create a complex scheduling system.

This is a preference, not a guaranteed appointment.

The UI must not imply that a worker has already accepted the time.

---

# 19. POST JOB — BUDGET / PRICING

Create a budget/pricing step.

The customer should be able to communicate their pricing preference.

The UX must support the concept of:

```text
Budget
```

and/or:

```text
Open to offers
```

where supported by the existing requirements.

Do not force the customer into a rigid fixed-price marketplace if the product requirements support flexible bidding.

The later bidding system must be able to operate against this information.

---

# 20. CURRENCY

Currency must always be explicit.

Do not display:

```text
500
```

without context.

Use an explicit format such as:

```text
USD 500
```

or the currency convention already established by the project.

Do not create currency conversion logic in Batch 3.

Do not invent exchange rates.

---

# 21. REVIEW JOB

Before publishing, show a review screen.

The customer should be able to verify:

```text
Category
Title
Description
Photos
Location
Preferred date
Preferred time
Budget
Pricing preference
```

The screen should make it obvious that the customer is reviewing before publishing.

Provide:

```text
Edit
```

actions where appropriate.

Do not force the user to restart the entire form because they want to change one field.

---

# 22. PUBLISH JOB

Provide a clear final action:

```text
Post Job
```

Before publishing, ensure required fields are valid.

When the job is successfully created:

```text
status = POSTED
```

Do not mark it as:

```text
BIDDING
```

unless the later worker-discovery/bidding system has actually started.

---

# 23. JOB POSTED SUCCESS STATE

After successful publication, show a clear success state.

Example:

```text
Job Posted

Your job has been posted successfully.

Nearby workers will be able to discover it when the matching system is available.
```

Do not falsely claim that workers have already been notified if that functionality does not exist yet.

Provide a clear action to:

```text
View Job
```

and/or:

```text
Back to Jobs
```

depending on the existing navigation architecture.

---

# 24. CUSTOMER JOB LIST

After posting, the job must appear in the customer's jobs/recent jobs area.

The customer should be able to see at least:

```text
Job title
Category
Status
Location/area
Created date
Budget/pricing preference
```

The newly posted job must actually appear.

Do not simply show a success message while keeping the job entirely disconnected from the customer's job list.

---

# 25. JOB DETAIL SCREEN

Create the foundation for a Customer Job Detail screen.

It should display the information that was entered during posting.

At minimum:

```text
Title
Category
Description
Photos
Location
Preferred date/time
Budget
Status
Created date
```

This screen is important because later batches will add:

```text
Bids
Worker selection
Payment
Job progress
Completion
Rating
```

Do not implement those later features yet.

Create the structure so they can be added cleanly.

---

# 26. JOB OWNERSHIP

A customer must only be able to see/manage jobs belonging to that customer.

Do not create a global list where every customer can access every job.

Use:

```text
customerId
```

or the project's equivalent ownership mechanism.

The UI should be designed around ownership even if the final backend security layer is implemented later.

---

# 27. PERSISTENCE ARCHITECTURE

This batch must establish the job persistence layer cleanly.

First inspect whether the existing Batch 1 architecture already provides:

- Repository pattern
- Local storage
- Remote API layer
- Database abstraction
- State management

Use the existing architecture.

Do not create a completely separate persistence system.

If no production database is connected yet, create a clean repository abstraction with a development/local implementation that can later be replaced by the real backend.

Do not fake a successful production database write.

---

# 28. IMPORTANT — DATABASE BOUNDARY

Do NOT add a production database simply because Batch 3 introduces a Job model unless the existing architecture is already ready for it.

The application architecture should separate:

```text
UI
 ↓
State / Controller
 ↓
Repository
 ↓
Data source
```

This allows the data source to evolve later.

For example:

```text
JobRepository
    ↓
LocalJobDataSource
```

during development, and later:

```text
JobRepository
    ↓
RemoteJobDataSource
    ↓
Production Database/API
```

Do not tightly couple Flutter widgets directly to database implementation details.

---

# 29. STATE MANAGEMENT

Use the project's existing state management approach.

Do not introduce a second state management framework.

The posting flow needs to maintain a job draft across multiple screens.

The draft should survive normal navigation between the steps.

For example:

```text
Category
   ↓
Details
   ↓
Photos
   ↓
Location
   ↓
Date/Time
   ↓
Budget
   ↓
Review
```

Information entered earlier must not mysteriously disappear.

---

# 30. DRAFT BEHAVIOUR

Create a clear JobDraft concept if the architecture requires it.

The draft should contain the information collected before publishing.

Do not mark the draft as POSTED until the final publish action succeeds.

If the user cancels the flow, do not accidentally create a published job.

---

# 31. LOADING STATES

Use the Batch 2 reusable LoadingState.

Publishing should have a proper loading state.

For example:

```text
Posting your job...
```

The user should not be able to accidentally submit the same job multiple times while a submission is in progress.

---

# 32. ERROR HANDLING

Use the Batch 2 ErrorState/Snackbar components where appropriate.

If publishing fails:

- Do not show success.
- Do not clear the user's entered information unnecessarily.
- Explain that the job was not posted.
- Allow retry.

Example:

```text
We couldn't post your job.

Your information is still here.

[ Try Again ]
```

Do not expose stack traces.

---

# 33. OFFLINE HANDLING

GRAFT must account for unreliable connectivity.

If the application requires network access to publish a job:

Clearly tell the user when they are offline.

Do not falsely show:

```text
Job Posted
```

when the server/database has not confirmed the creation.

If a local draft can safely be retained, preserve it.

---

# 34. ACCESSIBILITY

Maintain Batch 2 accessibility standards.

Ensure:

- Labels are readable
- Form fields have semantic labels
- Buttons have clear actions
- Touch targets are practical
- Error states are understandable
- Status is not communicated only through colour
- Text scaling does not break the layout
- Keyboard interaction is reasonable
- Screen-reader semantics are present where appropriate

---

# 35. GRAFT DESIGN SYSTEM

Use the existing Batch 2 design system.

Do NOT create new random colours.

Primary:

```text
#319400
```

Supporting:

```text
#D40000
#FFD200
#000000
#FFFFFF
```

Use the existing centralized tokens.

Young Serif remains the GRAFT brand/display font.

Do not introduce another decorative font.

---

# 36. UI DESIGN PRINCIPLES

The posting flow should feel:

```text
Simple
Fast
Clear
Trustworthy
Local
Professional
```

Avoid:

- Long walls of text
- Unnecessary fields
- Excessive animations
- Heavy gradients
- Excessive shadows
- Complex forms
- Generic SaaS styling

The user should always understand:

```text
Where am I?
What information am I entering?
What happens next?
```

---

# 37. PROGRESS INDICATOR

Because the posting flow contains multiple steps, provide a clear but lightweight progress indicator.

For example:

```text
1 Category
2 Details
3 Location
4 Schedule
5 Budget
6 Review
```

Do not make the progress indicator visually overwhelming.

The exact number of screens may differ if the implementation combines related fields.

The important requirement is that the customer understands their progress.

---

# 38. MOBILE-FIRST

The application is primarily a Flutter mobile application.

Design the posting flow for:

- Affordable Android phones
- Small screens
- One-handed use
- Slow connections
- Limited memory
- Touch interaction

Do not optimize for desktop first.

---

# 39. PERFORMANCE

Do not introduce heavy dependencies without justification.

Avoid:

- Large image-processing libraries
- Complex map libraries
- Heavy animation packages
- Unnecessary state-management frameworks
- Large UI frameworks

Reuse existing dependencies wherever possible.

---

# 40. DO NOT IMPLEMENT LATER BATCHES

The following are explicitly OUT OF SCOPE:

## Worker Discovery

Not Batch 3.

## Nearby Worker Map

Not Batch 3.

## Worker Bidding

Not Batch 3.

## Bid Comparison

Not Batch 3.

## Worker Selection

Not Batch 3.

## KYC

Not Batch 3.

## Identity Verification

Not Batch 3.

## EcoCash Integration

Not Batch 3.

## Payment Escrow

Not Batch 3.

## Ratings

Not Batch 3.

## Notifications

Not Batch 3.

## Real-time Chat

Not Batch 3.

## Live Location Tracking

Not Batch 3.

## Admin Dashboard

Not Batch 3.

## AI

Not Batch 3.

Do not add these "for completeness."

---

# 41. DO NOT BREAK BATCH 2

After implementing Batch 3, verify that the existing flow still works:

```text
Welcome
 ↓
Get Started
 ↓
Phone
 ↓
Role
 ├── Customer → Customer Home
 └── Worker → Worker Home
```

Customer Home must now provide the entry point into Post Job.

Worker Home should remain functional but does not need the worker marketplace implementation yet.

---

# 42. RUNTIME ACCEPTANCE TEST

This is mandatory.

Do NOT declare Batch 3 complete merely because:

- Files exist
- Models exist
- Routes exist
- Code compiles

The actual user journey must work.

Test on a physical Android device if available.

---

# 43. CUSTOMER END-TO-END TEST

Perform this exact scenario:

```text
Launch GRAFT
   ↓
Get Started
   ↓
Enter phone
   ↓
Select Customer
   ↓
Customer Home
   ↓
Tap Post a Job
   ↓
Select Plumbing
   ↓
Enter title:
"Fix leaking kitchen tap"
   ↓
Enter description
   ↓
Add/skip photo
   ↓
Select/provide location
   ↓
Select preferred date
   ↓
Select preferred time
   ↓
Enter budget/pricing preference
   ↓
Review
   ↓
Post Job
   ↓
Job Posted
   ↓
View Job
```

Verify that the created job actually appears in the customer's jobs/recent jobs.

---

# 44. SECOND TEST

Create a second job with a different category.

For example:

```text
Category: Gardening
Title: Cut overgrown grass
```

Verify that both jobs can exist independently.

This helps detect accidental singleton/global state.

---

# 45. VALIDATION TESTS

Test invalid submission attempts.

Examples:

### Missing category

Should not publish.

### Empty title

Should show validation.

### Empty description

Should show validation.

### Missing location

Should behave according to the defined MVP requirement.

### Invalid budget

Should show a clear validation message.

The application must not crash.

---

# 46. ERROR TEST

Simulate/trigger a publishing failure where practical.

Verify:

```text
No false success
No lost form data
Clear error
Retry available
```

---

# 47. VISUAL QA

Verify on the physical device:

### Branding

- GRAFT logo remains visible.
- Young Serif is used correctly.
- Primary green is #319400.

### Form

- Inputs are readable.
- Buttons are obvious.
- No overflow occurs.
- Keyboard does not hide important controls.

### Job cards

- Newly created jobs render correctly.
- Status is clear.
- Information hierarchy is good.

### Review

- All entered information is visible.
- Edit functionality works.

### Success

- Job Posted state is clear.
- View Job works.

---

# 48. TEST COMMANDS

Run:

```bash
flutter doctor
flutter devices
flutter analyze
flutter test
```

Then run the application on the Android device.

Use:

```bash
flutter run
```

or the appropriate device-specific command.

If any command cannot be run, state exactly why.

Do not claim a test passed if it was not executed.

---

# 49. CODE QUALITY

Before finishing:

Run formatting.

Remove:

- Unused imports
- Dead code
- Debug prints
- Temporary placeholders
- Duplicate models
- Duplicate navigation
- Hard-coded colours
- Hard-coded category strings where a model/enum is appropriate

Keep the implementation consistent with Batch 1 and Batch 2 architecture.

---

# 50. FINAL ACCEPTANCE CRITERIA

Batch 3 can only be marked PASSED if:

## Job Creation

- [ ] Customer can start Post Job from Customer Home.
- [ ] Category selection works.
- [ ] Job title works.
- [ ] Description works.
- [ ] Optional photos are supported appropriately.
- [ ] Location can be provided.
- [ ] Preferred date works.
- [ ] Preferred time works.
- [ ] Budget/pricing preference works.
- [ ] Review screen works.
- [ ] User can edit information before publishing.
- [ ] Job can be published.

## Data

- [ ] Job has a unique ID.
- [ ] Job has customer ownership.
- [ ] Job has category.
- [ ] Job has title.
- [ ] Job has description.
- [ ] Job has location.
- [ ] Job has scheduling preference.
- [ ] Job has budget/pricing information.
- [ ] Job has status.
- [ ] Job has timestamps.

## Lifecycle

- [ ] New job starts as POSTED after successful publication.
- [ ] It does not incorrectly enter BIDDING before Batch 4/5.
- [ ] Status is typed/centralized.

## Customer Experience

- [ ] Posted job appears in customer's jobs.
- [ ] Customer can open job details.
- [ ] Job information is displayed correctly.
- [ ] Multiple jobs can exist.

## Reliability

- [ ] Validation works.
- [ ] Loading state works.
- [ ] Duplicate submission is prevented.
- [ ] Error handling works.
- [ ] Offline state is handled appropriately.
- [ ] Form information is preserved after failed submission where practical.

## Existing Flow

- [ ] Welcome still works.
- [ ] Get Started still works.
- [ ] Phone flow still works.
- [ ] Role selection still works.
- [ ] Customer Home still works.
- [ ] Worker Home still works.

## Design

- [ ] GRAFT logo remains visible.
- [ ] Young Serif remains correctly configured.
- [ ] Primary green remains #319400.
- [ ] Existing design tokens are reused.
- [ ] No random new visual system was introduced.

## Runtime

- [ ] Physical-device customer flow tested.
- [ ] At least two different jobs successfully tested.
- [ ] No crashes.
- [ ] No route errors.
- [ ] No overflow.
- [ ] No missing assets.
- [ ] No false success states.

---

# 51. FINAL REPORT

When complete, provide:

## Status

Exactly one:

```text
BATCH 3: PASSED
BATCH 3: PARTIAL
BATCH 3: BLOCKED
```

Do not report PASSED unless the physical runtime flow was tested.

## What Was Implemented

Summarize the actual work.

## Files Created

List important files.

## Files Modified

List important files.

## Data Architecture

Explain:

- Job model
- Job repository
- Data source
- State management
- Persistence approach

## Tests Actually Run

Report:

```text
flutter doctor
flutter devices
flutter analyze
flutter test
flutter run
```

with actual results.

## Physical Runtime Test

Report:

```text
Customer flow: PASSED / FAILED
Second job test: PASSED / FAILED
Validation tests: PASSED / FAILED
Error handling: PASSED / FAILED
```

## Known Limitations

List only real limitations.

## Explicitly NOT Implemented

Confirm that later-batch features were not implemented.

---

# FINAL RULE

Batch 3 is not about creating a collection of forms.

It is about creating the first real GRAFT marketplace transaction:

> **A customer can describe a real-world problem, provide the necessary information, publish it as a real structured job, and see that job in their GRAFT account.**

The user journey is the acceptance test.

If the user cannot physically complete:

```text
Customer Home
→ Post Job
→ Category
→ Details
→ Photos
→ Location
→ Date/Time
→ Budget
→ Review
→ Publish
→ Job Posted
→ View Job
```

then Batch 3 is NOT complete.

**Execute Batch 3 only. Do not start Batch 4.**