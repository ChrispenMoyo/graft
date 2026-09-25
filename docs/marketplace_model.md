# MARKETPLACE MODEL

## GRAFT

**Document:** `marketplace_model.md`  
**Product Name:** GRAFT  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Document Type:** Marketplace Model Specification  
**Status:** Draft — Product Foundation  
**Primary Market:** Zimbabwe  
**Product Type:** Zimbabwe-focused two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Primary Payment Rail:** EcoCash  

---

# 1. PURPOSE OF THIS DOCUMENT

This document defines how the **GRAFT marketplace** should operate at a business and product-model level.

It establishes the fundamental marketplace mechanics that connect:

- Customers who need legitimate small jobs completed
- Workers who have practical skills and want access to work opportunities

The purpose of this document is to define:

- The two sides of the GRAFT marketplace
- How supply and demand interact
- How a customer creates demand through a job
- How suitable workers discover opportunities
- How matching should work
- How bidding should work
- How customers compare workers
- How workers are selected
- How jobs move through the marketplace
- How trust influences marketplace participation
- How location influences matching
- How new workers receive fair opportunities
- How GRAFT should avoid winner-takes-all behaviour
- How marketplace liquidity should be understood
- How failed, cancelled, disputed, expired, and reassigned jobs affect the marketplace

This document is **not a technical architecture specification**.

It does not define:

- Database schemas
- API contracts
- Exact ranking algorithms
- Exact geolocation implementation
- Exact map provider
- Exact EcoCash API integration
- Final payment architecture
- Final legal requirements
- Final automated fraud detection logic

Those areas must be defined and validated in later phases.

This document defines the **marketplace logic and operating model** that later product, UX, and engineering decisions should support.

---

# 2. THE GRAFT MARKETPLACE IN ONE SENTENCE

> **GRAFT is a two-sided Zimbabwean marketplace where customers post legitimate local jobs, suitable workers discover those opportunities and submit bids, customers compare the available options and choose who they want, and the job moves through a structured process from posting to completion.**

The fundamental interaction is:

```text
CUSTOMER NEEDS SOMETHING DONE
        ↓
CUSTOMER POSTS A JOB ON GRAFT
        ↓
GRAFT IDENTIFIES SUITABLE WORKERS
        ↓
RELEVANT WORKERS RECEIVE THE OPPORTUNITY
        ↓
WORKERS REVIEW THE JOB
        ↓
INTERESTED WORKERS SUBMIT BIDS
        ↓
CUSTOMER COMPARES AVAILABLE OPTIONS
        ↓
CUSTOMER SELECTS A WORKER
        ↓
PRICE IS CONFIRMED
        ↓
VALIDATED ECOCASH PAYMENT FLOW
        ↓
WORKER TRAVELS / ARRIVES WHERE APPLICABLE
        ↓
WORK STARTS
        ↓
WORK IS COMPLETED
        ↓
CUSTOMER CONFIRMS OR DISPUTES
        ↓
PAYMENT IS COMPLETED / SETTLED
        ↓
BOTH PARTIES BUILD REPUTATION
```

This is the core GRAFT marketplace loop.

Everything in the MVP should support this loop.

---

# 3. CORE MARKETPLACE PRINCIPLE

GRAFT is not:

- A general social network
- A traditional job board
- A corporate employment platform
- A simple directory of worker phone numbers
- A classifieds website
- A Facebook Marketplace clone
- A cleaning-only marketplace
- A generic freelancer platform
- A platform that automatically sends every job to every worker

The core GRAFT model is:

> **Local task marketplace + trusted workers + targeted matching + bidding + location + structured transaction.**

The marketplace exists to answer two connected questions.

For customers:

> **"I need something done. Who nearby can do it, can I trust them, what will they charge, and can I safely get the job completed?"**

For workers:

> **"I have a skill. Where can I find someone nearby who needs it and pay me fairly?"**

---

# 4. THE TWO SIDES OF THE GRAFT MARKETPLACE

GRAFT is a two-sided marketplace.

The two sides are:

```text
                    GRAFT
                      │
          ┌───────────┴───────────┐
          │                       │
          ▼                       ▼
      CUSTOMERS                WORKERS
          │                       │
          │                       │
          ▼                       ▼
   NEED A JOB DONE          HAVE SKILLS TO
                           PERFORM THE JOB
```

