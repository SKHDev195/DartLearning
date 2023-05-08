import 'package:basics/presentation/navigation_example_screens/screen_one.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen Two'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: TextButton(
            child: const Text('Go Forward'),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenOne(),
                  ));
            },
          ),
        ));
  }
}
