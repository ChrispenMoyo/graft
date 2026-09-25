# GRAFT — BATCH 4 IMPLEMENTATION SPECIFICATION

## Batch Title

**Batch 4 — Worker Nearby Jobs + Proximity + Map Discovery + Worker-Side Job Posting**

---

## 1. Purpose

Batch 4 turns GRAFT from a customer-only job-posting flow into a two-sided local marketplace experience.

The core marketplace loop for this batch is:

```text
CUSTOMER
   ↓
Post a Job
   ↓
JOB EXISTS
   ↓
WORKER
   ↓
Find Nearby Jobs
   ↓
View Job Details
```

In addition, workers must be able to use the **same existing PostJobFlow** to create a job from the Worker **Work** tab.

The worker-side posting flow is deliberately an extension/reuse of the existing workflow, not a second independently implemented posting system.

### Batch 4 has two primary deliverables

1. **Worker Nearby Jobs + Proximity + Map Discovery**
2. **Worker-Side Job Posting — Work tab → Post Job → existing PostJobFlow → Success**

---

# 2. Existing Project Context — DO NOT REBUILD

GRAFT is a Zimbabwe-first Flutter mobile marketplace.

Existing roles:

- Customer
- Worker

Existing core concept:

```text
Customer posts work
        ↓
Worker discovers work nearby
        ↓
Future batch: Worker makes offer
        ↓
Future batch: Customer selects worker
```

The project already contains the customer Post Job workflow and supporting job models/repository structures.

### IMPORTANT

**Reuse existing architecture and components wherever possible.**

Do NOT create:

- a second Job model
- a second PostJobFlow
- a second JobDraft implementation
- a second repository system
- duplicate navigation architecture
- duplicate validation logic
- duplicate job category definitions

Before writing new code, inspect the existing implementation and extend it.

---

# 3. Scope

## IN SCOPE

### Worker Discovery

- Worker Jobs/Work experience
- Nearby jobs list
- Job cards
- Job details
- Distance from worker
- Category filtering
- Basic sorting by proximity
- Loading state
- Empty state
- Error state
- Location unavailable state
- Refresh

### Location / Proximity

- Worker location abstraction
- Job location coordinates
- Distance calculation
- Nearby-radius filtering
- Mock/local location support where live GPS is not yet available
- Permission/state abstraction without coupling the domain layer to a specific map/GPS provider

### Map Discovery

- Map-ready architecture
- Worker location
- Job markers
- Tap marker → job preview/details
- List/map switching where consistent with the current UI architecture

A real external map provider is NOT required unless the current project already has one configured.

Prefer keeping the map behind an abstraction.

### Worker-Side Job Posting

From:

```text
Worker Home
   ↓
Work tab
   ↓
Post Job
   ↓
Existing PostJobFlow
   ↓
All existing steps
   ↓
Success
```

The worker must be able to use the same job-posting workflow already available to the customer.

---

# 4. Explicitly OUT OF SCOPE

Do NOT implement these in Batch 4:

- Real bidding/offers
- Accepting bids
- Hiring workers
- Customer selecting a worker
- Real payment processing
- EcoCash transactions
- Chat
- Push notifications
- Ratings/reviews
- KYC enforcement
- Disputes
- Production backend migration
- PostgreSQL integration
- Authentication redesign
- Admin dashboard
- Complex AI matching
- Dynamic pricing
- Full navigation/turn-by-turn directions

The marketplace action after viewing a job is intentionally reserved for a later batch.

If an existing UI contains a future action such as **Make an Offer**, do not implement its business logic in Batch 4.

---

# 5. Product Principle

GRAFT is hyperlocal.

The central discovery rule is:

> **Workers should be able to see jobs that are relevant and geographically close to them.**

For this batch, proximity should be deterministic and understandable.

Example:

```text
Fix leaking pipe
Avondale, Harare
2.4 km away
$25–$40
Today
```

Do not build a complicated recommendation engine.

