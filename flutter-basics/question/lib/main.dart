import 'package:flutter/material.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/new_question_screen/new_question_screen.dart';
import 'package:question/presentation/question_details_screen/question_details_screen.dart';
import 'package:question/presentation/questions_screen/questions_screen.dart';
import 'package:question/root_nav_bar.dart';
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
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: RootNavBar(),
        routes: {
          '/questions': (BuildContext context) => RootNavBar(),
          '/questionDetails': (BuildContext context) =>
              const QuestionDetailsScreen(),
          '/addNewQuestion': (BuildContext context) =>
              const NewQuestionScreen(),
        },
      ),
    );
  }
}
