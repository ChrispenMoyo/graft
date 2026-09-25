# User Flows Document

## GRAFT --- Zimbabwe Local Jobs Marketplace

**Document:** `USER_FLOWS.md`\
**Version:** 1.0\
**Status:** Product Foundation / Phase 1\
**Product Type:** Zimbabwe-focused two-sided local services marketplace\
**Primary Platforms:** Mobile App + Web App\
**Primary Mobile Technology:** Flutter\
**Primary Web Technology:** React + Next.js\
**Primary Payment Rail:** EcoCash\
**Primary Market:** Zimbabwe

------------------------------------------------------------------------

# 1. Document Purpose

This document defines the intended user journeys and interaction flows
for GRAFT.

GRAFT is a two-sided marketplace connecting:

-   Customers who need small jobs completed.
-   Workers who have skills and want nearby work.

The central marketplace interaction is:

> A customer needs a job done. Nearby suitable workers see the
> opportunity, submit bids, and the customer chooses who to hire.

This document translates the business requirements into practical user
journeys that can later guide:

-   UX/UI design
-   Product requirements
-   Application navigation
-   Flutter mobile implementation
-   React/Next.js web implementation
-   Backend/API design
-   QA and acceptance testing

This document is intentionally focused on **user behaviour and product
flow**, not technical implementation.

------------------------------------------------------------------------

# 2. Source of Truth

The flows in this document are derived primarily from the GRAFT Business
Requirements Document and the established GRAFT product foundation.

The Business Requirements define the core model:

-   Customer-posted jobs
-   Nearby worker discovery
-   Worker bidding
-   Customer worker selection
-   Worker verification
-   Location awareness
-   Job tracking
-   Ratings
-   EcoCash-based payment
-   Trust and safety
-   Low-bandwidth operation

Where the Business Requirements identify an item as an open question,
this document does not treat an unresolved implementation detail as a
final business decision.

Where a flow requires a decision that has not yet been finalized, the
flow is marked as a **Decision Required** or **Validation Required**
item.

------------------------------------------------------------------------

# 3. Product Experience Principles

All flows should follow these principles.

## 3.1 Simple

A user should understand what to do next without needing instructions.

## 3.2 Local

The experience should feel designed for Zimbabwe rather than being a
generic global marketplace with Zimbabwe added later.

## 3.3 Trustworthy

Trust must be visible throughout the journey, particularly before a user
hires or meets another person.

## 3.4 Fast

The shortest practical path should be used for common tasks.

## 3.5 Low Bandwidth

Flows should continue to behave sensibly when connectivity is slow or
temporarily unavailable.

## 3.6 Transparent

Users should understand:

-   What is happening.
-   What they are paying.
-   What the other party knows.
-   What happens next.

## 3.7 User Control

Customers should generally retain control over worker selection rather
than being forced into an automatic match.

## 3.8 Safety First

Location, identity and communication information should only be exposed
when necessary.

------------------------------------------------------------------------

# 4. Primary Actors

GRAFT has three primary product roles.

## 4.1 Customer

A person who needs a job completed.

Examples:

-   Homeowner
-   Tenant
-   Property manager
-   Landlord
-   Small business owner
-   Office manager
-   Individual customer

Primary goal:

> Get a legitimate small job completed by a suitable and trusted worker.

------------------------------------------------------------------------

## 4.2 Worker

A person who can perform a legitimate service and wants access to nearby
work.

Examples:

-   Plumber
-   Electrician
-   Gardener
-   Painter
-   Welder
-   Carpenter
-   Builder
-   Cleaner
-   Mechanic
-   Technician
-   Mover
-   General labourer
-   Other service provider

Primary goal:

> Find suitable nearby work, win jobs, complete them successfully, and
> build a trusted reputation.

------------------------------------------------------------------------

## 4.3 Admin

A platform operator responsible for:

-   User management
-   KYC review
-   Trust and safety
-   Job moderation
-   Payment monitoring
-   Dispute handling
-   Marketplace management
-   Platform configuration

Primary goal:

> Keep the marketplace safe, liquid, trustworthy and operational.

------------------------------------------------------------------------

# 5. Platform Flow Strategy

GRAFT has two primary client experiences.

``` text
                    GRAFT
                      |
             +--------+--------+
             |                 |
          MOBILE              WEB
             |                 |
       Flutter/Dart       React/Next.js
             |                 |
             +--------+--------+
                      |
                Shared Product
                   Behaviour
                      |
                  Backend/API
```

The same business journey should remain conceptually consistent across
platforms even where the UI differs.

The mobile application is the primary user experience for the
marketplace.

The web application should support the same core marketplace concepts
and provide appropriate browser-based experiences.

------------------------------------------------------------------------

# 6. High-Level Marketplace Journey

The fundamental GRAFT transaction is:

``` text
Customer needs a job
        ↓
Create job
        ↓
Set category
        ↓
Describe task
        ↓
Set location
        ↓
Set preferred time
        ↓
Publish job
        ↓
Suitable nearby workers discover job
        ↓
Workers review job
        ↓
Workers submit bids
        ↓
Customer compares bids
        ↓
Customer selects worker
        ↓
Price is confirmed
        ↓
EcoCash payment flow
        ↓
Worker travels to job
        ↓
Job starts
        ↓
Work is completed
        ↓
Customer confirms completion
        ↓
Payment is completed/released
        ↓
Both parties rate each other
        ↓
Job becomes part of reputation/history
```

This is the core journey the MVP must ultimately prove.

------------------------------------------------------------------------

# 7. First-Launch Flow

## 7.1 User Opens GRAFT

### Goal

Immediately communicate what GRAFT does.

### User should understand

-   This is a marketplace for local jobs.
-   They can hire someone.
-   They can find work.

