# GRAFT — BATCH 2 REPAIR + RUNTIME VERIFICATION

We have completed the initial Batch 2 implementation, but runtime testing on a physical phone has revealed that Batch 2 is NOT functionally complete.

Do NOT start Batch 3.

This task is a **Batch 2 repair, integration and runtime verification pass**.

The goal is to make the actual running application match what Batch 2 was supposed to deliver.

---

# 1. IMPORTANT: DO NOT ASSUME BATCH 2 IS COMPLETE

The previous Batch 2 summary reported:

- Customer Home created
- Worker Home created
- Loading state created
- Error state created
- Empty state created
- Offline state created
- Confirmation dialog created
- Snackbar created
- Routes added for `/customer/home`
- `/worker/home`
- Young Serif added
- Zimbabwean colour palette added
- G + location-pin logo created

However, runtime testing on a physical Android phone shows:

```text
Welcome
    ↓
Get Started
    ↓
Phone number
    ↓
Choose Customer / Worker
    ↓
STOPS
```

The Customer Home and Worker Home are NOT actually reachable through the normal user flow.

Additionally, the GRAFT logo is NOT visibly appearing in the running application as required.

Therefore the previous implementation must be treated as **PARTIAL**, not PASSED.

---

# 2. FIRST TASK — AUDIT THE CURRENT IMPLEMENTATION

Before changing anything:

Inspect the complete current project.

Read:

```text
docs/BUSINESS_REQUIREMENTS.md
docs/PRODUCT_VISION.md
docs/USER_PERSONAS.md
docs/USER_FLOWS.md
docs/UX_UI_REQUIREMENTS.md
docs/TECHNICAL_ARCHITECTURE.md
```

Then inspect the existing implementation from Batch 1 and Batch 2.

Pay particular attention to:

```text
lib/app.dart
lib/main.dart
lib/core/
lib/features/
routing/navigation files
authentication/onboarding files
role-selection files
theme/design-token files
asset/font configuration
logo/branding files
```

Do not assume the previous Batch 2 summary is accurate.

Verify the actual code.

---

# 3. PRIMARY BUG — ROLE SELECTION DOES NOT COMPLETE THE FLOW

Find the existing screen where the user chooses:

```text
Customer
Worker
```

Trace the actual button/tap handlers.

Determine exactly what happens after:

```text
Customer selected
```

and after:

```text
Worker selected
```

The expected runtime behaviour is:

```text
Customer
   ↓
Customer Home
```

and:

```text
Worker
   ↓
Worker Home
```

The routes already created in Batch 2 must actually be connected to this flow.

---

# 4. REQUIRED CUSTOMER FLOW

A user selecting Customer must be able to reach:

```text
Customer Home
```

without manually entering a route.

The runtime flow must be:

```text
Welcome
   ↓
Get Started
   ↓
Phone Number
   ↓
Role Selection
   ↓
Customer
   ↓
Customer Home
```

The Customer Home must visibly show the Batch 2 implementation:

```text
"What do you need done?"
```

A job description input.

Popular categories such as:

- Gardening
- Plumbing
- Electrical
- Cleaning
- Carpentry
- Painting

And the Recent / Active Jobs section.

---

# 5. REQUIRED WORKER FLOW

A user selecting Worker must be able to reach:

```text
Worker Home
```

The runtime flow must be:

```text
Welcome
   ↓
Get Started
   ↓
Phone Number
   ↓
Role Selection
   ↓
Worker
   ↓
Worker Home
```

The Worker Home must visibly show:

```text
"What jobs can I do nearby?"
```

Availability toggle.

Nearby Jobs.

Active Work.

---

# 6. DO NOT SIMPLY ADD ROUTES

Adding a route to `app.dart` is NOT sufficient.

Verify the complete navigation chain.

For example, if using named routes:

```dart
Navigator.pushNamed(
  context,
  '/customer/home',
);
```

or the equivalent architecture already used by the project.

Do not introduce a second routing architecture unnecessarily.

Use the existing project navigation architecture.

---

# 7. ROLE STATE

Inspect how the selected role is currently stored.

If Batch 1 already contains a role model/state mechanism, use it.

Do not create duplicate role state.

The selected role must be available to the application after selection.

The system should know:

```text
Customer
```

or:

```text
Worker
```

and route accordingly.

Do not permanently hard-code the application into one role.

---

# 8. BACK NAVIGATION

Verify that navigation does not create broken navigation stacks.

For example:

```text
Welcome
 ↓
Get Started
 ↓
Phone
 ↓
Role
 ↓
Customer Home
```

After reaching Customer Home, pressing back should not create an obviously broken experience.

