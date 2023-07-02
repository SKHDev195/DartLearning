import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/components/todo_entry_item/todo_entry_item.dart';
import 'package:todo_app/2_application/pages/create_todo_entry/create_todo_entry_page.dart';

class ToDoDetailLoaded extends StatelessWidget {
  const ToDoDetailLoaded({
    super.key,
    required this.entryIds,
    required this.collectionId,
  });

  final List<EntryId> entryIds;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: entryIds.length,
          itemBuilder: (context, index) {
            if (index == entryIds.length - 1) {
              return Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(
                        CreateToDoEntryPage.pageConfig.name,
                        pathParameters: {
                          'collectionId': collectionId.value.toString(),
                        },
                      );
                    },
                    child: const Text('Add New Entry'),
                  ),
                ],
              );
            } else {
              return ToDoEntryItemProvider(
                collectionId: collectionId,
                entryId: entryIds[index],
              );
            }
          },
          /*itemBuilder: (context, index) => ToDoEntryItemProvider(
            collectionId: collectionId,
            entryId: entryIds[index],
          ),*/
        ),
        /*const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Add New Entry'),
        ),*/
      ),
    );
  }
}
