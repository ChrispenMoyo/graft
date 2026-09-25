# RISKS AND ASSUMPTIONS

## GRAFT

**Document:** `risks_and_assumptions.md`  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Product:** GRAFT  
**Primary Market:** Zimbabwe  
**Product Type:** Two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Admin Platform:** Required  
**Primary Payment Direction:** EcoCash only, subject to capability validation  
**Status:** Initial Risks and Assumptions Register  

---

# 1. PURPOSE OF THIS DOCUMENT

This document identifies the major assumptions, uncertainties, dependencies, and risks associated with building and launching GRAFT.

GRAFT is a two-sided marketplace. Its success depends on multiple conditions being true at the same time:

- Customers must have real service needs.
- Customers must be willing to use a digital marketplace.
- Workers must be willing to join.
- Suitable workers must be available in the launch market.
- Jobs must receive meaningful bids.
- Customers must trust enough of the available information to select workers.
- Workers must trust the opportunity enough to spend time bidding.
- Payment must work through a validated EcoCash model.
- Real-world jobs must reach successful completion at a sustainable rate.
- GRAFT must be able to operate trust, safety, verification, support, and disputes at a realistic cost.

Many of these conditions are currently assumptions.

The purpose of this document is not to predict that GRAFT will fail. It is to make uncertainty visible before GRAFT commits significant time, money, or technical complexity.

The central principle is:

> **An untested assumption is a potential risk.**

---

# 2. HOW TO READ THIS DOCUMENT

Each major item is described using:

- **Assumption / Risk**
- **Why it matters**
- **Current status**
- **Potential impact**
- **Likelihood**
- **Validation or mitigation direction**
- **Owner / dependency direction where relevant**

The ratings in this document are initial product-planning assessments, not statistically proven probabilities.

Suggested interpretation:

| Rating | Meaning |
|---|---|
| Low | Limited expected effect or relatively easy to manage |
| Medium | Important and requires active monitoring |
| High | Could materially affect MVP viability or launch |
| Critical | Could invalidate the business model or prevent launch |

---

# 3. CORE GRAFT ASSUMPTIONS

## A1 — Customers Have a Meaningful Problem

### Assumption

Customers in the intended launch market experience a real and recurring problem finding reliable local workers for small service jobs.

### Why it matters

If the problem is weak, GRAFT may solve something users do not consider important enough to change their behaviour for.

### Current status

Unvalidated.

### Impact if false

Critical.

### Validation direction

Interview potential customers and investigate:

- How they currently find workers
- What frustrates them
- How often they need services
- Which categories cause the most difficulty
- Whether trust, availability, price comparison, or convenience is the main problem
- Whether they would realistically use GRAFT

---

## A2 — Workers Need More Access to Jobs

### Assumption

Suitable workers want access to additional legitimate job opportunities and are willing to participate in a digital marketplace.

### Why it matters

Without sufficient worker supply, customers will post jobs and receive no meaningful response.

### Current status

Unvalidated.

### Impact if false

Critical.

### Validation direction

Interview workers across intended launch categories.

Test:

- Interest in GRAFT
- Smartphone access
- Comfort with mobile applications
- Preferred job types
- Willingness to travel
- Price expectations
- Concerns about fraud and non-payment
- Willingness to complete verification
- Willingness to bid

---

## A3 — Customers Will Trust a Marketplace Enough to Hire

### Assumption

Customers will be willing to hire workers through GRAFT when appropriate trust information is available.

### Why it matters

The marketplace can have supply and demand but still fail if customers prefer personal referrals only.

### Current status

Unvalidated.

### Impact if false

High to Critical.

### Validation direction

Test which trust signals matter most:

- Ratings
- Completed jobs
- Identity verification
- Skills
- Recommendations
- Distance
- Price
- Referral-like mechanisms

---

## A4 — Workers Will Trust GRAFT Enough to Participate

### Assumption

Workers will believe jobs on GRAFT are genuine and worth spending time responding to.

### Why it matters

Workers may ignore the marketplace if they experience:

