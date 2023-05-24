import 'package:flutter/material.dart';

class SuccessfulSubmissionSnackBar extends SnackBar {
  SuccessfulSubmissionSnackBar({Key? key})
      : super(
          key: key,
          duration: const Duration(seconds: 10),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Question added!',
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
