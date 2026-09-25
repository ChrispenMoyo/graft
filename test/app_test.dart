// GRAFT App Tests
// Tests for the main application widget

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graft/app/app.dart';

void main() {
  group('GRAFTApp Tests', () {
    testWidgets('GRAFTApp renders without errors', (WidgetTester tester) async {
      await tester.pumpWidget(const GRAFTApp());

      // Should render without exceptions
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('GRAFTApp has correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const GRAFTApp());

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.title, 'GRAFT Zimbabwe');
    });

    testWidgets('GRAFTApp starts on onboarding screen', (WidgetTester tester) async {
      await tester.pumpWidget(const GRAFTApp());

      // Initial route should be /onboarding - check for onboarding page content
      expect(find.text('GRAFT'), findsOneWidget);
    });
  });
}