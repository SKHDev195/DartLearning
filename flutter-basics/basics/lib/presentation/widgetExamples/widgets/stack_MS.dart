import 'package:flutter/material.dart';

class StackMS extends StatelessWidget {
  const StackMS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('assets/test.jpg', fit: BoxFit.contain),
        ),
        const Positioned(top: 80, left: 20, child: Text('Lego Minifigs')),
      ],
    );
  }
}
