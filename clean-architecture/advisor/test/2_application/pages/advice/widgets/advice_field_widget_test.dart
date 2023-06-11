import 'package:advisor/2_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({required String adviceText}) {
    return MaterialApp(
      home: AdviceField(advice: adviceText),
    );
  }

  group('AdviceField', () {
    group('should be displayed correctly', () {
      testWidgets('when a short text is given', (widgetTester) async {
        const text = 'short';

        await widgetTester.pumpWidget(
          widgetUnderTest(adviceText: text),
        );

        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.textContaining(text);

        expect(adviceFieldFinder, findsOneWidget);
      });

      testWidgets('when a long text is given', (widgetTester) async {
        const text =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eros ipsum, blandit eu lorem non, maximus vestibulum mauris. Pellentesque ac arcu imperdiet elit malesuada mollis nec eget felis. Phasellus lacinia commodo ex sed hendrerit. Pellentesque a fermentum dui. Nulla congue felis id pulvinar varius. Phasellus convallis eget erat ut elementum. Mauris risus mauris, accumsan at volutpat vel, lacinia ac est. Sed convallis vehicula sapien eu hendrerit. Aliquam erat volutpat. Vivamus varius posuere enim, sed sodales ipsum sodales at. Curabitur pretium tellus vitae urna iaculis, vel commodo enim venenatis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In tristique a erat vel scelerisque. Donec gravida turpis risus, ac maximus nulla lacinia rutrum. Aliquam vel dui eros. ';

        await widgetTester.pumpWidget(
          widgetUnderTest(adviceText: text),
        );

        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.byType(AdviceField);

        expect(adviceFieldFinder, findsOneWidget);
      });

      testWidgets('when no text is given', (widgetTester) async {
        const text = '';

        await widgetTester.pumpWidget(
          widgetUnderTest(adviceText: text),
        );

        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.text(AdviceField.emptyAdvice);
        final adviceText =
            widgetTester.widget<AdviceField>(find.byType(AdviceField)).advice;

        expect(adviceFieldFinder, findsOneWidget);
        expect(adviceText, '');
      });
    });
  });
}
