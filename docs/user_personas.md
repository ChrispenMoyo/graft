# GRAFT — User Personas

**Project:** GRAFT  
**Document:** User Personas  
**Phase:** Phase 1  
**Status:** MVP Foundation  
**Last Updated:** 2026-08-19  

---

## 1. Purpose

This document defines the primary people GRAFT is designed for and the problems the MVP must solve for them.

GRAFT is a **Zimbabwean hyperlocal services marketplace**. The product connects people who need small jobs done with nearby workers who can perform those jobs.

The personas in this document are intentionally practical. They are not fictional biographies to be filled with unnecessary detail. Their purpose is to guide product decisions, UX, trust and safety, marketplace behavior, and MVP scope.

The two primary sides of the GRAFT marketplace are:

1. **Customers** — homeowners, residents, tenants, landlords, small businesses, and other people who need a small job completed.
2. **Workers (GRAFTs)** — unemployed, self-employed, informal, casual, or part-time workers who are looking for nearby jobs.

The MVP should optimize for these two users first.

---

# 2. Persona Overview

| Persona | Role | Primary Need | Core GRAFT Value |
|---|---|---|---|
| **The Customer** | Person who needs a small job done | Find a trustworthy nearby worker quickly | Local workers, clear offers, safer hiring |
| **The Worker / GRAFT** | Person looking for small jobs | Find nearby work and earn money | Local jobs matched to proximity and skills |
| **MVP Operations / Admin** | Internal marketplace operator | Keep the marketplace safe and functional | Verification, moderation, dispute handling |

The first two are **customer-facing core personas**. The admin role exists to support marketplace safety and operations but should not drive unnecessary MVP complexity.

---

# 3. Primary Persona A — The Customer

## 3.1 Persona Summary

**Example name:** Tariro  
**Age range:** 25–55  
**Location:** Zimbabwe, primarily urban and peri-urban areas  
**Typical context:** Homeowner, tenant, landlord, small-business owner, or resident  
**Digital behavior:** Uses a smartphone, WhatsApp, mobile internet, and common social platforms  
**Technical ability:** Basic to intermediate  
**Primary device:** Affordable Android smartphone  
**Payment context:** Ecocash is the required MVP payment method

### One-line persona

> **“I have a small problem that needs fixing, and I want someone nearby, capable, trustworthy, and affordable to do it without wasting my time.”**

---

## 3.2 Typical Customer Jobs

The customer may need help with small tasks such as:

- Plumbing repairs
- Electrical work
- Painting
- Yard or garden work
- Cleaning
- Moving heavy items
- Furniture assembly or repair
- Appliance-related assistance
- Welding
- Tiling
- Basic construction or handyman work
- Car-related minor services
- Errands or other practical local tasks

The exact service categories can expand later. The MVP should support a flexible small-job model rather than requiring a massive category system from day one.

---

## 3.3 Customer Goals

### Primary goals

- Get the job done quickly.
- Find someone close enough to respond.
- Avoid unreliable or unknown workers.
- Understand what the worker will charge.
- Compare multiple offers when possible.
- Communicate clearly about the job.
- Pay through a familiar local payment method.
- Know that GRAFT has some mechanism for dealing with unsafe or dishonest behavior.

### Secondary goals

- Save money compared with finding a larger formal company.
- Support local workers.
- Avoid repeatedly asking friends, family, neighbors, or WhatsApp groups for recommendations.
- Keep a record of jobs and workers used previously.

---

## 3.4 Customer Pain Points

The problem is not simply “finding a worker.” It is finding one who is **available, suitable, nearby, trustworthy, and reasonably priced**.

Common pain points include:

### Finding someone

- Asking friends and family for referrals takes time.
- WhatsApp groups may produce too many unrelated responses.
- Search results are not necessarily local.
- Formal businesses may not want very small jobs.

### Reliability

