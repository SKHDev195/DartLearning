import 'package:flutter/material.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/questions_screen/questions_screen.dart';
import 'presentation/components/question.dart';

void main() {
  runApp(QuestionsApp(
    questionList: questionsAll,
  ));
}

class QuestionsApp extends StatelessWidget {
  const QuestionsApp({super.key, required this.questionList});

  final List<Question> questionList;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: QuestionsScreen(questionList: questionList));
  }
}
