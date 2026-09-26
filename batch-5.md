# GRAFT — Batch 5 Product Experience & UI/UX Refinement

## Project Direction

GRAFT is moving from the **functional MVP stage** into the **professional product stage**.

The current functionality appears to be working, but the interface feels generic and "vibe coded." The next phase is therefore not simply about adding more screens. It is about turning GRAFT into a polished, practical Zimbabwean marketplace that feels trustworthy, modern, fast, and easy to use.

### Core product idea

> **GRAFT: Ndezve basa.**

GRAFT is a Zimbabwean real-world work marketplace where:

**Customer needs work → Posts a job → Nearby workers see it → Workers make offers → Customer chooses → Work happens → Payment/completion → Both sides build reputation.**

The experience should take inspiration from proven marketplace interaction patterns used by products such as **inDrive, Uber and SimbaTasker**, while maintaining a distinct GRAFT identity.

---

# BATCH 5 — GRAFT PRODUCT EXPERIENCE & UI/UX REFINEMENT

## Primary Objective

Transform the existing functional GRAFT app from a generic interface into a polished, modern, Zimbabwe-first marketplace experience.

### Batch 5 should focus on

- Visual hierarchy
- Information architecture
- Navigation
- Customer experience
- Worker experience
- Marketplace discovery
- Job cards
- Profiles
- Location presentation
- Bidding preparation
- Trust indicators
- Zimbabwe-specific usability
- Mobile ergonomics
- Loading states
- Empty states
- Error states
- Visual consistency
- Filling currently blank screens

### Important constraint

**Do not introduce unnecessary backend complexity in this batch.**

The goal is to establish the product's visual and UX foundation before implementing the deeper marketplace mechanics.

---

# 1. DESIGN DIRECTION

GRAFT must NOT look like a generic SaaS template or AI-generated UI.

## Design characteristics

### Modern

- Clean spacing
- Strong typography
- Clear hierarchy
- Minimal visual noise
- Good use of whitespace

### Classic

Avoid excessive:

- Gradients
- Glassmorphism
- Floating decorative elements
- Giant rounded cards
- Unnecessary animations
- Trend-driven UI patterns

### Zimbabwean

The product should feel naturally designed for Zimbabwe without relying on stereotypes or excessive "African" decoration.

### Practical

A person using an older Android phone should understand what to do within seconds.

### Trustworthy

GRAFT connects strangers who may enter each other's homes or workplaces.

Trust therefore needs to be visible throughout the interface.

---

# 2. CORE UX PRINCIPLE

Every major screen must immediately answer:

1. **Where am I?**
2. **What can I do here?**
3. **What should I do next?**

No screen should exist simply because "we need a screen."

---

# 3. CUSTOMER HOME

Replace the generic dashboard with a **task-first marketplace home**.

## Suggested structure

### Greeting

**Good morning, [Name]**

### Primary question

**What do you need help with?**

### Primary actions

#### Post a Job

Describe what you need and receive offers.

**CTA:** `Post a Job`

#### Find a Worker

Browse workers available near you.

**CTA:** `Find a Worker`

### Recent / Nearby activity

Example:

**Plumber**

Fix leaking kitchen pipe

📍 Avondale  
📏 3.2 km  
💰 From $15

Another example:

**Cleaner**

House cleaning

📍 Avondale  
📏 1.8 km  
💰 4 offers

## UX principle

The customer should NOT have to navigate through several screens to perform the primary action.

---

# 4. WORKER HOME

The worker home screen should answer:

> **"Is there work near me right now?"**

## Top section

### Availability

`● ONLINE`

**Looking for work near Harare**

Allow the worker to switch between:

- Online
- Offline

## Nearby jobs

Example:

### Fix leaking kitchen pipe

**Plumbing**

📍 Avondale  
📏 2.4 km away

💰 **$20–30**

🕐 Today • 14:00

**3 offers**

CTA:

`View Job`

## Worker mindset

The worker should be able to quickly scan several opportunities and decide which ones are worth pursuing.

---

# 5. MARKETPLACE JOB CARD

The Job Card becomes one of the most important reusable GRAFT components.

Every job should use a consistent visual structure.

