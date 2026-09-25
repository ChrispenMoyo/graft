# Business Requirements Document (BRD)

## GRAFT

**Document:** `BUSINESS_REQUIREMENTS.md`  
**Product Name:** GRAFT  
**Name Meaning:** In Zimbabwean slang, “graft” means work or a job.  
**Version:** 1.0  
**Status:** Product Foundation / Phase 1  
**Product Type:** Zimbabwe-focused two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Primary Payment Rail:** EcoCash  
**Primary Market:** Zimbabwe

---

# 1. Executive Summary

GRAFT is a Zimbabwean hyperlocal services marketplace designed to connect homeowners, residents, tenants, property managers, and small businesses who need small jobs done with nearby unemployed, underemployed, informal, or independent workers who can perform them.

The central idea is simple:

> A customer needs a job done. Nearby suitable workers see the opportunity, submit bids, and the customer chooses who to hire.

GRAFT combines local-service discovery, location awareness, worker verification, bidding, job tracking, ratings, and EcoCash-based payments into one marketplace.

GRAFT is inspired by marketplace mechanics found in platforms such as inDrive and Ezi Services, but it is **not a clone of either platform**. It is intended to be designed specifically around Zimbabwean users, Zimbabwean payment behaviour, local trust problems, informal employment, low-bandwidth conditions, and affordable Android devices.

GRAFT should support a broad range of legitimate small jobs rather than concentrating on a single service category such as cleaning.

Examples include plumbing, electrical work, gardening, painting, welding, carpentry, construction assistance, moving, appliance installation, technology support, vehicle assistance, cleaning, beauty services, events, and other practical services.

The initial product objective is not to build every possible feature.

The MVP must prove one fundamental proposition:

> **Can we safely and reliably match a customer with a trusted nearby worker, agree on a price, complete the job, and facilitate payment?**

Everything else should support that core outcome.

---

# 2. Product Vision

## 2.1 Vision Statement

To become Zimbabwe's trusted digital marketplace for getting small jobs done while creating accessible income opportunities for skilled and unemployed youths.

## 2.2 Long-Term Vision

The long-term opportunity is to build a trusted infrastructure layer for Zimbabwe's informal and small-service economy.

A customer should eventually be able to open the platform for almost any legitimate small task and quickly find suitable people nearby.

Examples:

- “I need someone to fix my leaking tap.”
- “I need someone to mow my yard.”
- “I need someone to move a couch.”
- “I need a welder for a small gate repair.”
- “I need someone to install WiFi.”
- “I need someone to paint one room.”
- “I need a mechanic to come to my car.”
- “I need someone to repair my washing machine.”
- “I need two people to help move furniture.”

GRAFT should make finding, evaluating, hiring, communicating with, and paying a suitable worker substantially easier and safer than relying only on personal referrals, WhatsApp groups, Facebook Marketplace, or informal word of mouth.

---

# 3. Problem Statement

## 3.1 Customer Problem

People frequently need small jobs completed but have difficulty finding trustworthy workers quickly.

Current behaviour often depends on:

- Asking friends and family
- WhatsApp groups
- Facebook groups
- Facebook Marketplace
- Informal referrals
- Local noticeboards
- Calling individual contractors
- Searching Google/social media
- Asking neighbours

These approaches have several weaknesses:

- No consistent verification
- Unclear pricing
- Limited availability information
- No standardized reputation system
- Difficult comparison between workers
- Poor visibility into distance
- No structured job lifecycle
- Limited accountability
- Difficult dispute handling
- Higher risk when inviting unknown people into homes
- Workers may struggle to find customers outside their immediate network

## 3.2 Worker Problem

Zimbabwe has many people with useful practical skills who struggle to access consistent work.

This includes:

- Unemployed youths
- Informal tradespeople
- Independent contractors
- Skilled individuals working part-time
- People starting small service businesses
- Workers relying on referrals
- Workers without formal companies or websites

Their problems include:

- Limited customer reach
- Unpredictable work
- Dependence on personal networks
- Difficulty proving trustworthiness
- Difficulty competing with established contractors
- Time spent searching for opportunities
- Customers negotiating without reliable market information

## 3.3 Marketplace Problem

