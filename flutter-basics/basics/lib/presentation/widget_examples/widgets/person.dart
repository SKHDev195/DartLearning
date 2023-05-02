import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  final String pictureUrl;
  final String name;
  final String age;
  final String country;
  final String job;

  const Person(
      {super.key,
      required this.pictureUrl,
      required this.name,
      required this.age,
      required this.country,
      required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 223, 211, 177),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pictureUrl),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                ),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                _createPersonInfoRow(
                  key: 'Age',
                  value: '32',
                  context: context,
                ),
                const SizedBox(height: 4),
                _createPersonInfoRow(
                  key: 'Job',
                  value: job,
                  context: context,
                ),
                const SizedBox(height: 4),
                _createPersonInfoRow(
                  key: 'Country',
                  value: country,
                  context: context,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ]));
  }

  Row _createPersonInfoRow(
      {required String key,
      required String value,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            key,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const Spacer(),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
