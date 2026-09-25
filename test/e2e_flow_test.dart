// GRAFT End-to-End Flow Test
// Drives the complete audit acceptance scenario through the real UI:
//   Onboarding -> Login -> Customer -> Post Job (all steps) -> Success
//   -> Job appears in customer jobs list -> Sign out -> Worker
//   -> Job discovered nearby -> Job details

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graft/app/app.dart';
import 'package:graft/core/session/session_manager.dart';
import 'package:graft/features/jobs/data/repositories/job_repository.dart';
import 'package:graft/models/job.dart';

void main() {
  testWidgets('customer posts a job and a worker discovers it',
      (tester) async {
    // Fresh session and empty data store
    ServiceLocator.reset();
    SessionManager.instance.clearSession();

    await tester.pumpWidget(const GRAFTApp());
    await tester.pumpAndSettle();

    // 1. Onboarding
    expect(find.text('GRAFT'), findsWidgets);
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // 2. Login with a Zimbabwean phone number
    await tester.enterText(find.byType(TextFormField), '771234567');
    await tester.tap(find.text('Continue'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // 3. Role selection -> Customer
    await tester.tap(find.text('Customer'));
    await tester.pumpAndSettle();

    // 4. Customer home
    expect(find.text('What do you need done?'), findsOneWidget);

    // 5. Open the Post Job flow (the primary button, not the empty-state CTA)
    await tester.tap(find.text('Post a Job').first);
    await tester.pumpAndSettle();

    // Step 1: Category (Gardening is the first card, always visible)
    expect(find.text('What kind of help do you need?'), findsOneWidget);
    await tester.tap(find.text('Gardening'));
    await tester.pump(); // let the Next button enable
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Step 2: Details
    await tester.enterText(find.byType(TextFormField).first, 'Fix leaking kitchen tap');
    await tester.enterText(
        find.byType(TextFormField).at(1), 'Kitchen tap is leaking and needs repair.');
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Step 3: Photos (optional - skip)
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Step 4: Location
    await tester.enterText(find.byType(TextFormField), 'Mbare');
    await tester.pump(); // let the Next button enable
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Step 5: Date and time
    await tester.tap(find.text('Select date'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Select time'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Step 6: Budget - open to offers needs no amount
    await tester.tap(find.text('Open to Offers'));
    await tester.pump(); // let the Review button enable
    await tester.tap(find.text('Review Job'));
    await tester.pumpAndSettle();

    // Review
    expect(find.text('Fix leaking kitchen tap'), findsOneWidget);
    expect(find.text('Mbare'), findsOneWidget);
    await tester.tap(find.text('Post Job'));
    await tester.pumpAndSettle();

    // 6. Success screen
    expect(find.text('Job Posted Successfully!'), findsOneWidget);

    // 7. Done returns to the app and shows the job in the customer's list
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
    expect(find.text('My Jobs'), findsOneWidget);
    expect(find.text('Fix leaking kitchen tap'), findsOneWidget);

    // The job was really persisted
    final allJobs = await ServiceLocator.dataSource.getAllJobs();
    expect(allJobs.length, 1);
    expect(allJobs.first.title, 'Fix leaking kitchen tap');
    expect(allJobs.first.status, JobStatus.posted);

    // 8. Sign out from the Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sign out'));
    await tester.pumpAndSettle();

    // 9. Enter as Worker
    await tester.tap(find.text('Worker'));
    await tester.pumpAndSettle();
    expect(find.text('What jobs can I do nearby?'), findsOneWidget);

    // 10. Open the Jobs tab - the customer's job must be discoverable
    await tester.tap(find.text('Jobs'));
    await tester.pumpAndSettle();
    expect(find.text('Nearby Jobs'), findsOneWidget);
    expect(find.text('Fix leaking kitchen tap'), findsOneWidget);

    // 11. Open the job details
    await tester.tap(find.text('Fix leaking kitchen tap'));
    await tester.pumpAndSettle();
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Kitchen tap is leaking and needs repair.'), findsOneWidget);
    expect(find.text('Mbare'), findsOneWidget);

    // 12. Back returns to the jobs list
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Nearby Jobs'), findsOneWidget);
  });
}