Use the existing navigation architecture and appropriate replacement/stack behaviour.

Do not blindly push unlimited routes onto the stack.

---

# 9. SECOND PRIMARY BUG — GRAFT LOGO IS NOT VISIBLE

The logo requirement is NOT satisfied merely because a logo file/widget exists.

The actual running application must visibly use the GRAFT logo.

The logo concept remains:

```text
BIG G
+
LOCATION PIN
=
GRAFT LOGO
```

The G and location marker should be visually blended/interlocked into one recognizable mark.

It must not simply be:

```text
[G] [generic location icon]
```

placed next to one another.

---

# 10. LOGO LOCATIONS

Make sure the actual GRAFT logo is visibly used where appropriate.

At minimum:

### Welcome screen

The GRAFT logo should be prominently visible.

### Get Started / onboarding

Use the logo consistently if the existing screen supports branding.

### Main application shell/home

Use a smaller GRAFT brand mark in the app bar/header or appropriate brand location.

### App icon

Ensure the Android application icon uses the GRAFT logo rather than a generic Flutter/default icon.

Do not leave the default Flutter icon.

---

# 11. LOGO IMPLEMENTATION

Inspect the existing logo implementation.

If the previous implementation created only a placeholder, generic icon, or unrelated mark:

REPLACE IT.

Create a clean vector-based GRAFT mark using Flutter-compatible assets/widgets.

The logo must work in:

```text
Primary green
White/light background
Dark background
```

where appropriate.

The primary brand version should use:

```text
#319400
```

---

# 12. IMPORTANT — DO NOT MAKE THE LOGO COMPLICATED

The logo should be:

- Simple
- Geometric
- Memorable
- Recognizable at small sizes
- Suitable for an Android app icon
- Suitable for a header
- Suitable for a splash/welcome screen

Do not create:

- Complex illustrations
- Detailed maps
- Tiny text
- Heavy gradients
- 3D effects
- Large decorative graphics

The identity is:

```text
GRAFT
LOCAL
NEARBY
```

---

# 13. TYPOGRAPHY — VERIFY ACTUAL RUNTIME USE

Do not merely verify that Young Serif exists in `/assets`.

Verify that it is actually loaded and rendered by Flutter.

Locate the actual font file.

Verify:

```text
pubspec.yaml
```

contains the correct font configuration.

Verify the font family name used in Flutter matches the declared family.

Then verify that the application theme actually uses Young Serif.

The requirement is:

**Young Serif is the primary GRAFT brand/display font.**

It should visibly appear on:

- GRAFT branding
- Main headings
- Major screen headings

Do not use a random fallback if Young Serif is correctly available.

For small dense UI text, a readable sans-serif fallback is acceptable where necessary.

---

# 14. BRAND COLOURS — VERIFY RUNTIME USE

The primary GRAFT colour must be:

```text
#319400
```

Supporting colours:

```text
Red:    #D40000
Yellow: #FFD200
Black:  #000000
White:  #FFFFFF
```

Verify that these are centralized in the design token/theme system.

Then verify that the actual screens use the theme.

Do NOT merely define the colours and leave the screens using old/default Flutter colours.

---

# 15. REMOVE DEFAULT FLUTTER VISUALS

Search the application for remaining starter-template visuals.

There must be no obvious default Flutter branding.

Check for:

- Flutter logo
- Default blue theme
- Default Material styling that conflicts with GRAFT
- Placeholder app title
- Placeholder icons
- Default counter/example screens
- Starter text

The running application should visibly look like GRAFT.

---

# 16. CUSTOMER HOME — RUNTIME VERIFICATION

Once navigation is repaired, physically verify that Customer Home renders.

Check:

```text
"What do you need done?"
```

is visible.

Check:

```text
Job description input
```

is visible.

Check categories:

```text
Gardening
Plumbing
Electrical
Cleaning
Carpentry
Painting
```

are visible.

Check JobCard components render.

Check the screen works on a small Android display.

Check there are no:

```text
RenderFlex overflow
pixel overflow
clipped text
unusable touch targets
```

---

# 17. WORKER HOME — RUNTIME VERIFICATION

Verify Worker Home.

Check:

```text
"What jobs can I do nearby?"
```

is visible.

Check availability toggle.

Check nearby job cards.

Check active work section.

Verify it does not accidentally show the Customer Home.

---

# 18. STATE COMPONENTS — VERIFY THEY ARE ACTUALLY USABLE

The following components were created:

```text
LoadingState
ErrorState
EmptyState
OfflineState
ConfirmationDialog
Snackbar
```

Do not delete them.

Verify:

- They compile.
- They use design tokens.
- They are exported correctly.
- Their public APIs are clean.
- They can actually be used by future screens.

Do not force them onto screens unnecessarily just to demonstrate them.

---

# 19. DO NOT OVERWRITE BATCH 1

This is a repair of Batch 2.

Do not rewrite working Batch 1 architecture.

Do not unnecessarily replace:

- Authentication architecture
- Models
- Existing navigation architecture
- Existing app structure

Make the smallest clean changes required.

---

# 20. DO NOT START BATCH 3

STOP after Batch 2 is correctly integrated.

Do not implement:

- Real EcoCash
- Real KYC
- Real map tracking
- Real bidding backend
- Production payments
- Full worker matching
- Notifications backend
- Admin dashboard
- AI
- Advanced marketplace logic

Those belong to later work.

---

# 21. PHYSICAL DEVICE TESTING IS REQUIRED

This time, runtime testing is mandatory if Flutter is installed on the development machine.

Run:

```bash
flutter doctor
```

Then:

```bash
flutter analyze
```

Then:

```bash
flutter test
```

Then run the application on the connected Android phone.

Use:

```bash
flutter devices
```

to identify the device.

Then:

```bash
flutter run
```

or the appropriate device-specific command.

---

# 22. MANUAL RUNTIME TEST

Perform this exact test.

## Test A — Customer

Start application.

```text
Welcome
 ↓
Get Started
 ↓
Enter phone number
 ↓
Select Customer
 ↓
Customer Home
```

Confirm that Customer Home actually appears.

Take note of:

- Logo
- Typography
- Colours
- Layout
- Navigation
- Overflow/errors

---

## Test B — Worker

Restart application if necessary.

```text
Welcome
 ↓
Get Started
 ↓
Enter phone number
 ↓
Select Worker
 ↓
Worker Home
```

Confirm Worker Home actually appears.

---

# 23. VISUAL CHECKLIST

On the physical phone verify:

### Branding

- [ ] GRAFT logo is visible.
- [ ] G + location-pin concept is recognizable.
- [ ] No default Flutter logo remains.
- [ ] Young Serif visibly renders on brand/headings.
- [ ] Primary green is #319400.

### Customer

- [ ] Customer Home reachable.
- [ ] "What do you need done?" visible.
- [ ] Job input visible.
- [ ] Categories visible.
- [ ] Job cards visible.

### Worker

- [ ] Worker Home reachable.
- [ ] "What jobs can I do nearby?" visible.
- [ ] Availability toggle visible.
- [ ] Nearby jobs visible.
- [ ] Active work visible.

### Technical

- [ ] No crashes.
- [ ] No route errors.
- [ ] No overflow errors.
- [ ] No missing asset errors.
- [ ] No missing font errors.
- [ ] No default Flutter branding.

---

# 24. IF SOMETHING IS MISSING

Do not simply report:

> "Implemented."

If a requirement is not visible in the running application, fix it.

The acceptance criterion is:

```text
USER CAN SEE IT
+
USER CAN REACH IT
+
USER CAN USE IT
```

Not:

```text
FILE EXISTS
+
ROUTE EXISTS
+
WIDGET EXISTS
```

---

# 25. FINAL VERIFICATION REPORT

When finished, provide:

## Batch Status

Choose exactly one:

```text
PASSED
PARTIAL
BLOCKED
```

Do not say PASSED unless the physical runtime flow was verified.

## Runtime Flow

Report:

```text
Customer:
Welcome → Get Started → Phone → Customer → Customer Home

Worker:
Welcome → Get Started → Phone → Worker → Worker Home
```

and whether each passed.

## Branding

Report:

- Logo visible: YES/NO
- Logo concept: G + location pin
- Young Serif visible: YES/NO
- Primary green applied: YES/NO
- Default Flutter branding removed: YES/NO

## Tests

Report the actual results of:

```text
flutter doctor
flutter devices
flutter analyze
flutter test
flutter run
```

Do NOT claim a command passed if it was not actually executed.

## Files Changed

List the important files modified.

## Remaining Issues

List only real remaining issues.

---

# FINAL RULE

The most important principle for this repair is:

> **Do not verify Batch 2 by looking at the code alone. Verify it by using the application like a real GRAFT user.**

If the user selects Customer, they must actually arrive at Customer Home.

If the user selects Worker, they must actually arrive at Worker Home.

If the logo was required, the user must actually see the logo.

If Young Serif was required, the user must actually see Young Serif.

If GRAFT green was required, the running UI must actually use GRAFT green.

Only then can Batch 2 be considered complete.

**Repair Batch 2 only. Do not start Batch 3.**