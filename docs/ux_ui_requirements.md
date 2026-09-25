# UX/UI Requirements Document

## GRAFT --- Zimbabwe Local Jobs Marketplace

**Document:** `UX_UI_REQUIREMENTS.md`\
**Version:** 1.0\
**Status:** Product Foundation / Phase 1\
**Product Type:** Zimbabwe-focused two-sided local services marketplace\
**Primary Platforms:** Mobile App + Web App\
**Primary Mobile Technology:** Flutter / Dart\
**Primary Web Technology:** React + Next.js\
**Primary Payment Rail:** EcoCash\
**Primary Market:** Zimbabwe

------------------------------------------------------------------------

# 1. Document Purpose

This document defines the user-experience and user-interface
requirements for GRAFT.

It translates the GRAFT Business Requirements and User Flows into
practical UX/UI rules that should guide:

-   Information architecture
-   Screen design
-   Navigation
-   Interaction patterns
-   Visual hierarchy
-   Forms
-   Maps
-   Job cards
-   Worker profiles
-   Bidding interfaces
-   Trust indicators
-   Payment states
-   Notifications
-   Error states
-   Empty states
-   Loading states
-   Offline states
-   Accessibility
-   Responsive web behaviour
-   Flutter implementation
-   React/Next.js implementation
-   Product QA

The goal is not simply to make GRAFT "look nice."

The interface must make the core marketplace transaction:

> **Post a job → find trusted nearby workers → compare bids → choose a
> worker → complete the job → complete payment**

feel simple, trustworthy, fast and understandable.

------------------------------------------------------------------------

# 2. Source of Truth

This document is grounded in the established GRAFT product requirements
and user-flow definitions.

The Business Requirements establish:

-   Zimbabwe as the initial market.
-   Customers and local workers as the two marketplace sides.
-   Customer-posted jobs.
-   Worker bidding.
-   Matching based on skills, distance, availability, trust and quality.
-   Maps as a core capability.
-   EcoCash as the initial payment rail.
-   Strong KYC.
-   Mobile as the priority platform.
-   Web as a required platform.
-   Low-bandwidth operation as a core requirement.
-   Ratings for both sides.
-   An administrative platform.
-   AI as a future capability rather than an MVP dependency.

The User Flows establish the intended journeys for:

-   Customer onboarding
-   Worker onboarding
-   KYC
-   Job creation
-   Job discovery
-   Bidding
-   Bid comparison
-   Worker selection
-   Payment
-   Job progress
-   Completion
-   Ratings
-   Disputes
-   Notifications
-   Offline/unstable connections
-   Admin operations

The UX/UI requirements below should therefore implement those concepts
rather than invent a different product.

Where the underlying product documents identify a decision as
unresolved, this document marks the relevant UI decision as **Decision
Required**, **Validation Required**, or **Recommended** rather than
presenting an assumption as a confirmed business rule.

------------------------------------------------------------------------

# 3. Core UX Objective

GRAFT should answer two questions extremely clearly.

## Customer

> **"I need something done. Who nearby can do it, can I trust them, what
> will they charge, and can I safely get the job completed?"**

## Worker

> **"I have a skill. Where can I find someone nearby who needs it and
> pay me fairly?"**

Every major screen should contribute to answering one of these
questions.

If a screen does not help the user:

-   understand,
-   decide,
-   act,
-   trust,
-   or complete

the marketplace transaction, it should be questioned before being
included.

------------------------------------------------------------------------

# 4. UX Principles

## 4.1 Zimbabwe First

GRAFT must feel designed for Zimbabwean users from the first
interaction.

This means the interface should naturally accommodate:

-   Zimbabwean phone numbers
-   Zimbabwean locations
-   EcoCash
-   USD/ZWL concepts where applicable
-   Local service categories
-   Informal and independent workers
-   Affordable Android devices
-   Slow or unstable mobile networks
-   Local trust concerns

The experience must not feel like a generic international marketplace
with Zimbabwe-specific fields added afterward.

------------------------------------------------------------------------

# 5. Simple Beats Complicated

The Business Requirements explicitly state:

> **Simple Beats Complicated**

Every unnecessary step increases friction.

The product should:

-   Ask only for information necessary at the current stage.
-   Use progressive disclosure.
-   Avoid long forms where shorter flows are possible.
-   Prefer clear actions over feature-heavy interfaces.
-   Keep the primary action visually obvious.
-   Avoid presenting advanced options before they are needed.

A customer should be able to create a basic job within a few minutes.

------------------------------------------------------------------------

# 6. Trust Before Transactions

Trust is a primary product pillar.

Users may:

-   Invite workers into homes.
-   Travel to unfamiliar locations.
-   Exchange money.
-   Hire people they have never met.

Therefore trust information should appear at the points where users make
decisions.

Trust signals may include:

-   Phone verification
-   Identity verification
-   EcoCash verification
-   Skill verification
-   Ratings
-   Completed jobs
-   Reviews
-   Experience
-   Relevant badges

The interface must distinguish between different verification levels.

Do not use a generic "Verified" label when the user needs to know what
was actually verified.

------------------------------------------------------------------------

# 7. Customer Control

Customers should generally retain control over worker selection.

The platform may recommend workers or rank bids, but the interface
should not imply:

> "GRAFT chose this worker, so you must use them."

Instead:

> "Here are suitable workers/bids. You choose."

The comparison interface should make important factors visible:

-   Price
-   Distance
-   ETA
-   Rating
-   Completed jobs
-   Verification
-   Skills
-   Reliability where available

The closest worker should not automatically appear to be the best
worker.

------------------------------------------------------------------------

# 8. Low-Bandwidth First

The product must be designed for:

-   Affordable Android phones
-   Older devices
-   Limited RAM
-   Slow processors
-   Slow mobile networks
-   Expensive data
-   Unstable connections
-   Limited storage
-   Battery constraints

This requirement affects visual design, not only engineering.

The interface should therefore avoid unnecessary:

-   Video backgrounds
-   Large decorative images
-   Heavy animation
-   Continuous map rendering
-   Autoplay media
-   Excessive gradients or effects that add no value
-   Huge image assets
-   Complex visual transitions

The product should remain visually polished without becoming visually
heavy.

------------------------------------------------------------------------

# 9. Fast Perceived Performance

The user should feel that the application responds quickly even when
network operations are slow.

UX requirements:

-   Show immediate feedback after taps.
-   Disable or change state of submitted actions when appropriate.
-   Use skeleton/loading placeholders for important lists.
-   Preserve already loaded information.
-   Show progress for uploads and payments.
-   Explain slow operations rather than appearing frozen.
-   Avoid blocking the whole screen for small operations.

A 2-second network operation should not feel like an application crash.

------------------------------------------------------------------------

# 10. Transparency

Users should understand:

-   What is happening.
-   What has happened.
-   What they need to do next.
-   What they are paying.
-   What the other party can see.
-   What the current job status means.

For important states, the UI should answer:

> **What happened?**

> **What does it mean?**

> **What can I do now?**

------------------------------------------------------------------------

# 11. Progressive Disclosure

Do not expose every possible piece of information at once.

Example:

### Before worker selection

Show:

-   Worker name
-   Verification
-   Rating
-   Completed jobs
-   Skills
-   Approximate distance
-   ETA
-   Bid price
-   Relevant reviews

### After worker selection

Reveal information necessary to perform the job.

### During active job

Show information necessary for coordination, safety and completion.

This supports both privacy and simplicity.

------------------------------------------------------------------------

# 12. Mobile-First Product Priority

The mobile application is the priority marketplace experience.

The primary mobile client must use:

**Flutter / Dart**

The interface should be designed for practical Android use.

Important considerations:

-   One-handed interaction where possible.
-   Large enough touch targets.
-   Clear bottom navigation.
-   Strong visual hierarchy.
-   Short forms.
-   Minimal keyboard entry.
-   Easy back navigation.
-   Fast access to primary actions.
-   Good behaviour on smaller screens.

------------------------------------------------------------------------

# 13. Web Experience

The web application should use:

**React + Next.js**

The web product should share the same product concepts as mobile but
does not need to reproduce the exact mobile layout.

Web can make better use of:

-   Wider content areas
-   Side-by-side comparisons
-   Tables
-   Larger maps
-   Multi-column dashboards
-   Administrative workflows

The web should not become a separate product with different business
logic.

------------------------------------------------------------------------

# 14. Shared Product Language

Flutter mobile and React/Next.js web should use consistent terminology.

Examples:

-   Job
-   Worker
-   Customer
-   Bid
-   Selected Worker
-   Verified
-   KYC
-   Payment
-   Completed
-   Cancelled
-   Dispute
-   Rating

Do not use different terms for the same concept across platforms.

For example, do not call a "bid" a "quote" in one interface unless the
product team intentionally defines them as different concepts.

------------------------------------------------------------------------

# 15. Information Architecture

The interface should be organized around the user's role.

## Customer

Recommended conceptual structure:

``` text
Home
Jobs
Notifications
Profile
```

## Worker

Recommended conceptual structure:

``` text
Home
Nearby Jobs
My Work
Notifications
Profile
```

The final navigation structure should be validated during implementation
and usability testing.

------------------------------------------------------------------------

# 16. Customer Home Screen

The customer home screen should immediately answer:

> **What do you need done?**

Primary action:

**Post a Job**

Secondary content can include:

-   Active jobs
-   Recent jobs
-   Relevant categories
-   Notifications
-   Useful marketplace prompts

The primary action should be visually dominant.

Avoid filling the first screen with:

-   Marketing copy
-   Analytics
-   Unnecessary banners
-   Complex filters
-   Too many categories

The user came to get something done.

------------------------------------------------------------------------

# 17. Customer Home Visual Hierarchy

Recommended hierarchy:

``` text
Greeting / context
        ↓
Primary "Post a Job" action
        ↓
Active jobs
        ↓
Useful categories / discovery
        ↓
Secondary information
```

The screen should feel calm and task-oriented.

------------------------------------------------------------------------

# 18. Worker Home Screen

The worker home screen should immediately answer:

> **What work is available near me?**

Important content:

-   Nearby relevant jobs
-   Distance
-   Category
-   Job summary
-   Preferred time
-   Budget where provided
-   Availability state

Primary action:

**View Nearby Jobs**

The worker should be able to quickly switch availability where that
feature is enabled.

------------------------------------------------------------------------

# 19. Worker Availability Indicator

If worker availability is implemented, it should be visually obvious.

Example:

``` text
● Available

[ Go Offline ]
```

or:

``` text
○ Offline

[ Go Online ]
```

The UI should clearly explain what being online means.

Do not imply that going online guarantees receiving work.

------------------------------------------------------------------------

# 20. Job Creation UX

Job creation is one of the most important customer flows.

It should be a guided, focused experience rather than one enormous form.

Recommended structure:

``` text
1. Category
2. Job details
3. Photos (optional)
4. Location
5. Date/time
6. Budget
7. Review
8. Publish
```

