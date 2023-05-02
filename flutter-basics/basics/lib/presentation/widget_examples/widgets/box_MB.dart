import 'package:flutter/material.dart';

class BoxMB extends StatelessWidget {
  const BoxMB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 100,
        width: 100,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://media.cnn.com/api/v1/images/stellar/prod/230326144721-01-formula-equality.jpg?c=16x9&q=w_850,c_fill',
          ),
        ));
  }
}
