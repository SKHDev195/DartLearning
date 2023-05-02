import 'package:basics/presentation/counter/counter_screen.dart';
import 'package:basics/presentation/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'presentation/widget_examples/widget_examples_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amber,
          ),
        ),
        home: const ListScreen());
  }
}
