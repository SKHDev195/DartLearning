import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/pages/overview/bloc/cubit/todo_overview_cubit.dart';
import 'package:todo_app/2_application/pages/overview/overview_page.dart';

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

  group(
    'ToDoOverviewLoading',
    () {
      testWidgets(
        'displays a loading indicator when rendered',
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

          final todoLoadingFinder = find.byType(CircularProgressIndicator);

          expect(todoLoadingFinder, findsOneWidget);
        },
      );
    },
  );

  group(
    'ToDoOverviewError',
    () {
      testWidgets(
        'displays an error card when rendered',
        (widgetTester) async {
          whenListen(
            mockToDoOverviewCubit,
            Stream.fromIterable(
              [ToDoOverviewCubitErrorState()],
            ),
            initialState: ToDoOverviewCubitInitial(),
          );

          await widgetTester.pumpWidget(
            widgetUnderTest(
              cubit: mockToDoOverviewCubit,
            ),
          );

          await widgetTester.pump();

          final todoErrorFinder = find.byType(Card);

          final todoErrorTextFinder = find.text('ERROR, please try again');

          expect(todoErrorFinder, findsOneWidget);

          expect(todoErrorTextFinder, findsOneWidget);
        },
      );
    },
  );

  group('ToDoOverviewLoaded', () {
    testWidgets(
      'displays the correct ListTiles when rendered',
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

        final todoLoadedStateFinder = find.byType(ListView);

        expect(todoLoadedStateFinder, findsOneWidget);

        List<Widget> listTiles =
            widgetTester.widgetList(find.byType(ListTile)).toList();

        expect(listTiles.length, expectedList.length);
      },
    );
  });
}
