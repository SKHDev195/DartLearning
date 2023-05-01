import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Color iconColor;
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Ink(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.yellow, Colors.green]),
            ),
            child: InkWell(
                onTap: () => onTap(),
                splashColor: Colors.red,
                customBorder: const CircleBorder(),
                child: Center(
                    child: Icon(
                  icon,
                  color: iconColor,
                )))));
  }
}