The marketplace only works when these two sides can successfully connect.

---

# 5. DEMAND SIDE — THE CUSTOMER

The customer creates marketplace demand.

A customer may be:

- A homeowner
- A tenant
- A landlord
- A property manager
- A small business owner
- An office manager
- An individual needing a legitimate service

For MVP, GRAFT should prioritize ordinary customers with practical household and small-service needs.

Examples include:

- A leaking tap needs repair
- A room needs painting
- A garden needs work
- Furniture needs moving
- A gate needs welding
- WiFi needs installation
- A car needs assistance
- A phone needs repair
- A property needs cleaning
- A small construction task requires labour

The customer enters GRAFT because they have a problem that needs to be solved.

The customer needs to move from:

> **"I have a problem."**

to:

> **"I found a suitable person, agreed on the job, and got it completed."**

---

# 6. SUPPLY SIDE — THE WORKER

The worker provides marketplace supply.

The primary GRAFT worker is an individual who can perform a legitimate service and wants access to customers.

The worker does not necessarily need to own a formal company.

Potential workers include:

- Plumbers
- Electricians
- Painters
- Gardeners
- Carpenters
- Welders
- Bricklayers
- Builders
- Cleaners
- Mechanics
- Technicians
- Phone repair specialists
- Computer repair specialists
- WiFi installers
- CCTV installers
- Solar installers
- Movers
- General labourers
- Barbers
- Hairdressers
- Photographers
- DJs
- Other legitimate service providers

GRAFT is particularly intended to create opportunities for:

- Unemployed youths
- Underemployed people
- Informal workers
- Independent contractors
- Skilled individuals working part-time
- Workers relying heavily on referrals
- People starting small service businesses
- Skilled individuals without formal companies or websites

The worker-side marketplace promise is:

> **Your skills can find work near you.**

---

# 7. THE MARKETPLACE CONNECTION

The fundamental GRAFT problem is that demand and supply may already exist close to each other without being connected.

```text
CUSTOMER
Needs a plumber
        │
        │ Does not know who is available
        ▼
      GRAFT
        ▲
        │ Has plumbing skills
        │
WORKER
Needs work
```

GRAFT creates the structured connection through:

> **Location + Skills + Trust + Availability + Bidding + Payment**

The objective is to create a fair and effective marketplace where suitable supply and genuine demand have a strong opportunity to find each other.

---

# 8. THE CORE GRAFT MARKETPLACE LOOP

The recommended marketplace loop is:

```text
1. CUSTOMER HAS A NEED
        ↓
2. CUSTOMER CREATES A JOB
        ↓
3. GRAFT PROCESSES THE JOB
        ↓
4. SUITABLE WORKERS ARE IDENTIFIED
        ↓
5. RELEVANT WORKERS DISCOVER THE JOB
        ↓
6. INTERESTED WORKERS SUBMIT BIDS
        ↓
7. CUSTOMER RECEIVES AND COMPARES BIDS
        ↓
8. CUSTOMER SELECTS A PREFERRED WORKER
        ↓
9. WORKER ACCEPTS / CONFIRMS AS REQUIRED
        ↓
10. PRICE IS CONFIRMED
        ↓
11. ECOCASH PAYMENT FLOW PROCEEDS
        ↓
12. WORKER TRAVELS / PREPARES
        ↓
13. WORK STARTS
        ↓
14. WORK IS COMPLETED
        ↓
15. CUSTOMER CONFIRMS OR DISPUTES
        ↓
16. PAYMENT IS COMPLETED / SETTLED
        ↓
17. BOTH PARTIES RATE EACH OTHER
        ↓
18. REPUTATION DATA IMPROVES FUTURE MARKETPLACE TRUST
```

---

# 9. MARKETPLACE VALUE EXCHANGE

## Customer Gives

The customer contributes:

- A legitimate job opportunity
- Job details
- Location information
- Time requirements
- Optional budget information
- Payment according to the validated GRAFT payment model
- Ratings and feedback after completion

## Worker Gives

The worker contributes:

- Skills
- Availability
- Service information
- A bid
- Estimated arrival information
- Labour and service delivery
- Job completion
- Ratings and feedback

