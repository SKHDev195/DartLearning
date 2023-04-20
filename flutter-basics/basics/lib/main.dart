import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 173, 173, 173),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Flutter Basics')
          ),
        body: const Center(
          child: Text('Hello World!')
          ),
      ),
    );
  }
}



