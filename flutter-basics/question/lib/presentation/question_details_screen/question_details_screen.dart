import 'package:flutter/material.dart';
import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/question_details_screen/widgets/show_hint_one_button.dart';
import 'package:question/presentation/question_details_screen/widgets/show_hint_two_button.dart';
import 'package:question/presentation/question_details_screen/widgets/show_solution_button.dart';
import 'package:question/presentation/questions_screen/widgets/question_widget.dart';

class QuestionDetailsScreen extends StatefulWidget {
  const QuestionDetailsScreen({
    super.key,
    required this.question,
    required this.questionNumber,
  });

  final Question question;
  final int questionNumber;

  @override
  State<QuestionDetailsScreen> createState() => _QuestionDetailsScreenState();
}

class _QuestionDetailsScreenState extends State<QuestionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Question #${widget.questionNumber + 1} Details'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Center(
                  child: QuestionWidget(
                    questionText: widget.question.questionText,
                    questionCategory: widget.question.questionCategory,
                    questionNumber: widget.questionNumber + 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: ShowHintOneButton(question: widget.question),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: ShowHintTwoButton(question: widget.question),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: ShowSolutionButton(question: widget.question),
          ),
        ],
      ),
    );
  }
}
