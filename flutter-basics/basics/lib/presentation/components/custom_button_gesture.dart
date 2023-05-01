import 'package:flutter/material.dart';

class CustomButtonGesture extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomButtonGesture(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap,
        child: Container(
            height: 50,
            width: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              shape: BoxShape.rectangle,
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.orange, Colors.lightBlue]),
            ),
            child: Center(child: Text(text))));
  }
}
