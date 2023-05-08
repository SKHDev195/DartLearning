import 'package:flutter/material.dart';
import 'package:question/presentation/components/question_category.dart';
import 'package:question/presentation/question_details_screen/question_details_screen.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.questionText,
    required this.questionCategory,
    required this.questionNumber,
  });

  final String questionText;
  final QuestionCategory questionCategory;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Image.asset('assets/${questionCategory.image}'),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Question #$questionNumber!',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                questionCategory.categoryName,
              ),
              Text(
                questionText,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 100,
          width: 20,
        )
      ],
    );
  }
}
