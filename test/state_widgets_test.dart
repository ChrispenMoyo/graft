// GRAFT State Widgets Tests
// Tests for state components (loading, empty, error, offline)

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graft/core/widgets/loading_state.dart';
import 'package:graft/core/widgets/error_state.dart';
import 'package:graft/core/widgets/empty_state.dart';
import 'package:graft/core/widgets/offline_state.dart';

void main() {
  group('LoadingState Tests', () {
    testWidgets('LoadingState displays with message', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingState(message: 'Loading...'),
          ),
        ),
      );

      expect(find.text('Loading...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('LoadingState displays without message', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingState(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.textContaining('Loading'), findsNothing);
    });
  });

  group('ErrorState Tests', () {
    testWidgets('ErrorState displays with message', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorState(message: 'Something went wrong'),
          ),
        ),
      );

      expect(find.text('Something went wrong'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });
  });

  group('EmptyState Tests', () {
    testWidgets('EmptyState displays with all fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: EmptyState(
              title: 'No Data',
              description: 'No data available',
              icon: Icons.data_object,
            ),
          ),
        ),
      );

      expect(find.text('No Data'), findsOneWidget);
      expect(find.text('No data available'), findsOneWidget);
    });

    testWidgets('NoJobsEmptyState displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NoJobsEmptyState(),
          ),
        ),
      );

      expect(find.text('No jobs available yet'), findsOneWidget);
    });

    testWidgets('NoJobsCustomerEmptyState displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NoJobsCustomerEmptyState(onPostJob: () {}),
          ),
        ),
      );

      expect(find.text('No jobs posted yet'), findsOneWidget);
      expect(find.text('Post a Job'), findsOneWidget);
    });

    testWidgets('NoJobsWorkerEmptyState displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NoJobsWorkerEmptyState(),
          ),
        ),
      );

      expect(find.text('No nearby jobs right now'), findsOneWidget);
    });
  });

  group('OfflineState Tests', () {
    testWidgets('OfflineState displays with default message', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfflineState(),
          ),
        ),
      );

      expect(find.text('No Internet Connection'), findsOneWidget);
      expect(find.byIcon(Icons.wifi_off), findsOneWidget);
    });

    testWidgets('OfflineState displays with custom title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfflineState(title: 'Custom Offline'),
          ),
        ),
      );

      expect(find.text('Custom Offline'), findsOneWidget);
    });
  });

  group('OfflineBanner Tests', () {
    testWidgets('OfflineBanner displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                OfflineBanner(),
                Expanded(
                  child: Center(
                    child: Text('Main Content'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('You are offline'), findsOneWidget);
    });
  });
}
