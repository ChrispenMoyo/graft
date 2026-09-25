# GRAFT — BATCH 2 IMPLEMENTATION PROMPT
## Design System, Brand Identity, Navigation & Core UI Foundation

You are continuing development of **GRAFT**, a Zimbabwean hyperlocal services marketplace.

Batch 1 has already been completed and verified.

Your task is to execute **BATCH 2 ONLY**.

Do not jump ahead into later batches.

---

# 1. SOURCE OF TRUTH — READ THESE FIRST

Before modifying any code, inspect the repository and read the following project documents if they exist:

1. `docs/BUSINESS_REQUIREMENTS.md`
2. `docs/PRODUCT_VISION.md`
3. `docs/USER_PERSONAS.md`
4. `docs/USER_FLOWS.md`
5. `docs/UX_UI_REQUIREMENTS.md`
6. All existing Batch 1 implementation files
7. The project's existing README/project documentation
8. The `/assets` directory

These documents are the product source of truth.

Do NOT invent major product behaviour that contradicts them.

The hierarchy is:

```text
BUSINESS REQUIREMENTS
        ↓
PRODUCT VISION
        ↓
USER PERSONAS
        ↓
USER FLOWS
        ↓
UX/UI REQUIREMENTS
        ↓
BATCH 1 FOUNDATION
        ↓
BATCH 2 UI / DESIGN FOUNDATION
```

If you encounter an ambiguity:

1. Check the existing documents.
2. Check the existing implementation.
3. Check whether the issue is explicitly marked as an open/validation decision.
4. Do not silently invent a permanent business rule.

---

# 2. BATCH 2 OBJECTIVE

The objective of Batch 2 is to establish the **visual and interaction foundation of GRAFT**.

By the end of this batch, GRAFT should no longer look like a generic Flutter starter application.

It should visibly feel like:

> **A modern Zimbabwean marketplace for finding trusted people nearby to get small jobs done.**

Batch 2 should establish:

- Brand identity
- Typography
- Colour system
- Design tokens
- GRAFT logo
- Iconography
- App theme
- Reusable UI components
- Navigation foundation
- Responsive foundations
- Core empty/loading/error states
- Customer/worker visual differentiation where appropriate
- Accessibility foundations
- Low-bandwidth-friendly visual implementation

This batch is about creating the **design system and core UI foundation**, not implementing the entire marketplace.

---

# 3. IMPORTANT — DO NOT BUILD THE WHOLE MVP YET

Do NOT attempt to implement every marketplace feature in this batch.

Do NOT build the complete:

- KYC system
- EcoCash integration
- Real payment processing
- Real map infrastructure
- Real-time worker tracking
- Full bidding backend
- Full notification system
- Full admin system
- AI features
- Advanced recommendation engine
- Production marketplace matching engine

Those belong to later implementation stages.

Batch 2 should make the application visually and structurally ready for those features.

---

# 4. BRAND IDENTITY — FINAL DECISIONS

These decisions are now authoritative for the project.

## 4.1 Brand Name

**GRAFT**

GRAFT represents the local worker/service provider side of the marketplace while also functioning as the overall product name.

The visual identity should communicate:

- Local
- Practical
- Trustworthy
- Energetic
- Human
- Professional
- Zimbabwean
- Hyperlocal

Avoid making it look like:

- A government application
- A banking application
- A social network
- A generic freelancer platform
- A classifieds website
- A corporate enterprise SaaS product

---

# 5. TYPOGRAPHY

There is a font inside the project's `/assets` directory called:

**Young Serif**

This font must be incorporated into the project.

## Requirement

Inspect `/assets` and locate the Young Serif font file.

Use the actual supplied font rather than downloading another version.

Do not replace it with a Google Font or another typeface.

The project should use Young Serif as the **default brand/display typeface**.

Use it consistently for:

- Logo wordmark where appropriate
- Major headings
- Hero text
- Section headings
- Important marketplace titles
- Brand-forward UI moments

However:

### IMPORTANT

Do not sacrifice readability for branding.

For very small UI text such as:

- Captions
- Dense metadata
- Form labels
- Navigation labels
- Status text
- Accessibility-critical text

you may use a highly legible system sans-serif fallback if necessary.

The design system should still treat Young Serif as the **primary brand typography**.

Do not introduce multiple decorative fonts.

---

# 6. COLOUR SYSTEM

The primary brand colour must be inspired directly by the **green of the Zimbabwean flag**.

Use:

```text
Primary Green: #319400
```