There is an opportunity to connect these two sides through:

**Location + Skills + Trust + Availability + Bidding + Payment**

---

# 4. Product Opportunity

GRAFT can create value for both sides.

### Customers gain

- Faster access to workers
- Nearby worker discovery
- Price comparison
- Worker profiles
- Verification information
- Ratings and reputation
- Job tracking
- Structured payment
- Greater accountability

### Workers gain

- Access to new customers
- Nearby job opportunities
- Ability to bid for work
- Digital reputation
- Verified-worker status
- Repeat customers
- More predictable opportunities
- A digital identity based on completed work

### Platform gains

- Transaction revenue
- Marketplace network effects
- Local service data
- Worker reputation data
- Potential future business services

---

# 5. Target Market

## 5.1 Geographic Market

Initial market:

**Zimbabwe**

GRAFT should be designed for Zimbabwe from the beginning rather than treating Zimbabwe as a later localization.

Potential initial launch cities should be validated before launch.

Possible launch markets include:

- Harare
- Bulawayo
- Gweru
- Mutare
- Masvingo
- Kwekwe
- Chitungwiza
- Other urban and peri-urban areas

A launch location should ultimately be selected based on:

- Population density
- Smartphone penetration
- Worker supply
- Customer demand
- Network quality
- Operational ability
- KYC/payment feasibility
- Ability to recruit an initial worker base

## 5.2 Primary Customer

A customer may be:

- Homeowner
- Tenant
- Property manager
- Small business owner
- Office manager
- Landlord
- Individual needing a service

The MVP should prioritize ordinary customers with small household/service needs.

## 5.3 Primary Worker

The primary worker is an individual who can perform a legitimate service and wants access to customers.

The worker does not need to own a formal company.

Examples:

- Plumber
- Electrician
- Gardener
- Painter
- Welder
- Carpenter
- Builder
- Cleaner
- Mechanic
- Technician
- Mover
- General labourer
- Barber
- Photographer
- Other service provider

---

# 6. Core Product Proposition

GRAFT should provide a simple promise:

> **Post a small job, find trusted people nearby, compare their offers, choose who you want, and get the job done.**

The worker-side promise:

> **Your skills can find work near you.**

---

# 7. Core Marketplace Model

GRAFT is a two-sided platform.

## Customer Side

1. Customer creates a job.
2. Platform identifies suitable workers.
3. Workers receive the opportunity.
4. Workers submit bids.
5. Customer compares workers.
6. Customer selects a worker.
7. Job is performed.
8. Customer confirms completion.
9. Payment is completed.
10. Both parties can rate each other.

## Worker Side

1. Worker creates a profile.
2. Worker completes verification.
3. Worker selects skills.
4. Worker sets availability/service area.
5. Worker receives relevant jobs.
6. Worker submits bids.
7. Worker is selected or rejected.
8. If selected, worker performs the job.
9. Worker completes the job.
10. Worker receives payment according to GRAFT's payment flow.
11. Worker builds reputation.

---

# 8. Core Job Flow

The recommended conceptual job lifecycle is:

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
PAYMENT RELEASED
  ↓
COMPLETED
```

Alternative states must also be supported:

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

The exact technical state machine will be defined in the technical architecture phase.

---

# 9. Job Creation Requirements

A customer should be able to create a job using a lightweight flow.

Minimum information:

- Job title
- Category
- Description
- Location
- Preferred date/time
- Optional photos
- Budget or pricing preference

Potential pricing models:

1. Customer specifies a budget.
2. Customer requests bids.
3. Customer accepts a worker's proposed price.

The MVP should prioritize bidding rather than creating a complex quotation system.

## Example

**Customer:** “Need a plumber to fix leaking kitchen tap.”

**Category:** Plumbing

**Location:** Customer-selected location

**Preferred time:** Today, 14:00–16:00

**Photos:** Optional

**Budget:** Optional

Workers then receive the opportunity.

---

# 10. Bidding Requirements

Bidding is a central differentiating feature.

Workers should be able to submit:

- Proposed price
- Estimated arrival time
- Short message
- Optional relevant experience

The customer should be able to compare bids.

Potential comparison information:

| Factor | Purpose |
|---|---|
| Price | Cost |
| Distance | Proximity |
| ETA | Speed |
| Rating | Reputation |
| Completed jobs | Experience |
| Verification | Trust |
| Skills | Relevance |
| Cancellation rate | Reliability |

## Important Principle

The closest worker should **not automatically win**.

GRAFT should provide recommendations but the customer should generally retain control.

GRAFT should balance:

**PRICE + DISTANCE + TRUST + AVAILABILITY + QUALITY**

---

# 11. Map & Location Requirements

Location is a major part of GRAFT.

GRAFT should eventually support:

- Customer location
- Worker approximate location
- Job location
- Nearby worker discovery
- Distance calculation
- ETA
- Route/navigation
- Active-job tracking

## Customer Map

A customer may see suitable nearby workers.

Example:

```text
        Worker
          ●
          |
   ●      |       ●
 Worker  Customer Worker
          ◎