### Primary actions

**Need a job done?**

**Looking for work?**

### Secondary action

Sign in / create account.

------------------------------------------------------------------------

## 7.2 Welcome Experience

The first-use experience should not overwhelm the user with a long
tutorial.

Suggested messaging:

> Need a job done?

Post a task and find suitable people nearby.

> Looking for work?

Find jobs near you and bid for work that matches your skills.

The user should be able to proceed quickly.

------------------------------------------------------------------------

# 8. Account Entry Flow

## 8.1 Sign Up

Conceptual flow:

``` text
Welcome
   ↓
Choose Customer or Worker
   ↓
Enter phone number
   ↓
Verify phone
   ↓
Create basic profile
   ↓
Continue to product
```

The exact authentication mechanism is expected to use phone
verification/OTP, but the final provider and technical implementation
are separate decisions.

------------------------------------------------------------------------

## 8.2 Phone Number Entry

The product should support Zimbabwean phone numbers.

The user should be guided toward the `+263` format.

The experience should avoid forcing users to understand international
formatting.

Example:

``` text
Phone number

+263 77 123 4567

[ Continue ]
```

The exact formatting and validation behaviour should be defined in UX/UI
requirements.

------------------------------------------------------------------------

## 8.3 OTP Verification

Conceptual flow:

``` text
Enter phone
   ↓
Receive OTP
   ↓
Enter OTP
   ↓
Verified
   ↓
Continue
```

Possible states:

-   OTP sent
-   OTP entered
-   OTP incorrect
-   OTP expired
-   Resend available
-   Network failure
-   Too many attempts

The user should always know what to do next.

------------------------------------------------------------------------

# 9. Customer Onboarding Flow

## 9.1 Customer Entry

``` text
Choose "Need a job done?"
        ↓
Phone verification
        ↓
Basic profile
        ↓
Location permission / location setup
        ↓
Customer home
```

Only information necessary to begin using the marketplace should be
required upfront.

------------------------------------------------------------------------

## 9.2 Customer Profile Setup

Potential information:

-   Name
-   Phone number
-   Profile photo, optional
-   Preferred location / saved address

The exact required fields remain a product decision.

The customer should not be forced through unnecessary onboarding before
seeing value.

------------------------------------------------------------------------

# 10. Worker Onboarding Flow

Worker onboarding requires more trust-related information than customer
onboarding.

## 10.1 Basic Flow

``` text
Choose "Looking for work?"
        ↓
Phone verification
        ↓
Basic profile
        ↓
Select skills/categories
        ↓
Set service area
        ↓
Set availability
        ↓
Begin KYC
        ↓
Verification status
        ↓
Worker home
```

------------------------------------------------------------------------

## 10.2 Worker Profile Setup

Potential information:

-   Name
-   Profile photo
-   Phone number
-   Skills
-   Categories
-   Experience
-   Service area
-   Availability
-   Portfolio/examples where relevant

The worker should understand why each important field is being
requested.

------------------------------------------------------------------------

# 11. Worker KYC Flow

KYC is a core trust requirement.

## 11.1 Conceptual Flow

``` text
Worker profile
        ↓
Verification
        ↓
Identity information
        ↓
Identity document
        ↓
Selfie / face verification where applicable
        ↓
Submit
        ↓
Verification pending
        ↓
Review
        ↓
Verified / Rejected / Additional information required
```

The exact KYC provider, document processing, legal requirements and
storage rules require validation.

------------------------------------------------------------------------

## 11.2 Verification States

Workers may have:

``` text
UNVERIFIED
     ↓
PENDING
     ↓
VERIFIED
```

Alternative outcomes:

``` text
PENDING
   ↓
REJECTED
   ↓
RESUBMIT
```

Possible additional state:

``` text
VERIFIED
   ↓
SUSPENDED
```

------------------------------------------------------------------------

## 11.3 KYC UX Principle

The worker should always know:

-   Why verification matters.
-   What is required.
-   What has been submitted.
-   Whether review is in progress.
-   What happens if verification fails.

Do not expose sensitive identity information unnecessarily.

------------------------------------------------------------------------

# 12. EcoCash Verification Flow

The Business Requirements identify EcoCash verification as part of the
trust model.

Conceptual flow:

``` text
Worker profile
      ↓
EcoCash verification
      ↓
Enter EcoCash details
      ↓
Verification process
      ↓
Verified / Failed
```

The exact technical process is **Validation Required** because available
EcoCash capabilities and integration requirements must be confirmed.

The product should not pretend that verification is successful when it
has not been confirmed.

------------------------------------------------------------------------

# 13. Customer Home Flow

The customer home screen should answer:

> What do you need done?

Primary action:

**Post a Job**

Secondary content may include:

-   Active jobs
-   Recent jobs
-   Nearby service categories
-   Suggested actions
-   Notifications

The home screen should remain lightweight.

------------------------------------------------------------------------

# 14. Worker Home Flow

The worker home screen should answer:

> What work is available near you?

Primary content:

-   Nearby relevant jobs
-   Distance
-   Category
-   Job summary
-   Budget if available
-   Time requirement
-   Verification/trust context where relevant

Primary action:

**View Nearby Jobs**

The worker should also be able to control availability/online status
where this becomes part of the product.

------------------------------------------------------------------------

# 15. Customer --- Post a Job Flow

This is one of the most important flows.

## 15.1 Entry

``` text
Customer Home
      ↓
Post a Job
```

------------------------------------------------------------------------

## 15.2 Step 1 --- What Do You Need?

Customer selects a category.

Examples:

-   Plumbing
-   Electrical
-   Gardening
-   Cleaning
-   Painting
-   Moving
-   Handyman
-   Other

The category system must remain expandable.

------------------------------------------------------------------------