The exact number of screens may be reduced where practical.

The principle is:

> Gather the minimum information needed to create a useful job.

------------------------------------------------------------------------

# 21. Job Creation --- Category

The category selector should be easy to scan.

Potential categories include:

### Home Services

-   Plumbing
-   Electrical
-   Painting
-   Gardening
-   Carpentry
-   Roofing
-   Tiling
-   General repairs
-   Appliance installation

### Construction

-   Bricklaying
-   Welding
-   Paving
-   Ceiling installation
-   Renovation
-   General building

### Automotive

-   Mechanic
-   Tyre assistance
-   Car washing
-   Battery assistance
-   Mobile vehicle services

### Technology

-   Computer repair
-   Phone repair
-   WiFi installation
-   CCTV
-   DSTV
-   Solar

### Moving & Labour

-   Furniture moving
-   Loading
-   Unloading
-   Small deliveries
-   General labour

### Cleaning

-   House cleaning
-   Office cleaning
-   Yard cleaning
-   Window cleaning

### Personal & Events

-   Barber
-   Hairdresser
-   Makeup
-   Photographer
-   DJ
-   Catering
-   Event support

The category system must remain expandable.

The final launch categories are a product validation decision.

------------------------------------------------------------------------

# 22. Category Card Design

Category cards should prioritize recognition.

Recommended information:

-   Simple icon
-   Category name
-   Optional short description

Avoid relying on complex illustrations that increase application size.

Icons should remain understandable at small sizes.

------------------------------------------------------------------------

# 23. Job Description UX

The job description should help customers describe what needs to be
done.

Recommended fields:

**Job title**

Example:

> Fix leaking kitchen tap

**Description**

Example:

> Tap has been leaking since yesterday. Water is coming from the base.

The UI should provide useful examples without forcing the user to write
an essay.

------------------------------------------------------------------------

# 24. Job Photo UX

Photos are optional.

Flow:

``` text
Add photos
   ↓
Take photo / Choose photo
   ↓
Preview
   ↓
Remove / Add another
```

The interface should make it clear that photos are optional.

Image handling should prioritize:

-   Compression
-   Low data usage
-   Fast upload
-   Retry
-   Clear progress

Do not block job creation because a user cannot upload a photo.

------------------------------------------------------------------------

# 25. Location UX

Location is a core GRAFT capability.

The customer should be able to:

**Use current location**

or

**Set location manually**

The interface should explain why location is required.

Example:

> Your location helps us find suitable workers nearby.

------------------------------------------------------------------------

# 26. Location Permission UX

If permission is required:

``` text
Why we need your location

GRAFT uses your location to find suitable workers nearby.

[ Allow Location ]
[ Enter Location Manually ]
```

If permission is denied, manual location selection must remain available
where possible.

The user should not be trapped in a permission loop.

------------------------------------------------------------------------

# 27. Map UX

Maps are a core product capability, but they should be used
purposefully.

The map should support:

-   Job location
-   Worker/job distance
-   Nearby worker discovery
-   Basic active-job location functionality

Avoid displaying large, constantly updating maps when a simple list is
sufficient.

A list can be more efficient on low-end devices and poor connections.

------------------------------------------------------------------------

# 28. Map + List Pattern

For worker discovery, a useful structure is:

``` text
[ MAP ]

Nearby Jobs

Job Card
Job Card
Job Card
```

or:

``` text
Nearby Jobs
1.4 km   Plumbing
0.8 km   Gardening
2.1 km   Moving

[ View Map ]
```

The product should allow the user to switch between map and list where
appropriate.

The list should remain useful even when map data fails.

------------------------------------------------------------------------

# 29. Location Privacy UX

Before a job is accepted:

-   Prefer approximate worker location.
-   Show distance rather than exact private location.
-   Avoid exposing exact worker addresses.

After acceptance:

-   Reveal only the information necessary to perform the job.

During active jobs:

-   Live tracking may be used where necessary and technically available.

The exact privacy policy requires validation.

------------------------------------------------------------------------

# 30. Job Review Screen

Before publication, the customer should see a clear summary.

Example:

``` text
Review Job

Plumbing

Fix leaking kitchen tap

Today
14:00–16:00

Location
George

Budget
USD 20

Photos
2 attached

[ Edit ]
[ Post Job ]
```

The screen should allow correction without forcing the customer to
restart.

------------------------------------------------------------------------

# 31. Publish Action

The primary action should clearly communicate the consequence.

Prefer:

**Post Job**

over:

**Continue**

because the user should know exactly what happens.

During submission:

``` text
Posting your job...
```

After success:

``` text
Job Posted

Nearby workers can now respond.

[ View Job ]
```

------------------------------------------------------------------------

# 32. Job Posted State

The customer should immediately see:

-   Job title
-   Category
-   Status
-   Location area
-   Time
-   Bid count
-   Relevant actions

Initial state:

**Posted / Receiving Bids**

The status should be understandable without technical terminology.

------------------------------------------------------------------------

# 33. Customer Job Card

A job card should communicate:

-   Job title
-   Category
-   Status
-   Date/time
-   Bid count
-   Approximate location
-   Optional budget

Example:

``` text
Plumbing
Fix leaking kitchen tap

Today · 14:00
3 bids

Status: Receiving bids
```

Avoid putting every job detail into the card.

------------------------------------------------------------------------

# 34. Worker Job Discovery UI

Worker job discovery should prioritize:

1.  Skill relevance
2.  Distance
3.  Timing
4.  Availability
5.  Other trust/relevance factors

The interface should not expose a mysterious "algorithm score" unless
there is a user benefit.

Instead, show understandable reasons.

Example:

> Matches your plumbing skills

> 1.4 km away

------------------------------------------------------------------------

# 35. Worker Job Card

Recommended content:

``` text
Plumbing

Fix leaking kitchen tap

1.4 km away
Today · 14:00

Budget: USD 20

[ View Job ]
```

Optional:

-   Time posted
-   Photo indicator
-   Relevant skill match

------------------------------------------------------------------------

# 36. Job Details UI

A worker viewing a job should see:

### Header

-   Category
-   Job title
-   Status

### Main details

-   Description
-   Photos
-   Approximate location
-   Distance
-   Preferred time
-   Budget

### Trust/context

-   Customer information where appropriate
-   Relevant reputation information

### Primary action

**Submit Bid**

The action should remain accessible without excessive scrolling.

------------------------------------------------------------------------

# 37. Bid Creation UX

The worker should be able to submit a bid quickly.

Recommended fields:

-   Proposed price
-   Estimated arrival time
-   Short message

Example:

``` text
Your bid

Price
USD 25

Arrival
45 minutes

Message
I can repair the tap today.

[ Review Bid ]
```

Do not require a long proposal like a freelance marketplace.

GRAFT is intended for practical local jobs.

------------------------------------------------------------------------

# 38. Bid Review

Before submission:

``` text
Your Bid

USD 25
ETA: 45 minutes

"I can repair the tap today."

[ Edit ]
[ Submit Bid ]
```

The worker should understand:

> Submitting a bid does not mean the job is awarded.

------------------------------------------------------------------------

# 39. Bid Submitted State

After successful submission:

``` text
Bid submitted

The customer is reviewing bids.

[ View Job ]
```

The worker should not be shown unnecessary actions.

The interface should make the waiting state clear.

------------------------------------------------------------------------

# 40. Customer Bid List

This is a high-value comparison screen.

Each bid should expose the decision-making information quickly.

Recommended:

``` text
Worker A
✓ Identity Verified
★ 4.8
127 completed jobs

USD 20
1.2 km
ETA 30 min

[ View Profile ]
[ Choose Worker ]
```

The design should make comparison easy without creating a table that is
difficult to use on mobile.

------------------------------------------------------------------------

# 41. Bid Comparison Factors

The Business Requirements identify these factors:

  Factor              Purpose
  ------------------- -------------
  Price               Cost
  Distance            Proximity
  ETA                 Speed
  Rating              Reputation
  Completed jobs      Experience
  Verification        Trust
  Skills              Relevance
  Cancellation rate   Reliability

The interface should prioritize the factors most useful to the decision.

Do not make price the only visually dominant metric.

------------------------------------------------------------------------

# 42. Worker Profile UI

The worker profile is a trust surface.

Recommended hierarchy:

``` text
Profile photo
Worker name
Verification status
Rating
Completed jobs

Skills
Service area
Experience

Reviews

[ Choose Worker ]
```

The customer should quickly answer:

> Can I trust this person to do this job?

------------------------------------------------------------------------

# 43. Verification Badge Design

Verification badges should be specific.

Possible labels:

-   Phone Verified
-   Identity Verified
-   EcoCash Verified
-   Skill Verified

Do not use misleading claims such as:

> Fully Trusted

unless the platform has a clearly defined meaning for that status.

The badge should have:

-   Icon
-   Short label
-   Optional explanatory tooltip/page

------------------------------------------------------------------------

# 44. Rating Display

Use simple, recognizable rating patterns.

Example:

**4.8 ★**

Supporting information:

**127 completed jobs**

The number of ratings/reviews should be distinguishable from completed
jobs.

Avoid visual clutter such as five oversized stars occupying half the
screen.

------------------------------------------------------------------------

# 45. New Worker UX

The Business Requirements identify fairness for new workers as a
concern.

A new worker should not look like a failed worker simply because they
have:

**0 completed jobs**

The UI should distinguish:

> New worker

from:

> Poorly rated worker

A verified new worker can display trust information that does not depend
on historical job volume.

------------------------------------------------------------------------

# 46. Worker Selection UX

Selecting a worker is a consequential action.

The confirmation screen should show:

-   Worker
-   Verification
-   Rating
-   Price
-   ETA
-   Job
-   Important payment information

Example:

``` text
Choose this worker?

John M.
Identity Verified
4.8 ★ · 127 jobs

Bid
USD 25

ETA
45 min

[ Cancel ]
[ Confirm Worker ]
```

The final wording should be tested.

------------------------------------------------------------------------

# 47. Selected Worker State

Customer:

``` text
Worker Selected

John M.
USD 25
ETA 45 min

Next:
Payment / job confirmation
```

Worker:

``` text
Your bid was accepted.

Job:
Fix leaking kitchen tap

Agreed price:
USD 25
```

The state change should be obvious.

------------------------------------------------------------------------

# 48. Payment UX

The initial payment rail is:

**EcoCash only**

The exact EcoCash integration and settlement model remain validation
items.

Therefore the UI should be designed around payment states rather than
hard-coding assumptions about the payment API.

Important payment states may include:

-   Payment required
-   Payment processing
-   Payment confirmed
-   Payment failed
-   Payment status unknown
-   Refund pending
-   Refunded
-   Disputed

------------------------------------------------------------------------

# 49. Payment Confirmation Screen

Before confirmation, show:

-   Job
-   Worker
-   Amount
-   Currency
-   Payment method
-   Applicable platform fee where defined
-   Total amount

