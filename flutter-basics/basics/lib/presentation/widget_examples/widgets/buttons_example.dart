import 'package:flutter/material.dart';

class ButtonsExample extends StatefulWidget {
  const ButtonsExample({super.key});

  @override
  State<ButtonsExample> createState() => _ButtonsExampleState();
}

class _ButtonsExampleState extends State<ButtonsExample> {
  bool switchState = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
          ),
          onLongPress: () {
            print('Long pressed');
          },
          onPressed: () {
            print('TextButton pressed');
          },
          child: const Text('TextButton',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        IconButton(
          onPressed: () {
            print('Icon pressed');
          },
          icon: const Icon(Icons.play_arrow),
        ),
        Switch(
          value: switchState,
          onChanged: (value) {
            setState(() {
              switchState = value;
            });
          },
        )
      ],
    );
  }
}