- Fake jobs
- Excessive unpaid bidding
- Poor conversion from bid to job
- Payment uncertainty
- Excessive verification friction

### Current status

Unvalidated.

### Impact if false

High.

### Validation direction

Measure:

- Bid participation
- Repeat worker activity
- Bid-to-selection rate
- Worker feedback
- Job authenticity complaints

---

## A5 — A Bidding Model Is Appropriate

### Assumption

A bidding model provides enough value to customers and workers for the initial GRAFT marketplace.

### Why it matters

Bidding may improve customer choice but can also create friction, waiting time, and price competition.

### Current status

Unvalidated.

### Impact if false

High.

### Validation direction

Test whether users understand and prefer:

- Open bidding
- Fixed-price services
- Direct worker selection
- Hybrid models

---

## A6 — The Launch Market Can Reach Marketplace Liquidity

### Assumption

A focused geographic launch can create enough supply and demand for jobs to receive relevant bids within a reasonable time.

### Why it matters

A marketplace without liquidity creates poor first experiences.

```text
CUSTOMER POSTS JOB
        ↓
NO RELEVANT WORKER RESPONDS
        ↓
CUSTOMER LOSES TRUST
        ↓
CUSTOMER DOES NOT RETURN
```

### Current status

Unvalidated.

### Impact if false

Critical.

### Validation direction

Before broad launch, estimate:

- Available worker density
- Expected customer demand
- Job frequency
- Worker coverage
- Likely time to first bid
- Category-level supply gaps

---

## A7 — GRAFT Can Start in One Geographic Market

### Assumption

Starting with one validated city or geographic area is sufficient to test the marketplace.

### Why it matters

A narrow launch helps concentrate supply and demand.

### Current status

Strong strategic direction, exact market unvalidated.

### Impact if false

High.

### Validation direction

Compare candidate launch markets based on:

- Population and density
- Smartphone usage
- Worker availability
- Category demand
- Operational access
- Network conditions
- EcoCash feasibility

---

## A8 — EcoCash Can Support the Required Payment Model

### Assumption

A validated EcoCash integration or operational payment flow can support the MVP marketplace transaction requirements.

### Why it matters

Payment is part of the core GRAFT transaction loop.

### Current status

Unvalidated and dependent on provider capability, commercial requirements, technical access, and regulatory requirements.

### Impact if false

Critical.

### Validation direction

Confirm directly with relevant payment-provider and professional sources:

- API availability
- Merchant requirements
- Marketplace support
- Payment initiation
- Payment confirmation
- Webhooks/callbacks where applicable
- Settlement
- Refunds
- Fees
- Limits
- Dispute implications

---

## A9 — GRAFT Can Obtain and Manage Required Verification Information

### Assumption

GRAFT can legally and operationally collect the information required for its verification model.

### Why it matters

Trust controls may depend on identity and other verification data.

### Current status

Unvalidated.

### Impact if false

Critical.

### Validation direction

Obtain appropriate legal, privacy, and regulatory guidance before implementation.

---

## A10 — Users Will Complete Required Verification

### Assumption

The verification process will not create so much friction that suitable users abandon onboarding.

### Why it matters

More verification can increase trust but reduce conversion.

### Current status

Unvalidated.

### Impact if false

High.

### Validation direction

Test:

- Onboarding completion rate
- Verification completion rate
- Time to complete verification
- Drop-off points
- User feedback

---

# 4. MAJOR MARKETPLACE RISKS

## R1 — Cold Start Risk

### Risk

GRAFT launches without enough workers, customers, or both.

### Impact

Critical.

### Likelihood

High for an early two-sided marketplace.

### Consequences

- Jobs receive no bids
- Workers see too few opportunities
- Users abandon the platform
- Marketing spend is wasted

### Mitigation direction

- Launch narrowly
- Recruit supply before broad demand acquisition
- Focus on selected categories
- Consider managed early marketplace operations
- Monitor liquidity by area and category

---

## R2 — Supply-Demand Imbalance

### Risk