Example:

``` text
Confirm Payment

Job
Fix leaking kitchen tap

Worker
John M.

Service
USD 25

Platform fee
[To be defined]

Total
USD 25

Payment method
EcoCash

[ Pay ]
```

Do not invent a platform fee until the business model is finalized.

------------------------------------------------------------------------

# 50. Payment Processing State

The interface must not appear frozen.

Example:

``` text
Payment processing...

Please don't close the app.

Checking your EcoCash payment status.
```

If the status is unknown:

``` text
Payment status is being verified.

Don't pay again yet.

[ Check Status ]
```

This is important to prevent duplicate payments.

------------------------------------------------------------------------

# 51. Worker En-Route UI

After the required payment/confirmation stage:

``` text
Worker is on the way

John M.
1.2 km away

ETA
20 min

[ View Job ]
```

If live location is unavailable, do not display fake real-time movement.

Show the last known state honestly.

------------------------------------------------------------------------

# 52. Active Job UI

Customer and worker should both see a clear job status.

Potential status progression:

``` text
Posted
↓
Bidding
↓
Worker Selected
↓
Payment
↓
Worker En Route
↓
Work Started
↓
Completed
↓
Confirmed
```

The exact status state machine must remain aligned with backend
implementation.

------------------------------------------------------------------------

# 53. Job Status Visual Design

The current status should be visually dominant.

Example:

``` text
WORK IN PROGRESS

John is working on your job.

Fix leaking kitchen tap
USD 25
```

Avoid showing ten equally prominent statuses.

The user primarily needs to know:

> What is happening now?

------------------------------------------------------------------------

# 54. Completion UI

Worker action:

**Mark Job Complete**

Customer then sees:

``` text
Job marked complete

Please confirm that the work is complete.

[ Confirm Completion ]
[ Report an Issue ]
```

The dispute/report path should remain visible where appropriate.

------------------------------------------------------------------------

# 55. Completion Confirmation

After confirmation:

``` text
Job Complete

Payment has been completed/settled.

How was your experience?

★★★★★

[ Submit Rating ]
```

The user should understand that the transaction has moved into the
completed state.

------------------------------------------------------------------------

# 56. Ratings UI

MVP rating should remain simple.

Recommended:

-   1--5 stars
-   Optional short feedback
-   Optional structured feedback where validated

Potential structured feedback:

-   Quality
-   Professionalism
-   Punctuality
-   Communication
-   Value

Do not make a five-minute survey out of a completed job.

------------------------------------------------------------------------

# 57. Reviews UI

Reviews should be:

-   Readable
-   Short
-   Associated with a completed transaction
-   Clearly attributable
-   Protected against obvious manipulation

Potential display:

``` text
★ 4.8

"Arrived on time and fixed the issue."

— Customer
Completed job
```

The final review policy requires product validation.

------------------------------------------------------------------------

# 58. Job History UI

History should be organized by meaningful status.

Customer:

``` text
My Jobs

Active
Completed
Cancelled
Disputed
```

Worker:

``` text
My Work

Active
Bids
Completed
Cancelled
Disputed
```

The interface should avoid overwhelming users with every historical
transaction on one screen.

------------------------------------------------------------------------

# 59. Notifications UI

Notifications should be actionable.

Example:

``` text
New bid

3 workers have bid on your plumbing job.

[ View Bids ]
```

Tapping a notification should deep-link to the relevant object.

Examples:

-   New bid → Job/Bids
-   Accepted bid → Job
-   Payment → Transaction/Job
-   Completion → Job confirmation

------------------------------------------------------------------------

# 60. Notification Priority

Not every event deserves equal visual priority.

### High priority

-   Bid accepted
-   Payment status
-   Job cancellation
-   Safety/dispute update
-   Job starting soon

### Normal priority

-   New bid
-   New nearby job
-   General job updates

The notification system should avoid spam.

------------------------------------------------------------------------

# 61. Empty States

Every major list needs a useful empty state.

## Customer --- No jobs

> You haven't posted any jobs yet.

**Post Your First Job**

## Customer --- No bids

> No workers have bid yet.

> We'll notify you when someone responds.

## Worker --- No nearby jobs

> No suitable jobs nearby right now.

Possible action:

**Update Skills**

or:

**Expand Service Area**

## Worker --- No completed jobs

> Your completed jobs will appear here.

Empty states should explain what happens next.

------------------------------------------------------------------------

# 62. Loading States

Loading states should preserve the structure of the content where
possible.

Examples:

-   Job list skeleton
-   Bid list skeleton
-   Worker profile skeleton
-   Map loading state
-   Payment processing state

Avoid replacing the entire application with a generic spinner for every
network request.

------------------------------------------------------------------------

# 63. Error States

Errors should be:

-   Human-readable
-   Specific
-   Actionable
-   Honest

Avoid:

> Error 500

Prefer:

> We couldn't load your jobs. Check your connection and try again.

Action:

**Try Again**

For payment:

> We couldn't confirm the payment yet. Don't pay again until we check
> the status.

Action:

**Check Payment Status**

------------------------------------------------------------------------

# 64. Offline States

When there is no connection:

``` text
You're offline

Some information may be out of date.

We'll retry when your connection returns.
```

The application should preserve safe local state where practical.

Do not imply that a server action succeeded when it has not been
confirmed.

------------------------------------------------------------------------

# 65. Form Persistence

Important forms should avoid losing user input unnecessarily.

Especially:

-   Job creation
-   Worker bids
-   Profile editing
-   KYC submission

If the network fails during job creation, the user should not have to
rewrite the entire job.

The exact persistence mechanism is a technical decision.

------------------------------------------------------------------------

# 66. Duplicate Action Prevention

Important actions must prevent accidental duplication.

Examples:

-   Posting a job
-   Submitting a bid
-   Paying
-   Confirming completion

After a user taps a primary action:

-   Show progress.
-   Prevent repeated submissions where appropriate.
-   Verify uncertain server states before retrying.

------------------------------------------------------------------------

# 67. Cancellation UX

Cancellation is a consequential action.

Flow:

``` text
Cancel Job
     ↓
Select reason
     ↓
Show consequences if applicable
     ↓
Confirm cancellation
```

Avoid:

> Cancel?

with no context.

The user should understand what will happen.

------------------------------------------------------------------------

# 68. No-Show UX

Customer:

``` text
Worker hasn't arrived?

[ Report No-Show ]
```

Worker:

``` text
Customer unavailable?

[ Report Customer Unavailable ]
```

The UI should avoid immediately accusing either party.

Use neutral wording until the platform investigates.

------------------------------------------------------------------------

# 69. Dispute UX

Dispute entry should be easy to find but not intrusive.

Potential entry:

**Report an Issue**

Then:

``` text
What happened?

○ Work not completed
○ Work quality issue
○ Payment problem
○ Worker/customer no-show
○ Safety concern
○ Other
```

Then:

**Describe the issue**

Optional:

**Add evidence**

Then:

**Submit Report**

------------------------------------------------------------------------

# 70. Safety Reporting

Safety-related actions should be accessible without being hidden inside
multiple menus.

Potential options:

-   Report
-   Block
-   Contact support
-   Emergency support where provided

The exact emergency support mechanism requires operational validation.

------------------------------------------------------------------------

# 71. Block User UX

Example:

``` text
Block this user?

You won't be able to interact with this user according to GRAFT's blocking rules.

[ Cancel ]
[ Block ]
```

The product should communicate what blocking actually does.

------------------------------------------------------------------------

# 72. KYC UX

KYC should feel trustworthy and professional.

The interface should explain:

> Verification helps protect customers and workers on GRAFT.

The flow should clearly show:

``` text
Step 1 — Identity
Step 2 — Document
Step 3 — Verification
```

Where additional information is required, explain why.

------------------------------------------------------------------------

# 73. KYC Progress

The worker should always see status.

Example:

``` text
Identity Verification

✓ Phone verified
✓ Identity submitted
○ Review in progress
```

Possible states:

-   Not started
-   In progress
-   Pending review
-   Verified
-   Rejected
-   Resubmission required

------------------------------------------------------------------------

# 74. KYC Rejection UX

Never simply display:

> KYC Failed

Prefer:

> We couldn't verify your identity.

Then explain the next step:

> Please check that your document details are readable and match your
> profile.

**Try Again**

The exact rejection reasons depend on the KYC system.

------------------------------------------------------------------------

# 75. Worker Profile Editing

Worker profile editing should be organized by sections:

``` text
Profile
├── Basic Information
├── Skills
├── Service Area
├── Availability
├── Verification
└── Reviews
```

This prevents one giant settings screen.

------------------------------------------------------------------------

# 76. Customer Profile Editing

Customer profile should remain simpler:

``` text
Profile
├── Basic Information
├── Saved Locations where supported
├── Verification where applicable
├── Jobs
├── Ratings
└── Settings
```

The exact structure should follow the finalized MVP.

------------------------------------------------------------------------

# 77. Search UX

Search should only be introduced where it improves the marketplace.

Potential search contexts:

-   Categories
-   Jobs
-   Workers
-   Admin users/jobs

The customer does not necessarily need a complex worker search if
bidding already provides the discovery mechanism.

Avoid building search simply because marketplace products normally have
search.

------------------------------------------------------------------------

# 78. Filters

Potential worker job filters:

-   Distance
-   Category
-   Time
-   Budget
-   Availability

Potential customer bid filters:

-   Price
-   Distance
-   Rating
-   Verification
-   ETA

MVP should only expose filters that solve a real decision problem.

------------------------------------------------------------------------

# 79. Pricing Presentation

Price should be clear and consistent.

Examples:

**USD 25**

Avoid ambiguous formats.

If ZWL is supported, the currency must be explicitly identified.

Do not show:

> 25

without making the currency obvious.

The exact default currency display must remain aligned with the
product's financial requirements.

------------------------------------------------------------------------

# 80. EcoCash Presentation

Use the official payment name consistently:

**EcoCash**

Do not refer to it inconsistently as:

-   Eco Cash
-   Eco-cash
-   Wallet payment

unless branding/legal guidance requires otherwise.

Payment screens should clearly distinguish:

-   Payment method
-   Amount
-   Status
-   Transaction reference where available

------------------------------------------------------------------------

# 81. Visual Design Direction

The visual language should communicate:

-   Trust
-   Simplicity
-   Local relevance
-   Energy
-   Professionalism
-   Accessibility

The product should feel like a serious marketplace, not a social-media
app.

Avoid excessive:

-   Glassmorphism
-   Neon effects
-   Decorative gradients
-   Floating objects
-   Large animated illustrations
-   Unnecessary shadows
-   Excessive rounded cards

A strong hierarchy and clean typography are more important than visual
effects.

------------------------------------------------------------------------

# 82. Brand System

The exact GRAFT brand palette, logo specifications and typography must
follow the approved GRAFT brand/design source when available.

