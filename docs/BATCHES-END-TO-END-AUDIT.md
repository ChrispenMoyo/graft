# GRAFT — END-TO-END PRODUCT AUDIT

## Purpose

This is a **product audit**, not a feature-development batch.

The objective is to verify that GRAFT behaves correctly from the perspective of the two primary users:

1. **CUSTOMER** — the person who needs work done and posts a job.
2. **WORKER** — the person looking for work and responding to jobs.

The audit must verify:

* Navigation
* Authentication / user roles
* Job posting
* Job discovery
* Job details
* Job lifecycle
* Worker interaction
* Customer interaction
* Data persistence
* Validation
* Error handling
* UI/UX behaviour
* Back navigation
* Empty states
* Loading states
* Success states
* Role separation
* Real-world usability

### IMPORTANT

Do **NOT** automatically add new features.

First determine whether the existing implementation matches the intended GRAFT product.

If something is broken, fix it.

If something is incomplete but belongs to a later planned feature, document it instead of inventing behaviour.

---

# 1. GRAFT PRODUCT DEFINITION

GRAFT is a Zimbabwean hyperlocal jobs marketplace.

### Core concept

> **GRAFT: Ndezve basa.**

A customer needs something done.

They post a job.

Nearby workers discover the job.

Workers can respond/bid.

The customer can review worker responses and eventually select a worker.

The product should feel:

* Simple
* Fast
* Local
* Mobile-first
* Easy to understand
* Suitable for Zimbabwean users
* Usable on slower Android phones
* Minimal in data usage
* Clear even for a first-time smartphone/app user

---

# 2. AUDIT RULE

For every screen and flow, answer:

### A. Can the user reach it?

### B. Does the screen show the correct information?

### C. Can the user complete the intended action?

### D. Does the app respond correctly?

### E. Is the data preserved?

### F. Can the user recover from mistakes?

### G. Does the behaviour make sense from a real user's perspective?

### H. Does the behaviour match the existing GRAFT product definition?

---

# 3. DO NOT ASSUME

Before making changes:

1. Inspect the existing codebase.
2. Inspect routing.
3. Inspect authentication/state management.
4. Inspect models/entities.
5. Inspect job-related services/repositories.
6. Inspect all existing screens.
7. Inspect Batch 1–4 implementation.
8. Determine what is already implemented.
9. Determine what is actually working.
10. Only then make fixes.

Do not rewrite working systems unnecessarily.

Prefer the smallest safe fix.

---

# 4. AUDIT STATUS SYSTEM

Use these statuses:

| Status   | Meaning                                          |
| -------- | ------------------------------------------------ |
| PASS     | Works exactly as expected                        |
| PASS*    | Works, but minor UX issue exists                 |
| FAIL     | Expected functionality does not work             |
| PARTIAL  | Some of the intended behaviour exists            |
| MISSING  | Functionality is not implemented                 |
| BLOCKED  | Cannot test because another dependency is broken |
| DEFERRED | Intentionally belongs to a future phase          |

For every FAIL/PARTIAL/MISSING item:

* Identify the root cause.
* Identify the file(s).
* Fix the issue if it belongs to the current product scope.
* Retest.
* Record the final status.

---

# 5. PHASE 0 — CODEBASE HEALTH CHECK

Before testing user flows, run the project's existing verification commands.

Determine the correct commands from the project.

At minimum check:

* Flutter analyze
* Tests
* Build
* Dependency integrity
* Routing
* Compile errors
* Runtime errors

Expected:

```text
flutter analyze
```

and the appropriate test/build commands for the project.

### Record

```text
ANALYZE: PASS / FAIL
TESTS: PASS / FAIL
BUILD: PASS / FAIL
RUNTIME: PASS / FAIL
```

If there are errors:

### DO NOT CONTINUE BLINDLY.

Fix blocking technical issues first.

---

# 6. PHASE 1 — CUSTOMER AUDIT

## CUSTOMER JOURNEY

The complete expected journey is:

```text
Open GRAFT
    ↓
Customer account
    ↓
Customer Home
    ↓
Post a Job
    ↓
Enter job information
    ↓
Review / confirmation
    ↓
Job successfully posted
    ↓
Customer sees posted job
    ↓
Workers can discover the job
    ↓
Worker responds/bids
    ↓
Customer sees worker response
    ↓
Customer reviews worker
    ↓
Customer can proceed with the worker
```

Audit every stage.

---

# 7. CUSTOMER — ACCOUNT / ROLE

Verify:

* Customer can enter the application.
* Customer role is correctly identified.
* Customer does not accidentally see worker-only functionality.
* Customer navigation is correct.
* Customer lands on the correct home screen.
* State survives navigation where appropriate.
* Logout/back behaviour is correct.

### Test

```text
Open app
→ Enter as Customer
→ Observe initial screen
→ Navigate between tabs
→ Return home
→ Navigate away
→ Return
```

### Expected

Customer consistently remains in the Customer experience.

---

# 8. CUSTOMER — HOME SCREEN

Verify:

* Home screen loads.
* Main navigation is visible.
* "Post a Job" is reachable.
* Existing jobs/data are displayed correctly if implemented.
* Empty states are sensible.
* No dead buttons.
* No TODO navigation.
* No placeholder behaviour.
* No unnecessary technical/debug UI.

### Critical check

Confirm that:

```text
Customer Home
→ Post a Job
```

actually reaches the real `PostJobFlow`.

---

# 9. CUSTOMER — POST JOB FLOW

This is one of the most important GRAFT flows.

Verify the complete flow implemented in Batch 2/3/4.

Expected:

```text
Customer Home
→ Post Job
→ Step 1
→ Step 2
→ Step 3
→ ...
→ Confirmation
→ Success
```

Do not assume the number of steps.

Inspect the actual implementation.

For EVERY step verify:

### UI

* Correct title
* Correct labels
* Correct inputs
* Correct buttons
* Correct progress indicator if implemented
* Correct keyboard behaviour

### Validation

Test:

* Empty fields
* Invalid values
* Very short values
* Very long values
* Invalid amounts
* Missing required information

The app should prevent invalid submissions where appropriate.

### Navigation

Test:

* Next
* Back
* Cancel
* Continue
* Submit

Make sure information entered on previous screens is not unexpectedly lost.

---

# 10. CUSTOMER — JOB CREATION

At final submission:

Verify:

* Job is actually created.
* Success screen appears.
* No duplicate job is created by accidental repeated taps.
* Data matches what the customer entered.
* Job ID/model/state is correctly created if applicable.
* Job becomes visible in the correct customer area.
* Worker side can eventually access the job where intended.

### Important

Tap the final submit button multiple times quickly.

Verify that this does NOT create duplicate jobs.

---

# 11. CUSTOMER — POSTED JOB

After creating a job:

Verify the customer can:

* Find the job.
* Open the job.
* See correct information.
* Understand its current state.
* Return to previous screen.
* Navigate back to Home.

Check:

```text
Job title
Description
Category
Location
Budget/payment
Date/time
Status
Other implemented fields
```

All displayed information should match the original submission.

---

# 12. CUSTOMER — JOB STATE

Inspect the actual job-state implementation.

Document the states currently supported.

For example:

```text
POSTED
→ RESPONSES
→ WORKER SELECTED
→ IN PROGRESS
→ COMPLETED
```

Do NOT invent states that don't exist.

Verify that existing states transition correctly.

Check that impossible transitions cannot accidentally happen.

---

# 13. CUSTOMER — WORKER RESPONSE

Where worker responses/bids are implemented:

Verify:

```text
Customer
→ Posted Job
→ Worker Responses
→ Worker Details
```

Check:

* Response appears.
* Worker information is correct.
* Bid/offer information is correct.
* Customer can distinguish multiple workers.
* No duplicated responses.
* Empty state works when nobody has responded.

---

# 14. CUSTOMER — WORKER SELECTION

If worker selection is already implemented:

Verify:

* Customer can select the intended worker.
* Correct worker is selected.
* Job state changes appropriately.
* Other workers are handled correctly.
* UI reflects the new state.
* Data remains correct after leaving and reopening the screen.

