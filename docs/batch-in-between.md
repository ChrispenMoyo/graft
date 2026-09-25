GRAFT — BATCH 3.1
============================================================
NAVIGATION + RESPONSIVE HOME SCREENS + BOTTOM NAVIGATION
============================================================

IMPORTANT:

Batch 3 has now been successfully repaired and verified.

DO NOT start Batch 4.

DO NOT implement maps.

DO NOT implement nearby jobs.

DO NOT implement PostgreSQL yet.

This task is a focused Batch 3.1 refinement to make the current MVP feel like a real mobile application before we proceed to backend integration and Batch 4.

The goal is:

1. Make all relevant screens navigable BACK AND FORTH.
2. Make Customer Home fully scrollable and responsive.
3. Make Worker Home fully scrollable and responsive.
4. Add a proper 4-item bottom navigation bar to both home experiences.
5. Make the navigation architecture ready for future batches.
6. Do not break anything already verified in Batch 2 or Batch 3.

============================================================
1. CURRENT VERIFIED STATE
============================================================

Batch 3 currently works:

Welcome
   ↓
Get Started
   ↓
Phone/Login
   ↓
Role Selection
   ↓
Customer Home / Worker Home

Customer:

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
Success
   ↓
Job Detail

The following were already implemented and verified:

- Job model
- JobDraft
- JobRepository
- InMemoryJobDataSource
- Post Job flow
- Customer Jobs
- Customer Job Detail
- SessionManager
- Customer Home Post Job CTA
- Customer/Worker role routing
- GRAFT logo
- Young Serif
- Primary green #319400

DO NOT rebuild these features.

Improve their navigation and presentation only where required.

============================================================
2. MAIN OBJECTIVE
============================================================

Turn the current screens into a coherent mobile application shell.

The user should be able to navigate naturally:

FORWARD
AND
BACKWARD

without getting trapped in screens or unexpectedly losing their state.

The app should feel like one connected application rather than a collection of independent screens.

============================================================
3. POST JOB BACK/FORWARD NAVIGATION
============================================================

The Post Job flow must support normal Android navigation.

Required:

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
Success

The user must be able to go BACK:

Review
   ↓
Budget
   ↓
Date/Time
   ↓
Location
   ↓
Photos
   ↓
Details
   ↓
Category

without losing previously entered information.

IMPORTANT:

Going backwards MUST preserve the current JobDraft.

Example:

User enters:

Title:
Fix leaking kitchen tap

Description:
The kitchen tap has been leaking.

Then goes:

Details
→ Photos
→ Location
→ Date/Time
→ Budget

If the user presses Back to Details:

The title and description MUST still be there.

Do not reset the JobDraft unnecessarily.

============================================================
4. ANDROID BACK BUTTON
============================================================

Handle the Android physical/system Back button correctly.

For every Post Job screen:

- If there is a previous Post Job step, return to that step.
- Preserve JobDraft state.
- Do not unexpectedly exit the application.
- Do not restart the flow.

Example:

Budget
   ← Android Back
Date/Time

Date/Time
   ← Android Back
Location

Location
   ← Android Back
Photos

============================================================
5. APP BAR BACK BUTTON
============================================================

Every Post Job step that requires navigation backwards should have a clear AppBar back button.

The user should not need to rely only on the Android system Back button.

Example:

<  Post Job
   Step 4 of 6

The exact visual implementation should follow the existing GRAFT design system.

============================================================
6. DO NOT ALLOW BROKEN NAVIGATION STACKS
============================================================

Inspect the current use of:

- push
- pushReplacement
- pushNamed
- pushReplacementNamed
- pop
- popAndPushNamed
- onGenerateRoute

Avoid unnecessary pushReplacement inside multi-step forms.

IMPORTANT:

The Post Job steps should behave like a normal stack.

Prefer:

Category
  push → Details
  push → Photos
  push → Location
  push → Date/Time
  push → Budget
  push → Review

Then Back naturally returns to the previous step.

Do not replace the previous screen unless there is a deliberate reason.

============================================================
7. SUCCESS SCREEN NAVIGATION
============================================================

After a successful job post:

Post Job
   ↓