## 15.3 Step 2 --- Describe the Job

Customer provides:

-   Job title
-   Description
-   Relevant details

Example:

> Fix leaking kitchen tap.

Additional details:

> Tap has been leaking since yesterday. Water is coming from the base.

The product should encourage useful information without forcing
excessive form completion.

------------------------------------------------------------------------

# 16. Job Photos

Photos are optional.

Conceptual flow:

``` text
Describe job
      ↓
Add photos? 
      ↓
Take photo / choose photo / Skip
```

The app should compress images appropriately.

The user should not be blocked from posting a job merely because they do
not have a photo.

Because bandwidth is a core requirement, image uploads must be handled
carefully.

------------------------------------------------------------------------

# 17. Job Location Flow

Location is a core marketplace feature.

Conceptual flow:

``` text
Job details
      ↓
Set location
      ↓
Use current location
OR
Select location manually
      ↓
Confirm location
```

Possible location states:

-   Permission granted
-   Permission denied
-   Location unavailable
-   GPS unavailable
-   Network location unavailable
-   Manual location selected

The user should have a practical fallback when automatic location fails.

------------------------------------------------------------------------

# 18. Job Location Privacy

The platform should avoid unnecessarily exposing precise location
information.

Before a worker is selected, the marketplace may show:

-   Approximate distance
-   Area/suburb
-   General location

After a worker is selected, the exact job location can be shared
according to the product's privacy rules.

The final privacy model requires UX and legal validation.

------------------------------------------------------------------------

# 19. Preferred Date and Time

Customer provides when the job should happen.

Conceptual flow:

``` text
When do you need it?
      ↓
Today
Tomorrow
Scheduled date
      ↓
Preferred time
```

The exact scheduling model remains to be finalized.

The flow should not make scheduling unnecessarily complicated for simple
jobs.

------------------------------------------------------------------------

# 20. Budget / Pricing Flow

The Business Requirements support:

-   Customer budget
-   Request for bids
-   Worker proposed price

The MVP should prioritize bidding.

Conceptual flow:

``` text
Pricing preference
      ↓
Optional customer budget
      ↓
Publish job
```

The user should understand that:

> A budget is not necessarily the final agreed price.

The worker's bid may differ.

------------------------------------------------------------------------

# 21. Job Review Before Publishing

Before publication, show a summary.

Example:

``` text
Review Job

Plumbing
Fix leaking kitchen tap

Today
14:00–16:00

George
Approximate location shown

Budget: USD 20

[ Edit ]
[ Post Job ]
```

The customer should have an opportunity to correct mistakes.

------------------------------------------------------------------------

# 22. Publish Job Flow

``` text
Review
   ↓
Post Job
   ↓
Posting...
   ↓
Job Posted
   ↓
Workers can respond
```

If the network fails:

``` text
Posting...
   ↓
Connection failed
   ↓
Retry
```

The app must avoid creating duplicate jobs when the user retries.

------------------------------------------------------------------------

# 23. Posted Job State

Once posted, the customer should see:

-   Job title
-   Category
-   Status
-   Location area
-   Time
-   Bid count
-   Relevant workers/bids
-   Actions available

Initial state:

``` text
POSTED / BIDDING
```

------------------------------------------------------------------------

# 24. Worker Job Discovery Flow

Worker journey:

``` text
Worker Home
      ↓
Nearby Jobs
      ↓
Job list
      ↓
Select job
      ↓
Job details
```

The job list should prioritize relevance.

Potential ranking factors:

-   Skill match
-   Distance
-   Availability
-   Timing
-   Service area

The exact algorithm is a later technical/product decision.

------------------------------------------------------------------------

# 25. Worker Job Card

A job card should quickly communicate:

-   Category
-   Job title
-   Approximate distance
-   Location area
-   Preferred time
-   Budget if provided
-   Time posted
-   Relevant details

Example:

``` text
Plumbing

Fix leaking kitchen tap

1.4 km away
Today · 14:00

Budget: USD 20

[ View Job ]
```

------------------------------------------------------------------------

# 26. Worker Job Details Flow

When the worker opens a job:

``` text
Job title
Category
Description
Area
Approximate distance
Preferred time
Budget
Photos if available
Customer trust information where appropriate

[ Submit Bid ]
```

The worker should have enough information to decide whether the job is
suitable before bidding.

------------------------------------------------------------------------

# 27. Worker Bid Flow

Worker selects:

**Submit Bid**

Then provides:

-   Proposed price
-   Estimated arrival time
-   Short message
-   Relevant experience if applicable

Conceptual flow:

``` text
Job Details
     ↓
Submit Bid
     ↓
Price
     ↓
ETA
     ↓
Message
     ↓
Review
     ↓
Submit
```

------------------------------------------------------------------------

# 28. Bid Review

Worker should see:

``` text
Your Bid

Price: USD 25
ETA: 45 minutes

Message:
"I can repair the tap today."

[ Submit Bid ]
```

After submission:

``` text
Bid submitted
     ↓
Waiting for customer
```

The worker should not assume the job is won.

------------------------------------------------------------------------

# 29. Customer Bid Arrival

Customer receives:

``` text
New bid received
```

The customer should be able to open the job and see available bids.

Potential information:

-   Worker name
-   Profile photo
-   Verification
-   Rating
-   Completed jobs
-   Distance
-   ETA
-   Price
-   Worker message
-   Skills

------------------------------------------------------------------------

# 30. Bid Comparison Flow

The customer should be able to compare offers without opening many
unrelated screens.

Conceptual comparison:

``` text
Job
 |
 +-- Worker A
 |   $20
 |   1.2 km
 |   4.8★
 |   Verified
 |
 +-- Worker B
 |   $25
 |   0.8 km
 |   4.6★
 |   Verified
 |
 +-- Worker C
     $18
     3.1 km
     4.2★
     Verified
```

