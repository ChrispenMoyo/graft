# TRUST AND SAFETY

## GRAFT

**Document:** `trust_and_safety.md`  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Product:** GRAFT  
**Primary Market:** Zimbabwe  
**Product Type:** Two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Admin Platform:** Required  
**Primary Payment Direction:** EcoCash only, subject to capability validation  
**Status:** Initial Trust & Safety Framework  

---

# 1. PURPOSE OF THIS DOCUMENT

This document defines the initial **Trust and Safety framework for GRAFT**.

GRAFT is a marketplace where customers and workers may be connected to complete real-world services. Unlike a purely digital marketplace, GRAFT can involve:

- People meeting in person
- Work being performed at homes or other physical locations
- Personal information
- Location information
- Payments
- Identity and verification information
- Service quality disputes
- Potential fraud
- Potential harassment
- Potential safety concerns

Trust and safety therefore cannot be treated as a feature that is added after the marketplace is built.

For GRAFT:

> **Trust and safety are part of the core marketplace infrastructure.**

This document defines the initial product principles, risks, controls, responsibilities, and open questions that should guide later product requirements, operations, design, technical architecture, and legal validation.

It is intended to support the central GRAFT marketplace loop:

```text
CUSTOMER NEED
        ↓
JOB POSTED
        ↓
RELEVANT WORKER DISCOVERY
        ↓
BIDDING
        ↓
CUSTOMER SELECTION
        ↓
PAYMENT PROCESS
        ↓
REAL-WORLD SERVICE
        ↓
COMPLETION OR DISPUTE
        ↓
REPUTATION AND ACCOUNTABILITY
```

Every stage must be considered from a trust and safety perspective.

---

# 2. CORE TRUST AND SAFETY OBJECTIVE

The objective of GRAFT is not to promise that every marketplace interaction is completely risk-free.

No marketplace can honestly guarantee that.

The objective is to:

> **Reduce avoidable risk, create meaningful accountability, provide users with relevant trust information, limit harmful behaviour, detect and respond to problems, and maintain operational controls appropriate to the risks GRAFT can reasonably manage.**

GRAFT should not make safety claims that it cannot operationally support.

---

# 3. TRUST AND SAFETY PRINCIPLES

## 3.1 Trust Must Be Earned Through Signals

GRAFT should not ask users to trust every participant blindly.

The marketplace should provide meaningful signals such as:

- Account verification
- Appropriate worker verification
- Ratings from eligible marketplace transactions
- Completed job history
- Relevant skills and service information
- Appropriate status indicators
- Clear transaction history

A trust signal must not imply more than it actually means.

For example:

> A verification badge should communicate what has actually been verified, not create the false impression that GRAFT guarantees the quality or safety of every service.

---

## 3.2 Verification Is Not a Guarantee

Identity verification, KYC, phone verification, EcoCash-related verification, or document review can reduce some risks.

They do not guarantee that a person will:

- Perform work well
- Behave safely
- Behave honestly
- Arrive on time
- Avoid disputes

GRAFT must distinguish between:

```text
VERIFIED IDENTITY
```

and:

```text
GUARANTEED TRUSTWORTHINESS OR SERVICE QUALITY
```

These are not the same thing.

---

## 3.3 Accountability Must Exist on Both Sides

Trust and safety should not focus only on workers.

Customers can also create risks through:

- Fraudulent jobs
- Harassment
- Unsafe locations
- Refusal to follow agreed processes
- Payment disputes
- False reports
- Abuse of workers

Workers can create risks through:

- Fake identities
- Misrepresentation
- Poor or unsafe conduct
- Fraud
- No-shows
- Harassment
- Attempts to move transactions outside accountable GRAFT processes

Therefore:

> **GRAFT is responsible for designing accountability across both sides of the marketplace.**

---

## 3.4 Privacy Is a Safety Requirement

Unnecessary exposure of personal information can create safety risks.

GRAFT should follow:

> **Collect only information necessary for legitimate marketplace purposes and expose only information necessary for the current transaction stage.**

Examples:

- Exact home addresses should not be publicly visible.
- Private identity documents should not be visible to other users.
- Exact worker location should not be publicly visible continuously.
- Verification information should be represented appropriately without exposing sensitive documents.

