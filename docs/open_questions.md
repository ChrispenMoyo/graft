# OPEN QUESTIONS

## GRAFT

**Document:** `open_questions.md`  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Product:** GRAFT  
**Primary Market:** Zimbabwe  
**Product Type:** Two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Admin Platform:** Required  
**Primary Payment Direction:** EcoCash only, subject to capability validation  
**Status:** Open Questions and Decision Register  

---

# 1. PURPOSE OF THIS DOCUMENT

This document records the important questions that have not yet been fully answered for GRAFT.

GRAFT is still in the business and product foundation stage. Some decisions are clear enough to guide current documentation, while others require user research, marketplace validation, technical investigation, payment-provider confirmation, legal or regulatory review, operational planning, product testing, or founder decisions.

The purpose of this document is to prevent assumptions from quietly becoming permanent product decisions without evidence.

> **An unanswered question should remain visible until it is answered, validated, deferred, or intentionally removed.**

---

# 2. HOW TO USE THIS DOCUMENT

Each open question includes its question, why it matters, current direction where known, how it should be answered, priority, relevant dependency, and status.

Decision flow:

```text
OPEN QUESTION
        ↓
RESEARCH / VALIDATION REQUIRED
        ↓
EVIDENCE COLLECTED
        ↓
DECISION MADE
        ↓
DOCUMENT RELEVANT RATIONALE
        ↓
UPDATE PRODUCT / BUSINESS REQUIREMENTS
```

Possible statuses:

| Status | Meaning |
|---|---|
| Open | No final answer yet |
| Research Required | User or market evidence is required |
| Technical Validation Required | Technical investigation is required |
| Provider Validation Required | External provider capability must be confirmed |
| Legal / Professional Review Required | Specialist advice is required |
| Founder Decision Required | Strategic direction must be chosen |
| Deferred | Important, but not required for the current stage |
| Resolved | Decision has been made and documented |

---

# 3. PRODUCT AND MARKET QUESTIONS

## Q1 — What exact customer problem should GRAFT solve first?

**Why it matters:** GRAFT should not attempt to solve every local-service problem at launch. The first use case should be real, frequent enough, difficult enough, and valuable enough to solve.

**Current direction:** GRAFT is focused on helping customers discover and hire local workers through a structured marketplace. The exact highest-priority problem remains open.

**How to answer:** Customer research and early marketplace testing.

**Priority:** Critical  
**Status:** Research Required

---

## Q2 — Which customer segment should GRAFT target first?

Possible segments include household customers, small businesses, property managers, and other customer groups.

Different groups may have different job frequency, trust requirements, budgets, service categories, and acquisition channels.

**Priority:** High  
**Status:** Research Required

---

## Q3 — What is the exact first launch geography?

Which Zimbabwean city or geographic area should GRAFT launch in first?

A two-sided marketplace requires local density. Launch geography should be evaluated using customer demand, worker availability, population density, service demand, smartphone access, operational access, network conditions, and payment feasibility.

**Priority:** Critical  
**Status:** Founder Decision Required, supported by research

---

## Q4 — Which service categories should launch first?

Categories influence worker supply, demand, trust requirements, verification requirements, pricing, legal requirements, safety risk, and product complexity.

GRAFT should not launch with every possible category unless evidence supports doing so.

**Priority:** Critical  
**Status:** Research Required

---

## Q5 — What should GRAFT's category expansion strategy be?

Future category expansion may consider demand, worker supply, repeat usage, revenue potential, operational complexity, trust and safety risk, and regulatory requirements.

**Priority:** Medium  
**Status:** Deferred until initial category validation

---

# 4. MARKETPLACE MODEL QUESTIONS

## Q6 — Is bidding the correct initial marketplace model?

Current direction:

1. Customer posts a job.
2. Relevant workers discover the job.
3. Workers submit bids.
4. Customer compares bids.
5. Customer selects a worker.

Bidding can create choice but may also create waiting time, pricing pressure, worker frustration, and complex decision-making.

**Priority:** Critical  
**Status:** Research Required

---

## Q7 — Should all categories use the same bidding model?

Some categories may work better with fixed prices, estimates, direct booking, or hybrid pricing.

**Priority:** High  
**Status:** Deferred pending category selection

---

