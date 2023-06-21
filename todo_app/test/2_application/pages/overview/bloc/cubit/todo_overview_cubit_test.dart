import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failure.dart';
import 'package:todo_app/1_domain/use_cases/load_overview_todo_collections.dart';
import 'package:todo_app/2_application/pages/overview/bloc/cubit/todo_overview_cubit.dart';
import 'package:todo_app/core/use_case.dart';

class MockLoadOverviewToDoCollections extends Mock
    implements LoadOverviewToDoCollections {}

void main() {
  MockLoadOverviewToDoCollections mockLoadOverviewToDoCollections =
      MockLoadOverviewToDoCollections();

  final expectedList = List<ToDoCollection>.generate(
    10,
    (index) => ToDoCollection(
      id: CollectionId.fromUniqueString('test'),
      title: 'test collection',
      todoColor: ToDoColor(
        colorIndex: 0,
      ),
    ),
  );

  group('ToDoOverviewCubit', () {
    group('should emit', () {
      blocTest(
        'nothing when no method is called',
        build: (() => ToDoOverviewCubit(
            loadOverviewToDoCollections: mockLoadOverviewToDoCollections)),
        expect: () => <ToDoOverviewCubitState>[],
      );

      blocTest(
        '[ToDoOverviewLoadingState, ToDoOverviewLoadedState] when readToDoOverviewCollections() is called',
        setUp: () => when(
          () => mockLoadOverviewToDoCollections.call(
            NoParams(),
          ),
        ).thenAnswer(
          (invocation) => Future.value(
            Right<Failure, List<ToDoCollection>>(expectedList),
          ),
        ),
        build: (() => ToDoOverviewCubit(
            loadOverviewToDoCollections: mockLoadOverviewToDoCollections)),
        act: (cubit) => cubit.readToDoOverviewCollections(),
        expect: () => <ToDoOverviewCubitState>[
          ToDoOverviewCubitLoadingState(),
          ToDoOverviewCubitLoadedState(collections: expectedList),
        ],
      );

      blocTest(
        '[ToDoOverviewLoadingState, ToDoOverviewErrorState] when readToDoOverviewCollections() is called',
        setUp: () => when(
          () => mockLoadOverviewToDoCollections.call(
            NoParams(),
          ),
        ).thenAnswer(
          (invocation) => Future.value(
            Left<Failure, List<ToDoCollection>>(ServerFailure()),
          ),
        ),
        build: (() => ToDoOverviewCubit(
            loadOverviewToDoCollections: mockLoadOverviewToDoCollections)),
        act: (cubit) => cubit.readToDoOverviewCollections(),
        expect: () => <ToDoOverviewCubitState>[
          ToDoOverviewCubitLoadingState(),
          ToDoOverviewCubitErrorState(),
        ],
      );
    });
  });
}
