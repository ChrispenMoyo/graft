# MVP SCOPE

## GRAFT

**Document:** `mvp_scope.md`  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Product:** GRAFT  
**Primary Market:** Zimbabwe  
**Product Type:** Two-sided hyperlocal services marketplace  
**Platforms:** Mobile App + Web App  
**Admin Platform:** Required  
**Payment Direction:** EcoCash only, subject to capability validation  
**Status:** Initial MVP Scope Definition  

---

## 1. PURPOSE

This document defines the strict Minimum Viable Product (MVP) scope for GRAFT.

The purpose is to answer one question:

> What is the minimum product GRAFT must build to prove that its core marketplace can work?

The MVP separates features into:

1. **MUST HAVE — MVP**
2. **SHOULD HAVE — Post-MVP**
3. **FUTURE / ADVANCED**

The core GRAFT transaction loop is:

```text
CUSTOMER HAS A NEED
        ↓
CUSTOMER CREATES A JOB
        ↓
GRAFT IDENTIFIES RELEVANT WORKERS
        ↓
SUITABLE WORKERS DISCOVER THE JOB
        ↓
WORKERS SUBMIT BIDS
        ↓
CUSTOMER COMPARES OPTIONS
        ↓
CUSTOMER SELECTS A WORKER
        ↓
PRICE IS CONFIRMED
        ↓
VALIDATED ECOCASH PAYMENT FLOW
        ↓
WORK IS PERFORMED
        ↓
CUSTOMER CONFIRMS COMPLETION OR DISPUTES
        ↓
PAYMENT COMPLETES / SETTLES
        ↓
BOTH PARTIES BUILD REPUTATION
```

The MVP is successful only if this loop can be tested with real marketplace users.

---

## 2. THE MVP HYPOTHESIS

> If customers can easily post legitimate small jobs, suitable nearby workers can discover those jobs and submit meaningful bids, customers can compare trusted options and choose a worker, and the job can move through a structured path to completion and payment, then GRAFT can create meaningful marketplace value in Zimbabwe.

### Customer-side hypothesis

Customers will use GRAFT when it gives them a more structured way to find, compare, and hire suitable workers than relying only on referrals, WhatsApp, Facebook, or informal networks.

### Worker-side hypothesis

Workers will join and actively use GRAFT when it gives their skills access to genuine nearby opportunities and a way to build reputation through completed work.

### Marketplace hypothesis

A focused geographic market can produce enough relevant supply and demand for jobs to receive useful bids and move toward successful completion.

---

## 3. CORE MVP QUESTION

> Can GRAFT safely and reliably match a customer with a trusted nearby worker, allow them to agree on a price, complete the job, and facilitate payment?

If a feature does not materially help answer this question, it should usually not be included in the MVP.

---

## 4. MVP PRINCIPLE

Minimum does **not** mean incomplete.

The MVP must not ignore:

- Trust
- Payment failures
- Safety
- Disputes
- Poor connectivity
- Worker verification
- Marketplace operations

The correct approach is:

> Reduce feature breadth, not the integrity of the core marketplace loop.

---

# 5. MUST HAVE — MVP

## 5.1 Accounts and Access

GRAFT must support two primary marketplace roles:

- Customer
- Worker

### Customers must be able to:

- Register
- Verify the required contact method
- Access their account
- Manage basic profile information
- Post and manage jobs
- View bids
- Select workers
- Track active jobs
- View payment status
- Rate workers
- Report or block users

### Workers must be able to:

- Register
- Verify the required contact method
- Complete worker onboarding
- Create a worker profile
- Select skills and service categories
- Define a service area
- Indicate availability
- Discover relevant jobs
- Submit and manage bids
- Manage active jobs
- View payment status
- Rate customers
- Report or block users

Phone verification is a core MVP trust and account-access requirement.

---

## 5.2 Customer Profile

The customer profile should remain simple.

It should support:

- Identity/account association
- Contact
- Basic marketplace history
- Ratings where applicable

Customers should not be forced through complex onboarding before posting their first job.

---

## 5.3 Worker Onboarding and Profile

The worker profile is a major GRAFT trust surface.

The MVP should support:

