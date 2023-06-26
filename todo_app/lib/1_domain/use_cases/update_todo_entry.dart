import 'package:either_dart/src/either.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/failures/failure.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/core/use_case.dart';

class UpdateToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdsParams> {
  const UpdateToDoEntry({
    required this.toDoRepository,
  });

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParams params) async {
    try {
      final toDoEntry = await toDoRepository.updateToDoEntry(
        collectionId: params.collectionId,
        entryId: params.entryId,
      );

      return toDoEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          stackTrace: e.toString(),
        ),
      );
    }
  }
}
