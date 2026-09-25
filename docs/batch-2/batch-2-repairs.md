# GRAFT — BATCH 2 REPAIR, BUILD & REAL-DEVICE VERIFICATION

We are currently working on BATCH 2 of the GRAFT project.

IMPORTANT CONTEXT:

Batch 1 established the technical/project foundation.

Batch 2 is intentionally focused on the VISUAL AND INTERACTION FOUNDATION of GRAFT.

The goal of Batch 2 is to make GRAFT no longer look like a generic Flutter starter application.

Batch 2 should make GRAFT feel like:

"A modern Zimbabwean marketplace for finding trusted people nearby to get small jobs done."

The Batch 2 scope is explicitly:

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

Batch 2 is NOT the full GRAFT marketplace.

DO NOT IMPLEMENT:

- Complete KYC system
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
- Backend marketplace infrastructure
- SMS/OTP authentication unless it already existed as part of the previous foundation
- Production API integrations

Those belong to later implementation stages.

==================================================
CURRENT PROBLEM
==================================================

We have now installed and configured the real Flutter development environment.

Environment:

- Flutter 3.47.1
- Android SDK 36.0.0
- Physical Android phone connected
- Android device: LLY NX1
- Android version: Android 16 / API 36

The physical device is successfully detected by Flutter.

We discovered that the original Batch 1 verification was performed primarily through code inspection because Flutter was not available in the previous environment.

We have now performed real runtime verification.

The Android platform scaffolding was initially missing, so:

flutter create .

was used to generate the missing Flutter platform files.

After that, running:

flutter analyze

revealed 56 issues.

IMPORTANT:

Do NOT assume that these 56 issues mean Batch 1 was entirely broken.

Many of the errors appeared after Batch 2's visual/design-system implementation.

Your job is to inspect the repository history, current code, and Batch 2 implementation and determine the ROOT CAUSE of each issue.

==================================================
YOUR PRIMARY OBJECTIVE
==================================================

Repair the current GRAFT implementation so that the existing Batch 1 + Batch 2 implementation:

1. Compiles successfully.
2. Passes Flutter analysis.
3. Passes its existing tests.
4. Builds an Android debug APK.
5. Launches successfully on the physical Android phone.
6. Preserves the intended Batch 2 visual/design foundation.

DO NOT redesign Batch 2 from scratch.

DO NOT remove Batch 2 functionality simply to make the analyzer pass.

DO NOT downgrade the design system to a generic Flutter theme.

DO NOT replace the GRAFT branding with default Flutter styling.

==================================================
STEP 1 — INSPECT BEFORE MODIFYING
==================================================

Before changing anything:

1. Inspect the entire project structure.

2. Inspect git status and git history.

3. Determine which changes belong to Batch 1 and which belong to Batch 2.

4. Inspect the Batch 2 implementation carefully.

5. Identify the root cause of all current analyzer errors.

6. Determine whether each issue is:

   A. Missing Batch 1 foundation
   B. Batch 2 implementation error
   C. Batch 2 integration error
   D. Flutter 3.47.1/API compatibility issue
   E. Test mismatch
   F. Deprecated API
   G. Genuine architectural problem

Do NOT make changes until this inspection is complete.

==================================================
CURRENT FLUTTER ANALYZER ISSUES
==================================================

The current `flutter analyze` output contains approximately 56 issues.

Important examples include:

Missing imports/files:

- ../models/enums/user_role.dart
- ../models/enums/verification_status.dart

Theme/API issues:

- AppTheme.primary is referenced but does not exist
- surfaceVariant deprecated
- background deprecated
- onBackground deprecated
- withOpacity deprecated

Widget/type issues:

- String? passed where String is required
- VoidCallback? vs ValueChanged<String> mismatch
- PrimaryButton referenced but not defined

Model issues:

- invalid constant values
- constructor/method syntax issues
- issues in job.dart
- issues in location.dart
- issues in payment.dart
- issues in user.dart

Test issues:

- currency_test.dart
- widget_test.dart
- widgets_test.dart

These are examples only.

Use the actual current analyzer output as the authoritative error list.

==================================================
REPAIR RULES
==================================================

### RULE 1 — Preserve Batch 2's purpose

Batch 2 is a DESIGN SYSTEM AND CORE UI FOUNDATION.

Do not remove:

- GRAFT branding
- typography system
- colour system
- design tokens
- reusable components
- navigation foundation
- responsive UI foundation
- loading states
- empty states
- error states
- customer/worker visual differentiation
- accessibility foundations
- low-bandwidth design decisions

Repair these systems rather than bypassing them.

### RULE 2 — Do not hide errors

DO NOT:

- add broad analyzer ignores
- disable lint rules
- comment out broken code
- delete failing tests
- replace real implementations with empty placeholders
- use `dynamic` to bypass type errors
- use unsafe casts purely to silence errors

Fix the underlying problem.

### RULE 3 — Preserve architecture

Do not unnecessarily restructure:

lib/
  core/
  features/
  models/

Preserve the feature-oriented architecture unless there is a clear technical reason to change something.

