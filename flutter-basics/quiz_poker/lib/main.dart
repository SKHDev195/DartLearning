import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Snackbar Test';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
        backgroundColor: Colors.amber,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: SnackbarExample(),
        ),
      ),
    );
  }
}

class SnackbarExample extends StatelessWidget {
  const SnackbarExample({super.key});

  @override
  Widget build (BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('The best snackbar around'),
            action: SnackBarAction(
              label: 'Action',
              onPressed: () {},
            )
          )
        );
      },
      child: const Icon(Icons.access_alarm_rounded),
    );
  }
}