## GRAFT Provides

GRAFT provides:

- Job posting
- Worker discovery
- Targeted matching
- Location relevance
- Bidding
- Bid comparison
- Worker profiles
- Verification signals
- Reputation
- Job lifecycle tracking
- Payment status tracking
- Notifications
- Reporting
- Blocking
- Basic dispute handling
- Marketplace accountability

---

# 10. THE JOB AS THE CENTRAL MARKETPLACE UNIT

The central unit of the GRAFT marketplace is the:

# JOB

The job is what creates a temporary connection between customer demand and worker supply.

A job should represent a legitimate real-world task requiring a service.

Examples:

- Fix leaking kitchen tap
- Paint one bedroom
- Install home WiFi
- Move a couch
- Repair a gate
- Mow a yard
- Repair a washing machine
- Assist with furniture loading

The job should contain enough information for a relevant worker to make a meaningful decision.

At minimum:

- Job title
- Category
- Description
- Location
- Preferred date/time
- Optional photos
- Budget or pricing preference

A basic job should be possible to post within a few minutes.

---

# 11. JOB VALIDITY AND MARKETPLACE QUALITY

Not every submitted job should automatically become an unrestricted marketplace opportunity.

GRAFT must account for:

- Incomplete jobs
- Suspicious jobs
- Fraudulent jobs
- Prohibited jobs
- Duplicate jobs
- Misleading descriptions
- Dangerous jobs requiring qualifications
- Illegal service requests

The marketplace must not support:

- Illegal activities
- Dangerous activities without appropriate qualifications
- Weapons-related work
- Drug-related services
- Fraudulent services
- Services designed to facilitate crime
- Other services prohibited by law or GRAFT policy

A formal prohibited-services policy must be created before launch.

---

# 12. LOCATION IN THE MARKETPLACE

GRAFT is a hyperlocal marketplace.

Location influences whether a worker can realistically perform a job.

The marketplace should consider:

- Customer location
- Job location
- Worker approximate location
- Worker service radius
- Distance between worker and job
- Estimated arrival time
- Route/navigation
- Active-job tracking where necessary

However:

> **Closest does not automatically mean best.**

A worker who is close but lacks the relevant skill, availability, or trust signals should not automatically be considered the best match.

---

# 13. LOCATION PRIVACY PRINCIPLE

Before job acceptance, GRAFT should avoid exposing unnecessary exact personal location information.

The marketplace may show:

- Approximate distance
- General location relevance

After job acceptance, job-specific location information may become available according to defined privacy rules.

The marketplace principle is:

> **Reveal the minimum location information necessary for the relevant marketplace stage.**

---

# 14. THE MATCHING SYSTEM

The matching system determines which workers should receive or discover a particular job opportunity.

GRAFT should not simply send every job to every worker.

Doing so would create:

- Notification spam
- Wasted mobile data
- Battery usage
- Worker overload
- Poor job relevance
- A worse marketplace experience

Matching should be targeted.

---

# 15. MATCHING FACTORS

Relevant matching factors include:

1. Required skill
2. Worker availability
3. Service radius
4. Distance
5. Worker reputation
6. Verification
7. Response history
8. Current workload
9. Estimated arrival time

The broader matching philosophy is:

> **Skills + Distance + Availability + Trust + Quality**

These factors define the marketplace decision framework rather than a final mathematical algorithm.

---

# 16. MATCHING PHILOSOPHY

The conceptual matching sequence is:

```text
JOB CREATED
      ↓
WHAT SKILL / CATEGORY IS REQUIRED?
      ↓
IDENTIFY RELEVANT WORKERS
      ↓
FILTER BY SERVICE AREA
      ↓
CONSIDER AVAILABILITY
      ↓
CONSIDER DISTANCE
      ↓
CONSIDER TRUST / VERIFICATION
      ↓
CONSIDER QUALITY / RELIABILITY
      ↓
APPLY FAIRNESS PRINCIPLES
      ↓
SURFACE JOB TO SUITABLE WORKERS
```

GRAFT should not operate according to either extreme:

```text
JOB CREATED
      ↓
SEND TO EVERY WORKER
```

or:

```text
JOB CREATED
      ↓
FIND THE CLOSEST WORKER
      ↓
SEND ONLY TO THEM
```