Do not invent a final brand system in engineering code if the brand has
not yet been formally approved.

The UI system should therefore define semantic tokens so the visual
identity can be adjusted centrally.

Recommended token categories:

``` text
Brand
Primary
Secondary
Accent

Surface
Background
Card
Elevated
Overlay

Text
Primary
Secondary
Muted
Inverse

Status
Success
Warning
Error
Info

Border
Default
Strong
Focus
```

Exact colour values are **Design Decision Required** unless already
defined in an authoritative brand document.

------------------------------------------------------------------------

# 83. Typography

Typography should prioritize:

-   Legibility
-   Strong hierarchy
-   Fast scanning
-   Good rendering on low-end Android devices
-   Consistent cross-platform appearance

Recommended hierarchy:

``` text
Display / Hero
H1
H2
H3
Body
Body Small
Label
Caption
```

The final font family should be selected as part of the visual design
system.

The chosen font must:

-   Support required Latin characters.
-   Render cleanly on Android.
-   Remain readable at small sizes.
-   Avoid excessive application size where font bundling matters.

Do not introduce multiple font families without a clear purpose.

------------------------------------------------------------------------

# 84. Colour Semantics

Colour should communicate meaning rather than decoration.

Recommended semantic use:

### Success

Used for:

-   Verified
-   Payment confirmed
-   Job completed

### Warning

Used for:

-   Pending
-   Attention required
-   Uncertain status

### Error

Used for:

-   Failed payment
-   Validation errors
-   Serious account restrictions

### Informational

Used for:

-   Helpful guidance
-   Neutral updates

Do not use status colours as the only indicator of meaning.

------------------------------------------------------------------------

# 85. Contrast

Text and interactive elements must maintain strong contrast.

Important information should remain readable:

-   Outdoors
-   On low-quality displays
-   At low brightness
-   With glare
-   On inexpensive phones

Do not use pale text on pale backgrounds merely for visual style.

------------------------------------------------------------------------

# 86. Spacing System

The interface should use a consistent spacing scale.

Recommended conceptual scale:

``` text
XS
SM
MD
LG
XL
XXL
```

The exact pixel values should be defined centrally in the design system.

The important requirement is consistency.

Do not manually invent unrelated spacing values on every screen.

------------------------------------------------------------------------

# 87. Border Radius

Use a consistent radius system.

Recommended semantic tokens:

``` text
Small
Medium
Large
Pill
```

Avoid giving every component a different radius.

Rounded corners should support hierarchy, not make every element look
like a floating bubble.

------------------------------------------------------------------------

# 88. Shadows and Elevation

Use elevation sparingly.

Prefer:

-   Borders
-   Surface contrast
-   Spacing
-   Typography

before heavy shadows.

This helps maintain a lightweight appearance and avoids unnecessary
visual complexity.

------------------------------------------------------------------------

# 89. Buttons

Buttons should have clear hierarchy.

Recommended types:

### Primary

The main action.

Examples:

-   Post Job
-   Submit Bid
-   Choose Worker
-   Pay
-   Confirm Completion

### Secondary

Supporting action.

Examples:

-   Edit
-   View Profile
-   View Map

### Tertiary

Low-emphasis action.

Examples:

-   Cancel
-   Skip
-   Learn More

### Destructive

Actions such as:

-   Delete
-   Report
-   Block
-   Cancel where appropriate

The exact visual styles belong in the design system.

------------------------------------------------------------------------

# 90. Button Copy

Button labels should describe the action.

Prefer:

**Post Job**

over:

**Continue**

Prefer:

**Submit Bid**

over:

**Send**

Prefer:

**Confirm Worker**

over:

**Next**

Prefer:

**Confirm Completion**

over:

**Done**

------------------------------------------------------------------------

# 91. Touch Targets

Interactive controls must be comfortable to use on mobile.

Avoid tiny:

-   Close buttons
-   Icon-only controls
-   Text links
-   Filter controls

Important actions should be easy to tap accurately.

The final minimum touch-target dimensions should follow the selected
accessibility standard.

------------------------------------------------------------------------

# 92. Forms

Forms should:

-   Group related information.
-   Use clear labels.
-   Provide examples.
-   Validate close to the relevant field.
-   Preserve input when errors occur.
-   Avoid unnecessary fields.
-   Use appropriate keyboards.

Example:

Phone number → phone keypad.

Price → numeric keypad.

Description → standard text keyboard.

------------------------------------------------------------------------

# 93. Form Validation

Validation messages should tell the user how to fix the problem.

Bad:

> Invalid.

Better:

> Enter a valid Zimbabwean mobile number.

Bad:

> Required.

Better:

> Add a short description of the job.

Validation should not be hostile.

------------------------------------------------------------------------

# 94. Keyboard and Mobile Form Behaviour

Forms should account for the keyboard covering content.

Requirements:

-   Automatically scroll focused fields into view.
-   Keep the primary action accessible.
-   Avoid fields hidden behind the keyboard.
-   Dismiss keyboard when appropriate.
-   Use next/continue actions where useful.

------------------------------------------------------------------------

# 95. Accessibility

Accessibility should be treated as a product quality requirement.

The interface should support:

-   Readable text
-   Strong contrast
-   Screen-reader-friendly labels
-   Logical focus order
-   Accessible controls
-   Non-colour-only status indicators
-   Large enough interactive targets
-   Meaningful error messages

The product should remain usable for people with different levels of
digital literacy.

------------------------------------------------------------------------

# 96. Digital Literacy

GRAFT may be used by people who are not experienced with complex
applications.

Therefore:

-   Avoid unexplained icons.
-   Use familiar language.
-   Pair icons with labels where ambiguity exists.
-   Avoid technical terminology.
-   Explain important actions.
-   Keep navigation predictable.

Do not assume users understand marketplace jargon.

------------------------------------------------------------------------

# 97. Language

The initial interface language should be clear, plain English unless a
formally approved localization strategy exists.

Avoid unnecessary:

-   Corporate jargon
-   Legalistic wording
-   Technical language
-   Complex sentences

The interface should be easy to understand for users with varying levels
of English proficiency.

Future localization can be considered later.

------------------------------------------------------------------------

# 98. Iconography

Icons should:

-   Be consistent.
-   Have a clear meaning.
-   Use a coherent visual style.
-   Support text labels when ambiguous.

Do not use icons merely because a text label looks less attractive.

For important actions, text should remain clear.

------------------------------------------------------------------------

# 99. Cards

Cards are appropriate for:

-   Jobs
-   Bids
-   Worker profiles
-   Notifications
-   Summary information

Cards should not become the default container for everything.

Each card should have one clear purpose.

------------------------------------------------------------------------

# 100. Job Card Anatomy

A job card can contain:

``` text
Category
Job title
Short description
Distance
Date/time
Budget
Status
Primary action
```

Optional:

-   Photo indicator
-   Skill-match indicator

The most important information should appear first.

------------------------------------------------------------------------

# 101. Bid Card Anatomy

A bid card can contain:

``` text
Worker
Verification
Rating
Completed jobs
Price
Distance
ETA
Short message

[ View Profile ]
[ Choose Worker ]
```

The customer should be able to compare several bids quickly.

------------------------------------------------------------------------

# 102. Worker Profile Card

A compact worker card should prioritize:

``` text
Photo
Name
Verification
Rating
Completed jobs
Primary skill
Distance
```

Avoid exposing too much information before the user opens the full
profile.

------------------------------------------------------------------------

# 103. Status Badges

Status badges should be short.

Examples:

-   Receiving Bids
-   Selected
-   Payment Pending
-   En Route
-   In Progress
-   Completed
-   Cancelled
-   Disputed
-   Verification Pending

Avoid technical backend names such as:

`PAYMENT_PROCESSING_STATE_02`

------------------------------------------------------------------------

# 104. Job Timeline

A timeline can help users understand progress.

Example:

``` text
✓ Job Posted
✓ Worker Selected
✓ Payment Confirmed
● Worker En Route
○ Work Started
○ Completed
```

Only use a timeline when it improves understanding.

On small screens, a compact status stepper may be better.

------------------------------------------------------------------------

# 105. Map Interaction Rules

Maps should not dominate every screen.

Use a map when spatial information changes the user's decision.

Good:

-   Nearby worker discovery
-   Nearby jobs
-   Route/navigation
-   Active job location

Less useful:

-   Profile editing
-   Payment confirmation
-   Rating
-   Basic job description

------------------------------------------------------------------------

# 106. Location Accuracy

The UI should not imply greater precision than the system actually has.

If location is approximate:

> Approximately 1.4 km away

If exact navigation is available:

> Route to job

Do not show a highly precise pin when the underlying location is
approximate.

------------------------------------------------------------------------

# 107. Location Loading

While location is loading:

``` text
Finding your location...
```

If it fails:

``` text
We couldn't determine your location.

[ Try Again ]
[ Set Location Manually ]
```

Do not show a fake location.

------------------------------------------------------------------------

# 108. Permissions

Permissions should be requested at the moment they become useful.

Examples:

-   Location → when creating/discovering a job.
-   Camera → when adding a photo.
-   Notifications → when notifications become valuable.

Do not request every permission immediately on first launch.

------------------------------------------------------------------------

# 109. Notification Permission

Explain the benefit.

Example:

> Get notified when workers bid on your job.

**Allow Notifications**

This is more useful than:

> Enable notifications.

------------------------------------------------------------------------

# 110. Camera Permission

Explain:

> Add photos to help workers understand the job.

Then request camera/gallery access.

------------------------------------------------------------------------

# 111. Authentication Screens

Authentication should be lightweight.

Suggested:

``` text
GRAFT

Need a job done?
Looking for work?

[ Get Started ]

Already have an account?
[ Sign In ]
```

If role selection is required, it should happen clearly and not create
confusion.

------------------------------------------------------------------------

# 112. Role Selection

Where the product asks users to choose a role:

``` text
What brings you to GRAFT?

[ I Need a Job Done ]

[ I'm Looking for Work ]
```

Use plain language.

Avoid:

> Select account type.

because it is less human and less immediately understandable.

------------------------------------------------------------------------

# 113. Worker Onboarding UX

Worker onboarding should communicate value.

Suggested sequence:

``` text
Phone
↓
Basic profile
↓
Skills
↓
Service area
↓
Verification
↓
Availability
↓
Nearby jobs
```

The worker should understand:

> Completing your profile and verification can help customers trust you.

------------------------------------------------------------------------

# 114. Customer Onboarding UX

Customer onboarding should be shorter.

Suggested:

``` text
Phone
↓
Name
↓
Location when needed
↓
Post first job
```

Do not make customers complete a worker-style profile before they can
experience the marketplace.

------------------------------------------------------------------------

# 115. Verification Visibility

A worker who has not completed required verification should understand
what they can and cannot do.

Example:

``` text
Verification pending

You can complete your profile, but some marketplace actions may remain unavailable until verification is complete.
```

The exact restrictions depend on final business rules.

