import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/use_cases/create_todo_entry.dart';
import 'package:todo_app/core/use_case.dart';

part 'create_to_do_entry_page_cubit_state.dart';

class CreateToDoEntryPageCubit extends Cubit<CreateToDoEntryPageCubitState> {
  CreateToDoEntryPageCubit({
    required this.createToDoEntry,
  }) : super(const CreateToDoEntryPageCubitState());

  final CreateToDoEntry createToDoEntry;

  void descriptionChanged(String description) {
    emit(
      state.copyWith(
        description: description,
      ),
    );
  }

  Future<void> submit() async {
    final String newEntryDescription = state.description ?? '';

    await createToDoEntry.call(
      ToDoEntryParams(
        description: newEntryDescription,
      ),
    );
  }
}