## Job Card

### Category

PLUMBING

### Job title

Fix leaking kitchen pipe

### Short description

One or two lines maximum.

### Key information

📍 Location  
📏 Distance  
🕐 Time  
💰 Budget  
👤 Customer  
⭐ Customer rating

### Primary action

`View Job`

Eventually:

`Make Offer`

## Important

Workers should not need to open every job simply to determine whether it is relevant.

The card should expose the information needed to make that decision.

---

# 6. JOB DETAIL SCREEN

This screen needs a professional marketplace layout.

## Header

### Fix leaking kitchen pipe

**Plumbing**

## Budget

### $20–30

## Location

📍 Avondale, Harare

**2.4 km away**

## Schedule

Today  
14:00–16:00

## Description

Customer's complete description.

## Photos

Horizontal image gallery when photos exist.

## Customer

Profile photo

**Tendai M.**

⭐ 4.8  
12 completed jobs

## Offers

Eventually show:

### Offer

**$25**

12 min away

⭐ 4.9

87 jobs completed

`View Profile`

---

# 7. CUSTOMER → WORKER SELECTION

This is one of GRAFT's key marketplace interactions.

The intended experience should eventually resemble the useful interaction pattern of inDrive without copying its branding.

## Example

Customer posts:

> Need a plumber

Workers respond:

> I'll do it for $25

> I can arrive in 20 minutes

> I'll do it for $22

The customer receives an offer comparison.

## Offers for your job

| Worker | Price | ETA | Rating |
|---|---:|---:|---:|
| Worker A | $25 | 15 min | ⭐ 4.9 |
| Worker B | $22 | 25 min | ⭐ 4.7 |
| Worker C | $28 | 10 min | ⭐ 5.0 |

Primary action:

`Choose Worker`

## Product principle

GRAFT should provide useful information so the customer can make the decision.

Do not hide the decision behind an unexplained algorithm.

---

# 8. WORKER PROFILE

The worker profile is a **trust document**, not a social-media profile.

## Header

Profile photo

### Blessing M.

⭐ **4.8**

**87 jobs completed**

**3 years on GRAFT**

## Verification

- ✓ Phone verified
- ✓ Identity verified
- ✓ Skills verified

## Services

- Plumbing
- Bathroom repairs
- Pipe installation

## Recent work

Display completed jobs where appropriate.

## Reviews

Example:

⭐⭐⭐⭐⭐

> "Arrived on time and fixed the problem."

---

# 9. CUSTOMER PROFILE

The customer profile should also communicate trust.

Include where appropriate:

- Name
- Profile photo
- Rating
- Completed jobs
- Verification status
- Member since
- Recent activity/reputation
- Contact/report controls

The goal is mutual trust:

**Customer needs to trust worker.**

**Worker needs to trust customer.**

---

# 10. LOCATION AS A FIRST-CLASS FEATURE

GRAFT is intended to be hyperlocal.

Location should therefore not be treated as merely a form field.

Use location throughout the product:

- Near you
- 2.1 km away
- Within 5 km
- Avondale
- Belgravia
- Mbare
- Harare
- etc.

## Future marketplace map

Eventually provide:

### Nearby Jobs

Map + job markers

Bottom sheet:

**12 jobs near you**

Users can browse nearby opportunities.

---

# 11. ZIMBABWE-FIRST UX

GRAFT must be designed around actual Zimbabwean usage conditions.

## Phone numbers

Use:

`+263`

as the natural default for Zimbabwean phone numbers.

## Currency

Primary currency:

**USD**

Design the financial components so other currencies can be supported later if required.

## Locations

Zimbabwean:

- cities
- suburbs
- neighbourhoods

should feel natural throughout the interface.

## Connectivity

Design for:

- slow networks
- affordable Android phones
- intermittent connectivity
- limited data

Therefore:

- Keep screens lightweight
- Compress images
- Avoid unnecessary animations
- Cache useful information
- Make retry actions obvious
- Avoid loading large assets unnecessarily
- Design sensible offline states

---

# 12. LANGUAGE

Do not immediately translate the entire application.

Instead, establish the architecture so localization can later support:

- English
- Shona
- Ndebele