------------------------------------------------------------------------

# 116. Admin UX Principles

The admin platform is a different interface from the consumer
marketplace.

Admin UI should prioritize:

-   Information density
-   Search
-   Filtering
-   Tables
-   Status
-   Auditability
-   Bulk operations where safe
-   Clear risk indicators

It should still use the same GRAFT visual identity.

------------------------------------------------------------------------

# 117. Admin Dashboard

Potential sections:

``` text
Overview
Users
KYC
Jobs
Payments
Reports
Disputes
Categories
Settings
Analytics
```

The final navigation depends on actual admin scope.

------------------------------------------------------------------------

# 118. Admin User Review

A user review screen should provide a structured overview:

``` text
User
Role
Verification
Account status

Profile
Jobs
Payments
Reports
Disputes
Activity
```

Actions should be permission-controlled.

------------------------------------------------------------------------

# 119. Admin KYC Review

KYC review should support:

-   Submitted information
-   Verification status
-   Document review
-   Decision
-   Reason
-   Audit information

Do not make sensitive identity data visually prominent beyond what the
reviewer needs.

------------------------------------------------------------------------

# 120. Admin Job Review

Admin should be able to identify:

-   Job status
-   Customer
-   Worker
-   Category
-   Location context
-   Payment status
-   Reports
-   Dispute state

Potential filters:

-   Active
-   Completed
-   Cancelled
-   Disputed
-   Flagged

------------------------------------------------------------------------

# 121. Admin Payment UI

Payment monitoring should clearly distinguish:

-   Confirmed
-   Pending
-   Failed
-   Unknown
-   Refunded
-   Disputed

Payment references should be searchable where available.

------------------------------------------------------------------------

# 122. Responsive Web Design

The web application should support:

-   Desktop
-   Laptop
-   Tablet
-   Mobile browser

The layout should adapt rather than simply shrinking the desktop
interface.

Recommended conceptual breakpoints:

``` text
Mobile
Tablet
Desktop
Wide Desktop
```

Exact breakpoints should be centralized in the web design system.

------------------------------------------------------------------------

# 123. Web Mobile Experience

A user opening the web app on a phone should still be able to:

-   Sign in
-   View jobs
-   Create a job
-   View bids
-   Manage relevant marketplace actions

The mobile web experience should not depend on hover interactions.

------------------------------------------------------------------------

# 124. Web Desktop Experience

Desktop can provide richer layouts.

For example:

``` text
+-------------------+-----------------------+
| Job details       | Bid comparison        |
|                   |                       |
| Description       | Worker A              |
| Location          | Worker B              |
| Photos            | Worker C              |
+-------------------+-----------------------+
```

This can improve decision-making without changing the underlying product
behaviour.

------------------------------------------------------------------------

# 125. Design System Architecture

The implementation should use reusable components rather than designing
every screen independently.

Core component groups:

### Navigation

-   App bar
-   Bottom navigation
-   Side navigation
-   Tabs
-   Breadcrumbs where useful

### Actions

-   Buttons
-   Icon buttons
-   Floating actions only where justified

### Content

-   Cards
-   Lists
-   Sections
-   Chips
-   Badges
-   Avatars

### Forms

-   Text fields
-   Selectors
-   Date/time controls
-   Toggles
-   Checkboxes
-   Radio options

### Feedback

-   Toast/snackbar
-   Dialog
-   Bottom sheet
-   Alert
-   Loading
-   Empty state
-   Error state

### Marketplace

-   Job card
-   Bid card
-   Worker card
-   Status stepper
-   Rating component
-   Verification badge
-   Payment status

------------------------------------------------------------------------

# 126. Component Consistency

The same component should behave consistently.

For example:

A primary button should not:

-   Have one height on one screen.
-   Have a different radius on another.
-   Use different typography elsewhere.
-   Change meaning based only on screen placement.

Create a reusable design system.

------------------------------------------------------------------------

# 127. Component States

Important components should define:

-   Default
-   Pressed
-   Disabled
-   Loading
-   Success
-   Error
-   Focused

For example:

``` text
Submit Bid
↓
Submitting...
↓
Bid Submitted
```

Do not simply freeze the button.

------------------------------------------------------------------------

# 128. Feedback Patterns

Use appropriate feedback.

### Snackbar

For lightweight confirmations.

Example:

> Bid submitted.

### Dialog

For consequential decisions.

Example:

> Choose this worker?

### Bottom Sheet

For quick mobile selections.

Example:

> Select job category.

### Full Screen

For complex tasks.

Example:

> KYC submission.

------------------------------------------------------------------------

# 129. Modal Usage

Avoid overusing modals.

A modal should be used when the user must make a decision before
continuing.

Do not put entire multi-step workflows into tiny dialogs.

------------------------------------------------------------------------

# 130. Bottom Sheets

Bottom sheets are useful for:

-   Category selection
-   Filters
-   Quick actions
-   Map details
-   Job summary

They should not become a replacement for normal navigation.

------------------------------------------------------------------------

# 131. Microinteractions

Microinteractions should reinforce actions.

Useful examples:

-   Button state change after submission.
-   Verification check appearing.
-   Rating selection.
-   Job status progression.
-   Successful payment confirmation.

Avoid animations simply for entertainment.

------------------------------------------------------------------------

# 132. Animation Rules

Animations should be:

-   Short
-   Purposeful
-   Lightweight
-   Interruptible
-   Optional where accessibility requires

Avoid:

-   Large page transitions
-   Constant moving elements
-   Heavy particle effects
-   Animated backgrounds
-   Excessive bouncing

The product must remain usable on older phones.

------------------------------------------------------------------------

# 133. Reduced Motion

Where platform accessibility settings indicate reduced motion,
nonessential animation should be reduced or removed.

Important state changes must still be communicated through:

-   Text
-   Status
-   Icons
-   Layout changes

not animation alone.

------------------------------------------------------------------------

# 134. Image Requirements

Images should be:

-   Compressed
-   Appropriately sized
-   Lazy-loaded where appropriate
-   Cached where useful
-   Replaceable with placeholders
-   Avoided when unnecessary

Job photos should not load at full camera resolution into list views.

------------------------------------------------------------------------

# 135. Avatar Requirements

Worker/customer avatars should use:

-   Consistent aspect ratio
-   Consistent size hierarchy
-   Placeholder state when absent

A missing photo should not make the interface look broken.

------------------------------------------------------------------------

# 136. Empty Image State

If a worker has no profile photo:

Use a clean placeholder rather than a broken image.

If a job has no photo:

Do not show an empty image container.

------------------------------------------------------------------------

# 137. Data Usage Awareness

Where practical, the product should avoid unexpectedly consuming data.

Examples:

-   Compress photos.
-   Avoid autoplay video.
-   Load map detail only when useful.
-   Do not refresh lists continuously without reason.
-   Cache safe data.
-   Avoid repeated network calls.

------------------------------------------------------------------------

# 138. Battery Awareness

Location functionality can consume battery.

The UX should not encourage unnecessary continuous location tracking.

Where possible:

-   Use event-based location updates.
-   Use appropriate polling intervals.
-   Explain active tracking.
-   Stop unnecessary tracking when jobs are no longer active.

The exact technical strategy is a later engineering decision.

------------------------------------------------------------------------

# 139. Trust Without Clutter

Trust information is important, but the interface should not display ten
badges on every worker.

Prioritize the most meaningful signals.

Example:

``` text
John M.
✓ Identity Verified
★ 4.8 · 127 jobs
Plumber
1.2 km away
```

This is often more useful than:

``` text
✓ Phone
✓ ID
✓ EcoCash
✓ Skill
✓ Background
✓ Trusted
✓ Premium
✓ Top Worker
...
```

------------------------------------------------------------------------

# 140. Avoid Price-Only Design

The marketplace should not visually encourage a race to the bottom.

When comparing bids, show:

-   Price
-   Trust
-   Quality
-   Distance
-   ETA
-   Experience

The customer should be able to understand why a slightly more expensive
worker may be a better choice.

------------------------------------------------------------------------

# 141. Worker Opportunity Design

The marketplace should not make new workers invisible.

The UI should provide fair visibility mechanisms once the
matching/ranking system is finalized.

A new worker with:

-   Valid verification
-   Relevant skills
-   Good profile

should still have an understandable path to getting their first job.

------------------------------------------------------------------------

# 142. Safety and Privacy by Design

The UI should minimize unnecessary exposure of:

-   Exact home addresses
-   Phone numbers
-   Identity documents
-   Payment information
-   Precise worker location

Use progressive disclosure.

------------------------------------------------------------------------

# 143. Sensitive Information

KYC documents should never be displayed in normal consumer profiles.

Payment details should not be displayed unnecessarily.

Exact personal information should only appear to authorized users at the
appropriate stage.

------------------------------------------------------------------------

# 144. Trust Language

Trust language should be factual.

Good:

> Identity Verified

> 127 completed jobs

> 4.8 rating

Avoid unsupported claims:

> Best Worker

> 100% Safe

> Guaranteed Quality

unless those claims have a defined and defensible basis.

------------------------------------------------------------------------

# 145. Content Tone

GRAFT's interface should feel:

-   Friendly
-   Direct
-   Confident
-   Respectful
-   Local
-   Professional

Avoid:

-   Corporate jargon
-   Overly formal language
-   Fake hype
-   Excessive emojis
-   Condescending language
-   Technical terminology

------------------------------------------------------------------------

# 146. Error Tone

When something fails, do not blame the user.

Bad:

> You entered the wrong information.

Better:

> We couldn't verify that number. Check it and try again.

Bad:

> Upload failed.

Better:

> We couldn't upload the photo. Check your connection and try again.

------------------------------------------------------------------------

# 147. Confirmation Tone

Important success messages should be reassuring but concise.

Examples:

> Job posted successfully.

> Bid submitted.

> Worker selected.

> Payment confirmed.

> Job completed.

------------------------------------------------------------------------

# 148. Role Clarity

The interface should always make the current role obvious.

A worker should not accidentally see a customer-only action such as:

> Post a Job

if the role does not support it.

Similarly, a customer should not see:

> Submit Bid

unless the product explicitly supports multiple roles for that account.

------------------------------------------------------------------------

# 149. Multi-Role Accounts

Whether one account can operate as both customer and worker is a product
decision that must be finalized.

Until confirmed, the UI should not assume unrestricted role switching.

If multi-role support is later introduced, role switching must be
obvious and safe.

------------------------------------------------------------------------

# 150. Job Ownership

Customers should only see and manage jobs they are authorized to access.

Workers should only see information they are authorized to access.

Admin access should be permission controlled.

The UI must never imply access that the backend does not enforce.

------------------------------------------------------------------------

# 151. Navigation Safety

Back navigation should preserve user progress where appropriate.

Example:

``` text
Job creation
 ↓
Description
 ↓
Location
 ↓
Back
 ↓
Description preserved
```

Do not unexpectedly discard entered information.