GRAFT has many workers but too few jobs, or many jobs but too few suitable workers.

### Impact

High.

### Likelihood

High.

### Mitigation direction

Track supply and demand separately by:

- Category
- Geography
- Availability
- Time period

Avoid using total user numbers as the only marketplace health indicator.

---

## R3 — Low Job Response Rate

### Risk

Customers post jobs but do not receive bids.

### Impact

Critical.

### Mitigation direction

Investigate:

- Category supply
- Matching radius
- Worker notifications
- Job quality
- Pricing expectations
- Timing
- Worker availability

Key metric:

> Percentage of jobs receiving at least one meaningful bid.

---

## R4 — Slow Time to First Bid

### Risk

Workers eventually respond, but customers wait too long.

### Impact

High.

### Mitigation direction

Measure:

- Median time to first bid
- Category differences
- Geographic differences
- Time-of-day differences

---

## R5 — Race-to-the-Bottom Pricing

### Risk

Workers compete primarily on the lowest price.

### Impact

High.

### Consequences

- Low worker earnings
- Poor service incentives
- Unrealistic bids
- Quality concerns

### Mitigation direction

Show customers multiple decision factors, including:

- Price
- Rating
- Relevant skills
- Completed jobs
- Availability
- Verification

---

## R6 — Unrealistic or Misleading Bids

### Risk

Workers submit artificially low bids and later attempt to increase the price.

### Impact

High.

### Mitigation direction

- Record proposed bid terms
- Define change rules
- Track repeated behaviour
- Provide reporting/dispute capability

---

## R7 — Customer Cancellation After Worker Commitment

### Risk

Workers invest time preparing or travelling and customers repeatedly cancel.

### Impact

High.

### Mitigation direction

Define:

- Job cancellation states
- Cancellation records
- Appropriate customer accountability
- Payment/cancellation rules only after the payment model is validated

---

## R8 — Worker No-Shows

### Risk

Workers accept jobs but fail to arrive.

### Impact

High.

### Mitigation direction

- Record no-show outcomes
- Support reporting
- Track repeated patterns
- Apply appropriate account actions

---

## R9 — Poor Service Quality

### Risk

Work is completed but the customer considers the quality unacceptable.

### Impact

High.

### Mitigation direction

- Clear job descriptions
- Relevant worker information
- Completion confirmation
- Ratings
- Basic dispute handling

GRAFT must avoid guaranteeing quality unless it can actually do so.

---

# 5. TRUST AND SAFETY RISKS

## R10 — Fake or Misrepresented Identities

### Risk

A user creates an account using false or misleading identity information.

### Impact

Critical.

### Mitigation direction

- Phone verification
- Appropriate worker verification
- Admin review
- Appropriate duplicate/suspicious account controls

---

## R11 — Verification Creates False Confidence

### Risk

Users assume a verified badge means GRAFT guarantees safety or service quality.

### Impact

High.

### Mitigation direction

Use precise trust communication.

A verification indicator should explain or accurately represent what it means.

---

## R12 — Privacy Exposure

### Risk

Sensitive information such as exact addresses, identity documents, or personal contact details is exposed unnecessarily.

### Impact

Critical.

### Mitigation direction

- Progressive location disclosure
- Role-based access
- Restricted verification-data access
- Data minimization
- Appropriate security controls

---

## R13 — Physical Safety Incidents

### Risk

A real-world meeting results in unsafe behaviour or physical harm.

### Impact

Critical.

### Likelihood

Unknown.

### Mitigation direction

- Appropriate verification
- Accountability
- Reporting
- Blocking
- Controlled information sharing
- Clear safety communication

GRAFT should not claim to guarantee personal safety.

---

## R14 — Harassment

### Risk

Customers or workers use marketplace access to harass another person.

### Impact

High.

### Mitigation direction

- Reporting
- Blocking
- Admin review
- Appropriate account actions

---

## R15 — False Reports and Retaliation

### Risk

Users abuse reporting systems to harm another user's reputation.

### Impact

Medium to High.

### Mitigation direction