- Profile photo
- Display name
- Skills
- Service categories
- Service area
- Approximate location where appropriate
- Availability
- Experience summary
- Rating
- Number of completed jobs
- Relevant verification badges

The worker profile should help customers answer:

> Who is this person, what can they do, and what evidence exists that they are suitable and trustworthy?

---

## 5.4 Skills and Service Categories

Workers must identify the legitimate services they can provide.

Potential launch categories may include:

- Plumbing
- Electrical
- Gardening
- Cleaning
- Painting
- General repairs
- Moving and labour
- Basic carpentry
- Basic welding

The final launch categories should be validated using:

- Customer demand
- Worker supply
- Operational complexity
- Safety risk
- Frequency of small jobs
- Ability to verify appropriate skills where necessary

GRAFT should launch with a focused set of validated categories rather than every imaginable service.

---

## 5.5 Worker Service Area and Availability

Workers need to define where they can reasonably work.

The MVP should support:

- Service area
- Relevant geographic coverage
- Availability status
- Ability to become unavailable

The MVP does not require a complex calendar system.

Simple availability controls are sufficient for the first release.

---

## 5.6 KYC and Identity Direction

Trust is a first-class GRAFT requirement.

The MVP should establish an appropriate worker verification process, potentially involving:

- Phone verification
- Identity information
- Zimbabwe National ID or other valid identity information where legally and operationally appropriate
- Selfie or identity confirmation where feasible
- Manual/admin review where required
- EcoCash-related verification where feasible and validated

### REQUIRES LEGAL / PROFESSIONAL VERIFICATION

The following must be validated:

- Applicable Zimbabwean KYC requirements
- Whether identity documents can legally be collected and stored
- Identity data retention requirements
- Biometric/selfie processing requirements
- Data protection requirements
- Operational review responsibilities

A tiered verification approach is recommended rather than demanding every possible document from every worker on day one.

---

## 5.7 EcoCash Verification Direction

The Phase 1 direction is:

> EcoCash only for the initial payment strategy.

Before implementation, GRAFT must validate:

- Available APIs
- Merchant requirements
- Payment initiation
- Payment confirmation
- Transaction references
- Refund capabilities
- Settlement capabilities
- Payout mechanisms
- Fees
- Limits
- Compliance requirements
- Marketplace-specific restrictions

The payment architecture must not assume unsupported capabilities.

---

## 5.8 Job Creation

Customers must be able to create legitimate jobs through a lightweight flow.

Minimum job information:

- Job title
- Service category
- Job description
- Job location
- Preferred date/time or timing preference
- Optional photos
- Optional budget or pricing preference

Example:

```text
JOB:
Need a plumber to fix leaking kitchen tap

CATEGORY:
Plumbing

LOCATION:
Customer-selected location

TIME:
Today, 14:00–16:00

PHOTOS:
Optional

BUDGET:
Optional
```

---

## 5.9 Job Location and Privacy

Location is a core GRAFT marketplace input.

The MVP should support:

- Customer-selected job location
- Location used to determine worker relevance
- Worker/job distance where useful
- Appropriate privacy controls
- Accurate enough information for an accepted job

GRAFT should follow this principle:

> Reveal only the location information necessary for the current stage of the marketplace transaction.

Before worker selection, approximate distance or area information may be sufficient.

---

## 5.10 Optional Job Photos

Customers should be able to add photos where they help workers understand the task.

Photos must remain optional.

MVP requirements include:

- Appropriate image compression
- Reasonable image limits
- Upload progress
- Clear failure handling
- Retry support

---

## 5.11 Targeted Job Discovery and Matching

GRAFT should not send every job to every worker.

The MVP matching logic should consider:

1. Skill/category relevance
2. Worker service area
3. Availability
4. Distance
5. Appropriate verification eligibility

The principle is:

> Skill relevance comes before simple proximity.

A transparent rules-based matching approach is sufficient for the MVP. Advanced AI matching belongs later.

---

## 5.12 Nearby Matching

Conceptually:

```text
CUSTOMER POSTS JOB
        ↓
GRAFT FINDS WORKERS WITH RELEVANT SKILLS
        ↓
FILTER BY SERVICE AREA / AVAILABILITY
        ↓
CONSIDER DISTANCE
        ↓
CHECK APPROPRIATE VERIFICATION ELIGIBILITY
        ↓
RELEVANT WORKERS DISCOVER THE JOB
```