GRAFT should operate between these two extremes.

---

# 17. NEW WORKER FAIRNESS

A major marketplace risk is winner-takes-all behaviour.

Workers with:

- Many reviews
- High ratings
- Many completed jobs
- Long platform history

could gradually dominate job opportunities.

This could prevent new workers from getting their first opportunities.

A new worker may be:

- Identity verified
- EcoCash verified
- Properly skilled
- Available
- Nearby
- Reasonably priced

but still have zero completed jobs.

GRAFT should not intentionally create a marketplace where such workers cannot compete.

The principle is:

> **A new verified worker with relevant skills should have a genuine opportunity to be discovered and compete.**

Potential fairness mechanisms include:

- Verification-based visibility
- New-worker discovery slots
- Fair ranking
- Geographic rotation
- Skill matching
- Quality-based recommendations
- Controlled exposure

---

# 18. THE BIDDING SYSTEM

Bidding is a central GRAFT marketplace mechanism.

Its purpose is to allow workers to express:

> **"I can do this job, and here is my offer."**

The customer then has options rather than being automatically assigned a worker.

The model is:

```text
JOB IS AVAILABLE
        ↓
SUITABLE WORKER REVIEWS JOB
        ↓
WORKER DECIDES WHETHER INTERESTED
        ↓
WORKER SUBMITS BID
        ↓
CUSTOMER RECEIVES BID
        ↓
CUSTOMER COMPARES AVAILABLE BIDS
        ↓
CUSTOMER CHOOSES
```

---

# 19. MVP BID CONTENT

A worker bid should include:

- Proposed price
- Estimated arrival time
- Short message
- Optional relevant experience

Conceptually:

```text
WORKER BID

Proposed Price:
$ ______

Estimated Arrival:
______ minutes / time

Message:
________________

Relevant Experience:
Optional
```

The bid should give the customer enough information to compare a worker meaningfully.

---

# 20. CUSTOMER BID COMPARISON

Customers should compare meaningful information.

Potential comparison factors include:

| Factor | Purpose |
|---|---|
| Price | Understand cost |
| Distance | Understand proximity |
| ETA | Understand likely arrival |
| Rating | Understand reputation |
| Completed Jobs | Understand marketplace experience |
| Verification | Understand trust status |
| Skills | Understand relevance |
| Cancellation Rate | Understand reliability |

The customer should not be expected to choose based only on price.

---

# 21. CUSTOMER RETAINS CONTROL

GRAFT may provide recommendations.

However:

> **The customer should generally retain control over who they hire.**

GRAFT should help structure the decision through:

> **PRICE + DISTANCE + TRUST + AVAILABILITY + QUALITY**

The customer compares and chooses.

---

# 22. CLOSEST AND CHEAPEST DO NOT AUTOMATICALLY WIN

The marketplace must reject:

> **Closest = Best**

and:

> **Lowest Price = Best**

A customer may reasonably prefer:

- Better rating
- Stronger verification
- More relevant experience
- Faster ETA
- Better reputation
- More suitable price

Workers should compete through a combination of:

- Price
- Skills
- Verification
- Reputation
- Reliability
- ETA
- Experience

---

# 23. RECOMMENDED MVP BIDDING MODEL

The recommended MVP model is:

> **Customer-posted job + targeted worker discovery + worker-submitted bids + customer comparison + customer selection.**

Potential pricing situations include:

1. Customer specifies a budget
2. Customer requests bids
3. Customer accepts a worker's proposed price

The exact operational rules for bidding must be finalized before implementation.

Open questions include:

- How long does bidding remain open?
- Can customers accept immediately?
- Can workers change bids?
- Can workers withdraw bids?
- Can customers negotiate?
- What happens if nobody bids?
- Can a customer invite a specific worker?
- Can workers see competing bids?
- Should workers see the customer's maximum budget?
- How should urgent jobs work?

---

# 24. JOB SELECTION

Once bids are available, the customer enters the selection stage.

```text
BID 1
PRICE + ETA + TRUST

BID 2
PRICE + ETA + TRUST

BID 3
PRICE + ETA + TRUST

        ↓

CUSTOMER SELECTS PREFERRED WORKER
```

The selected worker becomes the intended provider for the job.