Start with:

```text
Location
   ↓
Distance
   ↓
Radius
   ↓
Nearby Jobs
```

---

# 6. Navigation Requirements

Preserve the existing 4-item navigation shells.

## Customer

```text
Home | Jobs | Post | Profile
```

## Worker

```text
Home | Jobs | Work | Profile
```

Do not redesign the navigation system.

### Worker Work tab

The Work tab must expose a clear:

**Post a Job**

CTA.

Expected route:

```text
Worker Work
    ↓
Post a Job
    ↓
PostJobFlow
```

Use the existing route if one already exists.

Do NOT create a parallel `/worker/post-job` flow unless the current architecture absolutely requires a separate route. Prefer reusing the existing PostJobFlow route and passing role/context if necessary.

---

# 7. Worker-Side Job Posting

## Requirement

A worker can post a job using the exact same workflow already used by customers.

### Flow

```text
Worker
  ↓
Work
  ↓
Post a Job
  ↓
PostJobFlow
  ↓
Step 1
  ↓
Step 2
  ↓
...
  ↓
Review
  ↓
Publish
  ↓
Success
```

### Critical rule

There must be **one source of truth** for the Post Job workflow.

Do not copy/paste the flow.

If the current implementation is:

```text
PostJobFlow
JobDraft
JobRepository
```

then the worker must use those same components.

---

# 8. Role Awareness

The flow must know who initiated it.

At minimum, preserve:

```text
UserRole.customer
UserRole.worker
```

The job should retain its creator/owner information through the existing model/repository architecture.

Example concept:

```text
Job
 ├── id
 ├── createdBy
 ├── category
 ├── title
 ├── description
 ├── location
 ├── budget
 └── preferredTime
```

Do not invent a new worker-specific Job model.

---

# 9. Worker Posting Semantics

For Batch 4, a worker-posted job is still a valid GRAFT job.

Do not introduce special business rules such as:

- workers cannot post certain categories
- workers automatically become providers
- workers automatically bid on their own jobs
- worker jobs have different pricing rules

Those decisions belong to later product/business-rule work.

The immediate requirement is:

> A Worker can successfully complete the existing PostJobFlow.

---

# 10. Nearby Jobs Screen

Create or extend the worker's Jobs/Work discovery screen.

Recommended structure:

```text
Nearby Jobs

[ Search / Filter ]

2.4 km
Fix leaking pipe
Avondale, Harare
$25–$40
Today

4.1 km
Electrical repair
Eastlea, Harare
$30
Tomorrow

7.8 km
Garden cleanup
Mount Pleasant, Harare
$20–$35
Saturday
```

Keep the screen simple.

The list is the primary discovery experience.

---

# 11. Job Card Requirements

Each nearby-job card should show only useful information.

Minimum:

- Job title
- Category
- General location
- Distance
- Budget
- Preferred date/time
- Optional posted time

Example:

```text
Fix leaking pipe

Plumbing
Avondale, Harare

2.4 km away

$25–$40
Today · 14:00–17:00
```

Avoid overloading the card.

---

# 12. Job Details

Tapping a job opens a detail screen.

Minimum content:

```text
Fix leaking pipe

Plumbing

📍 Avondale, Harare
📏 2.4 km away

Description
Kitchen pipe is leaking...

Budget
$25–$40

Preferred time
Today · 14:00–17:00
```

A future marketplace action may be displayed as a placeholder if already designed, but:

**Do not implement bidding in Batch 4.**

---

# 13. Proximity Calculation

Distance calculation must be isolated from UI code.

Recommended abstraction:

```text
DistanceCalculator
```

or equivalent existing project abstraction.

Input:

```text
workerLocation
jobLocation
```

Output:

```text
distanceInMeters
```

Then format for UI:

```text
850 m away
2.4 km away
12.7 km away
```

Do not calculate distances directly inside widgets.

---

# 14. Coordinate Model

The existing Location model should be inspected and reused.