---

## 5.13 Bidding

Bidding is a central MVP mechanism.

A worker should be able to submit a meaningful bid containing:

- Proposed price
- Estimated arrival time or availability
- Short message

Recommended MVP approach:

- Jobs open for bids
- Relevant workers submit bids
- Customers review bids
- Customers select a suitable worker according to final rules
- Workers do not need competitors' detailed bid information
- The lowest bid is not automatically the best bid

---

## 5.14 Bid Comparison

Customers should compare meaningful factors:

| Factor | Customer Question |
|---|---|
| Price | What will this worker charge? |
| ETA / availability | When can they perform the job? |
| Distance | How practical is the worker's location? |
| Rating | What feedback exists? |
| Completed jobs | What GRAFT history exists? |
| Verification | What trust checks are complete? |
| Skills | Is the worker relevant to the task? |

The customer retains control over selection.

---

## 5.15 Worker Selection

The customer must be able to select a worker.

After selection, GRAFT must clearly communicate:

- Selected worker
- Agreed price
- Current job status
- Required next action
- Payment state

Workers who were not selected must also have an appropriate outcome.

---

## 5.16 Job Lifecycle and Status

GRAFT needs a clear job lifecycle.

Conceptual states:

```text
DRAFT
↓
POSTED
↓
BIDDING
↓
WORKER SELECTED
↓
PAYMENT PENDING
↓
PAYMENT CONFIRMED
↓
WORKER EN ROUTE
↓
WORK STARTED
↓
WORK COMPLETED
↓
CUSTOMER CONFIRMED
↓
PAYMENT RELEASED / SETTLED
↓
COMPLETED
```

Alternative states include:

```text
CANCELLED
EXPIRED
PAYMENT FAILED
DISPUTED
NO-SHOW
SUSPENDED
FRAUD REVIEW
```

The exact technical state machine belongs in later requirements and architecture work.

---

## 5.17 Active Job Progress

Both parties must understand the current job stage.

The MVP should support simple status updates such as:

- Worker selected
- Payment pending/confirmed
- Worker en route where applicable
- Work started
- Work completed
- Customer confirmation required
- Disputed
- Completed

A complex project-management system is not required.

---

## 5.18 Completion Confirmation

The customer must be able to confirm that work was completed.

The MVP must distinguish between:

- Worker claims completion
- Customer confirms completion
- Customer disputes the result

A basic dispute path is therefore required.

---

## 5.19 EcoCash Payment Flow

The intended MVP payment direction is:

# ECOCASH ONLY

Conceptually:

```text
CUSTOMER SELECTS WORKER
        ↓
PRICE IS CONFIRMED
        ↓
CUSTOMER PAYS THROUGH VALIDATED ECOCASH FLOW
        ↓
PAYMENT STATUS IS VERIFIED
        ↓
WORK PROCEEDS
        ↓
WORK IS COMPLETED
        ↓
CUSTOMER CONFIRMS OR DISPUTES
        ↓
PAYMENT COMPLETES / SETTLES ACCORDING TO
VALIDATED ECOCASH AND GRAFT CAPABILITIES
```

GRAFT must not assume that it can:

- Hold money in escrow
- Automatically split payments
- Automatically pay workers
- Process refunds
- Delay settlement

unless those capabilities are confirmed, permitted, and integrated.

---

## 5.20 Payment Status and Transaction Record

The MVP must accurately account for:

- Payment pending
- Payment initiated
- Payment confirmed
- Payment failed
- Duplicate payment risk
- Incorrect amount
- Payment timeout
- Refund required
- Settlement pending where applicable
- Payment completed/settled

A reliable transaction record is essential.

---

## 5.21 Ratings and Reputation

The MVP should support bilateral ratings after eligible completed jobs.

Recommended model:

> Simple 1–5 star rating

Optional structured feedback:

- Quality
- Professionalism
- Communication
- Punctuality
- Value

Only users connected through eligible completed marketplace transactions should rate each other.

---

