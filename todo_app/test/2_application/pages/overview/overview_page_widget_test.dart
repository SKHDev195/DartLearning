import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/pages/overview/bloc/cubit/todo_overview_cubit.dart';
import 'package:todo_app/2_application/pages/overview/overview_page.dart';
import 'package:todo_app/2_application/pages/overview/view_states/todo_overview_error.dart';
import 'package:todo_app/2_application/pages/overview/view_states/todo_overview_loaded.dart';
import 'package:todo_app/2_application/pages/overview/view_states/todo_overview_loading.dart';

class MockToDoOverviewCubit extends MockCubit<ToDoOverviewCubitState>
    implements ToDoOverviewCubit {}

void main() {
  Widget widgetUnderTest({required ToDoOverviewCubit cubit}) {
    return MaterialApp(
      home: BlocProvider<ToDoOverviewCubit>(
        create: (context) => cubit,
        child: const OverviewPage(),
      ),
    );
  }

  final ToDoOverviewCubit mockToDoOverviewCubit = MockToDoOverviewCubit();
  final expectedList = List<ToDoCollection>.generate(
    10,
    (index) => ToDoCollection(
      id: CollectionId.fromUniqueString('test'),
      title: 'test collection',
      todoColor: const ToDoColor(
        colorIndex: 0,
      ),
    ),
  );

  group('OverviewPage', () {
    late ToDoOverviewCubit mockToDoOverviewCubit;

    setUp(() {
      mockToDoOverviewCubit = MockToDoOverviewCubit();
    });
    group('should be displayed in ViewState', () {
      testWidgets(
        'Loading when the cubit emits ToDoOverviewCubitLoadingState',
        (widgetTester) async {
          whenListen(
            mockToDoOverviewCubit,
            Stream.fromIterable(
              [ToDoOverviewCubitLoadingState()],
            ),
            initialState: ToDoOverviewCubitInitial(),
          );

          await widgetTester.pumpWidget(
            widgetUnderTest(
              cubit: mockToDoOverviewCubit,
            ),
          );

          await widgetTester.pump();

          final todoLoadingFinder = find.byType(ToDoOverviewLoading);

          expect(todoLoadingFinder, findsOneWidget);
        },
      );

      testWidgets('Loaded when the cubit emits ToDoOverviewCubitLoadedState',
          (widgetTester) async {
        whenListen(
          mockToDoOverviewCubit,
          Stream.fromIterable(
            [ToDoOverviewCubitLoadedState(collections: expectedList)],
          ),
          initialState: ToDoOverviewCubitInitial(),
        );

        await widgetTester.pumpWidget(
          Material(
            child: widgetUnderTest(
              cubit: mockToDoOverviewCubit,
            ),
          ),
        );

        await widgetTester.pump();

        final todoLoadedFinder = find.byType(ToDoOverviewLoaded);

        expect(todoLoadedFinder, findsOneWidget);
      });

      testWidgets(
        'Error when the cubit emits ToDoOverviewCubitErrorState',
        (widgetTester) async {
          whenListen(
            mockToDoOverviewCubit,
            Stream.fromIterable(
              [ToDoOverviewCubitErrorState()],
            ),
            initialState: ToDoOverviewCubitInitial(),
          );

          await widgetTester.pumpWidget(
            widgetUnderTest(cubit: mockToDoOverviewCubit),
          );

          await widgetTester.pump();

          final todoErrorFinder = find.byType(ToDoOverviewError);

          expect(todoErrorFinder, findsOneWidget);
        },
      );
    });
  });
}
