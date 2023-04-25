import 'package:flutter/material.dart';

void main() {
  final List<Question> questions = [
    Question(
        questionText: 'How many fish are there in the world?',
        questionCategory: QuestionCategory.sciences),
    Question(
        questionText: 'What is Da Vinci\'s name?',
        questionCategory: QuestionCategory.arts),
    Question(
        questionText: 'When was Pump Up the Jam (the song) released?',
        questionCategory: QuestionCategory.history),
    Question(
        questionText: 'What is the name of the smallest unit of life?',
        questionCategory: QuestionCategory.sciences),
    Question(
        questionText:
            'In physics, what term is used to describe the resistance of an object to changes in its state of motion?',
        questionCategory: QuestionCategory.sciences),
    Question(
        questionText:
            'What is the name of the character played by Hugh Jackman in the X-Men movies?',
        questionCategory: QuestionCategory.entertainment),
    Question(
        questionText: 'Who wrote the novel "The Catcher in the Rye"?',
        questionCategory: QuestionCategory.arts),
    Question(
        questionText:
            'What is the highest-grossing film of all time (not adjusted for inflation)?',
        questionCategory: QuestionCategory.entertainment),
    Question(
        questionText:
            'Who was the first president of the United States of America?',
        questionCategory: QuestionCategory.history),
    Question(
        questionText: 'In what year did World War II end?',
        questionCategory: QuestionCategory.history),
    Question(
        questionText:
            'Who was the first female Prime Minister of the United Kingdom?',
        questionCategory: QuestionCategory.history),
    Question(
        questionText: 'In which sport would you use a shuttlecock?',
        questionCategory: QuestionCategory.sports),
  ];

  runApp(MyApp(
    questionList: questions,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required List<Question> this.questionList}) {}

  late List<Question> questionList;

  List<QuestionWidget> get questions => questionList
      .map((item) => QuestionWidget(
            questionText: item.questionText,
            questionCategory: item.questionCategory,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
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
            body: LayoutBuilder(builder: (context, constraints) {
              late Axis contentDirection;
              if (constraints.maxWidth > 600)
                contentDirection = Axis.horizontal;
              else
                contentDirection = Axis.vertical;
              return Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: contentDirection,
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    direction: contentDirection,
                    children: [
                      for (QuestionWidget question in questions) question,
                    ],
                  ),
                ),
              );
            })));
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.questionText,
    required this.questionCategory,
  });

  final String questionText;
  final QuestionCategory questionCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/${questionCategory.image}'),
            ],
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Question!',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                questionCategory.categoryName,
                textAlign: TextAlign.center,
              ),
              Text(
                questionText,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 100,
          width: 20,
        )
      ],
    );
  }
}

enum QuestionCategory {
  history(categoryName: 'History', image: 'history.png'),
  geography(categoryName: 'Geography', image: 'geography.png'),
  sciences(categoryName: 'Sciences', image: 'sciences.png'),
  sports(categoryName: 'Sports', image: 'sports.png'),
  arts(categoryName: 'Arts', image: 'arts.png'),
  entertainment(categoryName: 'Entertainment', image: 'entertainment.png');

  final String categoryName;
  final String image;

  const QuestionCategory({required this.categoryName, required this.image});
}

class Question {
  late String _questionText;
  late QuestionCategory _questionCategory;
  late String _image;

  String get questionText => _questionText;
  QuestionCategory get questionCategory => _questionCategory;
  String get image => _questionCategory.image;

  Question(
      {required String questionText,
      required QuestionCategory questionCategory})
      : _questionText = questionText,
        _questionCategory = questionCategory;
}
