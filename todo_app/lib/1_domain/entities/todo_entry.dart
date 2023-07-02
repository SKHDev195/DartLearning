import 'package:equatable/equatable.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

class ToDoEntry extends Equatable {
  ToDoEntry({
    required this.id,
    required this.isDone,
    required this.description,
  });

  final String description;
  bool isDone;
  final EntryId id;

  factory ToDoEntry.empty() {
    return ToDoEntry(
      id: EntryId(),
      isDone: false,
      description: '',
    );
  }

  factory ToDoEntry.fromForm(String description) {
    return ToDoEntry(
      id: EntryId(),
      isDone: false,
      description: description,
    );
  }

  ToDoEntry copyWith({String? description, bool? isDone}) {
    return ToDoEntry(
      id: id,
      isDone: isDone ?? this.isDone,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [
        id,
        isDone,
        description,
      ];
}
