import 'package:flutter/material.dart';

class RowExpandedExample extends StatelessWidget {
  const RowExpandedExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Flexible(
        child: Text(
          'Just Another Text for Row  - it is very very long for test purposes',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(height: 20, width: 20, color: Colors.blue),
      const SizedBox(
        width: 8,
      ),
      Container(height: 20, width: 20, color: Colors.green),
    ]);
  }
}
