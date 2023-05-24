import 'package:flutter/material.dart';

class HelpSolutionInfo extends StatelessWidget {
  HelpSolutionInfo({
    super.key,
    required this.text,
    required this.index,
    required this.isHint,
  });

  final String text;
  final int index;
  final bool isHint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(7),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    isHint ? 'Hint $index!' : 'Solution!',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