This is the dominant GRAFT brand colour.

Do not use a random modern SaaS green.

The colour should immediately contribute to GRAFT feeling Zimbabwean.

---

# 7. ZIMBABWEAN FLAG SUPPORTING PALETTE

Use the Zimbabwean flag colours as supporting colours, but do NOT turn every screen into a literal Zimbabwean flag.

The interface should remain sophisticated.

Recommended foundation:

```text
Primary Green
#319400

Zimbabwe Red
#D40000

Zimbabwe Yellow
#FFD200

Zimbabwe Black
#000000

White
#FFFFFF
```

Create semantic design tokens around these colours.

For example:

```text
Brand
├── primary
├── primaryDark
├── primaryLight
├── secondary
└── accent

Neutral
├── background
├── surface
├── surfaceVariant
├── textPrimary
├── textSecondary
├── textMuted
└── border

Status
├── success
├── warning
├── error
└── info
```

Do not hard-code colours throughout individual widgets.

All colours must come from the centralized design system.

---

# 8. COLOUR USAGE RULE

Green should be the dominant GRAFT identity.

Use the other Zimbabwean colours carefully.

For example:

### Green

Use for:

- Primary actions
- Active navigation
- Brand elements
- Selected states
- Important positive marketplace actions

### Yellow

Use sparingly for:

- Attention
- Pending
- Important highlights
- Marketplace opportunities

### Red

Use for:

- Errors
- Destructive actions
- Serious warnings
- Relevant safety states

Do not use red simply because it is part of the flag.

### Black

Use primarily for:

- Strong text
- High-contrast elements
- Brand/icon details
- Important hierarchy

### White

Use as a major neutral surface colour.

The interface should remain clean.

---

# 9. DESIGN PHILOSOPHY

Follow this visual formula:

```text
Zimbabwean
    +
Modern
    +
Trustworthy
    +
Simple
    +
Lightweight
    +
Professional
```

Avoid:

```text
Over-designed
    +
Neon
    +
Glassmorphism
    +
Huge gradients
    +
Excessive shadows
    +
Excessive animation
    +
Generic SaaS styling
```

The product should look premium because of:

- Typography
- Spacing
- Hierarchy
- Consistency
- Good component design
- Strong use of colour

Not because of decorative effects.

---

# 10. GRAFT LOGO — IMPORTANT

Create a reusable GRAFT brand mark.

The logo must visually combine:

**A large "G"**

with

**a location-pin/location-marker concept**

into one coherent symbol.

The concept should communicate:

```text
G = GRAFT
+
Location = Nearby / Hyperlocal
=
GRAFT
```

The result should feel like a single logo mark rather than:

> "letter G next to a random map pin."

The G and location-pin shape should feel visually blended/interlocked.

The logo must work at:

- App icon size
- Splash screen
- Header size
- Navigation size
- Website header
- Favicon
- Social/profile avatar

Create the logo as a reusable vector/widget where practical.

Do not use an unrelated stock logo.

Do not use a generic location icon next to a generic "G" without modification.

---

# 11. LOGO DESIGN DIRECTION

The logo should be:

- Simple
- Recognizable
- Geometric
- Memorable
- Strong at small sizes
- Suitable for an Android app icon
- Suitable for monochrome usage
- Suitable for the primary green brand colour

The logo should NOT contain:

- Complex illustrations
- Tiny text
- Detailed maps
- Gradients that make it unusable at small sizes
- Excessive shadows
- Decorative flags

The Zimbabwean identity should primarily come through the colour system and overall visual language.

---

# 12. APP ICON

Use the G + location-pin logo as the foundation of the application icon.

The icon should be optimized for a square mobile app icon.

At small size:

- The G must remain recognizable.
- The location concept must remain recognizable.
- The green brand identity must remain dominant.
- Avoid tiny details that disappear.

If platform-specific icon generation is required, establish the assets correctly rather than using a placeholder.

---

# 13. DESIGN TOKENS

Create a centralized design token system.

At minimum centralize:

```text
Colors
Typography
Font sizes
Font weights
Spacing
Border radius
Elevation
Icon sizes
Touch targets
Button heights
Input heights
Animation durations
Breakpoints
```

Do not scatter raw design values throughout the application.

The purpose is to make future design changes easy.

---

# 14. SPACING SYSTEM

Create a consistent spacing scale.

Use a simple predictable system.

For example:

```text
4
8
12
16
20
24
32
40
48
64
```

Use the design system rather than random padding values.

Do not obsess over exact numbers if the existing Batch 1 architecture already contains a suitable spacing system.