------------------------------------------------------------------------

# 152. Unsaved Changes

For important forms, if the user tries to leave with unsaved changes:

``` text
Leave without saving?

Your job details will be lost.

[ Stay ]
[ Leave ]
```

This should only be used when there is genuinely meaningful unsaved
information.

------------------------------------------------------------------------

# 153. First-Time User Experience

First-time users should receive enough guidance to understand GRAFT
without a long tutorial.

Use:

-   Clear role selection
-   Strong primary actions
-   Helpful examples
-   Short contextual explanations

Avoid:

-   Multi-screen tutorial carousels
-   Forced video
-   Long onboarding explanations

The product should teach itself through good UX.

------------------------------------------------------------------------

# 154. Customer First-Job Experience

The first customer journey should feel especially simple.

Ideal:

``` text
Get Started
 ↓
Need a job done?
 ↓
Post Job
 ↓
Category
 ↓
Description
 ↓
Location
 ↓
Post
```

The user should reach the marketplace value quickly.

------------------------------------------------------------------------

# 155. Worker First-Bid Experience

The worker should quickly understand:

1.  What job is available.
2.  Where it is.
3.  Whether it matches their skill.
4.  What the customer expects.
5.  What they can bid.
6.  What happens after bidding.

The first bid should not require an unnecessarily complex profile or
proposal.

------------------------------------------------------------------------

# 156. First-Time Trust Education

Trust features should be explained when encountered.

Example:

> Identity Verified means GRAFT has completed its identity verification
> process for this worker.

Do not force users to read a trust policy before they can use the
product.

------------------------------------------------------------------------

# 157. Help and Support

Help should be accessible but not dominate navigation.

Potential:

``` text
Profile
 ↓
Help & Support
```

Contextual help may also appear on:

-   Payment
-   KYC
-   Job cancellation
-   Disputes

------------------------------------------------------------------------

# 158. Support Entry During Active Job

During an active transaction, support should be easy to find.

Potential:

**Help with this job**

This can lead to:

-   Report issue
-   Payment issue
-   Safety concern
-   Cancellation
-   Contact support

The exact operational support system is a later decision.

------------------------------------------------------------------------

# 159. Design for Real-World Use

GRAFT may be used:

-   Outdoors
-   In bright sunlight
-   With one hand
-   While walking
-   On older devices
-   With limited connectivity
-   With low battery
-   Under time pressure

Therefore interfaces should prioritize:

-   High readability
-   Strong hierarchy
-   Large actionable controls
-   Minimal clutter
-   Clear status
-   Short flows

------------------------------------------------------------------------

# 160. Professionalism Standard

GRAFT should feel professional because of:

-   Consistency
-   Typography
-   Spacing
-   Trust
-   Clear information hierarchy
-   Predictable interaction
-   Good error handling
-   Strong states
-   Reliable navigation

It should not depend on:

-   Excessive visual effects
-   Complex gradients
-   Huge illustrations
-   Animation
-   Decorative UI

A professional product should still feel fast and practical.

------------------------------------------------------------------------

# 161. UX Quality Bar

A screen should not be considered finished merely because:

-   It compiles.
-   The button works.
-   The API returns data.

It should also satisfy:

### Clarity

Can a new user understand the screen?

### Hierarchy

Is the most important information obvious?

### Actionability

Is the next action clear?

### Trust

Does the user have enough information to proceed safely?

### Consistency

Does it match the rest of GRAFT?

### Accessibility

Can a broad range of users operate it?

### Performance

Will it remain usable on low-end devices and poor networks?

------------------------------------------------------------------------

# 162. Screen Acceptance Checklist

Every important screen should be reviewed against:

-   [ ] Purpose is clear.
-   [ ] Primary action is obvious.
-   [ ] Content hierarchy is clear.
-   [ ] Labels are understandable.
-   [ ] Loading state exists.
-   [ ] Empty state exists where relevant.
-   [ ] Error state exists.
-   [ ] Offline state exists where relevant.
-   [ ] Disabled state exists where relevant.
-   [ ] Success state exists where relevant.
-   [ ] Back navigation works.
-   [ ] Keyboard behaviour works.
-   [ ] Accessibility is considered.
-   [ ] Low-bandwidth impact is considered.
-   [ ] Sensitive information is protected.
-   [ ] Copy is concise.
-   [ ] Visual components use the design system.

------------------------------------------------------------------------

# 163. Core MVP Screen Inventory

The following screens are expected to be required for the core
marketplace experience.

## Shared

1.  Welcome
2.  Role Selection where required
3.  Sign In
4.  Sign Up
5.  Phone Verification / OTP
6.  Profile setup
7.  Notifications
8.  Settings
9.  Help / Support

## Customer

10. Customer Home
11. Post Job --- Category
12. Post Job --- Details
13. Post Job --- Photos
14. Post Job --- Location
15. Post Job --- Date/Time
16. Post Job --- Budget
17. Review Job
18. Job Posted
19. Customer Job Details
20. Bids
21. Worker Profile
22. Confirm Worker
23. Payment
24. Payment Status
25. Active Job
26. Completion Confirmation
27. Rating
28. Job History
29. Dispute / Report

## Worker

30. Worker Home
31. Nearby Jobs
32. Job Details
33. Submit Bid
34. Bid Review
35. Bid Status
36. Worker Profile
37. Edit Skills
38. Service Area
39. Availability
40. KYC
41. Verification Status
42. Accepted Job
43. Active Job
44. Completion
45. Payment Status
46. Rating
47. Work History

## Admin / Web

48. Admin Dashboard
49. User Management
50. User Detail
51. KYC Queue
52. KYC Review
53. Job Management
54. Job Detail
55. Payment Management
56. Dispute Management
57. Reports
58. Categories
59. Analytics
60. Settings

This is a planning inventory, not a requirement that every screen must
be implemented in Batch 2.

------------------------------------------------------------------------

# 164. MVP Screen Prioritization

## Tier 1 --- Core Transaction

These screens directly support the marketplace loop:

-   Authentication
-   Customer Home
-   Worker Home
-   Post Job
-   Job Details
-   Nearby Jobs
-   Submit Bid
-   Bids
-   Worker Profile
-   Select Worker
-   Payment
-   Active Job
-   Completion
-   Rating

## Tier 2 --- Trust & Reliability

-   KYC
-   Verification status
-   Notifications
-   Reports
-   Disputes
-   Job history
-   Profile management

## Tier 3 --- Operational/Admin

-   Admin dashboard
-   KYC review
-   User management
-   Job management
-   Payment monitoring
-   Dispute management

This prioritization should guide implementation sequencing.

------------------------------------------------------------------------

# 165. UX Flow to Screen Relationship

The design should map directly to the User Flows document.

Example:

``` text
Customer posts job
        ↓
Customer Home
        ↓
Category
        ↓
Details
        ↓
Location
        ↓
Review
        ↓
Job Posted
        ↓
Bids
        ↓
Worker Profile
        ↓
Confirm Worker
        ↓
Payment
        ↓
Active Job
        ↓
Completion
        ↓
Rating
```

The engineering implementation should not invent major screens outside
this product model without documenting why.

------------------------------------------------------------------------

# 166. Design Handoff Requirements

Before a major feature is implemented, the design specification should
communicate:

-   Screen purpose
-   User role
-   Entry point
-   Primary action
-   Secondary actions
-   Required content
-   Loading state
-   Empty state
-   Error state
-   Success state
-   Permission requirements
-   Privacy requirements
-   Responsive behaviour
-   Accessibility considerations

This prevents design intent from being lost during development.

------------------------------------------------------------------------

# 167. Design-to-Code Requirements

The Flutter implementation should use:

-   Reusable widgets
-   Centralized theme/tokens
-   Shared spacing values
-   Shared typography
-   Shared button styles
-   Shared status components
-   Shared cards
-   Shared form components

The React/Next.js implementation should use the equivalent component
system.

Do not duplicate visually identical components across dozens of files.

------------------------------------------------------------------------

# 168. Flutter-Specific UX Requirements

The Flutter application should prioritize:

-   Smooth navigation
-   Native-feeling touch interactions
-   Efficient scrolling
-   Responsive layouts
-   Proper keyboard handling
-   Platform permissions
-   Android back-button behaviour
-   Safe areas
-   Low-memory behaviour
-   Efficient image loading

Avoid heavy packages when a lightweight implementation is sufficient.

------------------------------------------------------------------------

# 169. Android Priority

The product should be optimized primarily for Android because the
Business Requirements explicitly prioritize affordable Android phones.

Testing should include lower-spec Android hardware where possible.

The UI should not depend on:

-   Large amounts of RAM
-   High refresh rates
-   Powerful GPUs
-   Constant connectivity

------------------------------------------------------------------------

# 170. React/Next.js UX Requirements

The web application should prioritize:

-   Responsive layout
-   Fast initial load
-   Accessible HTML
-   Keyboard navigation
-   Clear URLs
-   Browser back/forward support
-   Loading states
-   Error boundaries
-   Responsive maps
-   Desktop-friendly comparisons

The web should not require a powerful desktop computer.

------------------------------------------------------------------------

# 171. Browser Mobile Requirements

On mobile browsers:

-   Buttons remain easy to tap.
-   Forms work with mobile keyboards.
-   Maps remain usable.
-   Navigation does not depend on hover.
-   Tables become cards or horizontally scrollable structures where
    appropriate.
-   Primary actions remain visible.

------------------------------------------------------------------------

# 172. Admin Web Requirements

Admin interfaces can use denser layouts than consumer mobile screens.

However:

-   Destructive actions must be clear.
-   Sensitive data must be protected.
-   Search/filter states must be understandable.
-   Audit information should be visible.
-   Permissions should be enforced.

------------------------------------------------------------------------

# 173. Data Freshness

The UI should communicate when information may be stale.

For example:

> Updated 2 minutes ago

may be useful for nearby jobs or worker status.

Do not imply live information if the system is only periodically
refreshed.

------------------------------------------------------------------------

# 174. Live Location Transparency

If live location is implemented:

The user should know:

-   That location sharing is active.
-   Who can see it.
-   When it stops.

Example:

> Sharing your location with the customer during this active job.

Do not silently enable continuous tracking.

------------------------------------------------------------------------

# 175. Network State Awareness

A small, non-intrusive connection indicator may be useful when a user is
actively performing network-dependent actions.

Examples:

``` text
Offline
```

or:

``` text
Trying to reconnect...
```

Do not display a persistent network warning when the user can continue
normally.

------------------------------------------------------------------------

# 176. Retry UX

Retry should be contextual.

Example:

``` text
Couldn't load nearby jobs.

[ Try Again ]
```

For uncertain actions:

``` text
We're checking whether your bid was submitted.

[ Check Status ]
```

Do not blindly repeat potentially transactional requests.

------------------------------------------------------------------------

# 177. Payment Failure UX

Payment failures must be especially careful.

Potential:

``` text
Payment not confirmed

We couldn't confirm the EcoCash transaction.

Don't pay again yet.

[ Check Status ]
[ Contact Support ]
```

The exact wording depends on the final payment integration.

------------------------------------------------------------------------

# 178. Job Cancellation Payment UX

If a job is cancelled after payment, the UI must explain:

-   Whether payment was made.
-   Whether a refund is applicable.
-   Current refund status.
-   What happens next.

Never simply show:

> Job cancelled.

when money is involved.

------------------------------------------------------------------------

# 179. Dispute Payment UX

During a payment dispute:

``` text
Payment under review

Your transaction is being reviewed.

Reference:
XXXXXX
```

The user should understand that the transaction is not being silently
ignored.

------------------------------------------------------------------------

# 180. Safety UX During Active Jobs

Where supported, active-job screens should provide clear access to:

-   Job details
-   Worker/customer information
-   Location
-   Support/reporting
-   Emergency options if available

Safety actions should not be hidden inside obscure menus.

------------------------------------------------------------------------

# 181. Prohibited Job UX

If a job violates platform policy:

The user should receive a clear explanation.

Example:

> This type of service isn't allowed on GRAFT.

Avoid revealing internal moderation rules that could enable abuse.

The final prohibited-services policy must be defined before launch.

------------------------------------------------------------------------

# 182. Moderation UX

If a job is under review:

``` text
Job under review

We're checking this job before it can continue.

You'll be notified when there's an update.
```

Do not make the user believe their job disappeared.

------------------------------------------------------------------------

# 183. Account Restriction UX

If an account is restricted:

``` text
Your account is currently restricted.

Some GRAFT features are unavailable.

Reason:
[Appropriate explanation]

[ Contact Support ]
```

The exact legal/operational wording must be validated.

------------------------------------------------------------------------

# 184. Accessibility and Status

Never communicate important information through colour alone.

Bad:

-   Green = completed
-   Red = failed

Better:

-   [x] Completed
-   ⚠ Payment pending
-   ! Payment failed

Icons and text should reinforce status.

------------------------------------------------------------------------

# 185. Internationalization Readiness

Even if English is the initial language, UI architecture should avoid
hard-coding text in ways that make later localization difficult.

Text should be centralized appropriately.

Potential future languages can be evaluated later.

------------------------------------------------------------------------

# 186. Date and Time

Dates and times should be understandable to Zimbabwean users.

Prefer clear representations such as:

> Today · 14:00

or:

> Friday, 14 August · 14:00

Avoid ambiguous date formats.

The final date/time localization should follow the platform conventions.

------------------------------------------------------------------------

# 187. Distance

Distance should be easy to understand.

Examples:

> 800 m away

> 1.4 km away

Avoid excessive decimal precision.

Do not display:

> 1.43728 km

unless technically required.

------------------------------------------------------------------------

# 188. ETA

ETA should be presented as an estimate.

Example:

> ETA: 30 min

Do not promise:

> Arrives exactly at 14:30

unless the system can support that level of certainty.

------------------------------------------------------------------------

# 189. Worker Availability and Distance

Availability and distance should be treated as decision-support
information.

Do not imply:

> Online = guaranteed available for this job.

The UI should explain meaningful status where necessary.

------------------------------------------------------------------------

# 190. Customer Budget

A customer budget should be presented as:

> Budget: USD 20

not:

> Price: USD 20

unless the customer has actually agreed to a final price.

This distinction matters because workers submit bids.

------------------------------------------------------------------------

# 191. Bid Price

A worker's submitted amount can be presented as:

> Bid: USD 25

After selection:

> Agreed price: USD 25

The interface should distinguish proposed prices from confirmed prices.

------------------------------------------------------------------------

# 192. Transaction Language

Use clear lifecycle terminology:

``` text
Budget
↓
Bid
↓
Agreed Price
↓
Payment
↓
Completed
```

Do not call all of these "price."

------------------------------------------------------------------------

# 193. Job Status Language

User-facing language should be human.

Instead of:

`BIDDING_OPEN`

show:

**Receiving bids**

Instead of:

`WORKER_ASSIGNED`

show:

**Worker selected**

Instead of:

`JOB_IN_PROGRESS`

show:

**Work in progress**

Backend state names may remain technical.

------------------------------------------------------------------------

# 194. Trust and Safety Copy

Safety copy should be calm, not alarmist.

Example:

> For your safety, GRAFT verifies workers before they can access certain
> marketplace features.

Avoid repeatedly reminding users that other people may be dangerous.

Trust should feel built into the product.

------------------------------------------------------------------------

# 195. Privacy Copy

Privacy explanations should be short.

Example:

> Your exact location is only shared when needed to complete the job.

The final privacy wording requires legal review.

------------------------------------------------------------------------

# 196. Visual Density

The mobile interface should generally prefer:

-   One strong primary action.
-   Short sections.
-   Scannable cards.
-   Clear whitespace.
-   Limited simultaneous choices.

The web interface can support more density where comparison or
administration requires it.

------------------------------------------------------------------------

# 197. Information Priority

When space is limited, prioritize:

### Customer

1.  Job status
2.  Worker/bid information
3.  Price
4.  Trust
5.  Distance/ETA
6.  Next action

### Worker

1.  Job relevance
2.  Location/distance
3.  Time
4.  Job requirements
5.  Budget
6.  Next action

------------------------------------------------------------------------

# 198. Visual Hierarchy Rule

A screen should have:

``` text
ONE primary message
ONE primary action
A small number of secondary actions
```

Avoid five buttons competing for attention.

------------------------------------------------------------------------

# 199. Mobile Bottom Navigation

If bottom navigation is used, it should remain stable.

Customer example:

``` text
Home | Jobs | Notifications | Profile
```

Worker example:

``` text
Home | Jobs | My Work | Profile
```

The final structure should be validated against actual navigation depth.

------------------------------------------------------------------------

# 200. Navigation Depth

Avoid forcing users through unnecessary nested menus.

A common task should generally be reachable within a small number of
taps.

The exact target tap count should be validated through usability testing
rather than treated as an absolute rule.

------------------------------------------------------------------------

# 201. Back Behaviour

Back should feel predictable.

If a user is inside a form:

-   Back returns to the previous form step where appropriate.

If a modal is open:

-   Back closes the modal first.

If the user is on a top-level screen:

-   Back follows platform navigation conventions.

------------------------------------------------------------------------

# 202. Deep Linking

Notifications and web URLs should be able to open the relevant product
object where supported.

Examples:

-   Job URL → Job details
-   Bid notification → Bid list
-   Payment notification → Payment/job status

Authentication should be handled safely before exposing protected
information.

------------------------------------------------------------------------

# 203. Web URL Design

Public URLs should be understandable where appropriate.

Potential conceptual:

``` text
/jobs/[id]
/workers/[id]
/categories/[slug]
```

Exact URL architecture belongs to technical implementation.

Protected information must remain access-controlled.

------------------------------------------------------------------------

# 204. SEO Consideration

The public web experience may eventually benefit from search-friendly
pages for legitimate public content.

However, private customer jobs, personal information and sensitive
worker information should not be indexed by default.

The UX/UI specification should not override privacy requirements.

------------------------------------------------------------------------

# 205. Error Recovery

Every important failure should have a recovery path.

Examples:

``` text
Failed to load
→ Retry

Failed photo upload
→ Retry / Remove

Failed bid
→ Check status / Retry

Payment uncertain
→ Check status

KYC rejected
→ Review / Resubmit

Location unavailable
→ Manual location
```

------------------------------------------------------------------------

# 206. Confirmation Requirements

Use confirmation before actions that are:

-   Financial
-   Irreversible
-   Potentially disruptive
-   Safety-related

Examples:

-   Choose worker
-   Pay
-   Cancel
-   Delete
-   Block
-   Report
-   Confirm completion

------------------------------------------------------------------------

# 207. Avoid Confirmation Fatigue

Do not ask for confirmation on every small action.

Example:

No confirmation needed for:

-   Opening a job
-   Selecting a filter
-   Viewing a profile

Confirmation appropriate for:

-   Paying
-   Cancelling
-   Blocking
-   Selecting a worker

------------------------------------------------------------------------

# 208. UX for Slow Operations

For long-running operations:

Show:

``` text
Processing...

This may take a moment.
```

Where progress is known, show progress.

Where progress is unknown, show honest indeterminate loading.

Never fake progress percentages.

------------------------------------------------------------------------

# 209. Data Synchronization UX

If local data is temporarily stale:

-   Preserve usability.
-   Refresh when appropriate.
-   Avoid silently overwriting user changes.
-   Show updated state after successful synchronization.

The technical synchronization strategy is a later engineering decision.

------------------------------------------------------------------------

# 210. Product Quality Gates

A feature should not be considered UX-complete until it has:

### Functional

-   Primary flow works.

### Visual

-   Matches design system.

### Responsive

-   Works across target screen sizes.

### Accessibility

-   Important controls are accessible.

### Performance

-   Reasonable on target devices.

### Network

-   Handles slow/offline conditions.

### Error

-   Failure states are designed.

### Trust

-   Sensitive information is protected.

------------------------------------------------------------------------

# 211. Design Review Checklist

Before approving a screen:

``` text
[ ] Does the user know where they are?
[ ] Does the user know what to do?
[ ] Is the primary action obvious?
[ ] Is important information prioritized?
[ ] Is the wording clear?
[ ] Is the screen visually consistent?
[ ] Does it work on small screens?
[ ] Does it work with poor connectivity?
[ ] Are empty/error/loading states handled?
[ ] Is privacy respected?
[ ] Are trust signals accurate?
[ ] Are buttons and controls accessible?
```

------------------------------------------------------------------------

# 212. MVP Design Scope

The UX/UI system should focus first on proving the transaction loop.

Priority:

``` text
Authentication
      ↓
Customer Job Creation
      ↓
Worker Discovery
      ↓
Bidding
      ↓
Worker Selection
      ↓
Payment
      ↓
Active Job
      ↓
Completion
      ↓
Ratings
```

Trust, notifications, KYC, disputes and admin tooling support this loop.

Do not allow secondary features to consume disproportionate design and
engineering effort.

------------------------------------------------------------------------

# 213. What UX/UI Must NOT Become

The interface should not turn GRAFT into:

-   A social network
-   A classifieds site
-   A generic freelancer platform
-   A corporate job board
-   A payment wallet
-   A cleaning-only app
-   A directory of phone numbers
-   A visually heavy entertainment app

The core identity remains:

> **Local task marketplace + trusted workers + bidding + location +
> structured transaction.**

------------------------------------------------------------------------

# 214. Product Personality

GRAFT should feel:

**Practical**

It helps users solve real problems.

**Trustworthy**

It takes identity and safety seriously.

**Accessible**

It works for ordinary users and affordable devices.

**Local**

It understands Zimbabwean realities.

**Efficient**

It helps users complete jobs without unnecessary friction.

