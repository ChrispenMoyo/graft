
GRAFT — BATCH 3 RUNTIME REPAIR
============================================================
CRITICAL: POST JOB EXISTS IN CODE BUT IS NOT VISIBLE/REACHABLE
============================================================

You are repairing Batch 3 of the GRAFT project.

DO NOT start Batch 4.

DO NOT add new marketplace functionality.

The purpose of this task is to make the already-implemented Batch 3 functionality ACTUALLY VISIBLE, REACHABLE, AND USABLE in the running Android application.

============================================================
1. CURRENT PROBLEM
============================================================

Batch 3 was reported as implemented with:

- Job model
- JobDraft
- JobRepository
- InMemoryJobDataSource
- PostJobCategoryScreen
- PostJobDetailsScreen
- PostJobPhotosScreen
- PostJobLocationScreen
- PostJobDateTimeScreen
- PostJobBudgetScreen
- PostJobReviewScreen
- PostJobSuccessScreen
- CustomerJobsScreen
- CustomerJobDetailScreen
- PostJobFlow
- AppRouter routes

However, when the application is run on a physical Android phone, the Customer Home screen does NOT show a usable "Post a Job" entry point.

Therefore Batch 3 is NOT considered complete.

This is a runtime integration problem.

The feature may exist in the codebase, but if the customer cannot see and use it on the phone, it is not implemented from the user's perspective.

============================================================
2. IMPORTANT RULE
============================================================

Do NOT assume that because:

- a screen exists
- a route exists
- a model exists
- a repository exists
- the project compiles

that the feature is complete.

The actual user journey is the acceptance test.

The customer must physically be able to discover and use Post a Job from Customer Home.

============================================================
3. FIRST: INSPECT THE EXISTING CODE
============================================================

Before changing anything, inspect the current repository.

Inspect:

lib/features/customer_home/
lib/features/jobs/
lib/core/
lib/app.dart
lib/routes/
lib/models/
pubspec.yaml

Also inspect the actual current implementations of:

- CustomerHomeScreen
- AppRouter
- PostJobFlow
- JobRepository
- JobDraft
- CustomerJobsScreen
- CustomerJobDetailScreen

DO NOT immediately create new files.

First determine what Batch 3 already implemented.

Reuse the existing implementation wherever possible.

Do not create duplicate:

- Job models
- Job repositories
- Post Job flows
- routes
- Customer Home screens
- state managers

============================================================
4. VERIFY THE ACTUAL RUNTIME CUSTOMER FLOW
============================================================

Trace the application from the beginning:

Welcome
   ↓
Get Started
   ↓
Phone
   ↓
Role Selection
   ↓
Customer
   ↓
Customer Home

Determine exactly which widget/file is actually being rendered as Customer Home at runtime.

Do not assume the file name.

Answer through code inspection:

1. Which Customer Home widget is actually registered?
2. Which route loads it?
3. Does that screen contain a Post a Job action?
4. If it does, is it visible?
5. If it does, what route does it navigate to?
6. Does that route actually exist?
7. Does it open the existing PostJobFlow?
8. Does PostJobCategoryScreen render?
9. Can the complete flow continue from there?

============================================================
5. FIX CUSTOMER HOME
============================================================

Customer Home MUST have an obvious primary action:

POST A JOB

The action must be visible directly on Customer Home.

The customer must NOT have to:

- open a hidden menu
- guess a route
- use a developer-only action
- navigate through an unrelated screen

The customer should immediately understand:

"This is where I post something I need done."

Use the existing GRAFT design system.

Do NOT redesign the entire Customer Home.

Do NOT remove existing Customer Home functionality unnecessarily.

============================================================
6. POST A JOB CTA
============================================================

Add or repair a prominent action similar in purpose to:

"What do you need done?"

[ POST A JOB ]

The exact visual design should match the existing GRAFT UI.

The important requirements are:

- VISIBLE
- OBVIOUS
- TAPPABLE
- FUNCTIONAL

Use:

Primary Green:
#319400

Use existing design tokens.

Use existing GRAFT logo and typography.

============================================================
7. CONNECT THE CTA TO THE EXISTING FLOW
============================================================