Prefer consistency over unnecessary refactoring.

---

# 15. BORDER RADIUS

Use restrained rounding.

GRAFT should not look like a collection of floating pills.

Prefer:

- Moderate card radius
- Moderate input radius
- Strong button consistency
- Small radius for compact elements

Avoid:

- Excessive pill shapes
- Giant rounded containers
- Every element having a different radius

Centralize radius values in the design system.

---

# 16. ELEVATION / SHADOWS

Keep shadows subtle.

The UX requirements explicitly prioritize clean hierarchy over decorative effects.

Prefer:

- Borders
- Contrast
- Surface differences
- Minimal elevation

Avoid:

- Heavy shadows
- Glow effects
- Neon shadows
- Excessive floating cards

---

# 17. ICONOGRAPHY

Use one consistent icon family.

Icons should communicate clearly and remain recognizable on inexpensive displays.

Important GRAFT concepts should have consistent icons:

- Location
- Jobs
- Worker
- Customer
- Bid
- Price
- Verification
- Rating
- Payment
- EcoCash
- Notification
- Profile
- Settings
- Help
- Report
- Safety
- Time
- Skills
- Availability

Do not mix unrelated icon styles.

If an icon library already exists in Batch 1, use it consistently.

---

# 18. CORE COMPONENT LIBRARY

Establish reusable components for at least:

### Buttons

- Primary button
- Secondary button
- Tertiary/text button
- Destructive button
- Loading button

### Forms

- Text field
- Phone input
- Currency input
- Location field
- Search field
- Dropdown/select
- Category selector
- Date/time selector

### Marketplace

- Job card
- Bid card
- Worker card
- Customer card
- Profile header
- Verification badge
- Rating display
- Distance indicator
- Status badge
- Price display

### Feedback

- Loading state
- Empty state
- Error state
- Offline state
- Success state
- Snackbar
- Confirmation dialog
- Bottom sheet

### Navigation

- App navigation
- Bottom navigation where appropriate
- App bar
- Back navigation
- Tab/navigation components

### Location

- Map/list toggle foundation
- Location indicator
- Distance indicator
- Approximate location display

These should be reusable rather than copied screen-by-screen.

---

# 19. NAVIGATION FOUNDATION

Implement the navigation structure needed for the MVP foundation.

The exact final navigation may evolve later, but the structure should support the two-sided marketplace.

At minimum establish:

```text
GRAFT
│
├── Welcome
│
├── Authentication
│
├── Customer
│   ├── Home
│   ├── Jobs
│   ├── Post Job
│   ├── Notifications
│   └── Profile
│
└── Worker
    ├── Home
    ├── Nearby Jobs
    ├── Active Jobs
    ├── Notifications
    └── Profile
```

Do not build every screen yet.

Create the navigation architecture so future batches can plug screens into it cleanly.

---

# 20. WELCOME SCREEN

The Welcome screen is one of the most important screens in the product.

A new user should understand GRAFT almost immediately.

The screen should communicate:

> **Need a job done?**

and

> **Looking for work?**

Primary actions:

```text
Need a job done?
[ Find someone ]

Looking for work?
[ Find jobs ]
```

There should also be a clear:

```text
Sign in
```

or equivalent authentication path.

Do not create a long onboarding tutorial.

---

# 21. CUSTOMER HOME FOUNDATION

Create the visual foundation for the Customer Home.

The primary question should be:

> **"What do you need done?"**

The home screen should visually prioritize job creation.

Potential structure:

```text
Greeting
        ↓
What do you need done?
[ Describe a job... ]

Popular categories
        ↓
Recent / Active jobs
        ↓
Nearby / relevant activity
```

Do not overpopulate the screen.

The primary action should be obvious.

---

# 22. WORKER HOME FOUNDATION

Create the visual foundation for the Worker Home.

The primary question should be:

> **"What jobs can I do nearby?"**

Potential structure:

```text
Greeting
        ↓
Availability / Online status
        ↓
Nearby jobs
        ↓
Recommended relevant jobs
        ↓
Active work
```

The worker experience must remain extremely lightweight.

A worker should be able to see relevant jobs and understand them quickly.

---

# 23. JOB CARD

Create a reusable JobCard component.

It should be designed around the information users actually need.

Possible information:

```text
Job title
Category
Approximate area
Distance
Preferred time
Budget
Job status
Number of bids where appropriate
```

Before bidding, do NOT expose unnecessary exact customer information.

Respect the privacy requirements from the product documents.

