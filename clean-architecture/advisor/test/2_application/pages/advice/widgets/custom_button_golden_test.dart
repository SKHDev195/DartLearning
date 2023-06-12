import 'package:advisor/2_application/pages/advice/widgets/custom_advisor_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({Function()? onTap}) {
    return MaterialApp(
      home: Scaffold(
        body: CustomAdvisorButton(
          onTap: onTap,
        ),
      ),
    );
  }

  group('Golden Test', () {
    group('Custom Advisor Button', () {
      testWidgets('is enabled', (widgetTester) async {
        await widgetTester.pumpWidget(
          widgetUnderTest(onTap: () {}),
        );

        await expectLater(
          find.byType(CustomAdvisorButton),
          matchesGoldenFile('goldens/custom_button_enabled.png'),
        );
      });

      testWidgets('is disabled', (widgetTester) async {
        await widgetTester.pumpWidget(
          widgetUnderTest(),
        );

        await expectLater(
          find.byType(CustomAdvisorButton),
          matchesGoldenFile('goldens/custom_button_disabled.png'),
        );
      });
    });
  });
}
