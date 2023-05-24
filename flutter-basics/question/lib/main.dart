import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question/application/theme_service.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/new_question_screen/new_question_screen.dart';
import 'package:question/presentation/question_details_screen/question_details_screen.dart';
import 'package:question/root_nav_bar.dart';
import 'package:question/theme.dart';
import 'presentation/components/question.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: QuestionsApp(
        questionList: questionsAll,
      ),
      create: (context) => ThemeService(),
    ),
  );
}

class QuestionsApp extends StatelessWidget {
  const QuestionsApp({
    super.key,
    required this.questionList,
  });

  final List<Question> questionList;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return GestureDetector(
          onTap: () {
            final currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(
            title: 'Quiz App',
            themeMode: themeService.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: QuestionsAppTheme.lightTheme,
            darkTheme: QuestionsAppTheme.darkTheme,
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
      },
    );
  }
}
