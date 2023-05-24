import 'package:flutter/material.dart';

class FormWarningSnackBar extends SnackBar {
  FormWarningSnackBar({Key? key})
      : super(
          key: key,
          duration: const Duration(seconds: 10),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Form incomplete',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SnackBarAction(
                label: 'Hide',
                onPressed: () {},
              ),
            ],
          ),
        );
}