---

## 3.5 Safety Controls Must Match Real Operational Capability

A safety feature is only valuable if GRAFT can realistically operate it.

The platform should not promise:

- 24/7 emergency intervention unless it exists
- Guaranteed background checks unless they are actually performed
- Guaranteed service quality
- Guaranteed personal safety
- Insurance protection unless actual coverage exists
- Escrow protection unless the payment model actually supports it

The principle is:

> **Do not create a safety promise that the GRAFT product and operations cannot fulfil.**

---

## 3.6 Trust and Safety Must Work Under Real Network Conditions

Zimbabwe-first marketplace design must consider:

- Unstable connections
- Slow networks
- Mobile data costs
- Affordable Android devices
- Interrupted uploads
- Delayed payment confirmations

Safety-critical and transaction-critical actions should not falsely appear successful because connectivity is interrupted.

---

# 4. GRAFT TRUST MODEL

GRAFT should build trust through multiple layers rather than relying on one badge or one score.

## Layer 1 — Account Integrity

The platform should establish that an account is connected to an appropriately verified user or contact method.

Potential controls:

- Phone verification
- Account authentication
- Duplicate-account controls where feasible
- Suspicious account review

---

## Layer 2 — Identity and Worker Verification

Workers may require stronger verification because they may perform services for customers in real-world locations.

Potential controls may include:

- Identity information
- Appropriate Zimbabwean identity documentation
- Selfie or identity confirmation where feasible
- Manual review where required
- Relevant payment-account verification where feasible and validated

The exact process remains subject to legal, operational, privacy, and technical validation.

---

## Layer 3 — Marketplace Behaviour

GRAFT should build evidence from actual marketplace participation.

Potential signals include:

- Completed jobs
- Eligible ratings
- Cancellations
- No-shows
- Reports
- Disputes
- Other validated reliability signals

Early marketplace data should be interpreted carefully.

A new worker should not automatically be treated as untrustworthy merely because they have not yet completed jobs on GRAFT.

---

## Layer 4 — Transaction Accountability

GRAFT should maintain appropriate records of marketplace activity.

Relevant records may include:

- Job creation
- Bids
- Worker selection
- Price agreement
- Job status changes
- Payment status
- Completion confirmation
- Ratings
- Reports
- Disputes
- Relevant admin actions

The purpose is to support accountability, operational review, and dispute handling.

---

## Layer 5 — Reporting and Intervention

Users must have a way to raise concerns.

GRAFT requires:

- Reporting
- Blocking
- Admin visibility
- Appropriate investigation workflows
- Account action capability
- Basic dispute handling

---

# 5. TRUST AND SAFETY RISK AREAS

The initial GRAFT framework should consider at least the following categories:

1. Identity fraud
2. Account fraud
3. Fake jobs
4. Worker misrepresentation
5. Customer abuse
6. Payment fraud
7. Payment failures
8. Off-platform transactions
9. Harassment
10. Physical safety concerns
11. Privacy exposure
12. Location misuse
13. Poor service and quality disputes
14. No-shows and cancellations
15. False ratings
16. Retaliatory ratings
17. False reports
18. Platform abuse
19. Data security concerns
20. Low-connectivity transaction failures

---

# 6. IDENTITY AND ACCOUNT SAFETY

## 6.1 Phone Verification

Phone verification is a foundational GRAFT account control.

Its purpose is to help establish a verified contact method and reduce some forms of low-effort anonymous account abuse.

It does not prove:

- Legal identity
- Skill
- Service quality
- Physical safety
- Payment reliability

GRAFT should not present phone verification as more than it is.

---

## 6.2 Worker Identity Verification

Workers should be subject to an appropriate verification process before participating in marketplace activities that require stronger trust controls.

The exact required threshold must be validated.

Potential worker verification inputs may include:

- Identity details
- Zimbabwe National ID or another valid form of identification where appropriate
- Selfie or identity confirmation where feasible
- Manual/admin review
- Other legally appropriate verification mechanisms

### REQUIRES LEGAL / PROFESSIONAL VERIFICATION

Before implementation, GRAFT must validate:

- What documents may be collected
- How documents may be processed
- Whether and how documents may be stored
- Retention periods
- Access controls
- Identity verification vendor requirements where applicable
- Biometric/selfie processing requirements