## Q8 — How many bids should a customer ideally receive?

Too few bids may create poor choice. Too many may create decision friction.

**Priority:** Medium  
**Status:** Product Testing Required

---

## Q9 — How long should workers have to bid?

The appropriate bidding window may depend on urgent jobs, standard jobs, worker availability, customer waiting tolerance, and category differences.

**Priority:** High  
**Status:** Product Testing Required

---

## Q10 — What should happen if a job receives no bids?

Possible directions requiring validation include extending job visibility, notifying more relevant workers, asking the customer to revise details, expanding the geographic radius where appropriate, or suggesting alternative timing.

**Priority:** Critical  
**Status:** Product Decision Required

---

## Q11 — What should happen if a customer receives only one bid?

Should GRAFT encourage waiting, allow immediate selection, or provide another workflow?

**Priority:** Medium  
**Status:** Product Testing Required

---

## Q12 — Can a worker withdraw a bid?

Worker availability can change, but unrestricted changes can reduce customer trust.

**Priority:** Medium  
**Status:** Product and Policy Decision Required

---

## Q13 — Can a customer change a job after bids arrive?

Material changes may invalidate existing bids.

**Priority:** High  
**Status:** Product Decision Required

---

# 5. PRICING AND BUSINESS MODEL QUESTIONS

## Q14 — What is the final GRAFT revenue model?

How will GRAFT generate sustainable revenue?

Revenue affects adoption, worker earnings, customer prices, payment architecture, and unit economics.

**Priority:** Critical  
**Status:** Founder Decision Required, supported by validation

---

## Q15 — Who pays the platform fee?

Should GRAFT fees be paid by the customer, worker, both, or another model?

**Priority:** Critical  
**Status:** Open

---

## Q16 — When is a platform fee charged?

The answer depends on the validated payment and settlement model.

**Priority:** Critical  
**Status:** Provider Validation Required + Founder Decision Required

---

## Q17 — How should pricing changes be handled?

What happens when actual work differs materially from the original job description?

**Priority:** High  
**Status:** Product and Policy Decision Required

---

## Q18 — Should GRAFT provide pricing guidance?

Poor estimates may create false expectations, worker dissatisfaction, and customer disputes.

**Priority:** Medium  
**Status:** Deferred

---

# 6. PAYMENT QUESTIONS

## Q19 — What exact EcoCash capability is available?

What payment APIs, merchant capabilities, marketplace capabilities, confirmation mechanisms, and settlement options are actually available to GRAFT?

**Priority:** Critical  
**Status:** Provider Validation Required

---

## Q20 — What is the exact GRAFT payment flow?

When does the customer pay, and how is payment connected to job completion?

This affects user experience, trust, disputes, refunds, revenue, and worker payment.

**Priority:** Critical  
**Status:** Open

---

## Q21 — Can GRAFT legally and technically hold customer funds?

This must not be assumed.

**Priority:** Critical  
**Status:** Legal / Professional Review Required + Provider Validation Required

---

## Q22 — Are refunds supported?

Can the validated payment flow support refunds, reversals, or another appropriate remediation process?

**Priority:** Critical  
**Status:** Provider Validation Required

---

## Q23 — How are payment failures handled?

What happens when payment is pending, delayed, failed, duplicated, incorrect, or uncertain because of poor connectivity?

**Priority:** Critical  
**Status:** Technical Validation Required + Provider Validation Required

---

## Q24 — What transaction fees apply?

What EcoCash or other payment-processing costs affect GRAFT economics?

**Priority:** High  
**Status:** Provider Validation Required

---

# 7. VERIFICATION QUESTIONS

## Q25 — What exact verification is required for workers?

Too little verification can weaken trust. Too much can reduce onboarding.

**Priority:** Critical  
**Status:** Legal / Professional Review Required + Product Decision Required

---

## Q26 — What exact verification is required for customers?

Should customers have the same, lower, or different verification requirements?

**Priority:** High  
**Status:** Open

---

## Q27 — What does "Verified" mean on GRAFT?

What specific fact has been verified when GRAFT displays a verification indicator?

The platform must not create misleading trust signals.

**Priority:** Critical  
**Status:** Product and Policy Decision Required

---

## Q28 — Which verification data can be displayed publicly?

**Priority:** High  
**Status:** Privacy / Legal Review Required