- Do not treat every report as automatic proof
- Maintain relevant context
- Allow appropriate review
- Record repeat abuse patterns

---

# 6. PAYMENT RISKS

## R16 — EcoCash Capability Mismatch

### Risk

The desired GRAFT payment flow requires capabilities that are unavailable, commercially unsuitable, or not permitted.

### Impact

Critical.

### Mitigation direction

Validate before finalizing technical architecture or user promises.

---

## R17 — Payment Confirmation Failure

### Risk

A customer pays but GRAFT cannot reliably determine whether payment succeeded.

### Impact

Critical.

### Mitigation direction

Use validated provider confirmation mechanisms and clear pending states.

---

## R18 — Duplicate Payment

### Risk

A user retries after uncertainty and pays twice.

### Impact

High.

### Mitigation direction

- Idempotent transaction handling where technically appropriate
- Clear payment states
- Transaction references
- Retry controls

---

## R19 — Incorrect Payment Amount

### Risk

The payment amount does not match the agreed transaction.

### Impact

High.

### Mitigation direction

Validate transaction amounts against the agreed marketplace state where supported.

---

## R20 — Refund and Reversal Limitations

### Risk

A dispute requires a refund but the actual payment model cannot support the assumed process.

### Impact

Critical.

### Mitigation direction

Do not promise refund capability until validated.

---

## R21 — Escrow Assumption

### Risk

Product design assumes GRAFT can hold money safely until completion without confirmed legal, regulatory, or provider support.

### Impact

Critical.

### Mitigation direction

Treat escrow as unavailable until explicitly validated.

---

# 7. TECHNOLOGY AND PRODUCT RISKS

## R22 — Poor Connectivity

### Risk

Users experience slow or unstable network connections.

### Impact

High.

### Mitigation direction

- Lightweight application
- Retry support
- Clear pending/error states
- Compression
- Minimal unnecessary requests
- Duplicate-action protection

---

## R23 — Low-End Device Constraints

### Risk

The application performs poorly on common affordable devices.

### Impact

High.

### Mitigation direction

- Performance budgets
- Android device testing
- Conservative background activity
- Efficient image handling

---

## R24 — GPS Inaccuracy or Battery Cost

### Risk

Location information is inaccurate or location tracking consumes excessive battery/data.

### Impact

Medium to High.

### Mitigation direction

Use location only where needed.

Avoid continuous tracking as an MVP default.

---

## R25 — Notification Failure

### Risk

Workers do not learn about relevant jobs in time.

### Impact

High.

### Mitigation direction

Track notification delivery and fallback/retry approaches where appropriate.

---

## R26 — Complex State Management

### Risk

Job, payment, and dispute states become inconsistent.

### Impact

Critical.

### Mitigation direction

Define a formal state model before implementation.

Important transitions should be explicit.

---

# 8. BUSINESS MODEL RISKS

## R27 — Unit Economics Do Not Work

### Risk

The cost of acquiring users, operating verification, handling disputes, supporting users, and processing transactions exceeds sustainable marketplace revenue.

### Impact

Critical.

### Current status

Unvalidated.

### Mitigation direction

Model:

- Revenue per completed job
- Cost per transaction
- Support cost
- Verification cost
- Payment fees
- Customer acquisition cost
- Worker acquisition cost
- Dispute cost

---

## R28 — Revenue Model Reduces Adoption

### Risk

Platform fees or monetization create too much friction.

### Impact

High.

### Mitigation direction

Test monetization only after understanding user behaviour and payment economics.

---

## R29 — High Operational Cost

### Risk

Manual verification, dispute handling, and support require more human effort than the business can sustain.

### Impact

High.

### Mitigation direction

Track operational workload from the earliest pilot.

Do not assume all marketplace operations can be automated immediately.

---

## R30 — Customer Acquisition Is Too Expensive

### Risk

GRAFT can acquire customers only at an unsustainable cost.

### Impact

High.

### Mitigation direction

Test acquisition channels and repeat usage.

---