The closest worker should not automatically win.

The customer should make the final selection.

------------------------------------------------------------------------

# 31. Worker Profile From Bid

The customer should be able to inspect the worker before selecting them.

Potential information:

-   Name
-   Photo
-   Skills
-   Verification
-   Rating
-   Completed jobs
-   Reviews
-   Experience
-   Service area

The customer should not receive unnecessary private information.

------------------------------------------------------------------------

# 32. Customer Selects Worker

Conceptual flow:

``` text
Compare bids
      ↓
Open worker
      ↓
Choose worker
      ↓
Confirm selection
```

Confirmation should clearly communicate:

-   Worker selected
-   Agreed price
-   Job details
-   Next step

The exact payment timing must be validated against EcoCash capabilities.

------------------------------------------------------------------------

# 33. Worker Selection Notification

Worker receives:

> Your bid was accepted.

The worker should see:

-   Job details
-   Agreed price
-   Customer/job location information appropriate for the current stage
-   Required next action

Other bidding workers should eventually receive a suitable status such
as:

> The customer selected another worker.

The wording should be respectful and avoid creating unnecessary
frustration.

------------------------------------------------------------------------

# 34. Payment Flow

The Business Requirements describe a preferred conceptual flow:

``` text
Worker selected
      ↓
Price confirmed
      ↓
Customer pays through EcoCash
      ↓
Payment verified
      ↓
Job begins
      ↓
Job completed
      ↓
Customer confirms
      ↓
Payment released/settled
```

However, the exact implementation is **Validation Required**.

The platform must first establish what EcoCash technically and legally
supports.

The UI should therefore be designed around payment states rather than
assuming a specific integration mechanism.

------------------------------------------------------------------------

# 35. Payment States

Potential states:

``` text
PAYMENT_PENDING
PAYMENT_PROCESSING
PAYMENT_CONFIRMED
PAYMENT_FAILED
PAYMENT_CANCELLED
REFUND_PENDING
REFUNDED
PAYMENT_DISPUTED
```

The final state machine requires technical/payment validation.

------------------------------------------------------------------------

# 36. Worker En Route Flow

After the required payment/confirmation state:

``` text
Worker selected
      ↓
Worker prepares
      ↓
Worker en route
      ↓
Customer sees job status
```

Potential status:

**Worker is on the way**

Where live location is implemented, the user may see appropriate
location information.

Live tracking should not be assumed to be available until the relevant
technical/privacy requirements are validated.

------------------------------------------------------------------------

# 37. Job Start Flow

When the worker arrives:

``` text
Worker arrives
      ↓
Worker starts job
      ↓
Job status = WORK STARTED
```

The customer should be able to see that the job has started.

Potential worker action:

**Start Job**

The product should avoid allowing a worker to accidentally mark a job
started before they are ready.

------------------------------------------------------------------------

# 38. Job In Progress Flow

During the job:

Customer sees:

-   Worker
-   Job
-   Current status
-   Agreed price
-   Relevant communication/action controls
-   Safety/reporting options where appropriate

Worker sees:

-   Job details
-   Customer/job location
-   Agreed price
-   Job status
-   Completion action

------------------------------------------------------------------------

# 39. Job Completion Flow

Worker completes the work.

``` text
Work completed
      ↓
Worker marks complete
      ↓
Customer notified
      ↓
Customer reviews result
```

Worker action:

**Mark Job Complete**

This should not automatically erase the customer's ability to report an
issue.

------------------------------------------------------------------------

# 40. Customer Completion Confirmation

Customer sees:

> Worker marked this job as complete.

Actions:

**Confirm Completion**

or an appropriate issue/dispute action.

Potential outcomes:

``` text
CONFIRMED
    ↓
COMPLETED
```

or

``` text
ISSUE
  ↓
DISPUTE / SUPPORT
```

------------------------------------------------------------------------

# 41. Payment Completion

Once the required completion conditions are satisfied:

``` text
Customer confirms
      ↓
Payment released/settled
      ↓
Transaction completed
```

The exact settlement mechanism depends on EcoCash integration
capabilities and must be validated.

------------------------------------------------------------------------

# 42. Ratings Flow

After completion:

``` text
Job Completed
      ↓
Rate Worker
      ↓
Stars
      ↓
Optional feedback
      ↓
Submit
```

Workers should also eventually be able to rate customers.

------------------------------------------------------------------------

# 43. Rating Experience

The MVP should remain simple.

Potential:

``` text
How was your experience?

★★★★★

Optional:
What went well?
```

Potential dimensions may include:

-   Quality
-   Professionalism
-   Punctuality
-   Communication
-   Value

The exact rating model is a product decision to finalize.

------------------------------------------------------------------------

# 44. Review Submission

After submission:

``` text
Rating submitted
      ↓
Job history updated
```

The user should not be forced to write a review if they do not want to.

------------------------------------------------------------------------

# 45. Job History Flow

Both users should eventually have access to job history.

## Customer

``` text
Profile
  ↓
My Jobs
  ↓
Past Jobs
  ↓
Job Details
```

## Worker

``` text
Profile
  ↓
My Work
  ↓
Completed Jobs
  ↓
Job Details
```

History can contribute to:

-   Reputation
-   Completed-job count
-   Financial history
-   Repeat work

------------------------------------------------------------------------

# 46. Customer Active Jobs

Customer should be able to see:

-   Posted jobs
-   Jobs receiving bids
-   Worker selected
-   Active jobs
-   Completed jobs
-   Cancelled jobs
-   Disputed jobs

------------------------------------------------------------------------

# 47. Worker Active Jobs

Worker should be able to see:

-   Available jobs
-   Submitted bids
-   Accepted jobs
-   Active jobs
-   Completed jobs
-   Cancelled jobs
-   Disputed jobs

------------------------------------------------------------------------

# 48. Job Cancellation Flow

Cancellation must be handled explicitly.

Conceptual flow:

``` text
Job
 ↓
Cancel
 ↓
Select reason
 ↓
Confirm
 ↓
Cancellation processed
```

Potential reasons:

-   No longer needed
-   Worker unavailable
-   Customer unavailable
-   Price disagreement
-   Emergency
-   Other

The exact cancellation rules and penalties require product/business
definition.

------------------------------------------------------------------------

# 49. Worker Cancellation

Potential flow:

``` text
Accepted Job
      ↓
Cancel
      ↓
Reason
      ↓
Confirm
```

The platform should consider:

-   Customer notification
-   Worker reliability metrics
-   Potential reassignment
-   Payment implications
-   Dispute implications

------------------------------------------------------------------------

# 50. Customer Cancellation

Potential flow:

``` text
Active/Posted Job
      ↓
Cancel
      ↓
Reason
      ↓
Confirm
```

The product should communicate any applicable consequences before final
confirmation.

------------------------------------------------------------------------

# 51. Job Expiration

A job may expire if:

-   The requested time passes.
-   The customer no longer needs it.
-   No worker is selected within an appropriate period.

The exact expiration rules require validation.

Potential state:

``` text
BIDDING
   ↓
EXPIRED
```

The customer should be told why the job is no longer active.

------------------------------------------------------------------------

# 52. No-Show Flow

A worker may fail to arrive.

Potential customer flow:

``` text
Worker expected
      ↓
Worker does not arrive
      ↓
Customer reports no-show
      ↓
Platform records incident
      ↓
Support/dispute process
```

Worker may also report:

> Customer unavailable.

The final no-show rules and evidence requirements require product and
operational definition.

------------------------------------------------------------------------

# 53. Dispute Flow

Disputes are important because the marketplace involves real people,
real jobs and real money.

Conceptual flow:

``` text
Problem
  ↓
Report issue
  ↓
Select reason
  ↓
Provide details
  ↓
Attach evidence where appropriate
  ↓
Submit
  ↓
Dispute opened
  ↓
Platform review
  ↓
Resolution
```

Potential evidence:

-   Photos
-   Messages
-   Payment records
-   Job information
-   Timestamps
-   Relevant location information

The exact resolution policy requires operational/legal definition.

------------------------------------------------------------------------

# 54. Trust & Safety Reporting Flow

Users should be able to report:

-   Suspicious behaviour
-   Fraud
-   Harassment
-   Unsafe behaviour
-   Prohibited services
-   Fake profiles
-   Payment problems
-   Abuse
-   No-show
-   Other issues

Conceptual flow:

``` text
Profile / Job
      ↓
Report
      ↓
Choose reason
      ↓
Describe issue
      ↓
Submit
      ↓
Confirmation
```

The reporting flow should be accessible without making it easy to abuse
the system.

------------------------------------------------------------------------

# 55. Block User Flow

Where appropriate:

``` text
User profile
      ↓
Block
      ↓
Confirm
      ↓
User blocked
```

Blocking should affect future interactions according to platform rules.

------------------------------------------------------------------------

# 56. Worker Availability Flow

Workers need a way to communicate whether they are available.

Potential states:

``` text
ONLINE / AVAILABLE
OFFLINE / UNAVAILABLE
```

Potential worker flow:

``` text
Worker Home
      ↓
Availability
      ↓
Go Online
      ↓
Receive relevant opportunities
```

The final matching/availability implementation is a later
technical/product decision.

------------------------------------------------------------------------

# 57. Service Area Flow

Workers should define where they are willing to work.

Conceptual flow:

``` text
Worker Profile
      ↓
Service Area
      ↓
Current/general location
      ↓
Choose radius or areas
      ↓
Save
```

This supports targeted job matching.

The exact radius controls require product definition.

------------------------------------------------------------------------

# 58. Notifications Flow

Notifications should communicate meaningful events.

## Worker notifications

Examples:

-   New nearby job
-   Bid accepted
-   Bid rejected
-   Job updated
-   Job cancelled
-   Payment update
-   Reminder

## Customer notifications

Examples:

-   Job posted
-   New bid
-   Worker selected
-   Payment update
-   Worker en route
-   Job started
-   Job completed
-   Dispute update

Notifications should not become excessive.

------------------------------------------------------------------------

# 59. Notification Interaction

A notification should take the user directly to the relevant object.

Example:

``` text
Notification:
"3 workers have bid on your plumbing job."

Tap
 ↓
Job Details
 ↓
Bids
```

Do not send users to a generic home screen when the notification
contains a specific actionable event.

------------------------------------------------------------------------

# 60. Offline / Connection-Loss Flow

GRAFT must assume that network conditions can be unreliable.

## If connection is lost

The app should:

-   Communicate the problem clearly.
-   Preserve user-entered information where practical.
-   Allow retry.
-   Avoid duplicate actions.
-   Show the last known state where safe.

Example:

``` text
No internet connection

Your job details are saved on this device.

[ Try Again ]
```

The exact offline-storage model is a technical decision.

------------------------------------------------------------------------

# 61. Failed Job Posting

``` text
Customer submits job
      ↓
Network fails
      ↓
Posting not confirmed
      ↓
Show retry
```

The app must distinguish:

**Request failed**

from:

**Job definitely posted**

This is especially important where duplicate jobs could be created.

------------------------------------------------------------------------

# 62. Failed Bid Submission

``` text
Worker submits bid
      ↓
Network failure
      ↓
Bid status unknown
```

The system should verify whether the bid was actually created before
allowing a second submission.

