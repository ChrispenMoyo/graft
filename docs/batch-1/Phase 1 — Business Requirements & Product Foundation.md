# PHASE 1 — BUSINESS REQUIREMENTS & PRODUCT FOUNDATION

You are working on a completely NEW and INDEPENDENT Zimbabwean technology startup called "GRAFT" , slang word used to define any type of work or job.

IMPORTANT:
- This project has NOTHING to do with AnswerAfrika.
- This project has NOTHING to do with The African Concierge.
- Do NOT reuse their branding, architecture, business logic, terminology, files, prompts, design systems, or product decisions.
- Treat this as a completely standalone product from day one.

We are going to build this project through structured development phases using Claude Code.

Your job in THIS PHASE is NOT to build the application.

Your job is to deeply understand, structure, document, challenge, and formalize the business/product requirements so that later phases can use this document as the source of truth.

---

# 1. PRODUCT CONCEPT

The working concept is a Zimbabwean marketplace (GRAFT) that connects homeowners/customers who need small jobs done with nearby unemployed or informal workers/contractors who can perform those jobs.

Think of the core marketplace mechanics as being inspired by:

- inDrive — proximity + bidding/matching
- Ezi Services — local task/service marketplace
- Ride-hailing marketplaces — location, availability, ratings and tracking

BUT:

We are NOT cloning any existing platform.

We are creating our own Zimbabwe-focused product.

The marketplace (GRAFT) should support MANY types of small jobs rather than focusing only on cleaning.

Examples include:

HOME SERVICES
- Plumbing
- Electrical work
- Painting
- Gardening
- Yard work
- Carpentry
- Roofing
- Tiling
- General repairs
- Appliance installation
- Furniture assembly

CONSTRUCTION
- Bricklaying
- Welding
- Ceiling installation
- Paving
- Building work
- Renovation assistance

AUTOMOTIVE
- Mobile mechanic
- Tyre assistance
- Car washing
- Battery assistance
- Vehicle-related small jobs

TECHNOLOGY
- Computer repair
- Phone repair
- WiFi installation
- CCTV installation
- DSTV installation
- Solar installation

MOVING & LABOUR
- Furniture moving
- Loading/unloading
- Small deliveries
- General labour

CLEANING
- House cleaning
- Yard cleaning
- Office cleaning
- Window cleaning

EVENTS & PERSONAL SERVICES
- Photography
- DJ
- Catering
- Hairdressing
- Barbering
- Makeup

The system should ultimately be flexible enough to support almost any legitimate small task that a customer needs another person to perform.

---

# 2. CORE MARKETPLACE IDEA

A homeowner/customer posts:

"I need someone to fix my leaking kitchen tap."

They provide:

- Job description
- Photos if necessary
- Location
- Preferred time
- Optional budget
- Category

Nearby workers who match the required skill receive the job.

Workers can then submit bids.

Example:

Worker A:
$15
Arrives in 20 minutes
1.2 km away
4.8 rating

Worker B:
$12
Arrives in 35 minutes
2.4 km away
4.5 rating

Worker C:
$18
Arrives in 10 minutes
0.8 km away
4.9 rating

The customer chooses who to hire.

The closest worker should NOT automatically win.

The marketplace should allow the customer to make an informed decision based on:

- Price
- Distance
- ETA
- Rating
- Number of completed jobs
- Verification status
- Skills
- Previous experience
- Possibly response time

The platform should balance:

PRICE + DISTANCE + TRUST + AVAILABILITY + QUALITY.

---

# 3. LOCATION / MAP CONCEPT

A major part of the product should be location-aware.

Customers should be able to discover nearby workers.

Workers should be able to discover nearby jobs.

The product should eventually have an experience inspired by ride-hailing maps:

- Customer location
- Worker location
- Job location
- Nearby available workers
- Distance
- ETA
- Navigation
- Live location while a job is active

However, do NOT blindly copy inDrive's UI.

Document how our own map experience should work for this marketplace.

Also identify privacy concerns.

For example:

A worker's exact live location should NOT necessarily be publicly exposed before accepting a job.

Think carefully about:

- approximate location
- exact job location
- worker location privacy
- location permissions
- location spoofing
- GPS accuracy
- battery consumption
- low-data environments

---

# 4. PAYMENT MODEL

The initial marketplace should be:

# STRICTLY ECOCASH

Do NOT introduce:

- Stripe
- PayPal
- Bitcoin
- credit cards
- generic wallets
- cash payments

