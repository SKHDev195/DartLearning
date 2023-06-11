import 'package:advisor/2_application/pages/advice/widgets/custom_advisor_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

abstract class OnCustomAdvisorButtonTap {
  void call();
}

class MockOnCustomAdvisorButtonTap extends Mock
    implements OnCustomAdvisorButtonTap {}

void main() {
  Widget widgetUnderTest({Function()? callback}) {
    return MaterialApp(
      home: Scaffold(
        body: CustomAdvisorButton(
          onTap: callback,
        ),
      ),
    );
  }

  group('CustomAdvisorButton', () {
    group('is rendered correctly', () {
      testWidgets(
        'and has all parts that it needs',
        (widgetTester) async {
          await widgetTester.pumpWidget(widgetUnderTest());

          final buttonLabelFinder = find.text('Get Advice');

          expect(buttonLabelFinder, findsOneWidget);
        },
      );
    });

    group('should handle onTap', () {
      testWidgets(
        'when someone has pressed the button',
        (widgetTester) async {
          final mockOnCustomAdvisorButtonTap = MockOnCustomAdvisorButtonTap();
          await widgetTester.pumpWidget(
            widgetUnderTest(
              callback: mockOnCustomAdvisorButtonTap,
            ),
          );

          final customButtonFinder = find.byType(CustomAdvisorButton);

          widgetTester.tap(customButtonFinder);

          verify(mockOnCustomAdvisorButtonTap()).called(1);
        },
      );
    });
  });
}