### RULE 4 — Keep the application lightweight

GRAFT targets Zimbabwean users, including users who may have:

- slower Android phones
- limited storage
- limited mobile data
- unreliable internet

Therefore:

- Avoid unnecessary packages.
- Avoid heavy animation.
- Avoid unnecessary image assets.
- Avoid large dependencies.
- Avoid network-dependent visual elements.
- Prefer local/static UI foundations.

### RULE 5 — Flutter 3.47.1 compatibility

Make the code compatible with Flutter 3.47.1.

Where APIs have been deprecated, update them appropriately.

For example:

- surfaceVariant → surfaceContainerHighest
- background → surface
- onBackground → onSurface
- withOpacity(...) → appropriate withValues(...) usage

Do not blindly replace APIs if doing so changes the intended design.

### RULE 6 — Tests

Existing tests are part of the project.

Do not delete tests simply because the implementation changed.

Where tests are outdated because Batch 2 intentionally changed the UI/API, update the tests so that they verify the CURRENT intended implementation.

Tests should continue to verify meaningful behavior.

==================================================
STEP 2 — REPAIR
==================================================

After inspection, repair all genuine Batch 1/Batch 2 implementation problems.

Prioritize:

1. Missing files/imports
2. Dart compilation errors
3. Model errors
4. Theme errors
5. Widget/component errors
6. Test errors
7. Deprecated Flutter APIs
8. Warnings/cleanup

Do not add Batch 3 functionality.

==================================================
STEP 3 — VERIFY
==================================================

After repairs, execute these commands for real.

Do NOT claim success based on code inspection.

Run:

flutter pub get

flutter analyze

flutter test

flutter build apk --debug

flutter devices

Then launch on the physical Android phone:

flutter run -d A6KX6R4528001366

The application MUST actually launch on the phone.

==================================================
STEP 4 — MANUAL BATCH 2 VERIFICATION
==================================================

Once GRAFT launches on the physical phone, manually verify the visual foundation.

Verify:

### Branding

- GRAFT branding is visible.
- The application does not look like a default Flutter application.

### Typography

- Intended project typography is applied consistently.
- Text hierarchy is clear.
- Text remains readable on the physical device.

### Colour system

- Primary GRAFT colour system is applied consistently.
- Supporting colours are coherent.
- Zimbabwean identity is reflected appropriately without overusing flag colours.

### Components

Verify reusable UI components such as:

- buttons
- cards
- inputs
- navigation
- status indicators
- empty states
- loading states
- error states

### Navigation

Verify the existing Batch 2 navigation foundation works.

### Customer/Worker differentiation

Where already implemented, verify that customer and worker experiences have clear visual differentiation without creating two completely separate design systems.

### Accessibility

Verify:

- readable text
- adequate contrast
- usable touch targets
- sensible spacing
- no obviously inaccessible interactions

### Low bandwidth

Verify the UI does not depend on unnecessary remote images/assets just to render the core experience.

==================================================
STEP 5 — BUILD VERIFICATION
==================================================

The following must be recorded separately:

flutter analyze
flutter test
flutter build apk --debug
flutter run

For each command report:

PASS / FAIL

Do not mark the overall batch as PASS unless the application actually launches successfully on the physical Android device.

==================================================
DOCUMENTATION
==================================================

Create or update:

docs/verification_report.md

Use this structure:

# GRAFT Batch 2 Runtime Verification

## Batch Scope

Explain that Batch 2 establishes the visual and interaction foundation and does not implement the complete marketplace.

## Environment

- Flutter version
- Dart version
- Android SDK
- Android version
- Device

## Static Verification

### flutter pub get
PASS/FAIL

### flutter analyze
PASS/FAIL

Number of errors/warnings if applicable.

## Automated Tests

### flutter test
PASS/FAIL

Test count and result.

## Android Build

### flutter build apk --debug
PASS/FAIL

## Real Device

### flutter run
PASS/FAIL

Device used.

## Manual UI Verification

### Branding
PASS/FAIL

### Typography
PASS/FAIL

### Colour system
PASS/FAIL

### Design tokens
PASS/FAIL

### Reusable components
PASS/FAIL

### Navigation
PASS/FAIL

### Responsive foundation
PASS/FAIL

### Empty/loading/error states
PASS/FAIL

### Customer/worker differentiation
PASS/FAIL

### Accessibility foundation
PASS/FAIL

### Low-bandwidth implementation
PASS/FAIL

## Remaining Issues

List genuine remaining issues.

## Scope Compliance

Confirm that Batch 2 did NOT implement:

- KYC
- EcoCash
- real payment processing
- real maps
- real-time tracking
- full bidding backend
- notifications
- admin system
- AI
- advanced recommendation engine
- production marketplace matching

## Final Status

Use exactly one:

PASS — Batch 2 fully verified on real Android device

or

FAIL — Batch 2 still requires repair

IMPORTANT:

Do not report PASS simply because the code looks correct.

The final PASS requires actual:

flutter analyze
flutter test
flutter build apk --debug

and successful:

flutter run

on the physical Android device.