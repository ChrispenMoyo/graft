// GRAFT Widgets Tests
// Tests for core UI widgets

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graft/core/widgets/loading_state.dart';
import 'package:graft/core/widgets/error_state.dart';
import 'package:graft/core/widgets/empty_state.dart';

void main() {
  group('LoadingState Widget Tests', () {
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

  group('ErrorState Widget Tests', () {
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

    testWidgets('ErrorState displays retry button when onPressed provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorState(
              message: 'Error occurred',
              onRetry: null,
            ),
          ),
        ),
      );

      // Should not have retry button when onPressed is null
      expect(find.text('Retry'), findsNothing);
    });
  });

  group('EmptyState Widget Tests', () {
    testWidgets('EmptyState displays with custom icon', (WidgetTester tester) async {
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
  });
}