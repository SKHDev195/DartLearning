import 'package:flutter/material.dart';
import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/question_details_screen/components/question_details_screen_args.dart';
import 'package:question/presentation/question_details_screen/widgets/hint__solution_button.dart';
import 'package:question/presentation/questions_screen/widgets/question_widget.dart';

class QuestionDetailsScreen extends StatefulWidget {
  const QuestionDetailsScreen({
    super.key,
  });

  @override
  State<QuestionDetailsScreen> createState() => _QuestionDetailsScreenState();
}

class _QuestionDetailsScreenState extends State<QuestionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as QuestionDetailsScreenArgs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Question #${args.questionNumber + 1} Details'),
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
                    questionText: args.question.questionText,
                    questionCategory: args.question.questionCategory,
                    questionNumber: args.questionNumber + 1,
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
            child: ShowHintSolutionButton(question: args.question),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                  'Press the button above  for two hints, press it again for the solution'),
            ),
          )
        ],
      ),
    );
  }
}
