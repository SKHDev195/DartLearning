import 'question_category.dart';

class Question {
  late final String _questionText;
  late final QuestionCategory _questionCategory;
  late final String _hintOne;
  late final String _hintTwo;
  late final String _solution;

  String get questionText => _questionText;
  QuestionCategory get questionCategory => _questionCategory;
  String get image => _questionCategory.image;
  String get hintOne => _hintOne;
  String get hintTwo => _hintTwo;
  String get solution => _solution;

  Question(
      {required String questionText,
      required QuestionCategory questionCategory,
      required String hintOne,
      required String hintTwo,
      required String solution})
      : _questionText = questionText,
        _questionCategory = questionCategory,
        _hintOne = hintOne,
        _hintTwo = hintTwo,
        _solution = solution;
}