Other workers should receive a clear marketplace outcome.

---

# 25. CORE JOB LIFECYCLE

The conceptual GRAFT job lifecycle is:

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

---

# 26. JOB STATES

## DRAFT

The customer has started creating the job but it is not yet available to workers.

## POSTED

The job has been submitted and exists as a marketplace opportunity.

## BIDDING

Relevant workers can discover the job and submit bids.

## WORKER SELECTED

The customer has selected a preferred worker.

## PAYMENT PENDING

The transaction has reached the payment stage, but payment is not yet successfully confirmed.

## PAYMENT CONFIRMED

The relevant EcoCash payment has been successfully confirmed according to the validated GRAFT payment model.

## WORKER EN ROUTE

Where applicable, the worker is travelling toward the job.

## WORK STARTED

The worker has begun performing the work.

## WORK COMPLETED

The worker indicates that the requested work has been completed.

## CUSTOMER CONFIRMED

The customer confirms completion or proceeds through the relevant dispute process.

## PAYMENT RELEASED / SETTLED

Payment proceeds according to the validated GRAFT and EcoCash payment model.

## COMPLETED

The job has successfully completed its marketplace lifecycle.

---

# 27. ALTERNATIVE JOB STATES

The marketplace must also account for:

```text
CANCELLED
EXPIRED
PAYMENT FAILED
DISPUTED
NO-SHOW
WORKER REJECTED
CUSTOMER REJECTED
REASSIGNED
SUSPENDED
FRAUD REVIEW
```

A real marketplace cannot assume every job reaches successful completion.

---

# 28. PAYMENT IN THE MARKETPLACE MODEL

The initial payment direction is:

# ECOCASH ONLY

The conceptual flow is:

```text
CUSTOMER SELECTS WORKER
        ↓
PRICE CONFIRMED
        ↓
CUSTOMER PAYS THROUGH ECOCASH
        ↓
PAYMENT VERIFIED
        ↓
JOB BEGINS
        ↓
JOB COMPLETED
        ↓
CUSTOMER CONFIRMS
        ↓
PAYMENT RELEASED / SETTLED
        ↓
WORKER RECEIVES FUNDS
```

This is a conceptual model.

GRAFT must validate actual EcoCash capabilities before assuming:

- Escrow
- Marketplace payout capabilities
- Automatic fund splitting
- Refund capabilities
- Settlement mechanisms

---

# 29. RATINGS AND REPUTATION

Both customers and workers should be able to build marketplace reputation.

The MVP direction is a simple:

> **1–5 star rating**

Optional feedback may include:

- Quality
- Professionalism
- Communication
- Punctuality
- Value

Reputation can influence future marketplace trust and worker discovery.

Potential risks include:

- Fake reviews
- Retaliatory reviews
- Review manipulation
- Rating inflation
- Unfair ratings
- Review disputes

The reputation system must therefore be treated as marketplace infrastructure.

---

# 30. TRUST AND VERIFICATION

Potential worker trust signals include:

- Phone verification
- Identity verification
- EcoCash verification
- Skill verification
- Background verification
- Completed jobs
- Ratings
- Reputation milestones

A possible verification hierarchy is:

### Phone Verified

Phone number verified.

### Identity Verified

Identity verification completed.

### EcoCash Verified

EcoCash account successfully verified according to the validated process.

### Skill Verified

Relevant qualification or evidence reviewed where applicable.

### Background Verified

Additional verification completed where appropriate.

### Trusted Worker

A platform-defined reputation milestone.

The exact criteria require further validation.

---

# 31. MARKETPLACE SAFETY

Because GRAFT connects people who may meet physically, safety is a core marketplace requirement.

## Customer Safety

Potential measures:

- Worker identity verification
- Worker profiles
- Ratings
- Job tracking
- Reporting
- Blocking
- Emergency support
- Job sharing
- Dispute handling

## Worker Safety

Potential measures:

- Customer verification where appropriate
- Customer profile
- Job details before acceptance
- Reporting
- Blocking
- Emergency support
- Job sharing
- Dispute handling

## Platform Safety

GRAFT should eventually support:

- Fraud monitoring
- Suspicious behaviour monitoring
- Duplicate account detection
- Payment monitoring
- User reports
- Moderation
- Account suspension
- Audit logs

