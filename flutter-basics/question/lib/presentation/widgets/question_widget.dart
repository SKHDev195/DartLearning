import 'package:flutter/material.dart';
import 'package:question/presentation/components/question_category.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.questionText,
    required this.questionCategory,
  });

  final String questionText;
  final QuestionCategory questionCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Image.asset('assets/${questionCategory.image}'),
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Question!',
                  style: TextStyle(fontWeight: FontWeight.bold)),
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