---

## Q29 — How should new workers build trust?

How can legitimate new workers receive their first opportunities without a GRAFT transaction history?

**Priority:** High  
**Status:** Marketplace Design Required

---

# 8. TRUST AND SAFETY QUESTIONS

## Q30 — Which service categories are prohibited?

What jobs may never be posted on GRAFT?

**Priority:** Critical  
**Status:** Legal / Professional Review Required + Policy Decision Required

---

## Q31 — Which categories require additional controls?

Which services require stronger credentials, verification, safety procedures, or legal review?

**Priority:** Critical  
**Status:** Legal / Professional Review Required

---

## Q32 — What should GRAFT do after a serious safety report?

What is the operational escalation process?

GRAFT must define only processes it can realistically operate.

**Priority:** Critical  
**Status:** Operations and Professional Review Required

---

## Q33 — What response times can GRAFT realistically provide?

Response promises create operational obligations.

**Priority:** High  
**Status:** Operations Decision Required

---

## Q34 — What evidence can users submit?

**Priority:** Medium  
**Status:** Product + Privacy + Legal Review Required

---

## Q35 — Is an appeal process required?

How can users challenge suspension or other account actions?

**Priority:** Medium  
**Status:** Policy Decision Required

---

# 9. PRIVACY AND DATA QUESTIONS

## Q36 — What personal data does GRAFT actually need?

What data is essential to operate the marketplace, and what data is unnecessary?

**Priority:** Critical  
**Status:** Product + Privacy Review Required

---

## Q37 — When should exact job addresses be revealed?

At what transaction stage should a worker receive an exact location?

Current direction: controlled or progressive disclosure where appropriate.

**Priority:** Critical  
**Status:** Product Decision Required

---

## Q38 — Does GRAFT need live location sharing?

Current direction: not required as an MVP default.

**Priority:** Medium  
**Status:** Deferred

---

## Q39 — How long should data be retained?

This includes identity data, job data, payment records, reports, disputes, and admin records.

**Priority:** Critical  
**Status:** Legal / Professional Review Required

---

## Q40 — Who can access sensitive information?

What internal roles may access identity documents, addresses, payment references, reports, and disputes?

**Priority:** Critical  
**Status:** Security + Privacy + Operations Decision Required

---

# 10. DISPUTE QUESTIONS

## Q41 — What counts as a dispute?

Possible areas include service quality, non-completion, payment, no-show, price disagreement, and other policy concerns.

**Priority:** High  
**Status:** Policy Decision Required

---

## Q42 — What can GRAFT actually decide?

What decisions can GRAFT make within its marketplace role?

**Priority:** Critical  
**Status:** Legal / Professional Review Required

---

## Q43 — How is a disputed transaction represented?

What happens to job and payment status while a dispute is active?

**Priority:** Critical  
**Status:** Product + Payment Validation Required

---

## Q44 — What is the target dispute resolution process?

What is the step-by-step operational workflow from report to outcome?

**Priority:** High  
**Status:** Operations Design Required

---

# 11. USER EXPERIENCE QUESTIONS

## Q45 — What is the shortest acceptable onboarding?

How can GRAFT collect enough information without creating excessive friction?

**Priority:** High  
**Status:** UX Research and Testing Required

---

## Q46 — What information does a customer need to confidently select a worker?

Potential factors include price, ETA, rating, completed jobs, skills, verification, and distance.

**Priority:** High  
**Status:** UX Research Required

---

## Q47 — What information does a worker need before bidding?

How much job and location information is necessary to submit a meaningful bid while protecting customer privacy?

**Priority:** Critical  
**Status:** UX + Privacy Decision Required

---

## Q48 — How should urgent jobs work?

Urgency may change the bid window, notification strategy, matching radius, and customer expectations.

**Priority:** Medium  
**Status:** Deferred pending initial market research

---

## Q49 — How should GRAFT explain pending states?

How should the application communicate when an action is pending, retrying, confirmed, failed, or requires user action?

**Priority:** High  
**Status:** UX + Technical Design Required

---

# 12. WORKER EXPERIENCE QUESTIONS

## Q50 — How should relevant workers discover jobs?

Matching and notification may depend on category, distance, availability, skills, verification, and worker preferences.

