import 'package:flutter/material.dart';
import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/components/question_category.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/new_question_screen/widgets/form_warning_snackbar.dart';
import 'package:question/presentation/questions_screen/questions_screen.dart';

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
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.amber, Color.fromARGB(255, 220, 158, 122)],
            ),
          ),
          child: InkWell(
            onTap: onTap,
            splashColor: const Color.fromARGB(255, 102, 131, 103),
            customBorder: const RoundedRectangleBorder(),
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
