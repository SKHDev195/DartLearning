import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                      const QuestionWidget(
                        questionText: 'How many fish are there in the world?',
                        questionCategory: 'Sciences',
                      ),
                      const QuestionWidget(
                        questionText: 'What is Da Vinci\'s name?',
                        questionCategory: 'Arts',
                      ),
                      const QuestionWidget(
                        questionText:
                            'When was Pump Up the Jam (the song) released?',
                        questionCategory: 'History',
                      ),
                      const QuestionWidget(
                        questionText:
                            'What is the name of the smallest unit of life?',
                        questionCategory: 'Sciences',
                      ),
                      const QuestionWidget(
                        questionText:
                            'In physics, what term is used to describe the resistance of an object to changes in its state of motion?',
                        questionCategory: 'Sciences',
                      ),
                      const QuestionWidget(
                        questionText:
                            'What is the name of the character played by Hugh Jackman in the X-Men movies?',
                        questionCategory: 'Arts',
                      ),
                      const QuestionWidget(
                        questionText:
                            'Who wrote the novel "The Catcher in the Rye"?',
                        questionCategory: 'Arts',
                      ),
                      const QuestionWidget(
                        questionText:
                            'What is the highest-grossing film of all time (not adjusted for inflation)?',
                        questionCategory: 'Arts',
                      ),
                      const QuestionWidget(
                        questionText:
                            'Who was the first president of the United States of America?',
                        questionCategory: 'History',
                      ),
                      const QuestionWidget(
                        questionText: 'In what year did World War II end?',
                        questionCategory: 'History',
                      ),
                      const QuestionWidget(
                        questionText:
                            'Who was the first female Prime Minister of the United Kingdom?',
                        questionCategory: 'History',
                      ),
                      const QuestionWidget(
                        questionText:
                            'In which sport would you use a shuttlecock?',
                        questionCategory: 'Badminton',
                      ),
                    ],
                  ),
                ),
              );
            })));
    /*Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  const QuestionWidget(
                    questionText: 'How many fish are there in the world?',
                    questionCategory: 'Sciences',
                  ),
                  const QuestionWidget(
                    questionText: 'What is Da Vinci\'s name?',
                    questionCategory: 'Arts',
                  ),
                  const QuestionWidget(
                    questionText:
                        'When was Pump Up the Jam (the song) released?',
                    questionCategory: 'History',
                  ),
                  const QuestionWidget(
                    questionText:
                        'What is the name of the smallest unit of life?',
                    questionCategory: 'Sciences',
                  ),
                  const QuestionWidget(
                    questionText:
                        'In physics, what term is used to describe the resistance of an object to changes in its state of motion?',
                    questionCategory: 'Sciences',
                  ),
                  const QuestionWidget(
                    questionText:
                        'What is the name of the character played by Hugh Jackman in the X-Men movies?',
                    questionCategory: 'Arts',
                  ),
                  const QuestionWidget(
                    questionText:
                        'Who wrote the novel "The Catcher in the Rye"?',
                    questionCategory: 'Arts',
                  ),
                  const QuestionWidget(
                    questionText:
                        'What is the highest-grossing film of all time (not adjusted for inflation)?',
                    questionCategory: 'Arts',
                  ),
                  const QuestionWidget(
                    questionText:
                        'Who was the first president of the United States of America?',
                    questionCategory: 'History',
                  ),
                  const QuestionWidget(
                    questionText: 'In what year did World War II end?',
                    questionCategory: 'History',
                  ),
                  const QuestionWidget(
                    questionText:
                        'Who was the first female Prime Minister of the United Kingdom?',
                    questionCategory: 'History',
                  ),
                  const QuestionWidget(
                    questionText: 'In which sport would you use a shuttlecock?',
                    questionCategory: 'Badminton',
                  ),
                ],
              ),
            ),
          ),*/
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.questionText,
    required this.questionCategory,
  });

  final String questionText;
  final String questionCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 70,
                width: 70,
                child: Center(
                    child: Image.asset(
                        'assets/${createImage(questionCategory)}'))),
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Question!',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  questionCategory,
                  textAlign: TextAlign.center,
                ),
                Text(
                  questionText,
                  textAlign: TextAlign.center,
                )
              ],
            )),
        const SizedBox(
          height: 100,
          width: 20,
        )
      ],
    );
  }
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