The Post a Job button must open the EXISTING Batch 3 flow.

Do NOT create a second Post Job implementation.

Use the existing:

PostJobFlow

and:

PostJobCategoryScreen

The required runtime path is:

Customer Home
      ↓
POST A JOB
      ↓
PostJobCategoryScreen

If the existing architecture uses a different entry screen, use the correct existing entry point.

============================================================
8. VERIFY EVERY POST JOB STEP
============================================================

Trace and test the entire existing Batch 3 flow:

Customer Home
      ↓
Post a Job
      ↓
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
      ↓
Publish
      ↓
Success
      ↓
View Job

Do not stop after confirming that the first screen opens.

Every transition must work.

A route existing in AppRouter is NOT proof that navigation works.

Actually trigger each transition through the UI.

============================================================
9. CHECK FOR THE LIKELY ROOT CAUSES
============================================================

Specifically investigate:

A. Missing CTA

Customer Home does not contain Post a Job.

B. Wrong route

The CTA exists but navigates to a nonexistent or incorrect route.

C. Wrong router

The route exists in AppRouter but Customer Home uses another navigation mechanism.

D. Wrong Customer Home

Batch 3 modified one Customer Home implementation while the application actually renders another.

E. Duplicate Customer Home

There are multiple Customer Home implementations and the wrong one is registered.

F. Dead code

Batch 3 screens exist but are never referenced by the actual application.

G. PostJobFlow initialization problem

The flow exists but cannot start correctly.

H. Repository problem

Job creation appears successful but does not update Customer Jobs.

I. State problem

Information disappears between Post Job steps.

Fix the actual root cause rather than patching symptoms.

============================================================
10. SEARCH THE ENTIRE PROJECT
============================================================

Search for all references to:

/customer/home

CustomerHomeScreen

PostJob

PostJobFlow

PostJobCategoryScreen

CustomerJobsScreen

CustomerJobDetailScreen

JobRepository

JobDraft

JobStatus

PricingPreference

Identify:

- every definition
- every import
- every route
- every navigation call
- every duplicate
- every unused implementation

Consolidate duplicates where appropriate.

Do not leave competing implementations.

============================================================
11. DO NOT BREAK BATCH 2
============================================================

The existing verified flow MUST remain:

Welcome
   ↓
Get Started
   ↓
Phone
   ↓
Role Selection
   ├── Customer → Customer Home
   └── Worker → Worker Home

Do NOT:

- reintroduce the old bypass buttons
- remove role selection
- break Customer Home
- break Worker Home
- change authentication unnecessarily
- redesign onboarding unnecessarily

============================================================
12. TEST THE CUSTOMER POSTING FLOW
============================================================

Use this exact test data.

CATEGORY:

Plumbing

TITLE:

Fix leaking kitchen tap

DESCRIPTION:

The kitchen tap has been leaking since yesterday and needs to be repaired.

PHOTO:

Skip if necessary.

LOCATION:

Use a valid approximate location/area.

DATE:

Choose a valid future date.

TIME:

Choose a valid preferred time.

BUDGET:

Use a valid budget/pricing preference.

Then complete:

Review
   ↓
Post Job
   ↓
Success
   ↓
View Job

============================================================
13. VERIFY THE CREATED JOB
============================================================

After publishing, the Job Detail screen must display the actual information entered:

- Title
- Category
- Description
- Photos if provided
- Location
- Preferred date
- Preferred time
- Budget
- Pricing preference
- Status
- Created date

Do NOT show a hard-coded fake job.

The displayed job must come from the actual created Job object/repository.

============================================================
14. VERIFY CUSTOMER JOBS
============================================================

After posting:

Return to Customer Jobs / Recent Jobs.

The newly created job must appear.

Verify that the job contains:

- Correct title
- Correct category
- Correct status
- Correct ownership
- Correct information

============================================================
15. TEST A SECOND JOB
============================================================

Create another job:

CATEGORY:

Gardening

TITLE:

Cut overgrown grass

DESCRIPTION:

The grass around the house has become overgrown and needs cutting.

Verify that BOTH jobs exist independently.

This is important.

Do not allow the second job to overwrite the first.

Do not use a singleton/static job object incorrectly.

