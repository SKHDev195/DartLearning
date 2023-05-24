import 'package:flutter/material.dart';
import 'package:question/presentation/question_details_screen/components/question_details_screen_args.dart';
import 'package:question/presentation/question_details_screen/widgets/help_solution_info.dart';
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
  int _counter = 0;
  bool hintOneShown = false;
  bool hintTwoShown = false;
  bool solutionShown = false;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as QuestionDetailsScreenArgs;

    final HelpSolutionInfo hintOneWidget = HelpSolutionInfo(
      text: args.question.hintOne,
      index: 1,
      isHint: true,
    );

    final HelpSolutionInfo hintTwoWidget = HelpSolutionInfo(
      text: args.question.hintTwo,
      index: 2,
      isHint: true,
    );

    final HelpSolutionInfo solutionWidget = HelpSolutionInfo(
      text: args.question.solution,
      index: 3,
      isHint: false,
    );

    void showHelp() {
      setState(
        () {
          switch (_counter) {
            case 0:
              hintOneShown = true;
              _counter++;
              break;
            case 1:
              hintTwoShown = true;
              _counter++;
              break;
            case 2:
              solutionShown = true;
              break;
            default:
              break;
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
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
            height: 16,
          ),
          Container(
            alignment: Alignment.center,
            child: ShowHintSolutionButton(
              onTap: showHelp,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                  'Press the button above for two hints, press it again for the solution'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedOpacity(
            duration: const Duration(
              milliseconds: 300,
            ),
            opacity: hintOneShown ? 1 : 0,
            child: hintOneWidget,
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedOpacity(
            duration: const Duration(
              milliseconds: 300,
            ),
            opacity: hintTwoShown ? 1 : 0,
            child: hintTwoWidget,
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedOpacity(
            duration: const Duration(
              milliseconds: 300,
            ),
            opacity: solutionShown ? 1 : 0,
            child: solutionWidget,
          ),
        ],
      ),
    );
  }
}
