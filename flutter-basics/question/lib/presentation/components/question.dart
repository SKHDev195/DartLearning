import 'question_category.dart';

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