---

## 6.3 Customer Verification

Customers also participate in real-world transactions.

The MVP should establish an appropriate customer verification direction rather than assuming only workers create risk.

The final customer verification requirements should balance:

- Safety
- Fraud prevention
- User friction
- Marketplace supply and demand
- Legal requirements

---

## 6.4 Duplicate and Suspicious Accounts

GRAFT should consider reasonable controls against:

- Repeated fraudulent registrations
- Suspended users immediately creating replacement accounts
- Obvious duplicate abuse
- Suspicious account behaviour

The MVP does not require an advanced AI fraud system.

Basic controls, admin review, and appropriate technical safeguards are sufficient as an initial direction.

---

# 7. WORKER SKILL AND SERVICE REPRESENTATION

GRAFT workers must not be able to misrepresent their capabilities without accountability.

The marketplace should distinguish between:

```text
WHAT A WORKER CLAIMS
```

and:

```text
WHAT GRAFT HAS ACTUALLY VERIFIED
```

For example, a worker may list a skill, but GRAFT should not automatically imply professional certification unless that certification has actually been validated.

Where future categories require licences, qualifications, or regulated professional credentials, those requirements must be defined separately.

### REQUIRES LEGAL / PROFESSIONAL VERIFICATION

The team must validate which service categories may require:

- Licences
- Professional registration
- Formal certification
- Special insurance
- Additional safety controls

---

# 8. JOB SAFETY AND JOB LEGITIMACY

## 8.1 Legitimate Job Requirement

Customers should only use GRAFT to create legitimate jobs that are permitted by:

- Applicable law
- GRAFT marketplace policies
- Category rules
- Platform safety requirements

The platform must establish prohibited-job policies before launch.

---

## 8.2 Job Information

A customer should provide enough information for a worker to understand:

- What needs to be done
- Relevant category
- General location
- Timing
- Relevant photos where useful

Poor job information can create:

- Unsafe surprises
- Pricing disputes
- Wasted travel
- Misunderstandings

The MVP should encourage sufficient job clarity without creating excessive posting friction.

---

## 8.3 Prohibited or Restricted Work

Some jobs may be inappropriate or require additional controls.

Examples may include jobs involving:

- Illegal activity
- Dangerous materials
- Serious personal safety risks
- Services requiring regulated credentials
- Other restricted activities

The exact prohibited and restricted service list must be developed and professionally validated.

GRAFT must not silently assume that every local service category is safe or legally permitted.

---

# 9. LOCATION AND PHYSICAL SAFETY

## 9.1 Location Is Sensitive Information

A GRAFT job may take place at:

- A home
- A workplace
- A business
- Another private or public location

Exact location information should therefore be treated as sensitive marketplace data.

---

## 9.2 Progressive Location Disclosure

GRAFT should follow a stage-based approach where appropriate:

### Before worker selection

The worker may only need:

- Approximate area
- Approximate distance
- General geographic relevance

### After appropriate selection/transaction progression

The worker may receive the information necessary to reach and perform the job.

The exact disclosure model must be finalized in later product requirements.

---

## 9.3 Worker Location Privacy

Workers should not be continuously displayed on a public map.

The MVP should avoid:

- Always-on public tracking
- Exact live location exposure to all users
- Continuous background tracking without a clear need

Location functionality should be connected to legitimate marketplace needs.

---

## 9.4 Active-Job Location Features

During an active job, limited location functionality may be useful for:

- Arrival expectations
- Navigation
- Job progress

Continuous tracking should not automatically be required.

Any live-location feature must consider:

- Privacy
- Battery use
- Data use
- Consent
- Operational necessity

---

## 9.5 Physical Meeting Risks

GRAFT can reduce some risks through verification, accountability, reporting, and controlled information sharing.

However:

> GRAFT cannot guarantee the personal safety of every real-world meeting.

The product should therefore avoid claims of guaranteed safety.

Future safety procedures may include more advanced capabilities if GRAFT can actually support them operationally.

---

# 10. PAYMENT TRUST AND SAFETY

## 10.1 EcoCash-First Direction

The current GRAFT payment direction is:

> **EcoCash only for the initial marketplace payment strategy, subject to capability validation.**

Payment trust depends on accurate transaction status.

The system must distinguish between:

- Payment initiated
- Payment pending
- Payment confirmed
- Payment failed
- Payment timed out
- Incorrect amount
- Duplicate payment attempt
- Refund required
- Settlement pending where applicable
- Payment completed/settled

---

## 10.2 Payment Confirmation

GRAFT must not mark a payment as successful merely because the user claims to have paid.

Payment status must depend on the validated payment architecture and confirmed transaction information.

---

## 10.3 Escrow and Money Holding

GRAFT must not claim or implement an escrow-like experience unless the actual EcoCash/payment, legal, and regulatory model supports it.

The platform must not assume it can:

- Hold customer funds
- Delay settlement
- Split payments
- Automatically pay workers
- Reverse payments
- Issue refunds

without confirmed capability and authorization.

### REQUIRES LEGAL / PROFESSIONAL / PAYMENT PROVIDER VERIFICATION

---

## 10.4 Payment Disputes

Payment-related disputes require:

- Accurate transaction records
- Clear payment status
- Appropriate job history
- Admin review capability

The final resolution process must depend on the actual validated payment architecture.

---

# 11. BIDDING AND SELECTION SAFETY

## 11.1 Meaningful Bids

A bid should provide meaningful information.

The core MVP bid includes:

- Proposed price
- ETA or availability
- Short message

This creates a record of the worker's proposed offer.

---

## 11.2 Price Is Not the Only Trust Signal

GRAFT should not encourage customers to choose workers only because they submit the lowest bid.

The customer may need to compare:

- Price
- Availability
- Distance
- Relevant skills
- Ratings
- Completed jobs
- Verification information

This reduces the risk of turning the marketplace into a pure race to the bottom.

---

## 11.3 Misleading Bids

GRAFT should define policies and operational handling for situations such as:

- Intentionally misleading prices
- Material price changes after selection
- Repeated unrealistic bids
- Repeated bidding without intention to perform work

The exact enforcement rules belong in later policy and operations documentation.

---

# 12. JOB COMPLETION AND SERVICE DISPUTES

A real-world marketplace requires a distinction between:

```text
WORKER SAYS THE JOB IS COMPLETE
```

and:

```text
CUSTOMER ACCEPTS THAT THE JOB IS COMPLETE
```

The MVP should support:

- Worker completion indication
- Customer confirmation
- Customer dispute path
- Appropriate transaction history
- Admin visibility

Not every disagreement can be automatically resolved by software.

GRAFT needs an operational path for unresolved disputes.

---

# 13. RATINGS AND REPUTATION SAFETY

## 13.1 Eligible Ratings Only

Ratings should be linked to eligible completed marketplace transactions.

This reduces:

- Random reviews
- Fake reviews
- Reviews from unrelated people

---

## 13.2 Bilateral Ratings

Both sides may need the ability to rate:

- Customer rates worker
- Worker rates customer

This supports accountability across the marketplace.

---

## 13.3 Retaliation and Manipulation

Ratings can themselves be abused.

Potential risks include:

- Retaliatory ratings
- False ratings
- Coordinated manipulation
- Threatening users for positive ratings

The MVP may start with simple ratings, but later policy and product work must define stronger controls where needed.

---

## 13.4 New User Fairness

A lack of GRAFT history should not automatically mean that a new user is unsafe or low quality.

The product should distinguish:

```text
NO MARKETPLACE HISTORY
```

from:

```text
NEGATIVE MARKETPLACE HISTORY
```

These are not the same.

---

# 14. REPORTING

GRAFT users must have a clear way to report concerns.

Potential report categories may include:

- Suspected fraud
- Harassment
- Unsafe behaviour
- Fake identity information
- Misrepresentation
- Inappropriate conduct
- Prohibited job
- Payment concern
- Other policy violation

A report should be connected to the relevant:

- User
- Job
- Transaction where applicable

Reports should be available to the admin/operations team.

---

# 15. BLOCKING

Users should be able to block another user where appropriate.

Blocking should be designed carefully because marketplace relationships may include:

- Active jobs
- Payment processes
- Disputes
- Historical records

