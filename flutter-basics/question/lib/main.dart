import 'package:flutter/material.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/questions_screen/widgets/question_separator.dart';
import 'package:question/presentation/questions_screen/widgets/question_widget.dart';
import 'presentation/components/question.dart';

void main() {
  runApp(QuestionApp(
    questionList: questionsAll,
  ));
}

class QuestionApp extends StatefulWidget {
  QuestionApp({super.key, required this.questionList});

  final List<Question> questionList;

  @override
  State<QuestionApp> createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
  final List<Question> _displayedQuestions = [];

  final _valueNotifier = ValueNotifier(false);

  final _scrollController = ScrollController();

  void _addNewQuestion() {
    setState(() {
      if (_displayedQuestions.length < widget.questionList.length) {
        _displayedQuestions.add(widget.questionList[0]);
        _valueNotifier.value = !_valueNotifier.value;

        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
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
          body: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ValueListenableBuilder(
                valueListenable: _valueNotifier,
                builder: (context, constraints, value) {
                  return LayoutBuilder(builder: (context, constraints) {
                    late Axis contentDirection;
                    if (constraints.maxWidth > 600) {
                      contentDirection = Axis.horizontal;
                    } else {
                      contentDirection = Axis.vertical;
                    }
                    return ListView.separated(
                      controller: _scrollController,
                      scrollDirection: contentDirection,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _displayedQuestions.length,
                      separatorBuilder: (context, index) {
                        return const QuestionSeparator();
                      },
                      itemBuilder: (context, index) {
                        return QuestionWidget(
                          questionCategory:
                              widget.questionList[index].questionCategory,
                          questionText: widget.questionList[index].questionText,
                          questionNumber: index + 1,
                          widgetDirection: contentDirection,
                        );
                      },
                    );
                  });
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addNewQuestion(),
            child: const Icon(Icons.add),
          ),
        ));
  }
}
