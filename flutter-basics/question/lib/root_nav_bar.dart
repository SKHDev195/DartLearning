import 'package:flutter/material.dart';
import 'package:question/presentation/components/question_app_nav_bar.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/new_question_screen/new_question_screen.dart';
import 'package:question/presentation/questions_screen/questions_screen.dart';
import 'package:question/presentation/theme_switch_screen/theme_switch_screen.dart';

class RootNavBar extends StatefulWidget {
  RootNavBar({super.key});

  final _screens = [
    QuestionsScreen(questionList: questionsAll),
    const NewQuestionScreen(),
    const ThemeSwitchScreen(),
  ];

  @override
  State<RootNavBar> createState() => _RootNavBarState();
}

class _RootNavBarState extends State<RootNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return QuestionAppNavBar(
        currentIndex: _currentIndex,
        onTabSelected: onTabSelected,
        screens: widget._screens);
  }

  void onTabSelected(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