as core payment methods.

EcoCash is the intended payment rail for this Zimbabwe-focused marketplace.

The product should investigate and document the required payment flow conceptually.

For example:

Customer
↓
Agrees to job price
↓
Customer pays through EcoCash
↓
Platform/payment system confirms payment
↓
Worker performs job
↓
Customer confirms completion
↓
Worker receives payment

However:

DO NOT assume that a specific EcoCash API, escrow mechanism, merchant API, or settlement capability exists.

Clearly identify anything that must be technically/business verified with EcoCash or an authorized payment provider.

Document:

- EcoCash verification
- payment confirmation
- payment status
- failed payments
- cancelled jobs
- refunds
- disputes
- partial completion
- platform commission
- worker payout
- transaction records

We will solve the actual payment integration in a later technical phase.

---

# 5. STRONG KYC / TRUST

Trust and safety is one of the most important parts of this product.

The platform should not simply allow anonymous people to meet strangers at homes.

Workers should undergo strong identity verification.

Investigate and document a KYC framework involving:

- Zimbabwe National ID
- Selfie
- Face verification
- Phone number verification
- EcoCash number verification
- Identity/name matching
- Location verification where appropriate
- Skills/professional verification where applicable

Potential additional verification:

- Police clearance
- Trade certificates
- Professional certificates
- Driver's licence
- Business registration
- References

Do NOT make every verification mandatory unless justified.

Design a tiered verification system.

For example:

BASIC VERIFIED

IDENTITY VERIFIED

ECOCASH VERIFIED

SKILL VERIFIED

BACKGROUND VERIFIED

TRUSTED WORKER

Determine what each level should mean.

Also investigate:

- fraud
- fake IDs
- fake accounts
- duplicate accounts
- stolen identities
- fake EcoCash accounts
- account sharing
- impersonation
- worker/customer scams
- harassment
- unsafe jobs
- fraudulent job postings
- payment fraud
- location spoofing

Document the trust and safety requirements.

---

# 6. TARGET USERS

Primary CUSTOMER:

Zimbabwean homeowners and residents who need small jobs completed.

Primary WORKER:

Zimbabwean youths and informal workers who have practical skills and need income opportunities.

The product should be especially accessible to:

- unemployed youths
- informal contractors
- small independent tradespeople
- people operating without formal companies
- skilled individuals looking for extra income

Do NOT assume every worker owns a powerful smartphone.

The product must work well for people using:

- inexpensive Android phones
- older Android versions
- limited storage
- slow processors
- limited RAM
- slow mobile networks
- expensive mobile data

This constraint should influence the entire product strategy.

---

# 7. LOW-BANDWIDTH-FIRST PRINCIPLE

This is extremely important.

Zimbabwe has significant connectivity and affordability constraints.

The product must be designed around:

# "Works even when the internet is bad."

Document requirements for:

- lightweight application
- low image sizes
- compressed images
- minimal network requests
- efficient APIs
- caching
- offline-friendly screens
- retry mechanisms
- graceful connection failures
- minimal animations
- low battery usage
- efficient GPS usage
- push notifications
- background synchronization where appropriate

Do NOT create a product that assumes unlimited high-speed 5G.

The experience should remain usable on slow mobile networks.

---

# 8. MOBILE + WEB

The product should eventually exist as:

1. Mobile application
2. Web application
3. Admin platform

The mobile application will be especially important because workers will primarily use phones.

The web application should support customers and potentially workers where appropriate.

The admin system will be required for:

- KYC review
- disputes
- users
- jobs
- payments
- fraud monitoring
- categories
- worker verification
- reports
- platform analytics

Do NOT implement these yet.

Only document their requirements.

---

# 9. BUSINESS MODEL

Determine a realistic business model for the marketplace.

Investigate possibilities such as:

- commission per completed job
- customer service fee
- worker service fee
- percentage of transaction
- subscription for professional workers
- promoted workers
- business accounts

BUT:

Do not automatically choose a model.

Analyze the advantages and disadvantages for the Zimbabwean market.

Recommend an initial monetization model that:

- is easy to understand
- does not discourage unemployed workers
- does not make small jobs uneconomical
- can sustain the platform
- works with EcoCash
- can scale

Clearly separate:

MVP monetization

from

FUTURE monetization.

---

# 10. JOB LIFECYCLE

Define the complete job state machine.

For example:

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

Also define possible alternative states:

- Cancelled
- Expired
- Disputed
- Payment failed
- Worker rejected
- Customer rejected
- No-show
- Reassigned
- Suspended
- Fraud review

