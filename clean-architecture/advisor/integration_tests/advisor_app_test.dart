import 'package:advisor/2_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:advisor/main.dart' as advisor;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-end test', () {
    testWidgets(
      'tap on custom button, verify advice will be loaded',
      (widgetTester) async {
        advisor.main();
        await widgetTester.pumpAndSettle();

        expect(find.text('Your advice is waiting for you!'), findsOneWidget);

        final customButtonFinder = find.text('Get Advice');

        await widgetTester.tap(customButtonFinder);

        await widgetTester.pumpAndSettle();

        expect(find.byType(AdviceField), findsOneWidget);
      },
    );
  });
}