============================================================
16. VALIDATION TESTING
============================================================

Test invalid submissions.

Missing category:

→ Must not publish.

Empty title:

→ Must show validation.

Empty description:

→ Must show validation.

Invalid budget:

→ Must show clear validation.

Missing required location:

→ Must behave according to the existing MVP requirements.

The application must not crash.

Validation messages must be user-friendly.

============================================================
17. LOADING STATE
============================================================

Use the existing Batch 2 LoadingState.

When publishing:

Show an appropriate loading state, such as:

"Posting your job..."

Prevent duplicate submissions while publishing.

Do not allow the user to accidentally post the same job multiple times.

============================================================
18. ERROR HANDLING
============================================================

Use the existing GRAFT ErrorState/Snackbar components where appropriate.

If publishing fails:

- Do NOT show success.
- Do NOT falsely claim the job was posted.
- Do NOT unnecessarily erase the user's entered information.
- Show a clear error.
- Allow retry.

Example:

"We couldn't post your job."

"Your information is still here."

[ TRY AGAIN ]

Do not expose stack traces to the user.

============================================================
19. OFFLINE HANDLING
============================================================

GRAFT must account for unreliable connectivity.

If the job cannot be published because the application is offline:

- Clearly tell the user.
- Do not show false success.
- Preserve the draft where practical.
- Allow retry when connectivity returns.

============================================================
20. DESIGN REQUIREMENTS
============================================================

Keep the existing GRAFT design system.

Primary:

#319400

Supporting Zimbabwean-inspired colours:

#D40000
#FFD200

Young Serif remains the GRAFT brand/display font.

Use the existing GRAFT logo.

Use existing design tokens.

Do NOT introduce:

- random colours
- random fonts
- a second design system
- unnecessary gradients
- excessive shadows
- unnecessary animations

============================================================
21. MOBILE REQUIREMENTS
============================================================

The application is primarily designed for Android phones.

Verify the Post Job CTA and flow on a real phone.

Pay particular attention to:

- small screens
- keyboard visibility
- touch targets
- text overflow
- form scrolling
- button visibility
- slow devices
- unreliable connectivity

The user must always be able to find the next action.

============================================================
22. RUNTIME VERIFICATION IS MANDATORY
============================================================

Run:

flutter doctor
flutter devices
flutter analyze
flutter test

Then run:

flutter run

on the physical Android device.

If a command cannot be executed, report exactly why.

DO NOT claim that runtime verification passed if you did not actually run the application.

============================================================
23. PHYSICAL DEVICE ACCEPTANCE TEST
============================================================

Perform this exact journey on the physical phone:

Launch GRAFT
   ↓
Get Started
   ↓
Enter phone
   ↓
Select Customer
   ↓
Customer Home

STOP HERE AND VISUALLY VERIFY:

"POST A JOB"

must be visible.

Then:

Tap POST A JOB
   ↓
Category appears
   ↓
Select Plumbing
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
   ↓
Post Job
   ↓
Success
   ↓
View Job

Verify that the created job contains the information entered.

Then:

Return to Customer Jobs
   ↓
Verify created job appears

Then create the second Gardening job.

Verify both jobs appear.

============================================================
24. VISUAL QA
============================================================

On the physical phone verify:

- Post a Job CTA is clearly visible.
- CTA is not hidden below a broken layout.
- CTA is tappable.
- CTA opens the correct screen.
- No overflow occurs.
- No missing widgets.
- No missing assets.
- Keyboard does not cover critical controls.
- GRAFT logo remains correct.
- Young Serif remains correct.
- Primary green remains #319400.
- Existing Customer Home still looks coherent.

============================================================
25. DATABASE / PERSISTENCE BOUNDARY
============================================================

Do NOT introduce a production database in this repair unless one already exists in the project.

Do NOT replace the existing Batch 3 repository architecture unnecessarily.

The important requirement is that:

UI
 ↓
State
 ↓
JobRepository
 ↓
DataSource

works correctly.

If Batch 3 currently uses InMemoryJobDataSource, verify that it actually stores and retrieves multiple jobs correctly during the current application session.

Do NOT pretend an in-memory repository is a production database.