The user should not accidentally submit duplicate bids.

------------------------------------------------------------------------

# 63. Failed Payment Flow

Potential flow:

``` text
Payment initiated
      ↓
Payment fails / times out
      ↓
Show payment status
      ↓
Retry / verify status
```

The product should never tell a customer:

> Payment failed.

if the actual payment status is unknown.

Where payment status is uncertain, the user should be instructed to
verify rather than repeatedly paying.

------------------------------------------------------------------------

# 64. Location Permission Flow

When location is required:

``` text
Feature requires location
      ↓
Explain why
      ↓
Request permission
```

If denied:

``` text
Permission denied
      ↓
Offer manual location
```

Do not permanently block the user from the application simply because
GPS permission was denied.

------------------------------------------------------------------------

# 65. Camera / Photo Permission Flow

Where photos are useful:

``` text
Add photo
      ↓
Explain purpose if needed
      ↓
Camera/gallery permission
      ↓
Capture/select
      ↓
Compress
      ↓
Preview
      ↓
Upload
```

The user should be able to remove a selected image before submission.

------------------------------------------------------------------------

# 66. Profile Management Flow

Both customers and workers should be able to manage their profiles.

Conceptual:

``` text
Profile
 ↓
Edit Profile
 ↓
Update details
 ↓
Save
```

Worker profiles contain additional information such as:

-   Skills
-   Categories
-   Service area
-   Verification
-   Availability

------------------------------------------------------------------------

# 67. Worker Reputation Flow

A worker should be able to see:

-   Rating
-   Completed jobs
-   Reviews
-   Verification status
-   Work history

This creates a digital reputation that can help workers win future jobs.

------------------------------------------------------------------------

# 68. Customer Reputation Flow

Customers may also have a reputation profile.

Potential information:

-   Rating
-   Completed jobs
-   Account verification
-   History

The exact customer-facing reputation model requires product definition.

------------------------------------------------------------------------

# 69. Search and Discovery

The marketplace should eventually support discovery through:

-   Category
-   Distance
-   Availability
-   Price
-   Rating
-   Verification
-   Service area

However, the MVP should avoid unnecessary search complexity if
location-based job discovery already provides sufficient value.

------------------------------------------------------------------------

# 70. Customer Journey --- Happy Path

The primary customer happy path is:

``` text
Open GRAFT
   ↓
Sign in
   ↓
Customer Home
   ↓
Post a Job
   ↓
Select Category
   ↓
Describe Job
   ↓
Add Location
   ↓
Select Time
   ↓
Optional Budget
   ↓
Review
   ↓
Publish
   ↓
Receive Bids
   ↓
Compare Workers
   ↓
Select Worker
   ↓
Confirm Price
   ↓
EcoCash Payment Flow
   ↓
Worker En Route
   ↓
Job Started
   ↓
Job Completed
   ↓
Confirm Completion
   ↓
Payment Completed
   ↓
Rate Worker
   ↓
Done
```

------------------------------------------------------------------------

# 71. Worker Journey --- Happy Path

The primary worker happy path is:

``` text
Open GRAFT
   ↓
Sign in
   ↓
Worker Home
   ↓
Verified Profile
   ↓
Nearby Jobs
   ↓
Open Job
   ↓
Review Details
   ↓
Submit Bid
   ↓
Wait
   ↓
Bid Accepted
   ↓
Confirm Job
   ↓
EcoCash/payment status
   ↓
Travel to Customer
   ↓
Start Job
   ↓
Complete Job
   ↓
Customer Confirms
   ↓
Payment Completed
   ↓
Rate Customer
   ↓
Done
```

------------------------------------------------------------------------

# 72. Worker Rejection Journey

``` text
Worker submits bid
      ↓
Customer selects another worker
      ↓
Worker receives update
      ↓
Worker returns to nearby jobs
```

The experience should avoid making rejection feel punitive.

The worker should be encouraged to continue finding relevant
opportunities.

------------------------------------------------------------------------

# 73. Customer No-Bid Journey

A customer may post a job and receive no bids.

``` text
Job Posted
      ↓
No bids
      ↓
Customer notified
      ↓
Suggested actions
```

Potential actions:

-   Wait longer
-   Adjust job details
-   Adjust budget
-   Expand service area where appropriate
-   Repost

The exact recommendations require product validation.

The user should not simply encounter an empty screen.

------------------------------------------------------------------------

# 74. Worker No-Job Journey

A worker may have no nearby jobs.

``` text
Nearby Jobs
      ↓
No suitable jobs
```

The experience should explain:

> No suitable jobs nearby right now.

Potential actions:

-   Expand service area
-   Update skills
-   Check later
-   Improve profile
-   Review availability

The worker should not be made to think the app is broken.

------------------------------------------------------------------------

# 75. Customer Trust Journey

Trust should be visible before selection.

``` text
Customer receives bid
      ↓
Worker verification
      ↓
Worker rating
      ↓
Completed jobs
      ↓
Skills
      ↓
Reviews
      ↓
Distance / ETA
      ↓
Customer decides
```

The platform should make relevant trust signals easy to compare.

------------------------------------------------------------------------

# 76. Worker Trust Journey

Workers also need to trust customers.

``` text
Worker receives job
      ↓
Review customer/job information
      ↓
Location context
      ↓
Customer reputation where available
      ↓
Job requirements
      ↓
Decide whether to bid
```

The platform should avoid treating workers merely as supply.

Both sides are marketplace participants whose safety matters.

------------------------------------------------------------------------

# 77. Admin --- User Management Flow

Admin journey:

``` text
Admin Login
      ↓
Dashboard
      ↓
Users
      ↓
Search/filter
      ↓
Open user
      ↓
View account
      ↓
View verification
      ↓
View job/payment/report history
      ↓
Take permitted action
```

