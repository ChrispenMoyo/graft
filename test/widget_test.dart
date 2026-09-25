// Test file for GRAFTApp widget
import 'package:flutter_test/flutter_test.dart';

import 'package:graft/app/app.dart';

void main() {
  group('GRAFTApp Tests', () {
    testWidgets('GRAFTApp renders without errors', (WidgetTester tester) async {
      await tester.pumpWidget(const GRAFTApp());

      // The app starts on onboarding and should render its first page
      expect(find.text('GRAFT'), findsWidgets);
      expect(find.text('Get Started'), findsOneWidget);
    });
  });
}
