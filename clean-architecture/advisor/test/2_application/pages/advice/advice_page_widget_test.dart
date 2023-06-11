import 'package:advisor/2_application/core/services/theme_service.dart';
import 'package:advisor/2_application/pages/advice/advisor_page.dart';
import 'package:advisor/2_application/pages/advice/cubit/advisor_cubit.dart';
import 'package:advisor/2_application/pages/advice/widgets/advice_field.dart';
import 'package:advisor/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:provider/provider.dart';

class MockAdvisorCubit extends MockCubit<AdvisorStateCubit>
    implements AdvisorCubit {}

void main() {
  Widget widgetUnderTest({required AdvisorCubit cubit}) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ThemeService(),
        child: BlocProvider<AdvisorCubit>(
          create: (context) => cubit,
          child: const AdvisorPage(),
        ),
      ),
    );
  }

  group('AdvisorPage', () {
    late AdvisorCubit mockAdvisorCubit;

    setUp(() {
      mockAdvisorCubit = MockAdvisorCubit();
    });
    group('should be displayed in ViewState', () {
      testWidgets(
        'Initial when cubits emits AdvicerInitial()',
        (widgetTester) async {
          whenListen(
            mockAdvisorCubit,
            Stream.fromIterable(const [AdvisorInitial()]),
            initialState: const AdvisorInitial(),
          );

          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockAdvisorCubit));

          final advicerInitalTextFinder =
              find.text('Your advice is waiting for you!');

          expect(advicerInitalTextFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Loading when cubit emits AdvisorStateLoading()',
        (widgetTester) async {
          whenListen(
            mockAdvisorCubit,
            Stream.fromIterable(const [AdvisorStateLoading()]),
            initialState: const AdvisorInitial(),
          );

          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockAdvisorCubit));

          await widgetTester.pump();

          final advicerLoadingFinder = find.byType(CircularProgressIndicator);

          expect(advicerLoadingFinder, findsOneWidget);
        },
      );

      testWidgets(
        'advice text when cubit emits AdvisorStateLoaded()',
        (widgetTester) async {
          whenListen(
            mockAdvisorCubit,
            Stream.fromIterable(const [AdvisorStateLoaded(advice: '42')]),
            initialState: const AdvisorInitial(),
          );

          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockAdvisorCubit));

          await widgetTester.pump();

          final advisorLoadedStateFinder = find.byType(AdviceField);
          final adviceText =
              widgetTester.widget<AdviceField>(advisorLoadedStateFinder).advice;

          expect(advisorLoadedStateFinder, findsOneWidget);
          expect(adviceText, '42');
        },
      );

      testWidgets(
        'error when cubit emits AdvisorStateError()',
        (widgetTester) async {
          whenListen(
            mockAdvisorCubit,
            Stream.fromIterable(const [AdvisorStateError(message: 'error')]),
            initialState: const AdvisorInitial(),
          );

          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockAdvisorCubit));

          await widgetTester.pump();

          final advisorErrorFinder = find.byType(ErrorMessage);

          expect(advisorErrorFinder, findsOneWidget);
        },
      );
    });
  });
}