```

The map should not reveal unnecessary personal information.

## Worker Privacy

Before accepting a job:

- Do not expose exact worker location publicly.
- Prefer approximate distance.
- Only reveal necessary location information.

After a job is accepted:

- Job-specific location information can become available according to privacy rules.

During an active job:

- Live tracking may be enabled where necessary.

---

# 12. Location-Based Matching

Matching should consider:

1. Required skill
2. Worker availability
3. Service radius
4. Distance
5. Worker reputation
6. Verification
7. Response history
8. Current workload
9. Estimated arrival time

The system should not simply send every job to every worker.

This would:

- Waste data
- Drain battery
- Create notification spam
- Overload workers
- Reduce marketplace quality

Matching should be targeted.

---

# 13. Worker Profiles

A worker profile should establish trust quickly.

Potential profile information:

- Profile photo
- Display name
- Skills
- Service categories
- Approximate location
- Service radius
- Rating
- Number of completed jobs
- Verification badges
- Experience
- Availability
- Typical response time
- Reviews
- Portfolio/photos where relevant

## Verification Badges

A possible hierarchy:

### Phone Verified
Phone number verified.

### Identity Verified
National ID and identity verification completed.

### EcoCash Verified
EcoCash account successfully verified.

### Skill Verified
Relevant qualification or evidence reviewed where applicable.

### Background Verified
Additional background verification completed.

### Trusted Worker
Platform-defined reputation milestone.

The exact badge criteria should be finalized after legal, KYC, and operational validation.

---

# 14. KYC & Identity

Trust is a core product requirement.

GRAFT should investigate strong identity verification using:

- Zimbabwe National ID
- Selfie
- Face verification
- Phone verification
- EcoCash verification
- Identity/name matching

Additional verification may include:

- Police clearance
- Trade certificates
- Professional qualifications
- Driver's licence
- Business registration
- References

Not every worker should necessarily require every verification level.

A tiered verification model is preferable.

---

# 15. EcoCash Requirements

The initial payment strategy is:

# ECOCASH ONLY

The MVP should not depend on:

- Credit cards
- PayPal
- Stripe
- Cryptocurrency
- Generic wallets
- Cash as an official platform payment method

## Important Constraint

The exact technical capabilities of EcoCash must be verified before implementation.

Do not assume that an escrow or marketplace payout API exists.

The business and technical team must establish:

- Available EcoCash APIs
- Merchant capabilities
- Payment initiation
- Payment confirmation
- Transaction references
- Refund capability
- Settlement
- Payout mechanisms
- Compliance requirements
- Fees
- Limits
- Integration requirements

These are open business/technical questions.

---

# 16. Conceptual Payment Flow

Preferred conceptual flow:

```text
Customer selects worker
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
Customer confirms completion
        ↓
Payment released/settled
        ↓
