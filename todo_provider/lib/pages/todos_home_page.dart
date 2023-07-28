import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/providers/providers.dart';

import '../models/todo_model.dart';

class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
  State<ToDoHomePage> createState() => _ToDoHomePageState();
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Column(
                children: [
                  ToDoHeader(),
                  const CreateToDo(),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchAndFilterToDo(),
                ],
              )),
        ),
      ),
    );
  }
}

class ToDoHeader extends StatelessWidget {
  ToDoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    int activeToDoCount =
        context.watch<ActiveToDoCount>().state.activeToDoCount;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Text(
          '$activeToDoCount items left',
          style: const TextStyle(
            fontSize: 25,
            color: Colors.redAccent,
          ),
        )
      ],
    );
  }
}

class CreateToDo extends StatefulWidget {
  const CreateToDo({super.key});

  @override
  State<CreateToDo> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  final newToDoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newToDoController,
      decoration: const InputDecoration(
        labelText: 'Add a new todo',
      ),
      onSubmitted: (String? toDoDesc) {
        if (toDoDesc != null && toDoDesc.trim().isNotEmpty) {
          context.read<ToDoList>().addNewToDo(toDoDesc);
          newToDoController.clear();
        }
      },
    );
  }

  @override
  void dispose() {
    newToDoController.dispose();
    super.dispose();
  }
}

class SearchAndFilterToDo extends StatelessWidget {
  const SearchAndFilterToDo({super.key});

  @override
  Widget build(BuildContext context) {
    ToDoSearch toDoSearch = context.read<ToDoSearch>();
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search todos',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              toDoSearch.setSearchTerm(newSearchTerm);
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    String filterText = switch (filter) {
      Filter.all => 'All',
      Filter.active => 'Active',
      Filter.completed => 'Completed',
    };

    return TextButton(
      onPressed: () {
        context.read<ToDoFilter>().changeFilter(filter);
      },
      child: Text(
        filterText,
        style: TextStyle(
          fontSize: 18,
          color: textColor(context, filter),
        ),
      ),
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<ToDoFilter>().state.filter;

    return currentFilter == filter ? Colors.blueAccent : Colors.grey;
  }
}