If worker selection is NOT implemented:

Mark:

```text
DEFERRED / MISSING
```

Do not invent a new implementation unless it is explicitly part of the current scope.

---

# 15. PHASE 2 — WORKER AUDIT

## WORKER JOURNEY

Expected journey:

```text
Open GRAFT
    ↓
Worker account
    ↓
Worker Home / Work
    ↓
Discover jobs
    ↓
Open job
    ↓
Review job details
    ↓
Respond / Bid
    ↓
Submit response
    ↓
Response confirmation
    ↓
Customer receives response
```

---

# 16. WORKER — ACCOUNT / ROLE

Verify:

* Worker role is correctly identified.
* Worker sees Worker experience.
* Worker does not accidentally see Customer-only controls.
* Navigation is correct.
* Work tab works.
* Worker can return home.

---

# 17. WORKER — JOB DISCOVERY

Check the Work tab.

Verify:

* Jobs load.
* Job cards are understandable.
* Job title is visible.
* Location is understandable.
* Budget is visible if implemented.
* Relevant category information is visible.
* Status is visible where appropriate.

### Empty state

Test when no jobs exist.

Expected:

A clear empty state rather than:

* Blank screen
* Exception
* Infinite loading
* Broken UI

---

# 18. WORKER — JOB DETAILS

Open a job.

Verify:

* Full job information is shown.
* Information matches customer-created data.
* Worker can understand what work is required.
* Location information behaves correctly.
* Budget/payment information is correct.
* Job status is correct.
* Action button is appropriate.

Test:

```text
Job List
→ Job Details
→ Back
→ Job List
```

No navigation loops or broken state.

---

# 19. WORKER — POST JOB

This is specifically required from Batch 4.

Verify:

```text
Work tab
→ Post Job
→ PostJobFlow
→ All steps
→ Success
```

The Worker-side job posting flow should use the same underlying `PostJobFlow` where intended.

### Verify:

* Worker can reach Post Job.
* Same required fields are available.
* Validation works.
* Navigation works.
* Back works.
* Submit works.
* Success screen works.
* Created job is actually stored.
* Created job is visible where appropriate.

### Critical check

Confirm the Worker does NOT get a fake or separate incomplete implementation when the product expects the shared `PostJobFlow`.

---

# 20. WORKER — RESPOND / BID

Where implemented:

Test:

```text
Worker
→ Job
→ Respond / Bid
→ Enter response
→ Submit
→ Success
```

Verify:

* Required fields are validated.
* Response is created.
* Duplicate submissions are prevented.
* Customer can see the response.
* Worker can see their own response where implemented.

---

# 21. CROSS-ROLE AUDIT

This is one of the most important tests.

Create a real test scenario.

### Step 1 — Customer

Create:

```text
JOB A
```

Record:

```text
Title:
Description:
Category:
Location:
Budget:
Date:
```

### Step 2 — Worker

Open GRAFT as Worker.

Find:

```text
JOB A
```

Verify all information matches.

### Step 3 — Worker

Respond/bid on JOB A.

### Step 4 — Customer

Return to Customer.

Open JOB A.

Verify the worker response exists.

### Step 5

Verify both sides now see the correct state.

---

# 22. DATA CONSISTENCY AUDIT

The same job should not mysteriously have different information depending on the screen.

Compare:

```text
Customer Job Creation
        ↓
Customer Job Details
        ↓
Worker Job List
        ↓
Worker Job Details
        ↓
Worker Response
        ↓
Customer Response
```

Verify:

* IDs
* Titles
* Descriptions
* Categories
* Locations
* Budgets
* Dates
* Statuses
* User IDs
* Worker IDs
* Customer IDs

No mismatches.

---

# 23. NAVIGATION AUDIT

Test every important navigation path.

### Customer

```text
Home
→ Post Job
→ Step 1
→ Step 2
→ Back
→ Step 1
→ Continue
→ Success
→ Home
```

### Worker

```text
Work
→ Job
→ Details
→ Back
→ Work
```