- A worker may agree to come and not arrive.
- The quoted price may change after work begins.
- The worker may lack the required skill.
- The customer may have little information about the worker beforehand.

### Safety and trust

- The customer may not know who is entering their home.
- Fake identities or dishonest profiles are possible.
- There may be uncertainty about previous work quality.
- Disputes are difficult to resolve when the transaction happens informally.

### Communication

- Job requirements may be misunderstood.
- Exact location details may be unclear.
- Customers may receive too many calls or messages.

### Payment

- The customer wants a familiar and straightforward payment method.
- Payment disputes can become difficult if expectations are unclear.

---

## 3.5 Customer Motivations

The customer's strongest motivation is **convenience with confidence**.

The customer does not necessarily want the cheapest person. They want the best acceptable combination of:

**Trust + proximity + availability + price + skill**

This is important because GRAFT should not become a race to the lowest bid.

---

## 3.6 Customer Fears

The product experience should address these concerns explicitly:

- “What if this person is not who they claim to be?”
- “What if they damage my property?”
- “What if they take my money and do not do the job?”
- “What if the price suddenly changes?”
- “What if they do not show up?”
- “What if something goes wrong and I have nobody to contact?”

These fears directly justify GRAFT's KYC, worker verification, job details, offer transparency, ratings/reputation, and reporting mechanisms.

---

## 3.7 Customer Behavior

A typical customer may:

1. Notice a small problem.
2. Decide it needs to be solved soon.
3. Ask someone for a recommendation or search informally.
4. Receive one or more possible workers.
5. Compare availability, price, and trust signals.
6. Choose a worker.
7. Arrange the job.
8. Pay using Ecocash.
9. Confirm completion.
10. Leave feedback or use reporting/dispute tools if necessary.

GRAFT should make this process significantly simpler than the current informal alternatives.

---

## 3.8 Customer Jobs-to-be-Done

### Functional job

> “Help me find and hire a capable nearby person to complete this small job.”

### Emotional job

> “Make me feel confident that I am not making a risky choice.”

### Social job

> “Help me solve the problem efficiently without having to rely on a large formal service provider or personal connections.”

---

# 4. Primary Persona B — The Worker / GRAFT

## 4.1 Persona Summary

**Example name:** Tinashe  
**Age range:** 18–55  
**Location:** Zimbabwe, primarily urban and peri-urban areas  
**Typical context:** Informal worker, unemployed person, casual worker, tradesperson, freelancer, side-hustler, or small independent service provider  
**Digital behavior:** Smartphone-first; frequent WhatsApp and mobile-money user  
**Technical ability:** Basic to intermediate  
**Primary device:** Affordable Android smartphone  
**Payment context:** Ecocash is the required MVP payment method

### One-line persona

> **“I have skills and I am willing to work. Show me nearby jobs I can realistically do and give me a fair chance to earn.”**

---

## 4.2 Why This Persona Matters

GRAFT's worker is not necessarily a registered company.

The marketplace is intentionally designed to include people who already work informally or are capable of doing practical jobs but do not have a strong digital presence.

Examples include:

- A plumber looking for extra jobs.
- An electrician between contracts.
- A painter working independently.
- A gardener looking for nearby customers.
- A general handyman.
- Someone with practical skills who is unemployed but ready to work.
- A casual worker who wants additional income.

GRAFT's value is therefore not only “listing businesses.” It is helping **underused local skills become discoverable and economically useful**.

---

## 4.3 Worker Goals

### Primary goals

- Find jobs close to their current area.
- Get work they are capable of doing.
- Earn money frequently.
- Spend as little as possible on transport to a job.
- Build a reputation.
- Get selected based on skills and reliability rather than personal connections.
- Receive payment through a familiar method.

### Secondary goals

- Build a repeat customer base.
- Eventually become a trusted or highly rated worker.
- Increase income without needing a formal storefront.
- Turn informal work into a more sustainable livelihood.

---

## 4.4 Worker Pain Points