## Use simple language now

Avoid:

> Initiate service procurement request

Use:

> **Post a Job**

Avoid:

> Service provider marketplace

Use:

> **Find a Worker**

Avoid:

> Submit quotation

Use:

> **Make an Offer**

---

# 13. NAVIGATION

Keep the primary navigation simple.

## Customer

- Home
- Jobs
- Messages
- Profile

Primary action:

`+ Post Job`

## Worker

- Home
- Jobs
- Messages
- Profile

Primary availability control:

`Available / Offline`

The worker and customer experiences should feel related but clearly different.

---

# 14. EMPTY STATES

Every blank screen must become intentional.

## Example

### No jobs yet

**Your jobs will appear here**

Post your first job and start receiving offers.

`Post a Job`

Do not use generic messages such as:

> No data found.

Every empty state should tell the user:

1. What is empty
2. Why it is empty
3. What they can do next

---

# 15. LOADING STATES

Avoid using generic spinners everywhere.

Use appropriate loading states:

- Skeleton job cards
- Skeleton profiles
- Skeleton job detail
- Map loading state
- Button loading state
- List loading state

The interface should feel active rather than frozen.

---

# 16. ERROR STATES

Every important operation needs a useful error state.

## Example

### Couldn't load nearby jobs

Check your connection and try again.

`Try Again`

Error states should always explain:

- What went wrong
- What the user can do

---

# 17. GRAFT TRUST SYSTEM

Create reusable trust components.

## Verification

`✓ Verified`

## Rating

`⭐ 4.8`

## Completed work

`87 jobs`

## Response

`Usually responds quickly`

## Distance

`2.4 km away`

## Availability

`🟢 Available`

These should become reusable UI components throughout GRAFT.

---

# 18. WORKER ONLINE EXPERIENCE

This is a core part of the future GRAFT marketplace.

Worker opens GRAFT.

### Availability

# 🟢 ONLINE

**Looking for nearby work**

GRAFT then surfaces relevant jobs.

Example notification/card:

### NEW JOB NEAR YOU

Plumbing

2.1 km away

Budget: $20–30

`View`

## Intended interaction

**I'm available → show me nearby opportunities → let me choose.**

This creates the inDrive-like marketplace behaviour that GRAFT needs without cloning inDrive.

---

# 19. CUSTOMER JOB LIFECYCLE

The future product should support a clear lifecycle:

```text
Draft
  ↓
Posted
  ↓
Receiving Offers
  ↓
Worker Selected
  ↓
Worker On The Way
  ↓
Arrived
  ↓
Work Started
  ↓
Work Completed
  ↓
Payment
  ↓
Review
  ↓
Completed
```

The exact backend implementation can come later.

Batch 5 should establish the UI components and states needed to support this lifecycle.

---

# 20. WORKER JOB LIFECYCLE

The worker experience should eventually support:

```text
Online
  ↓
Find Nearby Job
  ↓
View Job
  ↓
Make Offer
  ↓
Offer Accepted
  ↓
Navigate / Travel
  ↓
Arrived
  ↓
Start Work
  ↓
Complete Work
  ↓
Payment
  ↓
Review
```

Again, Batch 5 should establish the visual language for these states without unnecessarily implementing the complete backend.

---

# 21. DESIGN SYSTEM

Before redesigning every screen independently, establish a proper GRAFT design system.

## Typography

Define:

- Display
- Heading
- Body
- Caption
- Numeric / price

## Spacing

Use a consistent 4/8-point spacing system.

## Components

Create reusable components for:

- Buttons
- Cards
- Chips
- Badges
- Inputs
- Bottom sheets
- Dialogs
- Avatars
- Ratings
- Job cards
- Worker cards
- Customer cards
- Offer cards
- Status indicators
- Verification badges

## Component states

Every important interactive component should support:

- Default
- Pressed
- Disabled
- Loading
- Error

---

# 22. VISUAL RULES

Avoid:

- Generic template layouts
- Excessive rounded rectangles
- Excessive gradients
- Glassmorphism
- Unnecessary shadows
- Excessive animations
- Decorative UI with no function
- Random icon styles
- Inconsistent spacing
- Inconsistent typography
- Different button styles for the same action