### Worker Posting

```text
Work
→ Post Job
→ Step 1
→ Step 2
→ ...
→ Success
```

Test Android back button/system back where applicable.

No:

* crashes
* blank screens
* dead ends
* duplicated screens
* unexpected logout
* lost form data

---

# 24. LOADING STATES

Every asynchronous operation should be checked.

Test:

* Opening jobs
* Loading jobs
* Creating job
* Submitting response
* Loading user data
* Any network/database operation

Verify:

```text
Loading
→ Success
```

and:

```text
Loading
→ Error
```

both behave properly.

Avoid:

* Infinite spinners
* Frozen buttons
* Duplicate submissions

---

# 25. ERROR HANDLING

Intentionally test failures where possible.

Examples:

* No internet
* Invalid input
* Empty input
* Failed request
* Duplicate submission
* Missing data
* Unexpected data

The user should receive understandable feedback.

Avoid technical messages such as:

```text
NullPointerException
Exception: ...
Stack trace
```

unless debugging mode is intentionally enabled.

---

# 26. EMPTY STATES

Check all major empty states.

Examples:

### Customer

```text
No posted jobs
No worker responses
```

### Worker

```text
No available jobs
No submitted responses
```

Empty screens must explain:

1. What is empty.
2. Why it might be empty.
3. What the user can do next.

---

# 27. ROLE SEPARATION

Verify that Customer and Worker experiences are not accidentally mixed.

### Customer should have:

* Customer Home
* Post Job
* Customer jobs
* Worker responses

### Worker should have:

* Work
* Available jobs
* Job details
* Worker response/bid
* Worker-side Post Job where implemented

Check for:

* Wrong buttons
* Wrong routes
* Wrong data
* Wrong permissions
* Wrong navigation

---

# 28. FORM AUDIT

For every important form verify:

### Required fields

```text
Empty → blocked
Filled → allowed
```

### Text

Test:

* Normal text
* Long text
* Numbers
* Special characters
* Zimbabwean names/locations

### Buttons

Check:

```text
Enabled
Disabled
Loading
Success
Error
```

---

# 29. REAL-WORLD ZIMBABWE TEST

Use realistic test data.

Example:

```text
Customer:
Tawanda M.

Job:
Fix leaking kitchen tap

Category:
Plumbing

Location:
Mbare, Harare

Description:
Kitchen tap is leaking and needs repair.

Budget:
$20

Date:
Tomorrow
```

Worker:

```text
Worker:
Blessing C.

Skill:
Plumber

Response:
I can come tomorrow morning.

Offer:
$18
```

The application should handle this naturally.

Also test realistic Zimbabwe locations such as:

* Harare
* Mbare
* Highfield
* Kuwadzana
* Chitungwiza
* Bulawayo
* Mutare

Do not hard-code these locations unless the existing product explicitly requires it.

---

# 30. SLOW PHONE / LOW DATA THINKING

Because GRAFT targets users who may use inexpensive Android devices and limited connectivity, inspect:

* Unnecessary large images
* Excessive animations
* Slow initial rendering
* Blocking operations
* Huge lists loaded at once
* Unnecessary network requests
* Repeated API/database calls
* Screens that remain blank while loading

The objective is not premature optimization.

Only fix obvious performance problems discovered during the audit.

---

# 31. UX FRICTION AUDIT

For every major flow ask:

> "If I have never used GRAFT before, would I know what to do next?"

Check:

* Button wording
* Screen titles
* Navigation
* Empty states
* Success messages
* Error messages
* Form instructions

Avoid technical language.

The app should communicate in simple user language.

---

# 32. SECURITY / DATA OWNERSHIP CHECK

Inspect whether the current implementation correctly associates data with users.

Verify:

```text
Customer A
≠
Customer B
```

and:

```text
Worker A
≠
Worker B
```

A user should not accidentally see another user's private information simply because the UI allows navigation.

Check:

* User IDs
* Job ownership
* Worker responses
* Customer jobs
* Role checks

Do not build a complete security architecture unless it already belongs to the current implementation scope.

Document serious security problems clearly.

