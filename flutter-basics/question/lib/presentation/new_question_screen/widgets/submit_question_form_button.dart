import 'package:flutter/material.dart';

class SubmitQuestionFormButton extends StatelessWidget {
  const SubmitQuestionFormButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(builder: (
        context,
        constraints,
      ) {
        return Ink(
          width: constraints.maxWidth / 2,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.inversePrimary),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onTap: onTap,
            splashFactory: InkRipple.splashFactory,
            child: const Center(
              child: Text(
                'Add New Question',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