## 5.22 Reporting and Blocking

Customers and workers must be able to report concerning behaviour.

Potential report reasons include:

- Suspected fraud
- Harassment
- Unsafe behaviour
- Fake information
- Inappropriate conduct
- Other policy violations

Users should also be able to block another user where appropriate.

Blocking rules for active jobs and disputes must be defined carefully.

---

## 5.23 Basic Dispute Handling

The MVP needs a basic dispute process.

```text
USER FLAGS DISPUTE
        ↓
JOB STATE CHANGES APPROPRIATELY
        ↓
RELEVANT HISTORY REMAINS AVAILABLE
        ↓
ADMIN REVIEWS
        ↓
RESOLUTION ACTION IS RECORDED
```

A fully automated arbitration system is not required.

### REQUIRES LEGAL / PROFESSIONAL VERIFICATION

Final resolution rules require appropriate business and legal validation.

---

## 5.24 Map and Core Location Capability

The MVP should support the minimum mapping/location capability needed for:

- Job location selection
- Worker/job distance
- Relevant nearby matching
- Basic active-job location needs

The MVP does not require constant tracking of every worker.

---

## 5.25 Notifications

GRAFT requires relevant, targeted notifications.

### Worker notifications

- New relevant job opportunity
- Customer selected your bid
- Job status changed
- Payment status changed

### Customer notifications

- New bid
- Job status changed
- Worker marked work completed
- Payment status changed
- Dispute update

Notification spam should be avoided.

---

## 5.26 Low-Bandwidth and Unstable Network Behaviour

This is an MVP requirement.

GRAFT must account for:

- Slow mobile networks
- Unstable connections
- Expensive mobile data
- Affordable Android devices
- Limited RAM
- Limited storage
- Battery constraints

The MVP should prioritize:

- Lightweight screens
- Compressed images
- Minimal unnecessary requests
- Cautious GPS use
- Clear loading states
- Clear connection errors
- Retry mechanisms
- Duplicate-action protection where practical
- Local caching where appropriate

Important failures must not be falsely shown as successful.

---

## 5.27 Admin and Marketplace Operations

The MVP requires administrative capability.

Minimum admin responsibilities:

- User management
- Worker verification review
- KYC-related review where required
- Job oversight
- Reports
- Blocking/suspension
- Dispute handling
- Payment monitoring
- Basic fraud monitoring
- Category management
- Marketplace activity visibility

The admin platform does not need advanced business intelligence for MVP.

---

# 6. CORE MVP USER JOURNEYS

## Customer Journey

```text
CREATE ACCOUNT
↓
VERIFY REQUIRED CONTACT METHOD
↓
CREATE JOB
↓
SELECT CATEGORY
↓
DESCRIBE TASK
↓
ADD LOCATION
↓
ADD TIME / OPTIONAL PHOTOS
↓
POST JOB
↓
RECEIVE BIDS
↓
COMPARE WORKERS
↓
SELECT WORKER
↓
CONFIRM PRICE
↓
COMPLETE VALIDATED PAYMENT STEP
↓
TRACK JOB STATUS
↓
WORK COMPLETED
↓
CONFIRM OR DISPUTE
↓
PAYMENT COMPLETES / SETTLES
↓
RATE WORKER
```

## Worker Journey

```text
CREATE ACCOUNT
↓
VERIFY REQUIRED CONTACT METHOD
↓
COMPLETE PROFILE
↓
COMPLETE REQUIRED VERIFICATION
↓
SELECT SKILLS
↓
DEFINE SERVICE AREA
↓
SET AVAILABILITY
↓
DISCOVER RELEVANT JOB
↓
SUBMIT BID
↓
CUSTOMER SELECTS WORKER
↓
COMPLETE JOB
↓
CUSTOMER CONFIRMS OR DISPUTES
↓
PAYMENT COMPLETES / SETTLES
↓
RATE CUSTOMER
```

---

# 7. SHOULD HAVE — POST-MVP

The following should generally wait until the core transaction loop has been proven:

- Advanced worker recommendations
- Worker portfolios
- Favourite workers
- Repeat bookings
- Scheduled recurring jobs
- Saved customer addresses
- Advanced worker availability calendars
- Advanced search and filters
- Referral systems
- Promotional campaigns
- Worker achievement badges
- Improved dispute tooling
- Standardized service packages
- Advanced analytics