Success

The Success screen should provide clear actions such as:

[ View Job ]

and:

[ Back to Home ]

or equivalent existing actions.

IMPORTANT:

Do not allow the user to accidentally go back into the completed Post Job form and submit the same job again.

After successful publishing, the navigation stack should be handled deliberately.

The user must be able to:

Success
   ↓
View Job
   ↓
Job Detail

OR:

Success
   ↓
Customer Home

without creating a confusing navigation stack.

============================================================
8. CUSTOMER HOME
============================================================

Make Customer Home fully scrollable.

The entire body should work correctly on:

- small Android phones
- large Android phones
- different aspect ratios
- portrait orientation

Use:

SingleChildScrollView

or:

CustomScrollView

or another appropriate responsive Flutter approach.

Do not create overflow errors.

The following content should be able to scroll:

- GRAFT branding/header
- Greeting
- Main "What do you need done?" section
- Post a Job CTA
- Popular categories
- Recent jobs
- Active jobs
- Empty states
- Other existing Customer Home content

Do not unnecessarily redesign the information architecture.

============================================================
9. CUSTOMER HOME RESPONSIVENESS
============================================================

The Customer Home must adapt to different screen widths.

Avoid:

- fixed-width layouts
- oversized hard-coded containers
- hard-coded heights that cause clipping
- horizontal overflow
- text overflow
- buttons extending beyond screen edges

Use:

- SafeArea
- Expanded/Flexible where appropriate
- responsive padding
- constraints
- Wrap where appropriate
- ListView/SliverList where appropriate

Maintain comfortable touch targets.

============================================================
10. CUSTOMER HOME PRIMARY ACTION
============================================================

The existing:

POST A JOB

action must remain highly visible.

It must continue to navigate to:

PostJobFlow

Do not remove or hide it because bottom navigation is being introduced.

The user should have TWO obvious ways to access job posting if appropriate:

1. Primary CTA on Home
2. Appropriate bottom navigation action

Avoid unnecessary duplication if it harms the UX.

============================================================
11. CUSTOMER BOTTOM NAVIGATION
============================================================

Add a persistent 4-item bottom navigation bar to the Customer application shell.

For now use:

1. Home
2. Jobs
3. Post
4. Profile

Conceptually:

┌─────────────────────────────────────┐
│                                     │
│           CURRENT SCREEN            │
│                                     │
├─────────────────────────────────────┤
│  Home   Jobs    Post    Profile     │
└─────────────────────────────────────┘

Use appropriate existing Material/Lucide-style icons already supported by the project.

Suggested meanings:

Home
→ Customer Home

Jobs
→ Customer Jobs

Post
→ Post a Job

Profile
→ Placeholder/Profile screen for now

IMPORTANT:

Do NOT build a complete Profile system.

For now, Profile can be a simple placeholder screen using the GRAFT design system.

The navigation architecture must make it easy to replace the placeholder later.

============================================================
12. WORKER BOTTOM NAVIGATION
============================================================

Add a persistent 4-item bottom navigation bar to Worker Home.

Use:

1. Home
2. Jobs
3. Work
4. Profile

Conceptually:

┌─────────────────────────────────────┐
│                                     │
│           CURRENT SCREEN            │
│                                     │
├─────────────────────────────────────┤
│  Home   Jobs    Work    Profile     │
└─────────────────────────────────────┘

Suggested meanings:

Home
→ Worker Home

Jobs
→ Nearby/available jobs placeholder for now

Work
→ Active work placeholder for now

Profile
→ Worker profile placeholder for now

IMPORTANT:

Do NOT implement Batch 4 nearby jobs.

Do NOT implement maps.

The Jobs screen can be a clearly marked placeholder if the functionality belongs to Batch 4.

============================================================
13. NAVIGATION BAR ARCHITECTURE
============================================================

Do NOT duplicate BottomNavigationBar code unnecessarily between Customer and Worker.

Create a reusable application navigation component if appropriate.

For example:

GraftBottomNavigation

or an equivalent clean architecture.

The component should support:

- selected index
- navigation destinations
- role-specific destinations
- future expansion

Avoid creating two completely separate implementations containing duplicated code.