Worker receives funds
```

The exact payment architecture must be validated.

GRAFT must account for:

- Payment failure
- Duplicate payment
- Wrong amount
- Payment timeout
- Customer cancellation
- Worker cancellation
- Job cancellation
- Refunds
- Disputes
- Failed settlement

---

# 17. Trust & Safety

Because workers may enter private homes and customers may meet unknown workers, trust and safety must be treated as a primary product pillar.

## Customer Safety

Potential measures:

- Worker identity verification
- Worker profile
- Ratings
- Job tracking
- Worker contact controls
- Report/block functionality
- Emergency support
- Job sharing
- Dispute system

## Worker Safety

Potential measures:

- Customer verification
- Customer profile
- Job details before acceptance
- Location information
- Report/block functionality
- Emergency support
- Job sharing
- Dispute system

## Platform Safety

Potential measures:

- Fraud detection
- Suspicious behaviour monitoring
- Duplicate account detection
- Device/account monitoring
- Payment monitoring
- User reports
- Moderation
- Account suspension
- Audit logs

---

# 18. Prohibited Jobs

GRAFT should define prohibited services.

Potentially prohibited categories include:

- Illegal activities
- Dangerous activities without appropriate qualifications
- Weapons-related work
- Drug-related services
- Fraudulent services
- Services designed to facilitate crime
- Other services prohibited by law or platform policy

A formal prohibited-services policy must be created before launch.

---

# 19. Ratings & Reputation

Both customers and workers should eventually be able to rate each other.

A simple MVP model should be considered first.

Possible rating:

**1–5 stars**

Optional structured feedback:

- Quality
- Professionalism
- Punctuality
- Communication
- Value

GRAFT should avoid unnecessarily complicated rating systems in MVP.

## Reputation Risks

The system must consider:

- Fake reviews
- Retaliatory reviews
- Review manipulation
- Rating inflation
- Coordinated ratings
- Unfair ratings
- Review disputes

---

# 20. New Worker Fairness

A marketplace can naturally favour workers who already have many reviews.

This can make it difficult for new workers to enter the market.

GRAFT should therefore consider mechanisms that allow verified new workers to gain opportunities.

Potential approaches:

- Verification-based visibility
- New-worker discovery slots
- Fair ranking
- Geographic rotation
- Skill matching
- Quality-based recommendations
- Controlled exposure

The system should not intentionally guarantee work, but it should avoid unnecessarily locking new workers out.

---

# 21. Low-Bandwidth & Low-End Device Requirements

This is a core product principle.

GRAFT should be designed for:

- Affordable Android phones
- Older phones
- Limited RAM
- Slow processors
- Slow mobile networks
- Expensive data
- Unstable connections
- Limited storage
- Battery constraints

## Requirements

The mobile experience should prioritize:

- Small application size
- Compressed images
- Efficient API calls
- Minimal unnecessary requests
- Local caching
- Retry mechanisms
- Connection-state awareness
- Lightweight screens
- Efficient push notifications
- Efficient location polling
- Minimal background processing

GRAFT should not assume:

> “The user always has fast internet.”

Instead:

> “The user may lose connectivity at any moment.”

---

# 22. Offline/Unstable Network Behaviour

GRAFT should gracefully handle:

- Lost connection
- Slow requests
- Failed uploads
- Failed payments
- Duplicate requests
- Partial synchronization
- Interrupted job updates

Examples:

If a worker submits a bid and the connection drops:

- The app should not create duplicate bids when the worker retries.

If a customer uploads a job photo:

- Upload should be resumable/retryable where practical.

If live tracking is interrupted:

- The application should clearly communicate the last known state.

---

# 23. Notifications

Workers need timely job opportunities.

Potential notifications:

> New plumbing job 1.3 km away.

> Customer accepted your bid.

> Payment confirmed.

> Customer cancelled the job.

> Job starts in 30 minutes.

> Customer marked the job complete.

Customers may receive:

> 3 workers have bid on your job.

> Your selected worker is 1.2 km away.

> Worker has started the job.

> Job completed — please confirm.

Push notifications should be lightweight and actionable.

---

# 24. Web Application

The web product should support:

- Customer access
- Worker access where appropriate
- Account management
- Job management
- Worker profiles
- Job browsing
- Bidding
- Payment status
- Ratings
- Help/support

The exact feature split between web and mobile will be defined in the PRD.

---

# 25. Admin Platform

GRAFT requires an administrative platform.

Admin capabilities will eventually include:

### User Management

- Customers
- Workers
- Suspended users
- Verification status

### KYC

- Verification queue
- Identity review
- Document review
- Verification decisions

### Jobs

- Active jobs
- Completed jobs
- Cancelled jobs
- Disputed jobs
- Suspicious jobs

### Payments

- Transactions
- Payment failures
- Refunds
- Settlement
- Platform fees

### Trust & Safety

- Reports
- Complaints
- Fraud flags
- Account restrictions
- Bans

### Marketplace Management

- Categories
- Service areas
- Pricing configuration
- Platform settings

### Analytics

- Jobs
- Users
- Workers
- Revenue
- Completion
- Disputes

---

# 26. Service Categories

The system should use flexible categories.

## Home Services

- Plumbing
- Electrical
- Painting
- Gardening
- Carpentry
- Roofing
- Tiling
- General repairs
- Appliance installation

## Construction

- Bricklaying
- Welding
- Paving
- Ceiling installation
- Renovation
- General building

## Automotive

- Mechanic
- Tyre assistance
- Car washing
- Battery assistance
- Mobile vehicle services

## Technology

- Computer repair
- Phone repair
- WiFi installation
- CCTV
- DSTV
- Solar

## Moving & Labour

- Furniture moving
- Loading
- Unloading
- Small deliveries
- General labour

## Cleaning

- House cleaning
- Office cleaning
- Yard cleaning
- Window cleaning

## Personal & Events

- Barber
- Hairdresser
- Makeup
- Photographer
- DJ
- Catering
- Event support

The category system must be expandable.

---

# 27. Customer Experience Principles

The customer experience should be:

- Fast
- Simple
- Trustworthy
- Local
- Transparent
- Lightweight

A customer should be able to post a basic job within a few minutes.

The application should avoid requiring unnecessary information before the customer can experience value.

---

# 28. Worker Experience Principles

The worker experience should be:

- Opportunity-focused
- Simple
- Fast
- Low-data
- Transparent
- Fair

Workers should quickly understand:

- What job is available
- Where it is
- What skill is required
- When it is needed
- What the customer is offering
- How far away it is
- How to submit a bid

---

# 29. Business Model

GRAFT requires a sustainable revenue model.

Possible models:

## Commission

Platform takes a percentage of completed transactions.

Advantages:

- Revenue grows with marketplace activity.
- Easy to understand.
- Low barrier to worker registration.

Risks:

- Small jobs may have very small margins.
- Workers may attempt to transact outside GRAFT.

## Customer Fee

Customer pays an additional marketplace fee.

Advantages:

- Worker keeps quoted price.
- Clear worker economics.

Risks:

- May make small jobs appear expensive.

## Worker Fee

Worker pays a small platform fee.

Advantages:

- Customer sees a simple price.

Risks:

- May discourage unemployed workers.

## Subscription

Workers pay monthly for additional access.

Not recommended for MVP because it creates friction before workers have proven value.

## Recommended MVP Direction

A small transaction-based platform fee should be investigated first.

The exact percentage should be validated against:

- Average Zimbabwean small-job value
- EcoCash fees
- Worker economics
- Customer willingness to pay
- Competitor behaviour

No final percentage should be hard-coded at the business requirements stage.

---

# 30. Competitive Environment

GRAFT competes indirectly with existing behaviour more than with a single competitor.

Relevant alternatives include:

- WhatsApp
- Facebook Marketplace
- Facebook groups
- Personal referrals
- Family/friend recommendations
- Local classifieds
- Individual contractors
- Existing service marketplaces

## Ezi Services

Ezi Services is an inspiration/reference point for the marketplace concept:

https://ezi.services/

GRAFT should study marketplace patterns such as:

- Service discovery
- Worker profiles
- Service categories
- Customer requests

However, GRAFT should differ by emphasizing:

- Zimbabwe
- Unemployed youth
- Broad small-job categories
- Location-based matching
- Bidding
- Strong KYC
- EcoCash
- Low-bandwidth operation
- Hyperlocal opportunities

---

# 31. Why Customers Should Use This Instead of WhatsApp/Facebook

GRAFT must offer clear advantages over informal channels.

WhatsApp/Facebook usually provides:

- People
- Posts
- Messages

But not necessarily:

- Strong identity verification
- Structured bidding
- Location-aware matching
- Standardized profiles
- Job lifecycle
- Payment tracking
- Reputation
- Dispute workflow
- Worker/customer accountability

GRAFT should combine these functions into a structured transaction.

---

# 32. Why Workers Should Use This Instead of Waiting for Referrals

Workers should gain:

- More customers
- Nearby jobs
- Faster opportunities
- Digital reputation
- Verification badges
- Repeat customers
- Job history
- Ability to compete based on price and service

GRAFT becomes a digital storefront for a worker's skills.

---

# 33. MVP Definition

The MVP must prove GRAFT's fundamental transaction loop.

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
- Worker accepted
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

# 34. SHOULD HAVE — POST-MVP

Potential features:

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

---

# 35. FUTURE FEATURES

Potential future capabilities:

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

These must not distract from the MVP.

---

# 36. Key Success Metrics

The most important MVP metrics should measure whether GRAFT actually works.

## Supply

- Registered workers
- Verified workers
- Active workers
- Workers online
- Jobs per worker

## Demand

- Registered customers
- Active customers
- Jobs posted
- Repeat customers

## Marketplace Liquidity

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

# 37. North Star Metric

A useful North Star Metric for GRAFT is:

> **Successfully completed verified jobs per month.**

This is better than focusing only on downloads, registrations, website traffic, or app opens because a marketplace only creates meaningful value when customers and workers successfully transact.

---

# 38. Marketplace Health

GRAFT must monitor whether the marketplace is healthy.

Important questions:

- Are customers receiving bids?
- Are workers finding enough jobs?
- Are customers choosing workers?
- Are workers completing jobs?
- Are jobs being cancelled?
- Are users returning?
- Are disputes increasing?
- Is one group dominating the marketplace?
- Are prices reasonable?
- Are workers earning enough to remain active?

A marketplace can have thousands of registered users and still fail if there is insufficient transaction liquidity.

---

# 39. Major Risks

## Risk 1 — Chicken and Egg Problem

Customers need workers. Workers need customers.

**Mitigation:** Launch in a concentrated geographic area. Recruit workers before aggressively acquiring customers.

## Risk 2 — Fraud

Fake identities or fake jobs could damage trust.

**Mitigation:** Strong KYC, verification, monitoring and reporting.

## Risk 3 — Off-Platform Transactions

Users may exchange contact details and complete transactions outside GRAFT.

**Risk:** Platform loses revenue and visibility.

**Mitigation:** Provide enough value inside GRAFT through verification, payment protection, reputation and dispute handling.

## Risk 4 — Poor Network Connectivity

Live maps and tracking can consume data.

**Mitigation:** Low-bandwidth architecture and intelligent location updates.

## Risk 5 — Payment Integration

EcoCash integration may have technical/business limitations.

**Mitigation:** Validate payment capabilities before committing to final architecture.

## Risk 6 — Safety Incident

A serious incident could severely damage the brand.

**Mitigation:** Strong KYC, reporting, tracking, moderation and clear safety procedures.

## Risk 7 — Worker Quality

Not every registered worker will be skilled.

**Mitigation:** Ratings, skill verification and reputation.

## Risk 8 — Price Race to the Bottom

Workers may underbid unsustainably.

**Mitigation:** Show quality and trust factors alongside price.

## Risk 9 — Marketplace Imbalance

Too many workers and not enough jobs can create frustration.

**Mitigation:** Controlled geographic expansion and supply/demand monitoring.

---

# 40. Key Assumptions

The following assumptions must be validated:

1. Zimbabwean customers are willing to hire workers through a digital marketplace.
2. Workers are willing to bid digitally.
3. Users are comfortable with EcoCash-only payment.
4. Customers value verified workers.
5. Workers value digital reputation.
6. Location-based matching improves job discovery.
7. Customers prefer comparing multiple offers.
8. Strong KYC can increase trust without creating excessive registration friction.
9. A low-bandwidth app can provide a good marketplace experience.
10. GRAFT can acquire sufficient worker supply in a concentrated launch area.

---

# 41. Open Business Questions

## Market

- Which city should launch first?
- What is the initial service radius?
- Which three to five categories should launch first?
- How will the first 500 workers be recruited?
- How will the first 500 customers be acquired?

## Payment

- What EcoCash APIs are available?
- Can payments be initiated from the application?
- Can payment status be verified automatically?
- Is marketplace settlement supported?
- Can GRAFT legally/technically hold funds?
- How are refunds handled?
- What are the transaction fees?

## KYC

- Which KYC provider should be used?
- Can Zimbabwe National IDs be verified electronically?
- What identity information can legally be stored?
- What retention period applies?
- Can EcoCash ownership be automatically verified?

## Safety

- What jobs are prohibited?
- What minimum age is required?
- What happens during a safety incident?
- What emergency support is available?
- What liability does GRAFT have?

## Business Model

- What platform fee is sustainable?
- Who pays it?
- Is there a minimum transaction fee?
- How do we prevent off-platform transactions?

## Operations

- Who handles disputes?
- Who reviews KYC?
- Who handles fraud?
- What are customer support hours?
- How quickly must disputes be resolved?

---

# 42. Legal & Regulatory Verification

The following areas require professional/legal verification in Zimbabwe:

- Data protection and privacy
- KYC requirements
- Identity document processing
- Payment regulations
- EcoCash integration requirements
- Consumer protection
- Worker classification
- Platform liability
- Insurance
- Dispute resolution
- Background checks
- Data retention
- Age restrictions
- Prohibited services

This document is a product/business specification and is **not legal advice**.

---

# 43. Product Principles

1. **Zimbabwe First** — Design for Zimbabwean users, payments, behaviour and infrastructure.
2. **Low Bandwidth First** — Assume connectivity may be slow or unstable.
3. **Trust Before Transactions** — A successful marketplace must make people feel safe.
4. **Simple Beats Complicated** — Every unnecessary step reduces adoption.
5. **EcoCash First** — The initial payment experience should focus on the payment ecosystem users already understand.
6. **Location Matters** — Nearby workers can improve speed and reduce travel costs.
7. **Workers Need Opportunity** — GRAFT should create genuine opportunities for skilled people.
8. **Customers Need Control** — Customers should be able to compare and choose rather than being forced into an automatic match.
9. **Privacy by Default** — Only expose information necessary to complete the job.
10. **Build for Affordable Phones** — GRAFT must work well beyond flagship devices.
11. **Build for Real Transactions** — The goal is completed jobs, not vanity metrics.
12. **Do Not Overbuild** — Solve the core marketplace problem before adding advanced features.

---

# 44. Recommended MVP Product Strategy

## Step 1 — Concentrate

Launch in one carefully selected geographic market.

## Step 2 — Recruit Supply

Build a verified worker base before large-scale customer marketing.

## Step 3 — Start With High-Frequency Categories

Prioritize categories that:

- Are easy to understand
- Have frequent demand
- Can be completed relatively quickly
- Have enough workers
- Have manageable safety risk

Potential examples:

- Plumbing
- Electrical
- Gardening
- Cleaning
- Moving/labour
- General repairs

The exact categories must be validated.

## Step 4 — Prove the Transaction

Measure whether customers can post jobs and receive useful bids.

## Step 5 — Improve Trust

Use completed jobs, ratings and verification to improve marketplace quality.

## Step 6 — Expand Categories

Only after marketplace liquidity is proven.

## Step 7 — Expand Geography

Expand city-by-city rather than immediately attempting nationwide coverage.

---

# 45. Recommended Core Experience

## Customer

```text
OPEN APP
   ↓