---

# 32. MARKETPLACE LIQUIDITY

Marketplace success is not determined simply by the number of registered users.

The critical question is:

> **Can supply and demand actually find each other and complete jobs?**

The GRAFT marketplace funnel is:

```text
REGISTERED CUSTOMERS
        ↓
ACTIVE CUSTOMERS
        ↓
JOBS POSTED
        ↓
JOBS RECEIVING BIDS
        ↓
JOBS WITH WORKERS SELECTED
        ↓
JOBS STARTED
        ↓
JOBS COMPLETED
        ↓
SUCCESSFULLY COMPLETED VERIFIED JOBS
```

---

# 33. MARKETPLACE HEALTH

GRAFT should monitor:

- Are customers receiving bids?
- Are workers finding opportunities?
- Are customers selecting workers?
- Are workers completing jobs?
- Are jobs being cancelled?
- Are users returning?
- Are disputes increasing?
- Is one group dominating the marketplace?
- Are prices reasonable?
- Are workers earning enough to remain active?

Important marketplace metrics include:

## Supply

- Registered workers
- Verified workers
- Active workers
- Jobs per worker

## Demand

- Registered customers
- Active customers
- Jobs posted
- Repeat customers

## Liquidity

- Jobs receiving at least one bid
- Average bids per job
- Time to first bid
- Time to worker selection
- Jobs completed

## Quality

- Completion rate
- Cancellation rate
- No-show rate
- Dispute rate
- Average rating

## Financial

- Gross transaction value
- Platform revenue
- Average job value
- Average platform fee

## Trust

- Verification completion
- Fraud rate
- Reports per 100 jobs
- Disputes per 100 jobs

---

# 34. NORTH STAR METRIC

The recommended GRAFT North Star Metric is:

> **Successfully completed verified jobs per month.**

This is more meaningful than:

- App downloads
- Website visits
- Registrations
- Worker profile count
- Jobs posted alone

The marketplace creates value when a customer and worker successfully transact.

---

# 35. CHICKEN-AND-EGG PROBLEM

GRAFT faces a fundamental marketplace challenge.

Customers need enough suitable workers.

Workers need enough real job opportunities.

Negative loop:

```text
TOO FEW WORKERS
        ↓
CUSTOMERS RECEIVE NO USEFUL BIDS
        ↓
CUSTOMERS LEAVE
        ↓
FEWER JOBS
        ↓
WORKERS RECEIVE FEWER OPPORTUNITIES
        ↓
WORKERS LEAVE
```

Positive loop:

```text
RELEVANT WORKER SUPPLY
        ↓
CUSTOMERS RECEIVE BIDS
        ↓
CUSTOMERS COMPLETE JOBS
        ↓
CUSTOMER TRUST INCREASES
        ↓
MORE CUSTOMER ACTIVITY
        ↓
MORE JOB OPPORTUNITIES
        ↓
WORKERS REMAIN ACTIVE
        ↓
STRONGER MARKETPLACE SUPPLY
```

GRAFT must deliberately create the conditions for the positive loop.

---

# 36. GEOGRAPHIC MARKETPLACE CONCENTRATION

The recommended approach is to launch in a concentrated geographic market rather than spreading immediately across Zimbabwe.

The reason is marketplace density.

A hyperlocal marketplace requires enough relevant workers and customers within the same operating area.

Potential launch locations require validation and may include:

- Harare
- Bulawayo
- Gweru
- Mutare
- Masvingo
- Kwekwe
- Chitungwiza
- Other urban and peri-urban areas

The expansion principle is:

> **Prove marketplace liquidity in a concentrated area before expanding city by city.**

---

# 37. SUPPLY AND DEMAND BALANCE

GRAFT should not measure only total users.

The relationship between supply and demand matters.

Too little supply means:

- Few bids
- Slow response
- Customer frustration

Too much supply with insufficient demand means:

- Workers receive few opportunities
- Workers become inactive
- Worker frustration increases

Important balance metrics include:

- Active workers
- Active customers
- Jobs per active worker
- Jobs receiving bids
- Average bids per job
- Time to first bid
- Time to worker selection
- Job completion rate

---

# 38. NOTIFICATIONS AS A MARKETPLACE MECHANISM

