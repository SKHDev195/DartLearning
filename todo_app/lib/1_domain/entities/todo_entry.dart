import 'package:todo_app/1_domain/entities/unique_id.dart';

class ToDoEntry {
  const ToDoEntry({
    required this.id,
    required this.isDone,
    required this.description,
  });

  final String description;
  final bool isDone;
  final EntryId id;

  factory ToDoEntry.empty() {
    return ToDoEntry(
      id: EntryId(),
      isDone: false,
      description: '',
    );
  }
}