Prefer:

- Strong hierarchy
- Clear typography
- Consistent spacing
- Functional cards
- Clear CTAs
- Subtle depth
- Useful colour
- Strong status indicators
- Good information density
- Excellent touch targets

---

# 23. MOBILE-FIRST REQUIREMENTS

GRAFT is primarily a mobile product.

Every screen must be designed for actual phone use.

Consider:

- One-handed use
- Large touch targets
- Bottom navigation
- Thumb reach
- Readable typography
- Short forms
- Minimal typing
- Keyboard behaviour
- Small screens
- Older Android devices

Avoid desktop-style dashboards squeezed into a phone.

---

# 24. PERFORMANCE REQUIREMENTS

The app should remain usable on:

- older Android phones
- slow mobile connections
- limited data plans

Do not introduce heavy UI libraries or animations unless they provide meaningful value.

Images should be:

- compressed
- appropriately sized
- lazy loaded where appropriate
- cached when useful

---

# 25. BATCH 5 SCOPE

## Must redesign

- [ ] Customer Home
- [ ] Worker Home
- [ ] Job Cards
- [ ] Job Detail
- [ ] Worker Profile
- [ ] Customer Profile
- [ ] Jobs screen
- [ ] Messages screen
- [ ] Profile screen
- [ ] Post Job flow
- [ ] Worker Post Job flow
- [ ] Main navigation

## Must establish

- [ ] Design system
- [ ] Typography system
- [ ] Spacing system
- [ ] Button system
- [ ] Card system
- [ ] Trust components
- [ ] Location components
- [ ] Rating components
- [ ] Availability components
- [ ] Job status components

## Must fix

- [ ] Blank screens
- [ ] Generic empty states
- [ ] Generic loading states
- [ ] Generic error states
- [ ] Inconsistent layouts
- [ ] Inconsistent icons
- [ ] Inconsistent typography
- [ ] Inconsistent spacing
- [ ] Inconsistent buttons
- [ ] Poor mobile ergonomics

---

# 26. DO NOT BUILD YET

Do not allow Batch 5 to become an uncontrolled feature-development batch.

Do not unnecessarily implement:

- Full real-time bidding backend
- Full payments infrastructure
- Full EcoCash integration
- Complex maps backend
- Advanced notifications infrastructure
- Complex chat backend
- AI features
- Admin systems
- Complex analytics

These belong in later batches.

Batch 5 establishes the **professional product foundation**.

---

# 27. FUTURE BATCH ROADMAP

After Batch 5:

## Batch 6 — Marketplace Discovery

Focus:

- Nearby jobs
- Nearby workers
- Location
- Search
- Categories
- Filters
- Map experience
- Availability

---

## Batch 7 — Offers / Bidding

Focus:

- Worker offers
- Counter-offers where appropriate
- Offer cards
- Offer status
- Customer comparison
- Worker offer management

---

## Batch 8 — Customer / Worker Selection

Focus:

- Choosing a worker
- Worker confirmation
- Job acceptance
- Selection states
- Trust information
- Confirmation flows

---

## Batch 9 — Job Lifecycle & Communication

Focus:

- Job status
- Arrival
- Start work
- Completion
- Messaging
- Job-related communication
- Status tracking

---

## Batch 10 — Trust & Safety

Focus:

- Ratings
- Reviews
- Verification
- Reports
- Disputes
- Block/report controls
- Reputation

---

## Batch 11 — Payments

Focus:

- Payment flow
- EcoCash
- Supported payment methods
- Payment states
- Receipts
- Transaction history

---

## Batch 12 — Notifications & Operational Polish

Focus:

- Push notifications
- Job alerts
- Offer alerts
- Message notifications
- Status notifications
- Reliability
- Performance
- Final UX polish

---

# 28. FINAL PRODUCT AUDIT

After the major marketplace functionality is implemented, perform an end-to-end audit from multiple perspectives.

## Customer

Test:

```text
Open GRAFT
↓
Create account
↓
Find service
↓
Post job
↓
Receive offers
↓
Compare workers
↓
Choose worker
↓
Communicate
↓
Worker arrives
↓
Work starts
↓
Work completed
↓
Payment
↓
Review
```

