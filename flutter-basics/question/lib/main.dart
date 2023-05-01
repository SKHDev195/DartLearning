import 'package:flutter/material.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/widgets/question_widget.dart';
import 'presentation/components/question.dart';

void main() {
  runApp(MyApp(
    questionList: questionsAll,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required List<Question> this.questionList});

  late List<Question> questionList;

  final _valueNotifier = ValueNotifier(false);

  List<QuestionWidget> questionsWidgets = [];

  void _addNewQuestion() {
    if (questionList.isNotEmpty) {
      questionsWidgets.add(QuestionWidget(
        questionText: questionList[0].questionText,
        questionCategory: questionList[0].questionCategory,
      ));
      questionList.removeAt(0);
      _valueNotifier.value = !_valueNotifier.value;
    }
  }

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
          body: ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (context, constraints, value) {
                return LayoutBuilder(builder: (context, constraints) {
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
                          const Text(
                              'To add questions, click on the button below!'),
                          const SizedBox(
                            height: 40,
                            width: 40,
                          ),
                          for (QuestionWidget question in questionsWidgets)
                            question,
                          if (questionList.isEmpty)
                            const Text('There are no more questions!'),
                        ],
                      ),
                    ),
                  );
                });
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addNewQuestion(),
            child: const Icon(Icons.add),
          ),
        ));
  }
}