---

# 8. FUTURE / ADVANCED

These features are not MVP dependencies:

- AI job categorization
- AI price recommendations
- AI worker matching
- Predictive demand
- Advanced fraud detection
- Business accounts
- Contractor teams
- Worker subscriptions
- Promoted workers
- Corporate services
- Insurance partnerships
- Financing opportunities
- Skill training partnerships
- Worker certification partnerships

---

# 9. EXPLICITLY OUT OF SCOPE FOR MVP

The MVP should not require:

- AI chatbot
- AI categorization
- AI pricing
- AI matching
- Predictive demand engine
- Social feed
- Worker subscriptions
- Promoted listings
- Complex loyalty programmes
- Nationwide launch
- Dozens of categories at launch
- Corporate procurement
- Advanced recurring bookings
- Complex calendar scheduling
- Insurance integration
- Financing products
- Training marketplace
- Complex gamification
- Constant live tracking of every worker
- Multiple payment rails beyond the validated EcoCash-first direction
- Credit cards
- PayPal
- Stripe
- Cryptocurrency
- Generic wallet functionality

---

# 10. MVP LAUNCH STRATEGY

GRAFT should not launch everywhere simultaneously.

A marketplace requires local liquidity.

## Recommended direction

> Launch in one validated geographic market first.

The exact city or area remains an open validation question.

Launch selection should consider:

- Customer density
- Worker supply
- Operational ability
- Smartphone access
- Network conditions
- EcoCash feasibility
- Ability to recruit and verify initial workers

---

# 11. MVP CATEGORY STRATEGY

GRAFT should be broad by design but focused at launch.

Potential initial categories:

- Plumbing
- Electrical
- Gardening
- Cleaning
- Painting
- General repairs
- Moving/labour

The final list must be validated based on:

- Demand
- Worker supply
- Safety
- Frequency
- Pricing suitability
- Operational feasibility

---

# 12. MVP SUCCESS METRICS

The MVP should be measured by marketplace outcomes.

## Supply

- Registered workers
- Verified workers
- Active workers
- Available workers
- Jobs per active worker

## Demand

- Registered customers
- Active customers
- Jobs posted
- Jobs per active customer
- Repeat customers

## Marketplace Liquidity

- Percentage of jobs receiving at least one bid
- Average bids per job
- Average time to first bid
- Average time to worker selection
- Percentage of jobs resulting in worker selection

## Completion

- Jobs started
- Jobs completed
- Completion rate
- Cancellation rate
- No-show rate
- Dispute rate

## Trust

- Verification completion rate
- Reports per 100 jobs
- Disputes per 100 jobs
- Fraud incidents
- Repeat successful transactions

## Financial

- Gross transaction value
- Average job value
- Payment success rate
- Platform revenue

## Reliability

- Failed bid submissions
- Failed photo uploads
- Payment confirmation failures
- Duplicate transaction attempts
- Key action retry rates

---

# 13. MVP NORTH STAR METRIC

> **Successfully completed verified jobs per month**

This connects customer demand, worker supply, matching, bidding, trust, payment, and completion.

Downloads and registrations alone do not prove marketplace value.

The strongest proof is:

```text
REAL CUSTOMER NEED
+
SUITABLE WORKER
+
SUCCESSFUL COMPLETION
```

---

# 14. MVP LAUNCH CRITERIA

GRAFT should be ready for meaningful testing only when the core flow works end-to-end.

### Accounts

- Customers can register and access accounts
- Workers can register and access accounts
- Required verification can be completed

### Worker setup

- Workers define skills
- Workers define service areas
- Workers indicate availability
- Required verification can be reviewed

### Jobs

- Customers create legitimate jobs
- Locations can be added
- Photos can be added optionally
- Relevant workers discover jobs

### Bidding

- Workers submit bids
- Customers compare bids
- Customers select workers

### Job progress

- Both parties see relevant status
- Workers mark progress/completion
- Customers confirm or dispute

### Payment

- The validated EcoCash flow operates
- Payment state is recorded accurately
- Failures and exceptions are handled