**Professional**

It provides structure that informal channels often lack.

------------------------------------------------------------------------

# 215. Visual Design Direction Summary

The desired visual result is:

``` text
Clean
  +
Trustworthy
  +
Modern
  +
Local
  +
Lightweight
  +
Practical
```

Not:

``` text
Complex
  +
Over-animated
  +
Data-heavy
  +
Generic
  +
Decorative
```

The product should look polished because the system is consistent, not
because it is visually overloaded.

------------------------------------------------------------------------

# 216. Design Tokens --- Required

Before high-fidelity implementation, the project should centralize:

``` text
Colors
Typography
Spacing
Radii
Elevation
Icon sizes
Touch targets
Button heights
Input heights
Breakpoints
Animation durations
```

Exact values should be established in the approved design system.

Engineering should not scatter raw values throughout the application
unnecessarily.

------------------------------------------------------------------------

# 217. Component Library --- Required

The MVP should have reusable components for at least:

-   Primary button
-   Secondary button
-   Text field
-   Phone input
-   Currency input
-   Category selector
-   Job card
-   Bid card
-   Worker card
-   Verification badge
-   Rating
-   Status badge
-   Loading state
-   Empty state
-   Error state
-   Confirmation dialog
-   Bottom sheet
-   Snackbar
-   Navigation
-   Profile header
-   Map/list toggle

------------------------------------------------------------------------

# 218. Design QA

Before a screen is accepted, compare the implemented interface against
the approved design.

Check:

-   Spacing
-   Typography
-   Component states
-   Alignment
-   Content
-   Interaction
-   Responsive behaviour
-   Accessibility
-   Loading
-   Error
-   Empty
-   Offline

Do not approve a screen because it is "close enough" if the difference
affects usability or consistency.

------------------------------------------------------------------------

# 219. Device Testing

Testing should include, where possible:

### Android

-   Small screen
-   Medium screen
-   Larger screen
-   Low RAM device
-   Slow network

### Web

-   Mobile browser
-   Tablet
-   Laptop
-   Desktop

The product should remain functional and readable.

------------------------------------------------------------------------

# 220. UX Performance Testing

Evaluate:

-   App startup
-   Screen transitions
-   Job list loading
-   Map loading
-   Image loading
-   Bid loading
-   Profile loading
-   Payment state updates
-   Notification opening

The goal is not benchmark perfection.

The goal is a product that feels responsive under realistic Zimbabwean
conditions.

------------------------------------------------------------------------

# 221. Low-Bandwidth Acceptance Criteria

The MVP should:

-   Avoid unnecessary large assets.
-   Compress user images.
-   Avoid unnecessary repeated requests.
-   Preserve safe user input during connection loss.
-   Provide retries.
-   Avoid duplicate transactions.
-   Show connection state where useful.
-   Remain usable without continuous map refresh.
-   Provide list alternatives to map-heavy experiences.

------------------------------------------------------------------------

# 222. Trust Acceptance Criteria

The UI should:

-   Clearly display relevant verification.
-   Distinguish verification types.
-   Show ratings and completed jobs.
-   Avoid unsupported trust claims.
-   Protect sensitive information.
-   Provide reporting.
-   Provide blocking where required.
-   Make disputes accessible.
-   Avoid exposing exact locations unnecessarily.

------------------------------------------------------------------------

# 223. Marketplace Acceptance Criteria

The interface should allow the core transaction to be understood as:

``` text
Need a job
↓
Post it
↓
Receive bids
↓
Compare
↓
Choose
↓
Pay
↓
Get job done
↓
Confirm
↓
Rate
```

A first-time user should be able to understand this journey without
reading documentation.

------------------------------------------------------------------------

# 224. Professional UX Acceptance Criteria

A screen is professionally designed when:

-   The hierarchy is immediately understandable.
-   The interface is visually consistent.
-   The copy is concise.
-   The primary action is obvious.
-   Trust information is easy to evaluate.
-   Errors are recoverable.
-   Loading is communicated.
-   Empty states are useful.
-   Mobile interaction is comfortable.
-   Accessibility is considered.
-   The screen performs well on target hardware.
-   The visual style is coherent with the rest of GRAFT.

------------------------------------------------------------------------

# 225. Open Design Decisions

The following remain decisions to finalize before high-fidelity design
is considered locked.

## Brand

-   Final logo usage
-   Brand colour palette
-   Typography
-   Icon style
-   Illustration style

## Navigation

-   Exact customer navigation
-   Exact worker navigation
-   Role switching behaviour

## Maps

-   Map provider
-   Map styling
-   Location privacy
-   Tracking behaviour

## KYC

-   Exact verification levels
-   Badge hierarchy
-   Provider-specific states

## Payment

-   EcoCash integration
-   Payment UX
-   Fees
-   Refunds
-   Settlement

## Ratings

-   Exact rating model
-   Review visibility
-   Review moderation

## Launch Categories

-   Initial categories
-   Category hierarchy
-   Category icons

## Launch Geography

-   Initial city
-   Service radius

These should be resolved before treating the visual design system as
permanently final.

------------------------------------------------------------------------

# 226. Recommended Design Sequence

The product should move through:

``` text
USER FLOWS
     ↓
INFORMATION ARCHITECTURE
     ↓
LOW-FIDELITY WIREFRAMES
     ↓
DESIGN SYSTEM
     ↓
HIGH-FIDELITY SCREENS
     ↓
INTERACTIVE PROTOTYPE
     ↓
USABILITY REVIEW
     ↓
IMPLEMENTATION
     ↓
DEVICE TESTING
     ↓
ITERATION
```

Do not jump directly from business requirements to dozens of
high-fidelity screens without first validating the flows.

------------------------------------------------------------------------

# 227. Implementation Relationship

The documents now have distinct responsibilities:

``` text
BUSINESS_REQUIREMENTS.md
        ↓
Why the product exists
What the business requires
        ↓
USER_FLOWS.md
        ↓
How users move through the product
        ↓
UX_UI_REQUIREMENTS.md
        ↓
How those journeys should behave and feel
        ↓
MVP IMPLEMENTATION
        ↓
Flutter + React/Next.js
```

This separation should be maintained.

------------------------------------------------------------------------

# 228. Engineering Rule

Claude Code or any engineering agent should not invent major UX
behaviour when the product documents already define it.

If a requirement is ambiguous:

1.  Identify the ambiguity.
2.  Check the relevant product document.
3.  Check Open Questions.
4.  Ask for a decision or use an explicitly marked recommendation.
5.  Do not silently create a permanent product rule.

This prevents implementation from becoming the source of product
decisions.

------------------------------------------------------------------------

# 229. UX/UI Rule for MVP

The MVP should be polished, but not over-designed.

Prioritize:

1.  Core transaction clarity.
2.  Trust.
3.  Speed.
4.  Low-bandwidth performance.
5.  Accessibility.
6.  Consistency.
7.  Strong states.
8.  Professional visual hierarchy.

Do not prioritize:

-   Decorative complexity
-   Advanced animation
-   Large content systems
-   AI features
-   Social features
-   Unnecessary personalization

------------------------------------------------------------------------

# 230. Final UX/UI Principle

GRAFT should feel like a product built for real people solving real
problems.

A customer should be able to open GRAFT and immediately think:

> **"I can post this job here."**

A worker should be able to open GRAFT and immediately think:

> **"There are jobs here that I can do."**

Before a transaction, both should think:

> **"I have enough information to trust this person."**

During a transaction:

> **"I know exactly what is happening."**

After a transaction:

> **"That was simple, structured and accountable."**

That is the UX standard for GRAFT.

------------------------------------------------------------------------

# 231. Final Acceptance Checklist

Before the GRAFT MVP is considered UX/UI ready, confirm:

## Product

-   [ ] Business Requirements remain the source of business truth.
-   [ ] User Flows remain the source of journey truth.
-   [ ] UX/UI Requirements define interaction and visual behaviour.
-   [ ] Open Questions have been reviewed.

## Customer

-   [ ] Customer can understand the product immediately.
-   [ ] Customer can post a job.
-   [ ] Customer can provide location.
-   [ ] Customer can receive and compare bids.
-   [ ] Customer can evaluate worker trust signals.
-   [ ] Customer can choose a worker.
-   [ ] Customer can understand payment.
-   [ ] Customer can track job progress.
-   [ ] Customer can confirm completion.
-   [ ] Customer can rate/report.

## Worker

-   [ ] Worker can understand the opportunity.
-   [ ] Worker can create a useful profile.
-   [ ] Worker can select skills.
-   [ ] Worker can complete verification.
-   [ ] Worker can discover relevant nearby jobs.
-   [ ] Worker can understand job requirements.
-   [ ] Worker can submit a bid.
-   [ ] Worker knows whether the bid was accepted.
-   [ ] Worker can manage active work.
-   [ ] Worker can understand payment.
-   [ ] Worker can complete/rate/report.

## Trust

-   [ ] Verification is understandable.
-   [ ] Sensitive information is protected.
-   [ ] Reporting is accessible.
-   [ ] Blocking is supported where required.
-   [ ] Disputes have a clear entry point.

## Performance

-   [ ] Low-end Android is considered.
-   [ ] Slow networks are considered.
-   [ ] Offline states exist where needed.
-   [ ] Images are optimized.
-   [ ] Maps are used efficiently.
-   [ ] Duplicate actions are prevented.

## Accessibility

-   [ ] Text is readable.
-   [ ] Contrast is sufficient.
-   [ ] Controls are accessible.
-   [ ] Status is not communicated by colour alone.
-   [ ] Screen-reader considerations exist.
-   [ ] Reduced motion is considered.

## Visual Quality

-   [ ] Design tokens are centralized.
-   [ ] Components are reusable.
-   [ ] Typography is consistent.
-   [ ] Spacing is consistent.
-   [ ] Buttons are consistent.
-   [ ] Cards are consistent.
-   [ ] Status badges are consistent.
-   [ ] Loading states are consistent.
-   [ ] Empty states are consistent.
-   [ ] Error states are consistent.

------------------------------------------------------------------------

# 232. Document Status

**Phase:** 1 --- UX/UI Foundation\
**Status:** Product Foundation / Ready to Guide MVP Design and
Implementation\
**Primary Mobile:** Flutter / Dart\
**Primary Web:** React + Next.js\
**Payment Rail:** EcoCash\
**Market:** Zimbabwe\
**Core Marketplace:** Local task marketplace + trusted workers +
bidding + location + structured transaction

**Companion Documents:**

-   `PRODUCT_VISION.md`
-   `BUSINESS_REQUIREMENTS.md`
-   `USER_PERSONAS.md`
-   `OPEN_QUESTIONS.md`
-   `MVP_SCOPE.md`
-   `USER_FLOWS.md`

**Next Step:** MVP implementation planning / Batch 2

**Important:** Open business, legal, KYC, payment, geographic and brand
decisions must remain explicitly identified as unresolved until
validated.
