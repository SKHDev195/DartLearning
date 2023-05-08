import 'package:flutter/material.dart';
import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/question_details_screen/widgets/help_snackbar.dart';

class ShowHintOneButton extends StatelessWidget {
  const ShowHintOneButton({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          return Ink(
            width: constraints.maxWidth / 2,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.amber, Color.fromARGB(255, 220, 158, 122)],
              ),
            ),
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                    HelpSnackbar(helpText: question.hintOne, isHint: true));
              },
              splashColor: const Color.fromARGB(255, 102, 131, 103),
              customBorder: const RoundedRectangleBorder(),
              child: const Center(
                child: Text(
                  'Show Hint #1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
