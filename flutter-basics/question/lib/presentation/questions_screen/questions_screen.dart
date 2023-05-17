import 'package:flutter/material.dart';
import 'dart:math';
import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/question_details_screen/components/question_details_screen_args.dart';
import 'package:question/presentation/question_details_screen/question_details_screen.dart';
import 'package:question/presentation/questions_screen/widgets/question_separator.dart';
import 'package:question/presentation/questions_screen/widgets/question_widget.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.questionList,
  });

  final List<Question> questionList;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final List<Question> _displayedQuestions = [];
  final _scrollController = ScrollController();
  final random = Random();

  void _addNewQuestion() {
    if (_displayedQuestions.length < widget.questionList.length) {
      _displayedQuestions.add(widget.questionList[0]);
    }
  }

  void _displayNewQuestion() {
    setState(() {
      _addNewQuestion();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  void _goToRandomQuestion() {
    int randomIndex = random.nextInt(_displayedQuestions.length);
    Navigator.pushNamed(context, '/questionDetails',
        arguments: QuestionDetailsScreenArgs(
          question: _displayedQuestions[randomIndex],
          questionNumber: randomIndex,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Questions'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: LayoutBuilder(builder: (context, constraints) {
            late Axis contentDirection;
            if (constraints.maxWidth > 600) {
              contentDirection = Axis.horizontal;
            } else {
              contentDirection = Axis.vertical;
            }
            return ListView.separated(
              controller: _scrollController,
              scrollDirection: contentDirection,
              physics: const BouncingScrollPhysics(),
              itemCount: _displayedQuestions.length,
              separatorBuilder: (context, index) {
                return const QuestionSeparator();
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/questionDetails',
                        arguments: QuestionDetailsScreenArgs(
                          question: widget.questionList[index],
                          questionNumber: index,
                        ));
                  },
                  child: QuestionWidget(
                    questionCategory:
                        widget.questionList[index].questionCategory,
                    questionText: widget.questionList[index].questionText,
                    questionNumber: index + 1,
                  ),
                );
              },
            );
          })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
                onPressed: () => _goToRandomQuestion(),
                child: const Icon(Icons.question_mark)),
            FloatingActionButton(
              onPressed: () => _displayNewQuestion(),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