"What do you need done?"
   ↓
SELECT CATEGORY
   ↓
DESCRIBE JOB
   ↓
ADD LOCATION
   ↓
ADD PHOTO (OPTIONAL)
   ↓
POST JOB
   ↓
NEARBY VERIFIED WORKERS RESPOND
   ↓
COMPARE BIDS
   ↓
CHOOSE WORKER
   ↓
CONFIRM PRICE
   ↓
ECOCASH PAYMENT
   ↓
WORKER TRAVELS TO CUSTOMER
   ↓
JOB COMPLETED
   ↓
CUSTOMER CONFIRMS
   ↓
PAYMENT COMPLETED
   ↓
RATE WORKER
```

## Worker

```text
OPEN APP
   ↓
GO ONLINE
   ↓
RECEIVE NEARBY JOB
   ↓
VIEW JOB
   ↓
SUBMIT BID
   ↓
WAIT
   ↓
CUSTOMER ACCEPTS
   ↓
CONFIRM JOB
   ↓
TRAVEL TO CUSTOMER
   ↓
START JOB
   ↓
COMPLETE JOB
   ↓
CUSTOMER CONFIRMS
   ↓
RECEIVE PAYMENT
   ↓
RATE CUSTOMER
```

---

# 46. Strategic Product Positioning

GRAFT should occupy the space between:

**Informal referrals**

and

**Formal service companies**

It should provide the accessibility of informal hiring while adding the trust, structure and accountability of a digital marketplace.

A useful positioning concept is:

> **The easiest way for Zimbabweans to find trusted people nearby to get small jobs done.**

For workers:

> **Turn your skills into income by finding jobs near you.**

These are positioning concepts rather than finalized marketing copy.

---

# 47. What This Product Is NOT

GRAFT should not become:

- A general social network
- A classifieds website
- A Facebook Marketplace clone
- A generic freelancer platform
- A job-board for corporate employment
- A cleaning-only platform
- A payment wallet
- A directory with phone numbers
- A platform that automatically sends every job to every worker

The core purpose is:

**Local task marketplace + trusted workers + bidding + location + structured transaction.**

---

# 48. Phase 1 Decisions

| Area | Direction |
|---|---|
| Market | Zimbabwe |
| Users | Customers + local workers |
| Core problem | Finding and hiring trusted people for small jobs |
| Marketplace | Two-sided |
| Job model | Customer-posted tasks |
| Worker model | Workers bid on suitable jobs |
| Matching | Skills + distance + availability + trust + quality |
| Maps | Core product capability |
| Payment | EcoCash only |
| KYC | Strong verification |
| Mobile | Priority platform |
| Web | Required |
| Low bandwidth | Core requirement |
| MVP | Focused transaction loop |
| Categories | Broad, not cleaning-only |
| Ratings | Both sides |
| Admin | Required |
| AI | Future, not MVP dependency |

These decisions remain subject to validation where explicitly identified as open questions.

---

# 49. Phase 1 Completion Criteria

Phase 1 is complete when the team can clearly answer:

### Problem
- What problem are we solving?

### Users
- Who is the customer?
- Who is the worker?

### Marketplace
- How does a job move through GRAFT?
- How does bidding work?
- How does matching work?

### Trust
- How do we establish identity?
- How do we protect users?

### Payment
- How is EcoCash expected to fit into the transaction?

### Product
- What belongs in MVP?
- What does not belong in MVP?

### Business
- How can GRAFT make money?
- What must be validated?

### Strategy
- Where should we launch?
- How do we acquire initial supply and demand?

### Technology
- What constraints must the future architecture support?

The technical architecture itself should be defined in a later phase.

---

# 50. Phase 2 Preparation

The next phase should convert these business requirements into a detailed:

# PRODUCT REQUIREMENTS DOCUMENT (PRD)

Phase 2 should define:

- Complete user journeys
- Every application screen
- Screen-by-screen requirements
- Navigation
- Customer experience
- Worker experience
- Admin experience
- Authentication
- KYC flows
- Job creation
- Job discovery
- Bidding
- Map interactions
- Notifications
- Payment flows
- Ratings
- Disputes
- Error states
- Empty states
- Loading states
- Offline states
- Permissions
- Accessibility
- MVP boundaries

Phase 2 should **not** begin implementation.

The PRD should become the source of truth for the later UI/UX and engineering phases.

---

# 51. Final Product Principle

The entire product should ultimately make one interaction dramatically easier:

> **“I need something done. Who nearby can do it, can I trust them, what will they charge, and can I safely get the job completed?”**

For workers:

> **“I have a skill. Where can I find someone nearby who needs it and pay me fairly?”**

If GRAFT solves those two questions reliably, the marketplace has a reason to exist.

---

## Document Status

**Product:** GRAFT  
**Phase:** 1 — Business Requirements  
**Status:** Initial Product Foundation  
**Next Phase:** Phase 2 — Product Requirements Document  
**Implementation:** Not started  
**Technical Architecture:** To be defined in later phase  
**Payment Integration:** Requires EcoCash capability validation  
**Legal/Regulatory:** Requires professional verification