### Finding customers

- Work often comes through word of mouth.
- Opportunities are inconsistent.
- Customers may be difficult to find outside personal networks.
- Informal workers can be invisible online.

### Location and transport

- A job far away may not be financially worthwhile.
- Transport costs can consume a large portion of earnings.
- Workers may need to know approximately how far away a job is before accepting it.

### Competition

- Workers may compete against people who have stronger personal networks.
- A skilled worker can lose work simply because the customer does not know they exist.

### Trust and payment

- Customers may also fail to pay.
- Workers need evidence that customers are genuine.
- Ambiguous job descriptions can create payment disputes.

### Technology

- Older or lower-end Android phones may struggle with heavy apps.
- Mobile data can be expensive.
- Internet connectivity may be unreliable.
- The worker cannot be expected to use a complicated interface.

---

## 4.5 Worker Motivations

The strongest motivation is **accessible local income**.

The worker should feel that GRAFT helps answer a simple question:

> **“What jobs are available near me right now that I can actually do?”**

This means proximity is not a decorative feature. It is a core marketplace value proposition.

---

## 4.6 Worker Fears

- “What if the customer is fake?”
- “What if I travel there and the job is not what they described?”
- “What if I do the work and do not get paid?”
- “What if a customer unfairly damages my reputation?”
- “What if there are too many workers competing and I never get selected?”
- “What if the app uses too much data or does not work properly on my phone?”

The MVP should therefore balance **customer protection with worker protection**.

---

## 4.7 Worker Behavior

A typical worker may:

1. Register on GRAFT.
2. Complete identity/KYC requirements.
3. Add skills or service categories.
4. Provide basic working-area information.
5. Browse or receive nearby jobs.
6. Inspect job details.
7. Decide whether the job is worth the distance and expected payment.
8. Submit an offer/bid.
9. Wait for customer selection.
10. Communicate with the customer.
11. Complete the work.
12. Receive payment through Ecocash.
13. Build reputation through successful jobs and reviews.

---

## 4.8 Worker Jobs-to-be-Done

### Functional job

> “Help me discover nearby work that matches my skills and gives me a realistic opportunity to earn.”

### Emotional job

> “Make me feel that I have a fair chance to get work even if I am not formally employed or well connected.”

### Social job

> “Help me build a trustworthy reputation that can lead to more work.”

---

# 5. Secondary Persona — GRAFT Operations / Admin

## 5.1 Persona Summary

The admin is an internal marketplace operator, not the primary customer of the product.

Their role exists because a marketplace involving people entering other people's homes requires active trust and safety controls.

### Main responsibilities

- Review KYC information where required.
- Handle reports.
- Investigate suspicious behavior.
- Suspend or restrict accounts when necessary.
- Manage disputes and marketplace abuse.
- Monitor marketplace health.
- Review jobs, users, and transactions when necessary.

### Admin's main goal

> **Keep GRAFT safe, trustworthy, and operational without manually controlling every transaction.**

The admin experience should remain simple in the MVP. Avoid building a huge back-office system before the marketplace itself is proven.

---

# 6. Persona Comparison

| Need | Customer | Worker |
|---|---|---|
| Find the right person | High | — |
| Find available work | — | High |
| Nearby matching | High | Very High |
| Trust / identity verification | Very High | Very High |
| Clear pricing | Very High | High |
| Reputation | High | Very High |
| Fast communication | High | High |
| Low data usage | High | Very High |
| Simple Android experience | High | Very High |
| Ecocash support | Very High | Very High |
| Dispute/reporting support | High | High |
| Repeat relationships | Medium | High |

---

# 7. Shared Context: Zimbabwean Reality

GRAFT should be designed for the actual environment in which its users operate, not for an idealized high-bandwidth marketplace.

The product should assume that users may experience:

