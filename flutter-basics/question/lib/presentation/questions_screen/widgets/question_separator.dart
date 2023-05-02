import 'package:flutter/material.dart';

class QuestionSeparator extends StatelessWidget {
  const QuestionSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.grey,
            Colors.transparent,
          ],
          stops: [0.0, 0.5, 1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