**Priority:** Critical  
**Status:** Product + Technical Design Required

---

## Q51 — What matching radius should GRAFT use?

A larger radius may improve supply but increase travel impracticality.

**Priority:** High  
**Status:** Product Testing Required

---

## Q52 — How should worker availability work?

How does a worker communicate available now, available later, or temporarily unavailable?

**Priority:** Medium  
**Status:** Product Design Required

---

## Q53 — What prevents excessive worker bidding with low conversion?

How can GRAFT ensure workers receive enough value from participation?

**Priority:** High  
**Status:** Marketplace Research Required

---

# 13. ADMIN AND OPERATIONS QUESTIONS

## Q54 — Who performs verification review?

What person, team, or process reviews workers when manual review is required?

**Priority:** High  
**Status:** Operations Decision Required

---

## Q55 — Who handles disputes?

Who is responsible for reviewing and resolving marketplace disputes?

**Priority:** Critical  
**Status:** Operations Decision Required

---

## Q56 — What admin tools are required for the MVP?

Current direction includes user review, verification review, report review, dispute visibility, payment exception visibility, and account actions. The exact scope remains open.

**Priority:** Critical  
**Status:** Product / Operations Decision Required

---

## Q57 — What should be automated versus manual?

Early manual operations may validate workflows before expensive automation.

**Priority:** High  
**Status:** Founder + Operations Decision Required

---

## Q58 — What operational metrics should be monitored daily?

Likely candidates include jobs posted, jobs receiving bids, time to first bid, selection rate, completion rate, disputes, reports, and payment failures.

**Priority:** High  
**Status:** Operations + Product Decision Required

---

# 14. TECHNICAL QUESTIONS

## Q59 — What is the final technical architecture?

What backend, database, authentication, infrastructure, and application architecture should GRAFT use?

This belongs to a later technical architecture stage.

**Priority:** Deferred for Phase 1, important before implementation  
**Status:** Deferred

---

## Q60 — How should GRAFT model job states?

What exact state machine represents a job from creation through completion or dispute?

Incorrect state design can create payment errors, disputes, inconsistent screens, and incorrect analytics.

**Priority:** Critical before implementation  
**Status:** Technical / Product Design Required

---

## Q61 — How should GRAFT prevent duplicate actions?

How should the system handle repeated bid submissions, payment attempts, completion actions, and cancellation requests?

**Priority:** High  
**Status:** Technical Design Required

---

## Q62 — What happens when the user goes offline?

Which actions can be queued, retried, or must wait for a connection?

**Priority:** High  
**Status:** Technical + UX Design Required

---

## Q63 — What are the security requirements?

What controls are required for authentication, sensitive data, admin access, payment references, and identity documents?

**Priority:** Critical  
**Status:** Security Architecture Required

---

# 15. METRICS AND SUCCESS QUESTIONS

## Q64 — What is the primary MVP success metric?

What single marketplace outcome best indicates that GRAFT is creating value?

**Priority:** Critical  
**Status:** Founder + Product Decision Required

---

## Q65 — What metrics define marketplace liquidity?

Potential measures include jobs receiving bids, time to first bid, selection rate, and completion rate.

**Priority:** Critical  
**Status:** Product Decision Required

---

## Q66 — What completion rate is acceptable?

Requires baseline data and later target setting.

**Priority:** High  
**Status:** Requires baseline data

---

## Q67 — What repeat usage should GRAFT expect?

How often should customers and workers return?

**Priority:** High  
**Status:** Requires market data

---

# 16. STRATEGIC QUESTIONS

## Q68 — What is GRAFT's strongest long-term differentiator?

Why should users choose GRAFT rather than existing informal channels or future competitors?

**Priority:** High  
**Status:** Founder Decision Required, supported by research

---

## Q69 — Is GRAFT primarily a discovery marketplace or a managed transaction platform?

How much of the transaction should GRAFT own and control?

This affects payments, disputes, revenue, liability, operations, and product complexity.

**Priority:** Critical  
**Status:** Founder + Legal + Payment Validation Required

---

## Q70 — How much operational involvement is GRAFT willing to have?

Will GRAFT operate as a highly automated marketplace, moderated marketplace, managed marketplace, or hybrid model?

**Priority:** Critical  
**Status:** Founder Decision Required