============================================================
14. IMPORTANT — POST BUTTON BEHAVIOUR
============================================================

Customer:

Bottom navigation:

Home
Jobs
Post
Profile

When the user taps:

Post

open the EXISTING PostJobFlow.

Do not create a second posting flow.

Do not duplicate JobDraft.

Do not create another repository.

============================================================
15. CUSTOMER JOBS NAVIGATION
============================================================

Customer:

Bottom navigation:

Jobs

must open:

CustomerJobsScreen

The existing jobs screen must remain functional.

From CustomerJobsScreen:

Tap a job
   ↓
CustomerJobDetailScreen

Back:

CustomerJobDetailScreen
   ↓
CustomerJobsScreen

The user must NOT be unexpectedly returned to Welcome or Role Selection.

============================================================
16. WORKER HOME
============================================================

Make Worker Home fully scrollable.

It should support:

- header/branding
- availability toggle
- nearby jobs section
- active work section
- empty states
- JobCard components
- other existing Worker Home content

Do not implement nearby-job matching yet.

Do not implement map functionality yet.

The existing UI should remain visually coherent.

============================================================
17. WORKER HOME RESPONSIVENESS
============================================================

Worker Home must work correctly on:

- small phones
- large phones
- different aspect ratios

Avoid:

- overflow
- clipped cards
- fixed-width layouts
- fixed-height content
- text overflow
- buttons outside the viewport

Use responsive Flutter layouts.

============================================================
18. SCROLL + BOTTOM NAVIGATION
============================================================

The bottom navigation bar must remain visible while the main content scrolls.

Correct structure should conceptually be:

Scaffold
   ├── AppBar
   ├── Body
   │     └── Scrollable content
   └── BottomNavigationBar

Do NOT put the bottom navigation bar inside the scrolling body.

The navigation bar should remain fixed at the bottom.

============================================================
19. KEYBOARD BEHAVIOUR
============================================================

Check screens containing forms.

The keyboard must not permanently hide:

- text fields
- Next buttons
- Continue buttons
- navigation controls

Forms should scroll when necessary.

The Post Job flow must remain usable on smaller phones.

============================================================
20. RESPONSIVE DESIGN
============================================================

Use Flutter responsive layout best practices.

The MVP must work on common Android phone widths.

Do not design only for the developer's current phone.

Check:

- narrow screen
- normal screen
- larger screen

Avoid relying on:

MediaQuery values for rigid fixed positioning.

Prefer:

- Expanded
- Flexible
- Wrap
- LayoutBuilder
- constraints
- scrollable layouts
- SafeArea

where appropriate.

============================================================
21. GRAFT BRANDING
============================================================

Keep the existing GRAFT brand.

Font:

Young Serif

Primary green:

#319400

Supporting Zimbabwean flag-inspired colours:

Red:
#D40000

Yellow:
#FFD200

Continue using the existing design token system.

Do not introduce another typography system.

Do not introduce another primary colour.

The GRAFT logo must remain the existing:

G + location-pin blended icon

implementation.

============================================================
22. APP SHELL
============================================================

Create a clean application shell architecture.

Conceptually:

GraftApp
   ↓
Role
   ├── CustomerShell
   │      ├── Home
   │      ├── Jobs
   │      ├── Post
   │      └── Profile
   │
   └── WorkerShell
          ├── Home
          ├── Jobs
          ├── Work
          └── Profile

Do not over-engineer this.

The purpose is simply to establish a clean foundation for future batches.

============================================================
23. DO NOT IMPLEMENT FUTURE FEATURES
============================================================

Explicitly DO NOT implement:

- PostgreSQL
- Supabase
- Firebase backend
- Mapbox
- Google Maps
- OpenStreetMap integration
- nearby-job matching
- distance calculations
- worker bidding
- customer bid comparison
- KYC
- EcoCash integration
- payments
- ratings
- reviews
- chat
- notifications
- real-time tracking

Those belong to later batches.

============================================================
24. PROFILE PLACEHOLDER
============================================================

Create only a lightweight placeholder if required by the navigation bar.

Customer:

Profile

Worker:

Profile

