import 'package:flutter/material.dart';
import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/question_details_screen/widgets/help_snackbar.dart';

class ShowHintSolutionButton extends StatefulWidget {
  const ShowHintSolutionButton({super.key, required this.question});

  final Question question;

  @override
  State<ShowHintSolutionButton> createState() => _ShowHintSolutionButtonState();
}

class _ShowHintSolutionButtonState extends State<ShowHintSolutionButton> {
  int _counter = 0;
  late String _buttonText;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          return Ink(
            width: constraints.maxWidth / 2,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.amber, Color.fromARGB(255, 220, 158, 122)],
              ),
            ),
            child: InkWell(
              onTap: () {
                switch (_counter) {
                  case 0:
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(HelpSnackbar(
                        helpText: widget.question.hintOne, isHint: true));
                    _incrementCounter();
                    break;
                  case 1:
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(HelpSnackbar(
                        helpText: widget.question.hintTwo, isHint: true));
                    _incrementCounter();
                    break;
                  case 2:
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(HelpSnackbar(
                        helpText: widget.question.solution, isHint: false));
                    _counter = 0;
                    break;
                  default:
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(HelpSnackbar(
                        helpText: widget.question.hintOne, isHint: false));
                    _counter = 0;
                    break;
                }
              },
              splashColor: const Color.fromARGB(255, 102, 131, 103),
              customBorder: const RoundedRectangleBorder(),
              child: const Center(
                child: Text(
                  'Show Hint/Solution',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
