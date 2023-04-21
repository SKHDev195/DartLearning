import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Question questionOne =
        Question('Sciences', 'How many fish are there in the world?');
    final Question questionTwo = Question('Arts', 'What is Da Vinci\'s name?');
    final Question questionThree =
        Question('History', 'When was Pump Up the Jam (the song) released?');
    return MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Quiz App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 70,
                              width: 70,
                              child: Image.asset('assets/${questionOne.image}'))
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Question 1',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(questionOne.category),
                            Text(questionOne.text)
                          ],
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 70,
                              width: 70,
                              child: Image.asset('assets/${questionTwo.image}'))
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Question 2',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(questionTwo.category),
                            Text(questionTwo.text)
                          ],
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 70,
                              width: 70,
                              child:
                                  Image.asset('assets/${questionThree.image}'))
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Question 3',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(questionThree.category),
                            Text(
                              questionThree.text,
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class Question {
  late String _category;
  late String _text;
  late String _image;

  String get category => _category;
  set category(String category) {
    try {
      if (category.length > 0) {
        _category = category;
      }
    } catch (e) {
      rethrow;
    }
  }

  String get text => _text;
  set text(String text) {
    try {
      if (text.length > 0) {
        _text = text;
      }
    } catch (e) {
      rethrow;
    }
  }

  String get image => _image;
  set image(String category) {
    try {
      if (category.length > 0) {
        _image = createImage(category);
      }
    } catch (e) {
      rethrow;
    }
  }

  Question(String category, String text) {
    this.category = category;
    this.text = text;
    this.image = category;
  }

  String createImage(String category) {
    switch (category) {
      case 'History':
        return 'history.png';
      case 'Geography':
        return 'geography.png';
      case 'Sciences':
        return 'sciences.png';
      case 'Sports':
        return 'sports.png';
      case 'Arts':
        return 'arts.png';
      case 'Entertainment':
        return 'entertainment.png';
      default:
        return 'sciences.png';
    }
  }
}