Blocking should not destroy evidence or prevent necessary marketplace resolution.

The final rules should define:

- Future contact restrictions
- Future matching restrictions
- Treatment of active transactions
- Treatment of disputes
- Admin override and investigation access where appropriate

---

# 16. HARASSMENT AND ABUSIVE CONDUCT

GRAFT should prohibit behaviour including, where applicable:

- Harassment
- Threats
- Hate or discriminatory abuse
- Sexual harassment
- Repeated unwanted contact
- Intimidation
- Abuse connected to a marketplace interaction

The platform must provide:

- Reporting
- Blocking
- Admin review
- Appropriate account action capability

The exact policy language and enforcement standards should be developed separately.

---

# 17. FRAUD AND MARKETPLACE ABUSE

Potential fraud and abuse scenarios include:

## Customer-side

- Fake jobs
- Payment deception
- Repeated cancellation abuse
- False disputes
- Harassment
- Attempts to exploit workers

## Worker-side

- Fake identity
- Skill misrepresentation
- Payment deception
- No-show patterns
- Fake completion claims
- Fraudulent requests for money outside the agreed process

## Cross-marketplace

- Collusive ratings
- Fake transactions
- Account manipulation
- Attempts to bypass platform accountability
- False reports

The MVP does not require advanced machine-learning fraud detection.

It does require:

- Basic monitoring
- Reporting
- Transaction records
- Admin review
- Suspension capability
- Appropriate investigation controls

---

# 18. OFF-PLATFORM RISK

Once a customer and worker discover each other, they may attempt to move important parts of the transaction outside GRAFT.

This can reduce:

- Payment accountability
- Transaction records
- Dispute visibility
- Marketplace reputation accuracy

GRAFT should understand this as a marketplace risk.

However, the exact product restrictions and enforcement approach must be designed carefully to avoid creating unrealistic or unenforceable rules.

---

# 19. DISPUTE MANAGEMENT

The MVP requires basic dispute management.

It does not require a fully automated legal or arbitration system.

A conceptual process is:

```text
USER FLAGS DISPUTE
        ↓
RELEVANT JOB / PAYMENT STATE IS PROTECTED
        ↓
TRANSACTION HISTORY REMAINS AVAILABLE
        ↓
RELEVANT INFORMATION IS REVIEWED
        ↓
ADMIN / OPERATIONS TAKES APPROPRIATE ACTION
        ↓
OUTCOME IS RECORDED
```

Potential dispute areas include:

- Service not completed
- Work quality disagreement
- Price disagreement
- Payment issue
- No-show
- Property-related concern
- Other policy issue

### REQUIRES LEGAL / PROFESSIONAL VERIFICATION

The exact authority, obligations, remedies, and liability of GRAFT in disputes must be professionally validated.

---

# 20. ADMIN TRUST AND SAFETY OPERATIONS

Trust and safety cannot be fully automated.

The GRAFT MVP requires admin capability for:

- User review
- Worker verification review
- KYC-related review where required
- Report review
- Dispute review
- Payment exception monitoring
- User suspension
- Other appropriate account actions
- Fraud monitoring
- Marketplace history review

Admin actions should be recorded where appropriate.

This creates an operational trail and supports accountability.

---

# 21. ACCOUNT ACTIONS

GRAFT may need a graduated set of account actions.

Conceptually:

```text
NO ACTION
↓
WARNING
↓
LIMIT FEATURE ACCESS
↓
TEMPORARY RESTRICTION
↓
SUSPENSION
↓
PERMANENT REMOVAL WHERE APPROPRIATE
```

The exact rules must be defined in later policy and operations documentation.

Account action should consider:

- Severity
- Evidence
- Repeated behaviour
- Immediate risk
- Relevant legal obligations

---

# 22. DATA PRIVACY AND SECURITY DIRECTION

Trust requires responsible handling of data.

Relevant GRAFT data may include:

- Phone numbers
- Identity information
- Verification information
- Job locations
- Payment references
- Ratings
- Reports
- Dispute records

GRAFT should apply the principle:

> **Collect the minimum appropriate information, protect it appropriately, restrict access, and retain it only according to legitimate and legally compliant requirements.**

### REQUIRES LEGAL / PROFESSIONAL VERIFICATION