---

# 24. WORKER CARD

Create a reusable WorkerCard.

Potential information:

```text
Profile photo
Name
Primary skill
Rating
Completed jobs
Verification indicators
Approximate distance
Availability
Bid price where applicable
Estimated arrival time where applicable
```

Trust must be visible.

Do not create an ambiguous:

> Verified

badge.

Where verification is displayed, distinguish the type of verification.

Examples:

```text
Phone Verified
Identity Verified
EcoCash Verified
Skill Verified
```

Only display badges that are actually supported by the underlying data.

Do not fabricate verification.

---

# 25. BID CARD

Create a reusable BidCard foundation.

It should support:

```text
Worker
Price
ETA
Rating
Verification
Short message
Experience/relevant information
```

The visual hierarchy should help the customer compare:

```text
PRICE
DISTANCE
TRUST
AVAILABILITY
SKILL
```

Do not design bidding as a race to the lowest price.

The UX requirements explicitly state that customers retain control and should be able to make a multidimensional decision.

---

# 26. STATUS SYSTEM

Create reusable semantic status components.

Potential job statuses include:

```text
Draft
Posted
Bidding
Worker Selected
Payment Pending
Payment Confirmed
Worker En Route
Work Started
Work Completed
Customer Confirmed
Payment Released
Completed
Cancelled
Expired
Payment Failed
Disputed
No-show
Suspended
```

The underlying state machine will be implemented later.

Batch 2 only needs the reusable visual/status system.

Do not hard-code unsupported state transitions.

---

# 27. LOADING STATES

Every future major screen must be able to use a consistent loading component.

Create lightweight loading states.

Avoid excessive skeleton animations.

The product must remain usable on:

- Slow networks
- Low-end Android
- Limited data

Animations should be subtle and optional.

---

# 28. EMPTY STATES

Create a reusable EmptyState component.

Examples:

### Customer

> No jobs yet.

> Post your first job and find someone nearby to help.

### Worker

> No nearby jobs right now.

> New jobs will appear here when they match your skills and area.

Keep empty states useful and concise.

---

# 29. ERROR STATES

Create a reusable ErrorState component.

Errors should explain:

1. What happened.
2. Whether the user's data is safe.
3. What they can do next.

Example:

> Something went wrong.

> Your information hasn't been lost.

> Try again.

Do not expose raw stack traces or technical errors to users.

---

# 30. OFFLINE / CONNECTION STATE

Because low bandwidth and unstable connections are core product constraints, establish a reusable connection state.

Examples:

```text
You're offline.
Some information may be unavailable.

[ Try again ]
```

Do not make the UI unusable merely because the network is temporarily unavailable.

Preserve user-entered information where practical.

---

# 31. ACCESSIBILITY

Batch 2 must establish accessibility foundations.

Ensure:

- Sufficient colour contrast
- Readable typography
- Minimum practical touch targets
- Semantic labels
- Screen-reader-friendly controls
- Do not communicate status by colour alone
- Focus states
- Appropriate text scaling
- Reduced-motion considerations

Do not sacrifice accessibility for the Zimbabwean colour palette.

---

# 32. LOW-END DEVICE REQUIREMENT

Optimize the visual implementation for affordable Android devices.

Avoid unnecessary:

- Large image assets
- Heavy animations
- Complex blur effects
- Excessive shadows
- Large decorative backgrounds
- Auto-playing media

The design should remain visually strong without requiring expensive rendering.

---

# 33. PERFORMANCE REQUIREMENT

Do not introduce heavy dependencies simply for visual effects.

Before adding a package, ask:

> Is this necessary for the MVP?

Prefer:

- Flutter-native widgets
- Existing project dependencies
- Lightweight SVG/vector assets
- Local font assets
- Reusable components

Avoid dependency bloat.

---

# 34. RESPONSIVE FOUNDATION

Although Flutter mobile is the priority, establish responsive foundations where appropriate.

The same product concepts should eventually work across:

```text
Small Android
Medium Android
Large Android
Tablet
Web
```

Do not force desktop layouts onto mobile.

Mobile should prioritize:

- One-handed use
- Compact navigation
- Fast actions

---

# 35. BRAND LOGO IMPLEMENTATION

Create the GRAFT logo in a reusable manner.

Requirements:

- G + location pin blended together
- Primary green version
- Light/white version
- Dark/black version where useful
- App-icon-compatible version
- Small-size version if necessary

Use vector-based implementation where practical.

Do not use a raster image when a clean vector implementation is more appropriate.