Minimum coordinate requirements:

```text
latitude
longitude
```

If the existing Location model already contains these, extend it rather than replacing it.

Do not duplicate coordinate fields elsewhere.

---

# 15. Radius Filtering

Introduce a simple configurable discovery radius.

Recommended initial default:

```text
10 km
```

The exact radius should be represented as configuration/domain data rather than scattered magic numbers.

Concept:

```text
NearbyJobsConfig
    radiusKm: 10
```

The architecture should make it easy to change later.

Example:

```text
Worker location
      ↓
Find jobs
      ↓
Calculate distance
      ↓
distance <= radius
      ↓
Show job
```

---

# 16. Sorting

Default sorting:

```text
Nearest first
```

Example:

```text
0.8 km
2.4 km
4.1 km
7.8 km
```

Do not implement complicated ranking.

A simple deterministic sort is enough.

---

# 17. Category Filtering

Workers should be able to filter by job category if the existing category architecture supports it.

Example:

```text
All
Plumbing
Electrical
Cleaning
Gardening
Moving
Repairs
Other
```

Reuse the existing `JobCategory` enum/model.

Do not create a second category list.

---

# 18. Location States

The UI must handle:

### Location available

Show nearby jobs.

### Location unavailable

Show:

```text
Location unavailable

We need your location to show jobs near you.

[Try Again]
```

### Permission denied

Do not crash.

Explain that location access is required for nearby-job discovery.

### No nearby jobs

Show:

```text
No nearby jobs yet

There are no jobs within your current search area.

Try expanding your search later.
```

Do not fake jobs simply to populate the screen.

---

# 19. Data Source

For this batch, the current in-memory/local repository can remain the source of truth if that is what Batches 1–3 currently use.

Do NOT force a backend migration into Batch 4.

The architecture should however keep the repository interface clean enough that a real backend can replace the local implementation later.

Concept:

```text
UI
 ↓
Repository interface
 ↓
Current in-memory implementation
```

Future:

```text
UI
 ↓
Repository interface
 ↓
API
 ↓
PostgreSQL
```

The Flutter UI should not contain database/business logic.

---

# 20. Seed/Test Data

For development verification, create deterministic local jobs if the existing repository does not already provide enough data.

Example categories:

- Plumbing
- Electrical
- Cleaning
- Gardening
- Moving

Use clearly identifiable test data.

Do not present fake development jobs as real production data.

---

# 21. Map Architecture

The map must be treated as a discovery surface, not the primary business logic.

Preferred structure:

```text
JobDiscovery
     ↓
JobLocation
     ↓
MapAdapter
```

Avoid coupling:

```text
JobRepository → Google Maps
```

or:

```text
JobRepository → Mapbox SDK
```

The repository should know about jobs and locations.

The map layer should render those locations.

### Map requirements

- Show worker position
- Show nearby job markers
- Tap marker → job preview
- Open job details
- Handle no jobs
- Handle unavailable location

If no map SDK is currently configured, create the abstraction and UI contract without adding unnecessary provider complexity.

---

# 22. List vs Map

The recommended discovery UX is:

### LIST = primary

### MAP = secondary

Workers should be able to understand jobs without needing a map.

Do not make the map the only way to discover jobs.

---

# 23. UI / UX Requirements

Use the existing GRAFT visual language.

Do not redesign the entire app during Batch 4.

Preserve:

- GRAFT logo
- existing typography
- existing spacing system
- existing navigation
- existing button styles
- existing cards
- existing loading/error components

The new screens should look like they belong to the same application.

---

# 24. Responsive Requirements

The worker discovery experience must work on small Android phones.

Avoid:

- fixed-width cards
- horizontal overflow
- text clipping
- oversized map controls
- buttons outside the viewport
- layouts that only work on desktop-sized screens

Test the smallest practical screen size available in the current environment.

---

# 25. Architecture Rules

Follow the existing feature-oriented Flutter structure.