---

## Q71 — What must GRAFT prove before expansion?

What evidence is required before expanding to new categories, geographic areas, payment methods, or product features?

**Priority:** High  
**Status:** Founder + Product Decision Required

---

# 17. CRITICAL QUESTIONS TO RESOLVE FIRST

1. **Q1** — What exact customer problem is being solved first?
2. **Q3** — What is the first launch geography?
3. **Q4** — Which service categories launch first?
4. **Q6** — Is bidding the correct initial model?
5. **Q14** — What is the GRAFT revenue model?
6. **Q19** — What exact EcoCash capability is available?
7. **Q20** — What is the exact payment flow?
8. **Q21** — Can GRAFT hold customer funds?
9. **Q25** — What verification is required for workers?
10. **Q30** — Which service categories are prohibited?
11. **Q36** — What personal data is actually necessary?
12. **Q42** — What can GRAFT actually decide in disputes?
13. **Q47** — What information can workers see before bidding?
14. **Q50** — How are relevant workers matched to jobs?
15. **Q55** — Who handles disputes?
16. **Q60** — What is the job state model?
17. **Q63** — What security architecture is required?
18. **Q64** — What is the primary MVP success metric?
19. **Q69** — How much of the transaction does GRAFT own?
20. **Q70** — How operationally involved will GRAFT be?

---

# 18. QUESTIONS THAT REQUIRE EXTERNAL VALIDATION

## Provider Validation

- EcoCash technical capability
- Payment confirmation
- Settlement
- Refunds
- Fees
- Merchant requirements

## Legal / Professional Review

- KYC
- Identity verification
- Identity data
- Biometric/selfie processing
- Data protection
- Data retention
- Payment regulation
- Money holding
- Escrow
- Consumer protection
- Platform liability
- Worker classification
- Tax
- Regulated services
- Licensing
- Insurance

## Market Research

- Customer pain
- Worker demand
- Category selection
- Trust requirements
- Preferred transaction model
- Pricing behaviour
- Launch geography

---

# 19. QUESTION MANAGEMENT RULES

For every important question:

1. Do not silently assume an answer.
2. Identify the type of evidence required.
3. Assign a responsible decision owner where appropriate.
4. Record the evidence used.
5. Record the final decision.
6. Update affected documents.

When a question is resolved, record:

```text
QUESTION
        ↓
ANSWER
        ↓
EVIDENCE / RATIONALE
        ↓
DECISION DATE
        ↓
AFFECTED DOCUMENTS
```

This creates a decision history for GRAFT.

---

# 20. FINAL STATEMENT

GRAFT is still moving from an initial product concept toward a validated marketplace model.

The purpose of `open_questions.md` is to make uncertainty explicit.

Some of the most important GRAFT decisions cannot yet be made responsibly because they depend on:

```text
REAL CUSTOMER EVIDENCE
        +
REAL WORKER EVIDENCE
        +
MARKETPLACE TESTING
        +
PAYMENT PROVIDER CONFIRMATION
        +
TECHNICAL INVESTIGATION
        +
LEGAL / PROFESSIONAL VALIDATION
        +
FOUNDER STRATEGY
```

The existence of open questions is not a weakness.

Ignoring them is.

GRAFT should use this document as a working decision register throughout product discovery and MVP development.

> **Do not confuse a current direction with a validated fact.**

Every major unanswered question should remain visible until GRAFT has sufficient evidence or authority to make a responsible decision.

---

# DOCUMENT STATUS

**Product:** GRAFT  
**Phase:** Phase 1 — Business Requirements & Product Foundation  
**Document:** `open_questions.md`  
**Status:** Initial Open Questions and Decision Register  
**Primary Market:** Zimbabwe  
**Product Type:** Two-sided hyperlocal services marketplace  
**Primary Platforms:** Mobile App + Web App  
**Admin Platform:** Required  
**Payment Direction:** EcoCash only, subject to capability validation  
**Core Purpose:** Track unresolved product, marketplace, payment, trust, safety, legal, technical, operational, and strategic questions  
**Critical Focus:** Do not allow assumptions to become permanent decisions without validation  
**Technical Architecture:** Deferred to a later stage  
**Legal / Regulatory Areas:** Require appropriate professional verification  
**Implementation:** Not started