The placeholder should:

- use GRAFT branding
- display a simple title
- clearly indicate the section is coming later
- not contain fake functionality

Example:

Profile

"Profile and account settings will be available in a later GRAFT release."

Do not build the actual profile system.

============================================================
25. JOBS / WORK PLACEHOLDERS
============================================================

For Worker:

Jobs

may temporarily show:

"Nearby jobs will appear here."

This is NOT Batch 4 implementation.

For Worker:

Work

may temporarily show:

"Your active work will appear here."

Use the existing EmptyState component where appropriate.

Do not fabricate data.

============================================================
26. NAVIGATION STATE
============================================================

Switching between bottom navigation destinations should NOT unnecessarily restart the entire application.

For example:

Customer:

Home
→ Jobs
→ Home

must keep the application session intact.

Do not send the user back to:

Welcome

or:

Role Selection

when switching tabs.

The active bottom navigation index must correctly reflect the current destination.

============================================================
27. BACK BUTTON WITH BOTTOM NAVIGATION
============================================================

Define sensible Android Back behaviour.

Example:

Customer:

Home
→ Jobs
→ Job Detail

Android Back:

Job Detail
→ Jobs

Android Back:

Jobs
→ Home

Do NOT exit the application immediately if there is a sensible navigation destination.

For modal/secondary flows, normal Flutter navigation should still apply.

============================================================
28. PRESERVE SESSION
============================================================

Do not break:

SessionManager

The current customer/worker session must remain available while navigating between:

- Home
- Jobs
- Post
- Profile

The user's role must not change accidentally.

============================================================
29. CODE QUALITY
============================================================

Run formatting.

Remove:

- unused imports
- dead navigation code
- TODO navigation comments
- duplicate navigation logic
- duplicate bottom navigation implementations
- debug prints
- unnecessary dependencies

Keep the architecture consistent with the existing project.

============================================================
30. TESTING
============================================================

Run:

flutter doctor

flutter devices

flutter analyze

flutter test

Then:

flutter run

on the physical Android device.

Do not claim runtime success if the physical device was not tested.

============================================================
31. PHYSICAL DEVICE TEST — CUSTOMER
============================================================

Perform:

Launch GRAFT
   ↓
Get Started
   ↓
Phone/Login
   ↓
Customer
   ↓
Customer Home

Verify:

- Home is visible.
- Home scrolls.
- No overflow occurs.
- Post a Job is visible.
- Bottom navigation is visible.
- Exactly 4 navigation destinations are present.

Test:

Home
→ Jobs
→ Home
→ Profile
→ Home

Then:

Home
→ Post

Verify the existing Post Job flow opens.

Complete:

Category
→ Details
→ Photos
→ Location
→ Date/Time
→ Budget
→ Review

Press Back several times.

Verify entered data remains.

Return forward.

Complete the job posting flow.

============================================================
32. PHYSICAL DEVICE TEST — WORKER
============================================================

Return to role selection or start a Worker session.

Verify:

Worker Home

contains:

- scrollable content
- availability toggle
- existing sections
- no overflow
- GRAFT logo
- 4-item bottom navigation

Test:

Home
→ Jobs
→ Home
→ Work
→ Home
→ Profile
→ Home

Verify the application does not lose the worker session.

============================================================
33. SMALL SCREEN TEST
============================================================

If possible, test using the smallest available Android device/emulator.

Verify:

- no RenderFlex overflow
- no clipped content
- no buttons outside viewport
- no navigation bar overlap
- no keyboard overlap
- no horizontal scrolling unless intentionally designed

============================================================
34. ACCEPTANCE CRITERIA
============================================================

Batch 3.1 PASSES only if:

NAVIGATION

[ ] Customer can navigate Home → Jobs → Home.

[ ] Customer can navigate Home → Profile → Home.

[ ] Customer can navigate Home → Post.

[ ] Worker can navigate Home → Jobs → Home.

[ ] Worker can navigate Home → Work → Home.

[ ] Worker can navigate Home → Profile → Home.

[ ] Android Back behaves correctly.

[ ] AppBar Back buttons work where appropriate.

POST JOB

[ ] Existing Post Job flow still works.