If the exact logo requires design judgment, create the simplest strong geometric interpretation that satisfies:

```text
GRAFT
+
LOCAL
+
NEARBY
+
TRUST
```

---

# 36. DO NOT OVER-DESIGN THE LOGO

The logo is an MVP identity mark.

Do not spend the batch building:

- elaborate brand animations
- 3D logos
- complex illustrations
- animated logo reveals
- expensive rendering effects

The logo must first be recognizable.

---

# 37. SCREEN IMPLEMENTATION PRIORITY

Implement the visual foundation in this order:

```text
1. App Theme
        ↓
2. Typography
        ↓
3. Colour Tokens
        ↓
4. Logo / App Icon
        ↓
5. Core Components
        ↓
6. Navigation
        ↓
7. Welcome
        ↓
8. Customer Home Foundation
        ↓
9. Worker Home Foundation
        ↓
10. Job / Worker / Bid Cards
        ↓
11. Loading / Empty / Error / Offline states
```

Do not reverse this order by building dozens of screens first.

---

# 38. ENGINEERING RULES

Follow the existing Batch 1 architecture.

Do not rewrite working Batch 1 code unnecessarily.

Do not change:

- Existing data models
- Existing architecture
- Existing repository structure
- Existing configuration

unless there is a clear technical reason.

If a refactor is necessary, keep it minimal and explain why in the final report.

---

# 39. DO NOT INVENT BACKEND BEHAVIOUR

If a UI requires data that does not yet exist:

Use:

- typed mock data
- clearly separated development fixtures
- existing models

Do not fake production API behaviour.

Do not create fake payment confirmations.

Do not create fake KYC verification.

Do not create fake worker locations that appear to be real user data.

Mock data must be clearly isolated and replaceable later.

---

# 40. TRUST RULE

Never create UI that falsely implies:

- A worker is verified when they are not.
- A payment has succeeded when it has not.
- A job is assigned when it is not.
- A location is exact when it is approximate.
- A user has completed KYC when they have not.

The UI must reflect actual state.

---

# 41. LOCATION PRIVACY

The product requirements explicitly require progressive disclosure of location.

Before a worker is selected:

Show information such as:

```text
Approximate area
Distance
```

Do NOT unnecessarily expose:

- Exact home address
- Exact customer coordinates
- Exact worker coordinates

Later job stages can expose the information necessary for the transaction.

---

# 42. ECOCASH

EcoCash remains the MVP payment rail.

Use the official spelling:

**EcoCash**

Do not implement a real EcoCash integration in Batch 2.

Create visual payment components that can later represent:

```text
Payment method
Amount
Currency
Status
Transaction reference
```

Do not claim a payment succeeded without actual payment state.

---

# 43. CURRENCY

The existing product documents require explicit currency display.

Do not display:

```text
25
```

Display:

```text
USD 25
```

or another explicitly supported format.

Do not invent a currency conversion system in Batch 2.

---

# 44. MVP SCOPE DISCIPLINE

The following are explicitly NOT Batch 2 priorities:

- AI
- Social features
- Gamification
- Complex subscriptions
- Advanced analytics
- Enterprise accounts
- Multi-country support
- Advanced recommendation engines
- Complex bidding algorithms
- Full admin dashboard
- Real payment settlement
- Advanced map tracking

Keep the focus on the visual foundation of the core transaction.

---

# 45. TESTING

After implementation:

Run all relevant project checks.

At minimum:

```bash
flutter analyze
flutter test
```

If applicable:

```bash
dart format --set-exit-if-changed .
```

Also test the application manually on an Android device/emulator.

Verify:

- App launches
- Logo renders correctly
- Young Serif loads correctly
- Theme loads correctly
- Primary green is applied consistently
- Navigation works
- Welcome screen works
- Customer home foundation works
- Worker home foundation works
- Cards render correctly
- Loading state works
- Empty state works
- Error state works
- Offline state works
- No overflow occurs on small screens
- Text remains readable
- Touch targets are usable

If Flutter commands cannot be executed in the environment, perform static/code verification and clearly report that limitation.

Do not claim tests passed if they were not actually run.

---

# 46. VISUAL QA

Review the implementation against these principles:

### Clarity

Can a first-time user understand the screen?

### Hierarchy

Is the most important information obvious?

### Actionability

Is the next action obvious?

### Trust

Does the UI provide the information needed to make a safe decision?

### Consistency

Does the screen follow the GRAFT design system?

### Accessibility

Is it readable and usable?

### Performance