Notifications help connect supply and demand quickly.

Workers may receive:

> New plumbing job nearby.

> Customer accepted your bid.

> Payment confirmed.

> Customer cancelled the job.

> Job starts soon.

Customers may receive:

> Workers have bid on your job.

> Your selected worker is on the way.

> Worker has started the job.

> Job completed — please confirm.

Notifications should be:

- Timely
- Lightweight
- Actionable
- Relevant

GRAFT should avoid notification spam.

---

# 39. LOW-BANDWIDTH MARKETPLACE PRINCIPLE

GRAFT must operate in conditions that may include:

- Slow mobile networks
- Expensive data
- Unstable connectivity
- Affordable Android devices
- Older phones
- Limited RAM
- Battery constraints

The core principle is:

> **Works even when the internet is bad.**

This affects:

- Job posting
- Bid submission
- Payment status
- Image uploads
- Notifications
- Active-job updates

The marketplace should consider retry behaviour and protection against duplicate actions.

---

# 40. MARKETPLACE MVP BOUNDARY

The MVP should prove the fundamental GRAFT transaction loop.

## MUST HAVE

### Accounts

- Customer account
- Worker account
- Phone verification

### Worker

- Worker profile
- Skills
- Service categories
- Service area
- Availability
- KYC
- EcoCash verification

### Customer

- Customer profile
- Job creation
- Location
- Category
- Description
- Optional photos

### Marketplace

- Job discovery
- Nearby matching
- Bidding
- Bid comparison
- Worker selection

### Job

- Job status
- Job progress
- Completion
- Customer confirmation

### Payment

- EcoCash payment flow
- Payment status
- Transaction record

### Trust

- Verification badges
- Ratings
- Reporting
- Blocking
- Basic dispute handling

### Location

- Job location
- Worker/job distance
- Map
- Basic active-job location functionality

### Notifications

- New job
- New bid
- Bid accepted
- Job updates
- Payment updates

---

# 41. POST-MVP MARKETPLACE CAPABILITIES

Potential post-MVP capabilities include:

- Advanced worker recommendations
- Portfolio
- Favourite workers
- Repeat bookings
- Scheduled recurring jobs
- Customer saved addresses
- Worker availability calendar
- Advanced filters
- Advanced analytics
- Referral system
- Promotional campaigns
- Worker achievement badges
- Improved dispute tooling
- Service packages

These should only be added after the core marketplace transaction loop has been proven.

---

# 42. FUTURE MARKETPLACE CAPABILITIES

Potential future capabilities include:

- AI job categorization
- AI price recommendations
- Fraud detection
- AI worker matching
- Predictive demand
- Business accounts
- Property manager accounts
- Contractor teams
- Worker subscriptions
- Promoted workers
- Corporate services
- Insurance partnerships
- Financing opportunities
- Skill training partnerships
- Worker certification partnerships

These must not become dependencies for the initial GRAFT marketplace.

---

# 43. KEY MARKETPLACE RISKS

## Risk 1 — Chicken-and-Egg Problem

**Response:** Launch in a concentrated geographic area and build relevant worker supply before aggressive expansion.

## Risk 2 — Fraud

**Response:** KYC, verification, monitoring, reporting, and moderation.

## Risk 3 — Off-Platform Transactions

**Response:** Provide enough value through verification, reputation, payment tracking, dispute handling, structured job history, and accountability.

> **Make using GRAFT more valuable than bypassing GRAFT.**

## Risk 4 — Poor Network Connectivity

**Response:** Low-bandwidth design, retries, connection awareness, caching, and efficient network behaviour.

## Risk 5 — Payment Limitations

**Response:** Validate EcoCash capabilities before making unsupported product promises.

## Risk 6 — Safety Incidents

**Response:** Verification, reporting, appropriate tracking, moderation, and clear safety procedures.

## Risk 7 — Worker Quality

**Response:** Verification, ratings, reputation, and appropriate skill evidence.

## Risk 8 — Price Race to the Bottom

**Response:** Show trust, skill, ETA, experience, and quality alongside price.

## Risk 9 — Winner-Takes-All Behaviour

**Response:** New-worker fairness, controlled exposure, skill relevance, geographic rotation, and fair marketplace discovery.