[ ] User can move forward through all steps.

[ ] User can move backward through all steps.

[ ] JobDraft information is preserved when going backward.

[ ] Android system Back works correctly.

[ ] Successful posting still works.

[ ] Customer Jobs still works.

[ ] Customer Job Detail still works.

CUSTOMER HOME

[ ] Scrollable.

[ ] Responsive.

[ ] No overflow.

[ ] Post a Job CTA remains visible.

[ ] 4-item bottom navigation exists.

WORKER HOME

[ ] Scrollable.

[ ] Responsive.

[ ] No overflow.

[ ] 4-item bottom navigation exists.

BRANDING

[ ] Young Serif remains correct.

[ ] Primary green remains #319400.

[ ] GRAFT logo remains correct.

[ ] Existing design tokens remain in use.

QUALITY

[ ] No unnecessary duplicate navigation systems.

[ ] No TODO navigation remains.

[ ] flutter analyze passes.

[ ] flutter test passes, or any existing test failures are explicitly reported.

[ ] Physical Android runtime verified.

============================================================
35. IMPORTANT BATCH BOUNDARY
============================================================

This is BATCH 3.1.

DO NOT call this Batch 4.

Batch 4 will be:

============================================================
BATCH 4 — NEARBY JOBS + PROXIMITY + MAP
============================================================

Batch 4 will introduce:

- nearby jobs
- location-based discovery
- distance/proximity
- map integration
- worker nearby job discovery
- map/list experience

Do NOT implement those features now.

============================================================
36. DATABASE BOUNDARY
============================================================

Do NOT implement PostgreSQL in this task.

The next deliberate architecture step after this navigation/UI repair will be:

BACKEND + POSTGRESQL INTEGRATION

The current InMemoryJobDataSource may remain temporarily.

Do not pretend it is a production database.

Do not add a database merely to make the navigation work.

============================================================
37. FINAL REPORT
============================================================

Return:

# BATCH 3.1 STATUS

Use exactly one:

BATCH 3.1: PASSED

BATCH 3.1: PARTIAL

BATCH 3.1: BLOCKED

Do NOT report PASSED unless the physical application was tested.

Then provide:

## 1. Navigation Changes

List the navigation architecture created/modified.

## 2. Customer Navigation

Show:

Home
→ Jobs
→ Home
→ Post
→ Home
→ Profile
→ Home

## 3. Worker Navigation

Show:

Home
→ Jobs
→ Home
→ Work
→ Home
→ Profile
→ Home

## 4. Post Job Back/Forward Test

Show:

Category
→ Details
→ Photos
→ Location
→ Date/Time
→ Budget
→ Review

and:

Review
→ Budget
→ Date/Time
→ Location
→ Photos
→ Details

Confirm whether JobDraft data was preserved.

## 5. Responsive UI Test

Report:

Customer Home scrolling: PASS/FAIL

Worker Home scrolling: PASS/FAIL

Small-screen layout: PASS/FAIL

Overflow check: PASS/FAIL

Keyboard/form layout: PASS/FAIL

## 6. Bottom Navigation

Customer:

Home | Jobs | Post | Profile

Worker:

Home | Jobs | Work | Profile

Report whether each destination works.

## 7. Tests Actually Run

flutter doctor: PASS/FAIL

flutter devices: PASS/FAIL

flutter analyze: PASS/FAIL

flutter test: PASS/FAIL

flutter run: PASS/FAIL

Physical Android test: PASS/FAIL

## 8. Files Changed

List every modified/created file.

## 9. Known Limitations

List only real limitations.

## 10. Explicitly NOT Implemented

Confirm:

- PostgreSQL
- Maps
- Nearby Jobs
- Proximity
- Bidding
- Payments
- KYC
- Notifications
- Chat

have NOT been implemented.

============================================================
FINAL RULE
============================================================

Make the current GRAFT MVP feel like a coherent mobile application.

Do not chase new features.

Fix navigation.

Fix scrolling.

Fix responsiveness.

Establish the 4-item navigation shell.

Preserve the existing working Batch 3 Job Posting functionality.

Then STOP.

Do not start Batch 4.