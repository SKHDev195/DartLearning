import 'package:question/presentation/components/question.dart';

class QuestionDetailsScreenArgs {
  QuestionDetailsScreenArgs({
    required this.question,
    required this.questionNumber,
  });

  final Question question;
  final int questionNumber;
}