## Risk 10 — Marketplace Imbalance

**Response:** Controlled geographic expansion and continuous supply/demand monitoring.

---

# 44. MARKETPLACE PRINCIPLES

Future GRAFT marketplace decisions should follow these principles.

## 1. GRAFT is a two-sided marketplace.

Both customer demand and worker supply must be healthy.

## 2. Jobs are the central marketplace unit.

A job connects a customer need with worker opportunity.

## 3. Matching should be targeted.

Do not send every job to every worker.

## 4. Skill relevance comes before simple proximity.

A nearby worker without the required skill is not necessarily useful.

## 5. Closest does not automatically win.

Distance is one factor.

## 6. Cheapest does not automatically win.

Price should be balanced with trust and quality.

## 7. Customers should generally retain choice.

GRAFT structures and recommends; customers compare and choose.

## 8. Bidding is a core mechanism.

Workers compete for suitable jobs using meaningful offers.

## 9. Trust is marketplace infrastructure.

Verification, reputation, reporting, and accountability are central.

## 10. New workers deserve a fair opportunity.

The marketplace should avoid permanently locking newcomers out.

## 11. Successful completion matters more than registration numbers.

Marketplace health depends on completed transactions.

## 12. The marketplace must work under poor connectivity.

Low-bandwidth operation is a core GRAFT requirement.

## 13. Payment must follow validated EcoCash capabilities.

Do not assume technical or legal capabilities that have not been confirmed.

## 14. Marketplace expansion should follow liquidity.

Expand only after proving local supply and demand can successfully transact.

---

# 45. FINAL GRAFT MARKETPLACE MODEL

```text
                    ┌──────────────────┐
                    │     CUSTOMER     │
                    │                  │
                    │ NEEDS A JOB DONE │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │   CREATE JOB     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │      GRAFT       │
                    │    MATCHING      │
                    │                  │
                    │ Skills           │
                    │ Availability     │
                    │ Service Radius   │
                    │ Distance         │
                    │ Trust            │
                    │ Quality          │
                    │ Fairness         │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ RELEVANT WORKERS │
                    │ DISCOVER JOB     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ WORKERS SUBMIT   │
                    │      BIDS        │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ CUSTOMER COMPARES│
                    │                  │
                    │ Price            │
                    │ Distance         │
                    │ ETA              │
                    │ Trust            │
                    │ Reputation       │
                    │ Skills           │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ CUSTOMER SELECTS │
                    │      WORKER      │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ VALIDATED        │
                    │ ECOCASH FLOW     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ JOB IS PERFORMED │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ CUSTOMER CONFIRMS│
                    │ OR DISPUTES      │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ PAYMENT COMPLETES│
                    │ / SETTLES        │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ RATINGS + TRUST  │
                    │ + REPUTATION     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ SUCCESSFUL GRAFT │
                    │ MARKETPLACE JOB  │
                    └──────────────────┘
```

---

# 46. FINAL MARKETPLACE STATEMENT

> **GRAFT is designed to transform the informal process of finding someone to do a small job into a structured Zimbabwe-focused marketplace where customers can post local needs, suitable workers can compete for opportunities, both sides can use trust and reputation signals, and the job can move through a clear lifecycle from discovery to completion.**

The core question GRAFT must prove is:

> **Can GRAFT reliably connect a real customer with a suitable trusted worker, allow them to agree on a fair job opportunity, and help move that job safely toward successful completion?**

That is the core marketplace GRAFT must prove before adding unnecessary complexity.

---

# DOCUMENT STATUS

**Product:** GRAFT  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Document:** `marketplace_model.md`  
**Status:** Initial Marketplace Model  
**Marketplace Type:** Two-sided hyperlocal services marketplace  
**Demand Side:** Customers needing legitimate small jobs completed  
**Supply Side:** Local skilled workers and service providers  
**Core Matching:** Skills + Distance + Availability + Trust + Quality + Fairness  
**Core Transaction:** Job posting → Matching → Bidding → Comparison → Selection → Payment → Completion  
**Primary Payment Direction:** EcoCash only  
**Payment Architecture:** Requires capability validation  
**Core Marketplace Metric:** Successfully completed verified jobs per month  
**Technical Architecture:** To be defined in a later phase  
**Implementation:** Not started