## Worker

Test:

```text
Open GRAFT
↓
Create worker profile
↓
Verify profile
↓
Go Online
↓
Find nearby jobs
↓
View job
↓
Make offer
↓
Offer accepted
↓
Communicate
↓
Travel
↓
Arrive
↓
Start work
↓
Complete work
↓
Receive payment
↓
Review customer
```

## Audit standard

Do not only test:

> `flutter analyze`

or:

> `flutter build apk`

The real test is:

> **Can a real person use GRAFT from beginning to end without confusion?**

---

# 29. DEFINITION OF DONE FOR BATCH 5

Batch 5 is complete when:

- [ ] GRAFT no longer looks like a generic/vibe-coded application
- [ ] Customer and worker experiences are clearly differentiated
- [ ] No unexplained blank screens remain
- [ ] Every important screen has intentional empty states
- [ ] Every important screen has loading states
- [ ] Every important screen has error states
- [ ] Typography is consistent
- [ ] Spacing is consistent
- [ ] Buttons are consistent
- [ ] Cards are consistent
- [ ] Navigation is consistent
- [ ] Job cards communicate useful information at a glance
- [ ] Worker profiles communicate trust
- [ ] Customer profiles communicate trust
- [ ] Location and distance are visible where useful
- [ ] Ratings are visible where useful
- [ ] Verification is visible where useful
- [ ] Worker availability is clearly represented
- [ ] Customer Post Job experience is polished
- [ ] Worker Post Job experience is polished
- [ ] Zimbabwe-first terminology is used
- [ ] `+263` is supported naturally
- [ ] USD is presented naturally
- [ ] UI is designed for older Android phones
- [ ] UI considers slow networks
- [ ] Unnecessary animations are removed
- [ ] Existing functionality continues working
- [ ] No fake functionality is presented as working
- [ ] The APK is physically tested on a real phone

---

# 30. PRODUCT QUALITY STANDARD

The target feeling after Batch 5 is:

> **"This looks like a real company built this."**

Not:

> "This looks like an AI generated Flutter app."

The product should feel:

**Simple enough for a first-time user.**

**Professional enough to trust.**

**Fast enough for Zimbabwean mobile conditions.**

**Powerful enough to become a real marketplace.**

---

# 31. IMPORTANT INSTRUCTION TO THE CODING AGENT

Do not blindly copy Uber, inDrive or SimbaTasker.

Study their **interaction patterns**, information hierarchy and marketplace mechanics.

GRAFT must have its own:

- Brand identity
- Visual language
- Components
- Typography
- Colour system
- Voice
- User experience

### The guiding principle

> **Borrow proven interaction patterns. Build an original GRAFT product.**

---

# 32. GRAFT'S LONG-TERM PRODUCT LOOP

The entire product should eventually reduce to this simple loop:

```text
NEED SOMETHING DONE
        ↓
POST A JOB
        ↓
NEARBY WORKERS SEE IT
        ↓
WORKERS MAKE OFFERS
        ↓
CUSTOMER CHOOSES
        ↓
WORKER TRAVELS
        ↓
WORK GETS DONE
        ↓
PAYMENT
        ↓
RATING
        ↓
REPUTATION
        ↓
MORE TRUST
        ↓
MORE JOBS
```

For workers:

```text
GO ONLINE
    ↓
FIND NEARBY WORK
    ↓
CHOOSE OPPORTUNITY
    ↓
MAKE OFFER
    ↓
GET HIRED
    ↓
DO THE WORK
    ↓
GET PAID
    ↓
BUILD REPUTATION
    ↓
GET MORE WORK
```

This is the marketplace engine GRAFT is ultimately being built around.

---

# FINAL DIRECTION

**Batch 5 is not just a UI makeover.**

It is the point where GRAFT moves from:

> **"We have a working app."**

to:

> **"We have the foundation of a real product."**

The priority is:

**Usability → Trust → Marketplace clarity → Professional visual design → Zimbabwe-first experience → Performance.**

Only after this foundation is strong should we aggressively add the deeper marketplace mechanics.
