import 'package:flutter/material.dart';

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
      home: Scaffold(

        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Flutter Basics')
          ),
        body: const Center(
          child: Text('Hello World!')
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint('clicked'),
          child: const Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}