Will it remain usable on a low-end Android phone?

### Local relevance

Does the product visibly feel Zimbabwean without becoming visually noisy?

---

# 47. ACCEPTANCE CRITERIA

Batch 2 is complete only when all of the following are true:

## Brand

- [ ] GRAFT has a recognizable G + location-pin logo.
- [ ] Logo works at small sizes.
- [ ] Logo works as an app icon foundation.
- [ ] Logo has appropriate light/dark/brand variants where needed.
- [ ] Zimbabwean green is the primary brand colour.
- [ ] Supporting Zimbabwean colours are centralized as semantic tokens.

## Typography

- [ ] Young Serif from `/assets` is correctly loaded.
- [ ] Young Serif is the default brand/display typeface.
- [ ] Typography hierarchy is centralized.
- [ ] Small text remains readable.
- [ ] No unnecessary font families were introduced.

## Design System

- [ ] Colour tokens centralized.
- [ ] Typography tokens centralized.
- [ ] Spacing tokens centralized.
- [ ] Radius tokens centralized.
- [ ] Elevation tokens centralized.
- [ ] Icon sizing centralized.
- [ ] Touch target standards established.

## Components

- [ ] Buttons
- [ ] Inputs
- [ ] Phone input
- [ ] Currency input
- [ ] Category selector
- [ ] Job card
- [ ] Worker card
- [ ] Bid card
- [ ] Verification badge
- [ ] Rating
- [ ] Status badge
- [ ] Loading state
- [ ] Empty state
- [ ] Error state
- [ ] Offline state
- [ ] Confirmation dialog
- [ ] Snackbar
- [ ] Navigation
- [ ] Profile header
- [ ] Map/list foundation

## Navigation

- [ ] Welcome route exists.
- [ ] Customer navigation foundation exists.
- [ ] Worker navigation foundation exists.
- [ ] Navigation is reusable and scalable.
- [ ] No dead-end navigation paths exist.

## UX

- [ ] Welcome screen immediately explains GRAFT.
- [ ] Customer can clearly see the "post a job" direction.
- [ ] Worker can clearly see the "find nearby work" direction.
- [ ] Core marketplace concepts are visually represented.
- [ ] Trust indicators have a consistent visual language.
- [ ] Location/proximity has a consistent visual language.

## Performance

- [ ] No unnecessary heavy UI dependencies.
- [ ] Images/assets are reasonable in size.
- [ ] Animations are restrained.
- [ ] UI works on small screens.
- [ ] UI does not depend on high bandwidth.

## Accessibility

- [ ] Good contrast.
- [ ] Readable text.
- [ ] Accessible controls.
- [ ] Status is not communicated through colour alone.
- [ ] Screen-reader labels exist where needed.
- [ ] Touch targets are practical.
- [ ] Reduced-motion considerations exist.

---

# 48. FINAL BATCH 2 REPORT

When finished, provide a concise report containing:

## 1. Status

```text
BATCH 2: PASSED / PARTIAL / BLOCKED
```

## 2. Implemented

List the actual work completed.

## 3. Files Changed

List important files created or modified.

## 4. Tests

List every command actually executed and its result.

Example:

```text
flutter analyze — PASSED
flutter test — PASSED
dart format — PASSED
```

Do not claim commands were run if they were not.

## 5. Visual QA

Report:

- Typography
- Colours
- Logo
- Navigation
- Components
- Accessibility
- Small-screen behaviour

## 6. Known Limitations

Clearly identify anything that remains blocked by:

- Backend
- API
- KYC provider
- EcoCash integration
- Map provider
- Open product decisions

## 7. Next Batch

Do NOT start the next batch.

Only state what Batch 3 would logically depend on.

---

# 49. FINAL PRINCIPLE

don't  use the Zimbabwe flag colours equally everywhere. Green should own the brand; red/yellow/black should provide controlled semantic accents. That will make GRAFT look like a real brand rather than a flag-themed app.

Do not build GRAFT as a generic marketplace template.

Build it around the product's central promise:

> **“I need something done. Who nearby can do it, can I trust them, what will they charge, and can I safely get the job completed?”**

And for the worker:

> **“I have a skill. Where can I find someone nearby who needs it and pay me fairly?”**

The visual system should reinforce:

```text
GRAFT

LOCAL
+
TRUSTED
+
NEARBY
+
SKILLED
+
SIMPLE
```

The product should feel unmistakably Zimbabwean, but sophisticated enough to become a serious technology platform.

**Execute Batch 2 only.**