- Affordable or older Android devices.
- Slow or unstable internet connections.
- Limited mobile data.
- Frequent use of mobile money.
- Informal employment patterns.
- Strong reliance on referrals and word of mouth.
- High sensitivity to trust and safety.
- Transportation costs that materially affect whether a job is worthwhile.

This has direct product implications.

### Product implications

1. **Mobile-first is mandatory.**
2. **Pages and interactions should remain lightweight.**
3. **The core job flow should work on slow connections.**
4. **Location/proximity should be easy to understand.**
5. **Trust signals should be visible before a user commits.**
6. **Ecocash must be treated as a first-class payment method in the MVP.**
7. **The app should not depend on sophisticated hardware or expensive phones.**

---

# 8. Core Marketplace Tension

GRAFT serves two users whose incentives are related but not identical.

### Customer wants

- Reliable worker.
- Fast response.
- Good quality.
- Fair price.
- Safety.
- Convenience.

### Worker wants

- More jobs.
- Fair opportunity.
- Reasonable travel distance.
- Clear job expectations.
- Fair payment.
- Protection from dishonest customers.

GRAFT succeeds when it creates a transaction that both sides consider worthwhile.

Therefore, the marketplace should not optimize only for:

- the lowest price,
- the highest number of bids,
- the fastest worker,
- or the highest number of jobs.

It should optimize for **successful, trusted local transactions**.

---

# 9. MVP User Scenarios

## Scenario A — Customer needs urgent plumbing help

A resident discovers a leaking pipe.

They open GRAFT, describe the problem, add their location, and post the job.

Nearby plumbers can see the job and submit offers.

The customer compares:

- distance,
- estimated price,
- worker verification,
- ratings/reputation,
- and availability.

The customer selects one worker and arranges the job.

### MVP success condition

The customer can move from **“I have a problem”** to **“a suitable nearby worker has been selected”** without needing to leave GRAFT's core flow.

---

## Scenario B — Worker is looking for work

A worker is available in their area and wants a job.

They open GRAFT and view nearby jobs.

They find a small painting job that is close enough to make economic sense.

They review the requirements and submit an offer.

The customer selects them.

### MVP success condition

The worker can move from **“I need work”** to **“I have a real job opportunity”** quickly and simply.

---

## Scenario C — Trust issue before hiring

A customer is considering two workers.

One worker has minimal profile information.

The other has completed KYC and has a useful reputation history.

The customer chooses the more trustworthy option even though they are not necessarily the cheapest.

### Product lesson

Trust must be a visible part of the decision, not a hidden back-office process.

---

# 10. What the MVP Must Make Easy

For the **customer**:

- Sign up / sign in.
- Post a small job.
- Add useful job details.
- Share or use location.
- See relevant nearby workers/offers.
- Compare offers.
- Select a worker.
- Communicate.
- Pay via Ecocash.
- Mark completion.
- Rate/report when appropriate.

For the **worker**:

- Sign up / sign in.
- Complete required verification.
- Create a simple skills/profile record.
- See nearby jobs.
- Understand job requirements.
- Submit an offer/bid.
- Be selected by a customer.
- Communicate.
- Receive Ecocash payment.
- Build reputation.

---

# 11. What the MVP Does NOT Need to Solve Yet

To avoid overbuilding, GRAFT does not need to fully optimize the following before the first real users can test the marketplace:

- Complex subscriptions.
- Advanced worker analytics.
- AI-powered job matching.
- Sophisticated recommendation engines.
- Large enterprise accounts.
- Complex loyalty systems.
- Multi-country support.
- Dozens of payment providers.
- Complex insurance products.
- Large service catalogs.
- Advanced bidding algorithms.
- Full-scale business intelligence dashboards.

These can be evaluated after the basic marketplace loop works.

---

# 12. Anti-Personas

Anti-personas help prevent GRAFT from drifting away from its core purpose.

## 12.1 Large Enterprise Procurement User

A large company looking to run complex procurement processes is not an MVP target.