Determine the correct lifecycle.

---

# 11. BIDDING SYSTEM

Design the marketplace bidding model.

Answer questions such as:

- How long does bidding remain open?
- Can customers accept a bid immediately?
- Can workers change bids?
- Can workers withdraw bids?
- Can customers negotiate?
- Can workers submit one bid or multiple?
- What happens if nobody bids?
- Can the customer invite a specific nearby worker?
- Can workers see competing bids?
- Should workers see the customer's maximum budget?
- How should urgent jobs work?
- Should bidding be fixed-price, negotiated, or both?

Recommend the best MVP approach.

---

# 12. MATCHING SYSTEM

Define how the platform finds appropriate workers.

Potential factors:

- Skill/category
- Distance
- Availability
- Rating
- Completed jobs
- Verification level
- Response rate
- Cancellation rate
- Current workload
- ETA

Do not assume "closest wins."

Develop a fair matching philosophy.

The platform should avoid creating a system where established workers permanently dominate new workers.

Consider:

# New Worker Fairness

A new worker with:

- verified identity
- verified EcoCash
- appropriate skills
- reasonable price

should still have a chance to receive jobs.

Document how the marketplace can prevent winner-takes-all behaviour.

---

# 13. RATINGS & REPUTATION

Design a reputation system.

Customers should be able to rate workers.

Workers should also be able to rate customers.

Potential rating categories:

- Quality
- Professionalism
- Communication
- Punctuality
- Value

Determine whether a simple 5-star rating is enough for MVP.

Also investigate:

- fake reviews
- retaliatory reviews
- review manipulation
- rating inflation
- unfair ratings
- disputes over reviews

---

# 14. SAFETY

Because workers may enter people's homes, safety must be a first-class product requirement.

Document:

CUSTOMER SAFETY

WORKER SAFETY

PLATFORM SAFETY

Potential features:

- identity verification
- job sharing
- emergency contact
- trip/job tracking
- check-in/check-out
- report user
- block user
- emergency support
- suspicious activity detection

Do not overbuild this for MVP, but clearly define what should exist immediately versus later.

---

# 15. PRODUCT DIFFERENTIATION

The platform should NOT simply be:

"Ezi Services but with more categories."

Identify our unique Zimbabwean advantages.

Explore differentiation around:

- unemployed youth
- EcoCash-first economy
- hyperlocal matching
- bidding
- location
- strong KYC
- informal workers
- low-bandwidth design
- affordable small jobs
- trust
- reputation
- Zimbabwe-specific payment and identity systems

Produce a clear:

# "Why this product should exist"

statement.

Also create a:

# "Why would someone use this instead of WhatsApp/Facebook Marketplace?"

argument.

---

# 16. COMPETITIVE ANALYSIS

Use Ezi Services as inspiration/reference:

https://ezi.services/

But do not clone it.

Analyze the general marketplace model and identify:

- what it does well
- what we can learn
- what we should avoid
- what is missing for Zimbabwe
- where our product can differentiate

Also identify relevant alternatives Zimbabweans currently use, such as:

- WhatsApp
- Facebook Marketplace
- informal referrals
- classifieds
- local contractor networks

The goal is not to copy competitors.

The goal is to understand the existing behaviour we are replacing or improving.

---

# 17. MVP VS FUTURE

Create a very strict MVP boundary.

MVP should focus on proving:

# "Can we successfully match a customer with a trusted nearby worker and complete a paid job?"

MVP should include only what is necessary to prove that.

Create three categories:

MUST HAVE — MVP

SHOULD HAVE — Post-MVP

FUTURE / ADVANCED

Do not allow feature creep.

---

# 18. KEY BUSINESS QUESTIONS

Identify every important unanswered business question.

Examples:

- What exact percentage does the platform charge?
- Who pays the platform fee?
- How does EcoCash settlement work?
- Is escrow technically possible?
- What happens when customers refuse to confirm completion?
- What happens when workers claim the job was completed?
- Who handles disputes?
- Can minors register?
- What is the minimum age?
- What jobs are prohibited?
- What happens with dangerous jobs?
- What geographic area launches first?
- Should launch start in Harare?
- Bulawayo?
- Mutare?
- Gweru?
- Nationwide?
- How do we acquire the first 1,000 workers?
- How do we prevent fake jobs?
- How do we prevent worker oversupply in one area?
- How do we handle poor connectivity?
- How do we calculate commissions?
- How do we handle refunds?