### Trust

- Eligible users can rate each other
- Users can report
- Users can block where appropriate
- Admins can review relevant issues

### Reliability

- Important failures are communicated clearly
- Duplicate critical actions are reasonably controlled
- The product remains usable on poor connections

---

# 15. OPEN MVP QUESTIONS

The following remain open and must not be treated as solved.

## Launch

- Which city launches first?
- What service radius should be used?
- Which exact categories launch first?
- How many verified workers are needed before customer acquisition?

## Bidding

- How long should bidding remain open?
- Can customers select immediately?
- Can workers edit or withdraw bids?
- Should customers negotiate?
- What happens when nobody bids?

## Matching

- What exact matching radius applies?
- How should service area and distance interact?
- How should new workers receive fair exposure?

## Verification

- What exact KYC checks are feasible?
- Which checks are mandatory before bidding?
- Which checks are manual?
- What data can legally be stored?

## Payment

- What exact EcoCash APIs are available?
- Can payment be initiated from GRAFT?
- How is payment confirmed?
- Can funds be held?
- How are workers paid?
- How are refunds handled?
- What happens during disputes?
- What fees and limits apply?

## Operations

- Who reviews KYC?
- Who handles disputes?
- What response times are realistic?
- What admin actions are permitted?
- What evidence is retained?

---

# 16. REQUIRES LEGAL / PROFESSIONAL VERIFICATION

Before implementation, appropriate Zimbabwean professional verification is required for:

- KYC
- Identity document processing
- Identity data storage
- Biometric/selfie verification
- Privacy and data protection
- Location data handling
- Consumer protection
- Payment regulations
- EcoCash merchant and marketplace requirements
- Money handling
- Settlement
- Refunds
- Worker classification
- Platform liability
- Dispute resolution
- Insurance
- Prohibited services
- Data retention
- Minors and age restrictions
- Background checks

This document is a product scope document and is **not legal advice**.

---

# 17. MAJOR MVP RISKS

## Building Too Much

**Recommendation:** Protect the core transaction loop and postpone everything else.

## Launching Too Broadly

**Recommendation:** Start in one validated geographic market.

## Too Many Categories

**Recommendation:** Launch with a focused, validated subset.

## Payment Assumptions

**Recommendation:** Base payment architecture on confirmed EcoCash capabilities.

## Too Much Verification Friction

**Recommendation:** Use an appropriate validated tiered approach.

## Race to the Bottom

**Recommendation:** Show price alongside trust, ETA, skills, and reputation.

## Established Workers Dominating

**Recommendation:** Develop controlled fairness mechanisms as GRAFT matures.

## Poor Connectivity

**Recommendation:** Prioritize efficient requests, retries, clear states, and cautious location use.

---

# 18. FINAL MVP SCOPE STATEMENT

The MVP of GRAFT should build the smallest credible version of the complete marketplace transaction:

```text
IDENTIFIED CUSTOMER
        +
RELEVANT JOB
        +
APPROPRIATELY VERIFIED WORKER
        +
TARGETED DISCOVERY
        +
MEANINGFUL BID
        +
CUSTOMER CHOICE
        +
STRUCTURED JOB STATUS
        +
VALIDATED PAYMENT FLOW
        +
COMPLETION CONFIRMATION
        +
BASIC TRUST AND ACCOUNTABILITY
```

Everything in the first release should serve that outcome.

Everything else should wait until GRAFT proves that real customers and real workers can repeatedly complete legitimate marketplace jobs.

---

## DOCUMENT STATUS

**Product:** GRAFT  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Document:** `mvp_scope.md`  
**Status:** Initial MVP Scope Definition  
**Primary Market:** Zimbabwe  
**Product Type:** Two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Admin:** Required  
**Payment Direction:** EcoCash only, subject to capability validation  
**MVP Objective:** Prove the end-to-end customer-to-worker transaction loop  
**North Star Metric:** Successfully completed verified jobs per month  
**Technical Architecture:** To be defined in a later phase  
**UI/UX Screens:** To be defined in the Phase 2 PRD  
**Implementation:** Not started  
**Legal / Regulatory Areas:** Require professional verification