---

# 33. COMPLETE END-TO-END TEST

Perform this exact scenario.

## CUSTOMER

```text
1. Open GRAFT
2. Enter Customer experience
3. Open Customer Home
4. Tap Post Job
5. Complete every step
6. Submit job
7. Verify Success
8. Verify job exists
```

## WORKER

```text
9. Switch to Worker
10. Open Work
11. Find the created job
12. Open job
13. Verify details
14. Respond/bid
15. Submit
16. Verify success
```

## CUSTOMER AGAIN

```text
17. Return to Customer
18. Open the posted job
19. Verify Worker response
20. Verify all information
21. Verify job state
```

## FINAL

```text
22. Restart application
23. Repeat relevant navigation
24. Verify data was not lost
```

This is the minimum end-to-end acceptance test.

---

# 34. BUG CLASSIFICATION

When a problem is found, classify it.

### P0 — BLOCKER

App cannot be used.

Examples:

* App crashes on startup.
* Customer cannot post jobs.
* Worker cannot access jobs.
* Core flow completely broken.

### P1 — CRITICAL

Core functionality is seriously broken.

Examples:

* Job is created but disappears.
* Worker cannot respond.
* Customer cannot see responses.
* Wrong user sees private data.

### P2 — NORMAL

Functionality works but has a meaningful problem.

Examples:

* Incorrect navigation.
* Broken validation.
* Incorrect state display.
* Missing error handling.

### P3 — POLISH

Minor UI/UX issue.

Examples:

* Spacing
* Copy
* Minor visual inconsistency

---

# 35. FIXING RULE

For every P0/P1/P2 issue:

1. Reproduce.
2. Find root cause.
3. Fix the smallest appropriate part.
4. Run analyzer/tests.
5. Re-run the affected flow.
6. Re-run the end-to-end flow if necessary.
7. Confirm no regression.

Do not perform large refactors just because the code could be cleaner.

---

# 36. REGRESSION CHECK

After fixes:

Run:

```text
flutter analyze
```

Then the project's tests/build commands.

Then repeat:

```text
Customer → Post Job → Success

Worker → Find Job → Details → Respond

Customer → View Response
```

The audit is NOT complete until the fixes have been retested.

---

# 37. FINAL AUDIT REPORT

At the end create a report using this structure:

```text
# GRAFT END-TO-END PRODUCT AUDIT

Date:
Commit:

## Overall Technical Status

Analyze:
Tests:
Build:
Runtime:

## CUSTOMER

Account/Role:
Home:
Post Job:
Validation:
Job Creation:
Posted Jobs:
Job Details:
Job State:
Worker Responses:
Worker Selection:

## WORKER

Account/Role:
Work:
Job Discovery:
Job Details:
Post Job:
Response/Bid:

## CROSS-ROLE

Customer → Worker:
Worker → Customer:
Data consistency:
State consistency:

## UX

Navigation:
Loading:
Errors:
Empty states:
Forms:
Mobile usability:
Performance:

## SECURITY / DATA OWNERSHIP

Status:

## ISSUES FOUND

### P0
- None / list

### P1
- None / list

### P2
- None / list

### P3
- None / list

## FIXES MADE

1.
2.
3.

## DEFERRED

Features intentionally not implemented because they belong to a future phase.

## FINAL ACCEPTANCE

Customer journey: PASS / FAIL
Worker journey: PASS / FAIL
Cross-role journey: PASS / FAIL
Data persistence: PASS / FAIL
Navigation: PASS / FAIL
Build: PASS / FAIL

## FINAL PRODUCT STATUS

READY FOR NEXT PHASE / NEEDS FIXES
```

---

# 38. IMPORTANT FINAL RULE

Do not judge GRAFT by whether every possible marketplace feature exists.

Judge it by:

> **Does the functionality that has already been defined actually work correctly from the perspective of a real Customer and a real Worker?**

If the answer is yes:

**Do not add unnecessary features.**

If the answer is no:

**Fix the product before moving forward.**

The objective of this audit is to make GRAFT's existing foundation reliable before expanding the product.