Create an explicit:

# OPEN QUESTIONS

section.

Do NOT silently invent answers.

---

# 19. LEGAL / REGULATORY CONSIDERATIONS

Do not provide legal advice.

Instead, identify areas requiring professional/legal verification in Zimbabwe.

Examples:

- KYC requirements
- identity data storage
- privacy
- consumer protection
- payment regulations
- money handling
- worker classification
- platform liability
- dispute resolution
- insurance
- prohibited services
- data retention
- minors
- background checks

Mark these as:

REQUIRES LEGAL / PROFESSIONAL VERIFICATION.

---

# 20. SUCCESS METRICS

Define measurable marketplace KPIs.

Examples:

- Registered customers
- Verified workers
- Active workers
- Jobs posted
- Jobs receiving bids
- Job completion rate
- Average time to first bid
- Average time to worker acceptance
- Repeat customers
- Worker retention
- Average job value
- Platform revenue
- Cancellation rate
- Dispute rate
- Fraud rate

Recommend the most important metrics for MVP.

---

# 21. PRODUCT PRINCIPLES

Create approximately 8–12 principles that should guide all future development.

Examples:

1. Zimbabwe first.
2. Low bandwidth first.
3. Trust before transactions.
4. Simple beats complicated.
5. EcoCash first.
6. Location matters.
7. Workers deserve opportunity.
8. Customers deserve safety.
9. Never expose unnecessary personal information.
10. Build for affordable Android phones.
11. Every feature must solve a real problem.
12. Do not build unnecessary complexity.

Improve these principles where necessary.

---

# 22. DELIVERABLE

Create a professional Business Requirements Document.

Create this structure:

docs/
└── phase-1/
    ├── BUSINESS_REQUIREMENTS.md
    ├── PRODUCT_VISION.md
    ├── MVP_SCOPE.md
    ├── USER_PERSONAS.md
    ├── MARKETPLACE_MODEL.md
    ├── TRUST_AND_SAFETY.md
    ├── BUSINESS_MODEL.md
    ├── RISKS_AND_ASSUMPTIONS.md
    └── OPEN_QUESTIONS.md

The main source of truth should be:

docs/phase-1/BUSINESS_REQUIREMENTS.md

---

# 23. DOCUMENT QUALITY

The documents must be:

- professional
- clear
- structured
- practical
- specific to Zimbabwe
- developer-friendly
- understandable by a non-technical founder
- detailed enough to guide future development

Avoid meaningless corporate language.

Do not write vague statements like:

"The application should be scalable."

Instead explain what scalability means for THIS marketplace.

---

# 24. IMPORTANT: CHALLENGE MY IDEAS

Do not simply agree with everything I have proposed.

You are acting as:

- Product strategist
- Marketplace expert
- UX thinker
- Technical product analyst
- Zimbabwe market analyst
- Trust & safety analyst

If you believe an idea could cause problems, say so.

For every major recommendation, explain:

WHY

TRADE-OFF

RECOMMENDATION

Do not blindly copy inDrive mechanics.

Adapt them to this marketplace.

---

# 25. DO NOT CODE

For this phase:

DO NOT:

- create React components
- create Flutter screens
- create APIs
- create database schemas
- install dependencies
- configure Firebase
- configure maps
- integrate EcoCash
- create authentication
- build UI
- write application code

This is a product/business requirements phase.

Documentation only.

You may inspect the repository to understand the current project state, but do not modify application code.

---

# 26. FINAL REVIEW

Before finishing Phase 1, perform a requirements audit.

Check whether the documentation answers:

1. What problem are we solving?
2. Who are we solving it for?
3. Why would they use us?
4. How does the marketplace work?
5. How does bidding work?
6. How does location work?
7. How does EcoCash fit into the system?
8. How does KYC work?
9. How do we keep people safe?
10. How does a job move from posting to completion?
11. How does the platform make money?
12. What exactly belongs in MVP?
13. What does NOT belong in MVP?
14. What are the biggest risks?
15. What assumptions need validation?
16. What questions remain unanswered?
17. What should Phase 2 focus on?

Then produce a final section:

# PHASE 1 COMPLETION REPORT

Include:

- Documents created
- Key product decisions
- Important assumptions
- Major risks discovered
- Unresolved questions
- Recommended MVP
- Recommended next phase
- Any changes you recommend to my original concept

DO NOT start Phase 2.

STOP after Phase 1 is complete and wait for my review.