Potential actions:

-   Suspend
-   Restrict
-   Verify
-   Reject verification
-   Review report

Administrative permissions must be controlled.

------------------------------------------------------------------------

# 78. Admin --- KYC Review Flow

``` text
Admin Dashboard
      ↓
KYC Queue
      ↓
Pending Worker
      ↓
Review submitted information
      ↓
Approve
OR
Reject
OR
Request more information
```

All verification decisions should be auditable.

------------------------------------------------------------------------

# 79. Admin --- Dispute Flow

``` text
Admin Dashboard
      ↓
Disputes
      ↓
Open dispute
      ↓
Review job
      ↓
Review users
      ↓
Review payment
      ↓
Review evidence
      ↓
Make decision
      ↓
Record resolution
      ↓
Notify relevant users
```

The exact dispute policy must be defined operationally.

------------------------------------------------------------------------

# 80. Admin --- Job Moderation Flow

``` text
Admin
  ↓
Jobs
  ↓
Flagged / reported job
  ↓
Review
  ↓
Allow
OR
Remove
OR
Suspend
OR
Investigate
```

Prohibited jobs should be handled according to platform policy.

------------------------------------------------------------------------

# 81. Admin --- Payment Monitoring Flow

``` text
Admin
  ↓
Payments
  ↓
Transaction
  ↓
Review status
  ↓
Investigate failure/dispute
```

The admin system should not expose more payment information than
necessary.

------------------------------------------------------------------------

# 82. Navigation Model

## Customer

Suggested conceptual navigation:

``` text
Home
Jobs
Notifications
Profile
```

Where:

-   Home = primary action/discovery
-   Jobs = active/history
-   Notifications = marketplace events
-   Profile = account/settings

------------------------------------------------------------------------

## Worker

Suggested conceptual navigation:

``` text
Home
Nearby Jobs
My Work
Notifications
Profile
```

The final navigation structure should be validated during UX/UI design.

------------------------------------------------------------------------

# 83. Shared Account States

A user may encounter:

``` text
NEW
ACTIVE
VERIFICATION_PENDING
VERIFIED
SUSPENDED
RESTRICTED
DEACTIVATED
```

The exact state model is technical and operational work.

The UX should always communicate what the user can and cannot do.

------------------------------------------------------------------------

# 84. Session Flow

Conceptual:

``` text
Open app
   ↓
Check existing session
   ↓
Authenticated?
  / \
Yes  No
 |    |
Home Login
```

If a session expires:

``` text
Session expired
      ↓
Sign in again
```

The app should preserve safe local state where practical.

------------------------------------------------------------------------

# 85. Error Handling Principles

Errors should be:

-   Understandable
-   Actionable
-   Honest
-   Brief

Avoid:

> Error 500.

Prefer:

> We couldn't load your jobs. Check your connection and try again.

Actions:

**Try Again**

or

**Go Back**

------------------------------------------------------------------------

# 86. Empty-State Principles

Every important list needs a useful empty state.

Examples:

### Customer --- No jobs

> You haven't posted any jobs yet.

**Post Your First Job**

### Worker --- No nearby jobs

> No suitable jobs nearby right now.

**Update Your Skills**

### Customer --- No bids

> No workers have bid yet.

**We'll notify you when someone responds.**

### Worker --- No completed jobs

> Your completed jobs will appear here.

Empty states should help the user understand what happens next.

------------------------------------------------------------------------

# 87. Loading-State Principles

Loading should communicate that the application is working.

Examples:

-   Job list skeleton
-   Bid loading state
-   Profile loading state
-   Payment processing state

Avoid unnecessary full-screen loading where only a small component is
loading.

------------------------------------------------------------------------

# 88. Data-Saving Principle

Because connectivity can fail, forms should avoid unnecessary data loss.

Potentially important forms include:

-   Job creation
-   Worker bid
-   Profile editing
-   KYC submission

The exact persistence strategy is a technical decision.

------------------------------------------------------------------------

# 89. Safety-Critical Interaction Principles

For actions involving:

-   Payment
-   Job acceptance
-   Worker selection
-   Cancellation
-   Dispute submission
-   Account suspension

The UI should provide clear confirmation.

Example:

``` text
Choose this worker?

Agreed price: USD 25

This will select the worker for this job.

[ Cancel ]
[ Confirm Worker ]
```

Avoid ambiguous one-tap destructive actions.

------------------------------------------------------------------------

# 90. Payment Confirmation Principle

Before a user confirms payment, show:

-   Amount
-   Currency
-   Job
-   Worker
-   Relevant fee information
-   Payment method

The user should understand exactly what they are confirming.

------------------------------------------------------------------------

# 91. Privacy Principles

The product should minimize unnecessary exposure of:

-   Exact home addresses
-   Phone numbers
-   Personal identity information
-   Live location
-   Payment details

Information should be disclosed progressively according to the job
lifecycle.

------------------------------------------------------------------------

# 92. Progressive Disclosure

GRAFT should not show every possible piece of information at once.

Example:

### Before bidding

Show:

-   Approximate area
-   Distance
-   Job details
-   Time
-   Budget

### After worker selection

Show the information necessary to perform the job.

### During active job

Show the information necessary for coordination and safety.

This reduces clutter and protects privacy.

------------------------------------------------------------------------

# 93. Cross-Platform Consistency

The Flutter mobile app and React/Next.js web app should share the same
product concepts:

-   User roles
-   Jobs
-   Bids
-   Worker profiles
-   Verification
-   Payment states
-   Job statuses
-   Ratings
-   Disputes

However, the layouts do not need to be identical.

Mobile should prioritize:

-   One-handed use
-   Compact navigation
-   Fast actions

