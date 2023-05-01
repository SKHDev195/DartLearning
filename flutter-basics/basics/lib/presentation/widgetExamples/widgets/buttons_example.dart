import 'package:flutter/material.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({super.key});

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
          value: true,
          onChanged: (value) {
            print(value);
          },
        )
      ],
    );
  }
}