Before implementation, data protection requirements applicable to GRAFT in Zimbabwe must be validated.

---

# 23. LOW-CONNECTIVITY TRUST REQUIREMENTS

Poor connectivity can create trust problems.

Examples:

## Duplicate bids

A worker submits a bid, loses connection, retries, and accidentally creates duplicate submissions.

GRAFT should reasonably protect against this.

## Duplicate payments

A customer is uncertain whether a payment succeeded and attempts the payment again.

The payment flow must avoid falsely encouraging duplicate payment.

## False success

An app must not show:

> "Payment complete"

unless the validated payment process confirms that state.

## Delayed updates

If a connection fails, the user should understand whether the latest action:

- Succeeded
- Failed
- Is pending
- Requires retry

Clear state communication is therefore part of trust and safety.

---

# 24. INCIDENT RECORDS AND EVIDENCE

Where appropriate and legally permitted, GRAFT should maintain relevant records to support:

- Dispute review
- Fraud investigation
- Report investigation
- Payment reconciliation
- Operational accountability

Relevant records may include:

- Job details
- Bid history
- Selection history
- Status changes
- Payment references
- Ratings
- Reports
- Admin actions

Evidence collection and retention must respect applicable privacy and legal requirements.

---

# 25. TRUST SIGNALS SHOWN TO USERS

The GRAFT product should prioritize understandable trust information.

Potential worker-facing customer signals and customer-facing worker signals may include appropriate:

- Verification status
- Rating
- Completed jobs
- Relevant skills
- Relevant service information

The product should avoid overwhelming users with complex internal risk scores.

### Important principle

Internal risk controls and public trust signals are not necessarily the same thing.

A user should not automatically see sensitive internal moderation information.

---

# 26. WHAT GRAFT SHOULD NOT CLAIM

Unless independently established and operationally supported, GRAFT should not claim:

- "Every worker is fully guaranteed"
- "Every job is guaranteed safe"
- "All workers are background checked"
- "GRAFT guarantees service quality"
- "Your payment is held safely in escrow"
- "GRAFT provides insurance"
- "GRAFT monitors every job in real time"
- "GRAFT can provide emergency intervention"

Trust communication must be accurate.

---

# 27. MVP TRUST AND SAFETY REQUIREMENTS

The MVP must include the minimum controls necessary to support a real marketplace.

## MUST HAVE

### Account and verification

- Phone verification
- Appropriate worker verification direction
- Admin review capability
- Accurate verification representation

### Marketplace accountability

- Job history
- Bid records
- Worker selection records
- Job status records
- Payment status records

### User controls

- Ratings after eligible transactions
- Reporting
- Blocking

### Operations

- Admin report review
- Basic dispute handling
- Account action capability
- Payment exception visibility

### Privacy

- Controlled disclosure of exact locations
- Protection of private verification data
- No unnecessary continuous public location tracking

### Reliability

- Clear transaction states
- Retry/error handling
- Reasonable duplicate-action protection

---

# 28. SHOULD HAVE — POST-MVP

The following may add stronger trust and safety capability after the MVP:

- Improved verification automation
- More detailed verification levels
- Advanced report workflows
- Structured evidence uploads
- Appeal workflows
- Improved retaliation protections for ratings
- Advanced suspicious behaviour monitoring
- More sophisticated account integrity controls
- Category-specific safety requirements
- Enhanced customer and worker safety guidance
- More advanced location-sharing controls
- Improved fraud rules

---

# 29. FUTURE / ADVANCED

Future capabilities may include:

- Automated fraud detection
- Behavioural risk models
- Advanced anomaly detection
- AI-assisted moderation
- Advanced identity verification integrations
- Advanced credential verification
- Insurance partnerships
- Formal emergency response partnerships
- Advanced safety scoring
- Category-specific certification ecosystems

These are not MVP dependencies.

---

# 30. TRUST AND SAFETY DECISION MATRIX

