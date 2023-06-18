import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';

class ToDoOverviewLoaded extends StatelessWidget {
  const ToDoOverviewLoaded({
    super.key,
    required this.collections,
  });

  final List<ToDoCollection> collections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        final colorScheme = Theme.of(context).colorScheme;
        return ListTile(
          tileColor: colorScheme.surface,
          selectedTileColor: colorScheme.surfaceVariant,
          iconColor: item.todoColor.color,
          selectedColor: item.todoColor.color,
          onTap: () => debugPrint('tapped on ${item.title}'),
          leading: const Icon(Icons.circle),
          title: Text(item.title),
        );
      },
    );
  }
}
