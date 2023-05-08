import 'package:flutter/material.dart';

class HelpSnackbar extends SnackBar {
  HelpSnackbar({
    Key? key,
    required bool isHint,
    required String helpText,
    Duration duration = const Duration(seconds: 15),
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) : super(
          key: key,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  (isHint) ? 'Hint: $helpText' : 'Solution: $helpText',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SnackBarAction(
                label: 'Hide',
                onPressed: () {},
                textColor: Colors.white,
              ),
            ],
          ),
          backgroundColor: Colors.amber,
          duration: duration,
          behavior: behavior,
        );
}