GRAFT is designed around **small, local, practical jobs**, not enterprise procurement.

## 12.2 High-End Specialist Marketplace User

A user searching primarily for large engineering contracts, major construction projects, or complex professional services is outside the initial focus.

## 12.3 User Expecting a Fully Managed Service

GRAFT is a marketplace, not initially a service company that sends its own employees to do every job.

The platform facilitates the connection and transaction between customer and worker.

---

# 13. Persona-Driven Product Principles

Every major feature should be tested against these questions:

### Customer question

> **Does this help the customer find, trust, hire, communicate with, and pay a suitable local worker?**

### Worker question

> **Does this help the worker find, win, complete, and get paid for suitable local jobs?**

### Marketplace question

> **Does this make successful, trustworthy local transactions more likely?**

If a proposed feature does not materially improve one of these outcomes, it should be questioned before being added to the MVP.

---

# 14. Most Important Persona Insights

## Insight 1 — Proximity is economic, not cosmetic

A worker being nearby can determine whether a job is profitable after transport costs and travel time.

Therefore, proximity should influence job discovery and matching from the beginning.

## Insight 2 — Trust is a core product feature

Customers may be allowing workers into private homes or businesses. Workers also need protection from fake or dishonest customers.

KYC, verification, reputation, reporting, and dispute handling are therefore central to the marketplace.

## Insight 3 — The lowest price should not automatically win

The customer's real decision is multidimensional.

A trustworthy worker who is slightly more expensive may be more attractive than an unknown worker with the lowest offer.

## Insight 4 — The worker experience must be extremely lightweight

Many workers may use lower-cost Android phones and limited data connections.

A worker should be able to understand and respond to a job with minimal steps.

## Insight 5 — GRAFT must work with informal work, not fight it

The platform should not assume that every worker already has:

- a registered business,
- a website,
- formal branding,
- a storefront,
- or a sophisticated digital profile.

The product should help capable people become discoverable and trusted without forcing unnecessary formalization.

## Insight 6 — Reputation can become a worker asset

A worker who repeatedly completes jobs successfully should gradually gain a stronger reputation.

This can create a long-term incentive for quality and reliability.

---

# 15. MVP Persona Priority

| Priority | Persona | Why |
|---|---|---|
| **P0** | Customer | Without demand, there is no marketplace transaction. |
| **P0** | Worker / GRAFT | Without supply, customers cannot get jobs completed. |
| **P1** | Admin / Operations | Necessary for trust, safety, moderation, and marketplace health. |
| **Later** | Enterprise / other specialized users | Not required to validate the core GRAFT marketplace. |

The customer and worker experiences must be developed **together**, because a marketplace MVP cannot succeed by validating only one side.

---

# 16. Persona Validation Questions

These are questions to validate with real users rather than treating assumptions as facts.

## Customer

- How do you currently find someone for small jobs?
- What makes you trust a worker?
- What is your biggest fear when letting an unfamiliar worker into your home or business?
- How important is worker distance?
- Would you compare multiple offers before choosing someone?
- What information do you need before hiring?
- What would make you use GRAFT again?

## Worker

- How do you currently find work?
- How much does transport distance affect which jobs you accept?
- What information do you need before making an offer?
- What makes a customer trustworthy?
- What would make you prefer GRAFT over WhatsApp or word of mouth?
- How important are ratings and verification?
- What would stop you from using the app regularly?

These questions should guide real-world validation after the MVP is usable.

---

# 17. Final Persona Definition

GRAFT exists for two core people:

### The customer

> **Someone with a real local problem who wants to find a trustworthy person nearby to solve it quickly and at a reasonable cost.**

### The worker / GRAFT

> **A person with useful skills who wants a fair opportunity to find nearby work and earn money reliably.**

The MVP should make the exchange between these two people **simple, local, trustworthy, and economically worthwhile**.

That is the central user experience GRAFT needs to prove before the product expands into more complex features.