Before implementation:

1. Inspect existing folders.
2. Inspect existing models.
3. Inspect existing routes.
4. Inspect existing PostJobFlow.
5. Inspect existing JobDraft.
6. Inspect existing JobRepository.
7. Inspect existing role/session handling.
8. Inspect existing location abstractions.
9. Reuse before creating.

Do not reorganize the entire project unless required to safely implement Batch 4.

---

# 26. Error Handling

No uncaught errors for normal user states.

Handle:

- location unavailable
- permission denied
- repository failure
- empty jobs
- malformed/missing coordinates
- invalid job data
- navigation failure

Use the project's existing error-state components where available.

---

# 27. Testing Requirements

At minimum, add/maintain tests for:

### Distance

```text
same location → 0 km
nearby coordinates → expected approximate distance
```

### Filtering

```text
inside radius → included
outside radius → excluded
```

### Sorting

```text
nearest → first
furthest → later
```

### Categories

```text
selected category → only matching jobs
All → all eligible jobs
```

### Worker Post Job

Verify:

```text
Worker
 → Work
 → Post Job
 → PostJobFlow
 → complete all steps
 → Success
```

### Customer regression

Verify the existing customer flow still works:

```text
Customer
 → Post
 → PostJobFlow
 → Success
```

Batch 4 must not break Batch 3.

---

# 28. Runtime Verification — MANDATORY

Do not consider Batch 4 complete because the code compiles.

The previous batches demonstrated that:

> Code can exist while the actual navigation/runtime flow is broken.

Therefore runtime verification is part of the implementation.

Run:

```bash
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

Then install/run the debug APK on the available Android device/emulator.

---

# 29. Manual Runtime Checklist

## Customer regression

- [ ] App launches
- [ ] Customer role opens
- [ ] Customer Home loads
- [ ] Customer Post tab works
- [ ] PostJobFlow opens
- [ ] Every step is reachable
- [ ] Back navigation works
- [ ] Job draft survives navigation
- [ ] Review works
- [ ] Publish works
- [ ] Success screen appears
- [ ] Job is visible through the current repository/state

## Worker discovery

- [ ] Worker role opens
- [ ] Worker Home loads
- [ ] Worker Jobs/Work area loads
- [ ] Nearby jobs render
- [ ] Distance renders
- [ ] Jobs are sorted nearest-first
- [ ] Category filtering works
- [ ] Job details open
- [ ] Empty state works
- [ ] Location-unavailable state works
- [ ] Refresh works

## Worker posting

- [ ] Worker opens Work tab
- [ ] Post a Job CTA is visible
- [ ] CTA opens existing PostJobFlow
- [ ] All existing steps work
- [ ] Back navigation works
- [ ] Job draft survives navigation
- [ ] Review works
- [ ] Publish works
- [ ] Success screen appears
- [ ] No duplicate PostJobFlow was created

## Map

- [ ] Map screen opens if map implementation is enabled
- [ ] Worker location is represented
- [ ] Job markers render
- [ ] Marker opens correct job
- [ ] Map does not crash when location is unavailable
- [ ] List remains usable

---

# 30. Git Safety

Before implementation:

```bash
git status
git branch
git log --oneline -10
```

Confirm the working tree is understood.

After successful implementation:

```bash
flutter analyze
flutter test
flutter build apk --debug
git status
```

Commit only after runtime verification.

Suggested commit:

```text
feat: add worker nearby jobs and worker job posting
```

---

# 31. Definition of Done

Batch 4 is DONE only when all of the following are true:

### Discovery

- [ ] Worker can access nearby jobs.
- [ ] Jobs show useful information.
- [ ] Distance is calculated.
- [ ] Nearby radius works.
- [ ] Nearest jobs appear first.
- [ ] Category filtering works.
- [ ] Empty/error/location states work.
- [ ] Job details work.

### Map

- [ ] Map architecture exists.
- [ ] Job locations can be rendered.
- [ ] Worker location can be represented.
- [ ] Marker → job details works when map provider is available.
- [ ] List remains the primary discovery surface.

### Worker Posting

- [ ] Worker Work tab contains Post a Job.
- [ ] It reuses the existing PostJobFlow.
- [ ] No duplicate posting workflow exists.
- [ ] Worker can complete every existing step.
- [ ] Worker reaches Success.
- [ ] Existing JobDraft/JobRepository logic remains intact.

### Regression

- [ ] Customer PostJobFlow still works.
- [ ] Existing navigation still works.
- [ ] Existing tests pass.
- [ ] `flutter analyze` passes.
- [ ] Debug APK builds.
- [ ] Actual runtime flow is manually verified.

---

# 32. Claude Code Execution Rules

Claude Code must work in small verified steps.

### STEP 0 — Inspect

Do not modify code yet.

Inspect:

```text
lib/
routes/navigation
models
enums
PostJobFlow
JobDraft
JobRepository
SessionManager
Customer Home
Worker Home
Customer navigation
Worker navigation
Location
```

Report what already exists.

### STEP 1 — Worker posting

Implement:

```text
Worker Work
 → Post a Job
 → existing PostJobFlow