## R31 — Worker Acquisition Is Too Expensive

### Risk

Recruiting enough qualified workers requires excessive cost or effort.

### Impact

High.

### Mitigation direction

Test:

- Direct outreach
- Partnerships
- Referrals
- Local category recruitment

---

# 9. LEGAL AND REGULATORY RISKS

## R32 — KYC and Privacy Requirements Are Misunderstood

### Risk

GRAFT collects or processes identity information without an appropriate legal basis or compliant process.

### Impact

Critical.

### Mitigation direction

Professional legal/privacy review before implementation.

---

## R33 — Payment Regulation Risk

### Risk

GRAFT's intended payment model creates regulatory obligations that were not considered.

### Impact

Critical.

### Mitigation direction

Validate payment architecture with appropriate legal, regulatory, and provider guidance.

---

## R34 — Worker Classification Risk

### Risk

The relationship between GRAFT and workers creates obligations or legal risks that were not considered.

### Impact

High to Critical.

### Mitigation direction

Professional legal review.

---

## R35 — Regulated Service Categories

### Risk

Some categories require licences, qualifications, or additional controls.

### Impact

High.

### Mitigation direction

Validate categories individually before launch.

---

## R36 — Consumer Protection and Liability

### Risk

GRAFT's policies, marketing, dispute processes, or product promises create obligations or liability exposure.

### Impact

Critical.

### Mitigation direction

Professional legal review of:

- Terms
- User policies
- Payment representations
- Verification claims
- Disclaimers
- Dispute processes

---

# 10. OPERATIONAL RISKS

## R37 — Admin Team Cannot Keep Up

### Risk

Reports, verification, disputes, and payment issues exceed operational capacity.

### Impact

High.

### Mitigation direction

Track workload and define operational service levels based on actual capacity.

---

## R38 — Inconsistent Moderation

### Risk

Different cases receive inconsistent decisions.

### Impact

Medium to High.

### Mitigation direction

Develop internal policies and decision guidelines.

---

## R39 — Slow Dispute Resolution

### Risk

Users lose trust because disputes remain unresolved too long.

### Impact

High.

### Mitigation direction

Define realistic priorities and response processes.

Do not promise response times that cannot be met.

---

## R40 — Inadequate Audit Trail

### Risk

GRAFT cannot reconstruct what happened during an important marketplace incident.

### Impact

High.

### Mitigation direction

Maintain appropriate records of:

- Job changes
- Bids
- Selection
- Payment states
- Reports
- Disputes
- Admin actions

subject to applicable privacy requirements.

---

# 11. COMPETITIVE AND BEHAVIOURAL RISKS

## R41 — Users Prefer Existing Informal Channels

### Risk

Customers and workers prefer WhatsApp, referrals, Facebook, or other existing methods.

### Impact

High.

### Mitigation direction

GRAFT must provide a meaningful improvement rather than simply copying existing communication channels.

Potential value may come from:

- Discovery
- Comparison
- Structured bidding
- Reputation
- Accountability
- Convenience

---

## R42 — Off-Platform Leakage

### Risk

Users meet through GRAFT and complete future transactions outside the platform.

### Impact

High.

### Mitigation direction

Create continuing marketplace value rather than relying only on restrictions.

---

## R43 — Trust Takes Too Long to Build

### Risk

Users require more reputation history before they are willing to transact.

### Impact

High.

### Mitigation direction

Test which trust signals are sufficient for early adoption.

---

## R44 — New Workers Cannot Get Their First Jobs

### Risk

Customers always choose workers with established GRAFT histories.

### Impact

Medium to High.

### Mitigation direction

Future marketplace design should balance:

- Customer trust
- Proven history
- Fair access for legitimate new workers

---

# 12. ASSUMPTION VALIDATION PRIORITIES

The following assumptions should be validated before significant implementation investment.

## Priority 1 — Critical

1. Customers have a strong enough problem.
2. Workers want additional job access.
3. One launch market can reach liquidity.
4. Suitable categories have enough supply and demand.
5. EcoCash can support a viable payment flow.
6. GRAFT can legally and operationally implement its required verification model.

