import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/use_cases/create_todo_entry.dart';
import 'package:todo_app/2_application/core/form_value.dart';
import 'package:todo_app/core/use_case.dart';

part 'create_to_do_entry_page_cubit_state.dart';

class CreateToDoEntryPageCubit extends Cubit<CreateToDoEntryPageCubitState> {
  CreateToDoEntryPageCubit({
    required this.createToDoEntry,
    required this.collectionId,
  }) : super(const CreateToDoEntryPageCubitState());

  final CreateToDoEntry createToDoEntry;
  final CollectionId collectionId;

  void descriptionChanged(String? description) {
    ValidationStatus currentStatus = ValidationStatus.pending;

    if (description == null || description.isEmpty || description.length < 2) {
      currentStatus = ValidationStatus.error;
    } else {
      ValidationStatus.success;
    }

    emit(
      state.copyWith(
        description: FormValue(
          value: description,
          validationStatus: currentStatus,
        ),
      ),
    );
  }

  Future<void> submit() async {}
}