Web can prioritize:

-   Wider comparisons
-   Tables/lists
-   Larger maps
-   Administrative workflows
-   More information density where appropriate

------------------------------------------------------------------------

# 94. MVP Flow Boundaries

The following flows are core to the MVP:

-   Account creation
-   Phone verification
-   Customer onboarding
-   Worker onboarding
-   Worker verification/KYC
-   Customer job creation
-   Job location
-   Job publishing
-   Worker job discovery
-   Worker bidding
-   Customer bid comparison
-   Worker selection
-   Job lifecycle
-   EcoCash payment flow
-   Completion
-   Ratings
-   Basic trust/safety reporting
-   Notifications
-   Basic history

The following should not be allowed to distract from the core
marketplace transaction:

-   Advanced AI
-   Complex social features
-   Extensive gamification
-   Large content systems
-   Unnecessary subscriptions
-   Advanced analytics for end users
-   Feature-heavy dashboards

------------------------------------------------------------------------

# 95. Post-MVP Flow Candidates

Potential future flows include:

-   Repeat booking
-   Favourite workers
-   Recurring jobs
-   Worker portfolio
-   Advanced worker recommendations
-   AI-assisted job creation
-   AI price guidance
-   Business accounts
-   Contractor teams
-   Worker subscriptions
-   Promoted listings
-   Advanced analytics
-   Referral programmes
-   Training/certification partnerships

These should be evaluated after the core marketplace is proven.

------------------------------------------------------------------------

# 96. Flow Acceptance Criteria

The GRAFT user-flow system should eventually satisfy the following:

## Customer

-   A new customer understands the two-sided marketplace.
-   A customer can create a job through a simple flow.
-   A customer can provide useful job details.
-   A customer can specify location.
-   A customer can receive worker bids.
-   A customer can compare workers.
-   A customer can choose a worker.
-   A customer can understand payment status.
-   A customer can track job progress.
-   A customer can confirm completion.
-   A customer can rate the worker.
-   A customer can report problems.

## Worker

-   A new worker understands how GRAFT creates work opportunities.
-   A worker can create a useful profile.
-   A worker can identify required skills.
-   A worker can complete verification.
-   A worker can discover relevant nearby jobs.
-   A worker can understand job requirements.
-   A worker can submit a bid.
-   A worker knows whether a bid was accepted.
-   A worker can manage accepted jobs.
-   A worker can complete a job.
-   A worker can understand payment status.
-   A worker can rate the customer.
-   A worker can report safety/issues.

## Platform

-   Admins can review KYC.
-   Admins can review reports.
-   Admins can investigate disputes.
-   Admins can monitor jobs.
-   Admins can monitor payments.
-   Platform actions are auditable.

------------------------------------------------------------------------

# 97. Open Flow Decisions

The following must be finalized before the corresponding implementation
is considered complete.

## Authentication

-   OTP provider
-   OTP expiry
-   Resend limits
-   Account recovery
-   Multiple roles per phone number

## KYC

-   Exact provider
-   Required documents
-   Verification levels
-   Manual vs automated review
-   Data retention

## EcoCash

-   Payment API
-   Merchant model
-   Payment confirmation
-   Settlement
-   Refunds
-   Fees
-   Limits

## Location

-   Map provider
-   Exact privacy model
-   Location update frequency
-   Background tracking
-   Service-radius controls

## Bidding

-   Bid expiry
-   Number of bids
-   Bid editing
-   Bid withdrawal
-   Customer response time

## Job Lifecycle

-   Exact statuses
-   Cancellation rules
-   No-show rules
-   Completion confirmation window
-   Dispute window

## Ratings

-   One-way vs two-way release timing
-   Review visibility
-   Rating manipulation protection

## Notifications

-   Push provider
-   SMS fallback
-   Notification frequency
-   User notification controls

------------------------------------------------------------------------

# 98. Recommended UX Design Sequence

Before detailed implementation, UX/UI work should proceed in this order:

``` text
User Flows
    ↓
Information Architecture
    ↓
Low-Fidelity Wireframes
    ↓
High-Fidelity UI
    ↓
Interactive Prototype
    ↓
Usability Review
    ↓
Implementation
    ↓
Device Testing
```

This prevents engineering from locking in poorly understood flows.

------------------------------------------------------------------------

# 99. Core Product Loop

Everything should ultimately support this loop:

``` text
CUSTOMER
Needs a job
    ↓
POSTS JOB
    ↓
MARKETPLACE
Finds suitable nearby workers
    ↓
WORKERS
Submit bids
    ↓
CUSTOMER
Chooses trusted worker
    ↓
PAYMENT
EcoCash
    ↓
WORKER
Completes job
    ↓
CUSTOMER
Confirms
    ↓
REPUTATION
Both parties rate
    ↓
TRUST
Better future matching
```

This loop is the heart of GRAFT.

------------------------------------------------------------------------

# 100. Final Product Flow Principle

GRAFT should make the following customer question easy to answer:

> **"I need something done. Who nearby can do it, can I trust them, what
> will they charge, and can I safely get the job completed?"**

And it should make the worker question equally easy:

> **"I have a skill. Where can I find someone nearby who needs it and
> pay me fairly?"**

If these two journeys are simple, trustworthy and reliable, the core
GRAFT product is working.

------------------------------------------------------------------------

## Document Status

**Phase:** 1 --- User Flow Foundation\
**Status:** Draft / Product Foundation\
**Primary Mobile:** Flutter\
**Primary Web:** React + Next.js\
**Payment Rail:** EcoCash\
**Market:** Zimbabwe\
**Next Document:** `UX_UI_REQUIREMENTS.md`\
**Implementation:** User flows define behaviour; they do not replace
technical architecture or visual design specifications.