```

Verify before moving on.

### STEP 2 — Job discovery

Implement nearby-job repository/query logic.

Verify tests.

### STEP 3 — Distance

Implement/reuse distance calculation.

Verify tests.

### STEP 4 — Worker discovery UI

Implement job cards, filtering, sorting, states.

Verify runtime.

### STEP 5 — Job details

Implement job details.

Verify runtime.

### STEP 6 — Map layer

Implement the map abstraction and map UI only to the level supported by the current project/dependencies.

Do not derail the batch by introducing unnecessary external infrastructure.

### STEP 7 — Full verification

Run the complete Batch 4 runtime checklist.

---

# 33. Anti-Scope-Creep Rules

If Claude encounters a problem that belongs to a later batch:

**DO NOT implement it automatically.**

Examples:

```text
Bidding → later
Payments → later
Chat → later
Notifications → later
KYC → later
Ratings → later
Backend → later
```

Instead:

1. Preserve the existing architecture.
2. Add the smallest safe interface/placeholder required.
3. Record the issue.
4. Continue Batch 4.

---

# 34. Final Product Test

The most important end-to-end demonstration after Batch 4 should be:

```text
CUSTOMER PHONE
────────────────────

Customer
   ↓
Post a Job
   ↓
Publish
   ↓
Job exists


WORKER PHONE
────────────────────

Worker
   ↓
Nearby Jobs
   ↓
Sees customer's job
   ↓
"2.4 km away"
   ↓
Opens Job Details


WORKER POSTING
────────────────────

Worker
   ↓
Work
   ↓
Post a Job
   ↓
Existing PostJobFlow
   ↓
Publish
   ↓
Success
```

That is the Batch 4 MVP.

---

# 35. Important Product Boundary

Batch 4 does NOT complete the entire marketplace.

After Batch 4, the next logical marketplace capability is:

```text
Worker sees job
      ↓
Worker makes offer
      ↓
Customer sees offers
      ↓
Customer selects worker
```

That belongs to the subsequent batch.

Batch 4's job is to make sure:

> **Jobs can be posted from either role, and workers can discover jobs geographically.**

---

# 36. Expected Final State

At the end of Batch 4, GRAFT should have a working foundation for:

```text
                 GRAFT
                   │
        ┌──────────┴──────────┐
        │                     │
     CUSTOMER               WORKER
        │                     │
    Post a Job          Find Nearby Jobs
        │                     │
        │               Distance + Radius
        │                     │
        │                  Map/List
        │                     │
        └──────────┬──────────┘
                   │
                  JOB
                   │
             Future Batch
                   ↓
                 OFFER
```

The implementation must remain small, testable, mobile-first, and compatible with the existing Batch 1–3 architecture.