---

## Priority 2 — High

1. Customers will trust marketplace workers enough to hire.
2. Workers will trust marketplace jobs enough to bid.
3. The bidding model is appropriate.
4. Verification friction is acceptable.
5. Unit economics can become sustainable.
6. GRAFT can manage disputes and operations at realistic cost.

---

## Priority 3 — Important

1. Which trust signals matter most?
2. Which categories should launch first?
3. What matching radius works best?
4. What notification strategy drives response?
5. What monetization model is acceptable?

---

# 13. ASSUMPTION TESTING FRAMEWORK

Each important assumption should have a validation plan.

```text
ASSUMPTION
        ↓
DEFINE WHAT MUST BE TRUE
        ↓
CREATE TEST
        ↓
COLLECT EVIDENCE
        ↓
MEASURE RESULT
        ↓
DECIDE:
VALIDATED / INVALIDATED / UNCERTAIN
        ↓
UPDATE PRODUCT DIRECTION
```

GRAFT should avoid treating opinions as validation.

Examples of stronger evidence include:

- Repeated user interviews showing the same problem
- Workers completing onboarding voluntarily
- Customers posting real jobs
- Workers submitting real bids
- Customers selecting workers
- Jobs reaching successful completion
- Repeat usage

---

# 14. KEY RISK REGISTER

| ID | Risk | Impact | Initial Likelihood | Priority |
|---|---|---|---|---|
| R1 | Cold start / no liquidity | Critical | High | Critical |
| R2 | Supply-demand imbalance | High | High | Critical |
| R3 | Jobs receive no bids | Critical | High | Critical |
| R5 | Race-to-the-bottom pricing | High | Medium | High |
| R8 | Worker no-shows | High | Medium | High |
| R10 | Fake identities | Critical | Medium | Critical |
| R12 | Privacy exposure | Critical | Medium | Critical |
| R13 | Physical safety incident | Critical | Unknown | Critical |
| R16 | EcoCash capability mismatch | Critical | Medium | Critical |
| R17 | Payment confirmation failure | Critical | Medium | Critical |
| R18 | Duplicate payment | High | Medium | High |
| R21 | Unsupported escrow assumption | Critical | Medium | Critical |
| R22 | Poor connectivity | High | High | High |
| R26 | Inconsistent transaction states | Critical | Medium | Critical |
| R27 | Unsustainable unit economics | Critical | Unknown | Critical |
| R29 | High operational cost | High | High | High |
| R32 | KYC/privacy non-compliance | Critical | Medium | Critical |
| R33 | Payment regulatory risk | Critical | Medium | Critical |
| R34 | Worker classification risk | High/Critical | Unknown | High |
| R37 | Admin capacity overload | High | Medium | High |
| R41 | Existing channels remain preferred | High | High | High |
| R42 | Off-platform leakage | High | High | High |

---

# 15. RISK RESPONSE STRATEGIES

GRAFT should generally use one of five approaches:

## Avoid

Do not build or promise something before capability is validated.

Example:

> Do not promise escrow until the payment and regulatory model supports it.

---

## Reduce

Introduce product or operational controls that reduce likelihood or impact.

Example:

> Use controlled location disclosure to reduce unnecessary privacy exposure.

---

## Validate

Run research or technical investigation before committing.

Example:

> Validate EcoCash capabilities directly.

---

## Accept and Monitor

Some marketplace risk cannot be completely removed.

Example:

> Real-world service quality will always vary.

The objective is to monitor, respond, and improve.

---

## Escalate to Professionals

Some risks cannot be resolved through product reasoning alone.

Examples:

- Legal
- Regulatory
- Tax
- Payment compliance
- Data protection
- Security
- Insurance

These require appropriate professional guidance.

---

# 16. MVP RISK GATES

Before GRAFT moves from planning into full MVP implementation, the following gates should be addressed.

## Gate 1 — Problem Validation

Evidence that:

- Customers have the problem.
- The problem is sufficiently painful.
- Customers are interested in a better solution.