| Area | MVP Direction | Status |
|---|---|---|
| Phone verification | Required | MVP |
| Worker verification | Required direction, exact process to validate | MVP |
| Customer verification | Appropriate direction required | MVP |
| Identity document handling | Subject to legal/privacy validation | Open |
| EcoCash-related verification | Where feasible and validated | Open |
| Ratings | Eligible completed transactions | MVP |
| Reporting | Required | MVP |
| Blocking | Required | MVP |
| Basic disputes | Required | MVP |
| Admin review | Required | MVP |
| Account actions | Required | MVP |
| Exact address privacy | Controlled disclosure | MVP |
| Continuous public tracking | Not required | Out of scope |
| Advanced fraud AI | Not required | Future |
| Insurance | Not assumed | Future |
| Emergency intervention | Not promised without capability | Future / Open |
| Escrow | Not assumed | Requires validation |
| Automated KYC | Not required | Post-MVP / Future |

---

# 31. OPEN QUESTIONS

The following questions remain open.

## Verification

- What exact worker checks are required?
- What customer checks are required?
- What verification tiers should exist?
- Which checks can be automated?
- Which require manual review?
- What verification information can be publicly displayed?

## Safety

- Which services are prohibited?
- Which services require additional controls?
- What age restrictions apply?
- What user safety guidance should exist?
- What emergency escalation capability can GRAFT realistically support?

## Payments

- What EcoCash payment capabilities are available?
- How is payment confirmation obtained?
- What happens during delayed confirmations?
- Are refunds supported?
- Can GRAFT hold funds?
- What settlement model is permitted?

## Disputes

- What evidence can be collected?
- What outcomes can GRAFT decide?
- What disputes must be referred externally?
- What response times are operationally realistic?

## Privacy

- What identity data may be retained?
- For how long?
- What location information may be shared?
- What consent is required for any live-location functionality?

## Operations

- Who performs verification review?
- Who reviews reports?
- Who handles disputes?
- What account actions are permitted?
- What response times can be promised?

---

# 32. REQUIRES LEGAL / PROFESSIONAL VERIFICATION

Before implementation, GRAFT requires appropriate professional validation regarding:

- Zimbabwean KYC requirements
- Identity verification
- Identity document processing
- Biometric/selfie processing
- Data protection and privacy
- Data retention
- Location data
- Consumer protection
- Payment regulation
- EcoCash merchant and marketplace requirements
- Money handling
- Settlement
- Refunds
- Escrow or escrow-like models
- Platform liability
- Dispute authority
- Worker classification
- Age restrictions
- Regulated service categories
- Licensing and professional credentials
- Prohibited services
- Insurance
- Background checks

This document is a product and business framework.

> **It is not legal, regulatory, financial, security, or professional safety advice.**

---

# 33. FINAL TRUST AND SAFETY STATEMENT

The GRAFT marketplace should be built around the understanding that trust is not created by a single badge, feature, or promise.

Trust is created through a connected system:

```text
APPROPRIATE IDENTITY CONTROLS
        +
CLEAR MARKETPLACE RULES
        +
MEANINGFUL TRANSACTION RECORDS
        +
RELEVANT VERIFICATION
        +
CONTROLLED INFORMATION SHARING
        +
ELIGIBLE RATINGS
        +
REPORTING
        +
BLOCKING
        +
DISPUTE HANDLING
        +
ADMIN OPERATIONS
        +
ACCURATE PAYMENT STATES
        +
HONEST SAFETY COMMUNICATION
```

The purpose of this system is to reduce avoidable risk and increase accountability while recognising the limits of what GRAFT can control in real-world marketplace interactions.

The first version of GRAFT should therefore focus on the minimum credible trust and safety foundation required to support real customers, real workers, real jobs, and real payments.

Advanced automation can come later.

The core principle remains:

> **GRAFT should never ask users to trust more than the platform can reasonably verify, support, or protect.**

---

# DOCUMENT STATUS

**Product:** GRAFT  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Document:** `trust_and_safety.md`  
**Status:** Initial Trust & Safety Framework  
**Primary Market:** Zimbabwe  
**Product Type:** Two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Admin Platform:** Required  
**Payment Direction:** EcoCash only, subject to capability validation  
**Core Principle:** Trust and safety are part of the core marketplace infrastructure  
**MVP Direction:** Appropriate verification, accountability, privacy, reporting, blocking, disputes, admin operations, and accurate transaction states  
**Legal / Regulatory Areas:** Require professional verification  
**Implementation:** Not started