Do NOT add Firebase, Supabase, PostgreSQL or another backend during this repair unless the repository already uses one.

The production backend/database will be handled deliberately in a later architecture step.

============================================================
26. CODE QUALITY
============================================================

Before finishing:

Run formatting.

Remove:

- unused imports
- dead code
- debug prints
- duplicate models
- duplicate routes
- duplicate Customer Home implementations
- temporary fake UI
- hard-coded job data
- unnecessary dependencies

Keep the architecture consistent with Batch 1 and Batch 2.

============================================================
27. FINAL ACCEPTANCE CRITERIA
============================================================

Batch 3 Runtime Repair PASSES only if ALL of these are true:

CUSTOMER HOME

[ ] Customer Home displays a visible "Post a Job" action.

[ ] The action is obvious.

[ ] The action is tappable.

[ ] The action opens the existing Batch 3 Post Job flow.

POST JOB FLOW

[ ] Category screen works.

[ ] Details screen works.

[ ] Photos screen works.

[ ] Location screen works.

[ ] Date/Time screen works.

[ ] Budget screen works.

[ ] Review screen works.

[ ] Publish works.

[ ] Success screen works.

DATA

[ ] Created job has a unique ID.

[ ] Created job has customer ownership.

[ ] Created job contains the entered information.

[ ] Multiple jobs can exist.

[ ] Customer can view their jobs.

[ ] Customer can view job details.

VALIDATION

[ ] Required fields validate.

[ ] Invalid input does not crash the application.

ERRORS

[ ] Failed publishing does not show false success.

[ ] Retry works where appropriate.

[ ] Form information is preserved where practical.

BATCH 2

[ ] Welcome works.

[ ] Get Started works.

[ ] Phone flow works.

[ ] Role selection works.

[ ] Customer Home works.

[ ] Worker Home works.

[ ] GRAFT logo remains visible where previously implemented.

[ ] Young Serif remains configured.

[ ] Primary green remains #319400.

RUNTIME

[ ] Physical Android test completed.

[ ] Post Job CTA physically visible.

[ ] Full posting flow physically completed.

[ ] First job successfully created.

[ ] Second job successfully created.

[ ] Both jobs visible independently.

============================================================
28. FINAL REPORT
============================================================

Return exactly one status:

BATCH 3 RUNTIME REPAIR: PASSED

OR

BATCH 3 RUNTIME REPAIR: PARTIAL

OR

BATCH 3 RUNTIME REPAIR: BLOCKED

Do NOT report PASSED unless the physical runtime flow was actually tested.

Then provide:

1. ROOT CAUSE

Explain exactly why the Post Job feature was not visible/reachable.

2. CHANGES MADE

List the files modified and what was fixed.

3. NAVIGATION VERIFIED

Show:

Customer Home
→ Post Job
→ Category
→ Details
→ Photos
→ Location
→ Date/Time
→ Budget
→ Review
→ Success
→ Job Detail

4. TESTS ACTUALLY RUN

Report actual results for:

flutter doctor
flutter devices
flutter analyze
flutter test
flutter run

5. PHYSICAL DEVICE TEST

Report:

Post Job CTA visible: PASS/FAIL
Post Job navigation: PASS/FAIL
Full posting flow: PASS/FAIL
Job creation: PASS/FAIL
Job persistence: PASS/FAIL
Second job: PASS/FAIL
Customer job list: PASS/FAIL
Validation: PASS/FAIL
Error handling: PASS/FAIL

6. KNOWN LIMITATIONS

List only real limitations.

7. EXPLICITLY NOT IMPLEMENTED

Confirm that Batch 4 functionality has NOT been implemented.

============================================================
FINAL RULE
============================================================

DO NOT start Batch 4.

DO NOT add maps.

DO NOT add worker nearby jobs.

DO NOT add bidding.

DO NOT add KYC.

DO NOT add EcoCash.

DO NOT add payments.

DO NOT add ratings.

DO NOT add notifications.

DO NOT add chat.

ONLY repair Batch 3 so that the customer can actually see and use:

Customer Home
→ POST A JOB
→ Complete Job Form
→ Review
→ Publish
→ View Created Job

The feature is NOT complete until this exact journey works on the physical Android device.
```
