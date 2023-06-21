import 'package:flutter/material.dart';
import 'package:todo_app/2_application/core/page_config.dart';

class ToDoDetailPage extends StatelessWidget {
  const ToDoDetailPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.details_rounded,
    name: 'detail',
    child: ToDoDetailPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