---

## Gate 2 — Supply Validation

Evidence that:

- Suitable workers exist.
- They are willing to join.
- They are willing to complete appropriate verification.
- They are willing to bid.

---

## Gate 3 — Launch Market Validation

Evidence that:

- One launch market has realistic liquidity potential.
- Selected categories have sufficient supply and demand.

---

## Gate 4 — Payment Feasibility

Validated understanding of:

- EcoCash capabilities
- Payment flow
- Confirmation
- Settlement
- Refund implications
- Fees
- Commercial requirements

---

## Gate 5 — Trust and Safety Feasibility

Validated understanding of:

- Verification requirements
- Data handling
- Admin review
- Reporting
- Disputes
- Account actions

---

## Gate 6 — Legal and Regulatory Review

Appropriate professional guidance for the areas that cannot safely be assumed.

---

# 17. REQUIRES LEGAL / PROFESSIONAL VERIFICATION

Before implementation, GRAFT requires appropriate professional validation regarding:

- KYC
- Identity verification
- Identity document collection and storage
- Biometric/selfie processing
- Data protection
- Data retention
- Location data
- Payment regulation
- EcoCash marketplace and merchant requirements
- Money handling
- Settlement
- Refunds
- Escrow
- Consumer protection
- Platform liability
- Worker classification
- Tax obligations
- Regulated service categories
- Licensing and credentials
- Insurance
- Dispute processes

This document does not provide legal, financial, regulatory, tax, security, or professional advice.

---

# 18. KEY DECISIONS THAT MUST NOT BE ASSUMED

The following should remain explicitly marked as open until validated:

1. Exact launch city or geographic market
2. Final launch service categories
3. Exact verification requirements
4. Exact KYC process
5. EcoCash API and commercial capability
6. Payment confirmation mechanism
7. Refund capability
8. Settlement model
9. Escrow feasibility
10. GRAFT revenue model
11. Final commission or fee structure
12. Worker classification model
13. Dispute authority and obligations
14. Prohibited and restricted service categories
15. Data retention rules
16. Insurance strategy
17. Exact matching radius
18. Final bidding rules

---

# 19. FINAL RISK AND ASSUMPTION STATEMENT

GRAFT should be developed with the understanding that the biggest risks are not only technical.

The most important uncertainties involve whether the marketplace itself can become viable.

A successful GRAFT marketplace requires:

```text
REAL CUSTOMER PROBLEM
        +
SUFFICIENT WORKER SUPPLY
        +
LOCAL MARKETPLACE LIQUIDITY
        +
MEANINGFUL TRUST
        +
APPROPRIATE VERIFICATION
        +
RELIABLE JOB MATCHING
        +
A WORKABLE PAYMENT MODEL
        +
SUCCESSFUL JOB COMPLETION
        +
SUSTAINABLE OPERATIONS
```

If any major part of this system fails, the marketplace can struggle even if the application itself is technically excellent.

Therefore:

> **GRAFT should validate its highest-risk assumptions as early as possible and avoid building complex features around unproven beliefs.**

The MVP should not attempt to eliminate every risk.

Its purpose is to test the most important assumptions with real users and real marketplace behaviour.

The guiding principle is:

> **Build enough to test reality, measure what happens, and change direction when evidence requires it.**

---

# DOCUMENT STATUS

**Product:** GRAFT  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Document:** `risks_and_assumptions.md`  
**Status:** Initial Risks and Assumptions Register  
**Primary Market:** Zimbabwe  
**Product Type:** Two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Admin Platform:** Required  
**Payment Direction:** EcoCash only, subject to capability validation  
**Core Purpose:** Identify, prioritize, and validate assumptions and risks before and during MVP development  
**Highest Initial Risk Areas:** Marketplace liquidity, payment feasibility, verification/legal feasibility, trust and safety, unit economics, and operational scalability  
**Technical Architecture:** To be defined in a later phase  
**Implementation:** Not started  
**Legal / Regulatory Areas:** Require professional verification
