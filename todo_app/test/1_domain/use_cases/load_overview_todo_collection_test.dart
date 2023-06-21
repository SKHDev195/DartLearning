import 'package:either_dart/either.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app/0_data/repositories/todo_repository_mock.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failure.dart';
import 'package:todo_app/1_domain/use_cases/load_overview_todo_collections.dart';
import 'package:todo_app/core/use_case.dart';

import 'load_overview_todo_collection_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ToDoRepositoryMock>()])
void main() {
  final todoRepositoryMock = MockToDoRepositoryMock();
  final loadOverviewToDoCollectionsTest =
      LoadOverviewToDoCollections(toDoRepository: todoRepositoryMock);
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
  group('LoadOverviewToDoCollections', () {
    group('should return a List<ToDoCollection>', () {
      test('when ToDoRepositoryMock returns a List<ToDoCollection>', () async {
        when(todoRepositoryMock.readToDoCollections()).thenAnswer(
          (realInvocation) => Future.value(
            Right(expectedList),
          ),
        );
        final result = await loadOverviewToDoCollectionsTest.call(
          NoParams(),
        );

        expect(result.isLeft, false);
        expect(result.isRight, true);
        expect(
          result,
          isA<Right<Failure, List<ToDoCollection>>>()
              .having((r) => r.value, 'value', equals(expectedList)),
        );

        verify(todoRepositoryMock.readToDoCollections()).called(1);
        verifyNoMoreInteractions(todoRepositoryMock);
      });
    });

    group('should return left with', () {
      test('a ServerFailure when an Exception is caught', () async {
        when(todoRepositoryMock.readToDoCollections()).thenAnswer(
          (realInvocation) => Future.value(
            Left(
              ServerFailure(),
            ),
          ),
        );

        final result = await loadOverviewToDoCollectionsTest.call(
          NoParams(),
        );

        expect(result.isLeft, true);
        expect(result.isRight, false);

        expect(
          result,
          Left<Failure, ServerFailure>(
            ServerFailure(),
          ),
        );

        verify(todoRepositoryMock.readToDoCollections()).called(1);
        verifyNoMoreInteractions(todoRepositoryMock);
      });
    });
  });
}
