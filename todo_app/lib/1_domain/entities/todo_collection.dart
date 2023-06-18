import 'package:equatable/equatable.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

class ToDoCollection extends Equatable {
  ToDoCollection({
    required this.id,
    required this.title,
    required this.todoColor,
  });

  factory ToDoCollection.empty() {
    return ToDoCollection(
      id: CollectionId(),
      title: 'Empty collection',
      todoColor: ToDoColor(
        colorIndex: 0,
      ),
    );
  }

  final CollectionId id;
  final String title;
  final ToDoColor todoColor;

  @override
  List<Object?> get props => [
        id,
        title,
        todoColor,
      ];
}
