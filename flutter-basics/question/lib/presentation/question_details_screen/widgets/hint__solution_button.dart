import 'package:flutter/material.dart';
import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/question_details_screen/widgets/help_solution_info.dart';

class ShowHintSolutionButton extends StatelessWidget {
  const ShowHintSolutionButton({Key? key, required this.onTap})
      : super(key: key);

  final Function()? onTap;

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
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: InkWell(
              onTap: onTap,
              splashFactory: InkRipple.splashFactory,
              splashColor: Theme.of(context).colorScheme.outline,
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
