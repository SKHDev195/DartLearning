import 'package:flutter/material.dart';
import 'package:question/presentation/components/question.dart';
import 'package:question/presentation/components/question_category.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/new_question_screen/widgets/form_warning_snackbar.dart';
import 'package:question/presentation/new_question_screen/widgets/submit_question_form_button.dart';
import 'package:question/presentation/new_question_screen/widgets/successful_submission_snackbar.dart';

class NewQuestionScreen extends StatefulWidget {
  const NewQuestionScreen({super.key});

  @override
  State<NewQuestionScreen> createState() => _NewQuestionScreenState();
}

class _NewQuestionScreenState extends State<NewQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _dropdownKey = GlobalKey<FormFieldState>();
  final TextEditingController _questionTextController = TextEditingController();
  final TextEditingController _questionHintOneController =
      TextEditingController();
  final TextEditingController _questionHintTwoController =
      TextEditingController();
  final TextEditingController _questionSolutionController =
      TextEditingController();

  late String _selectedCategory = QuestionCategory.sciences.name;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Question'),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Center(child: Text('Define your question below')),
                const SizedBox(
                  height: 8,
                ),
                Form(
                  autovalidateMode: _autovalidateMode,
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _questionTextController,
                        decoration: const InputDecoration(
                          labelText: 'Question Text *',
                        ),
                        maxLines: 3,
                        textInputAction: TextInputAction.done,
                        validator: (value) => _validateTextField(
                          value: value,
                          isHelp: false,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _questionHintOneController,
                        decoration: const InputDecoration(
                          labelText: 'Question Hint One *',
                        ),
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        validator: (value) => _validateTextField(
                          value: value,
                          isHelp: true,
                        ),
                      ),
                      TextFormField(
                        controller: _questionHintTwoController,
                        decoration: const InputDecoration(
                          labelText: 'Question Hint Two *',
                        ),
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        validator: (value) => _validateTextField(
                          value: value,
                          isHelp: true,
                        ),
                      ),
                      TextFormField(
                        controller: _questionSolutionController,
                        decoration: const InputDecoration(
                          labelText: 'Question Solution *',
                        ),
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        validator: (value) => _validateTextField(
                          value: value,
                          isHelp: true,
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        key: _dropdownKey,
                        validator: (value) =>
                            _validateCategoryField(value: value),
                        decoration: const InputDecoration(
                          labelText: 'Question Category',
                        ),
                        items: QuestionCategory.values
                            .map((QuestionCategory questionCategory) {
                          return DropdownMenuItem<String>(
                            value: questionCategory.name,
                            child: Text(_capitalizeCategoryName(
                              value: questionCategory.name,
                            )),
                          );
                        }).toList(),
                        onChanged: (String? questionCategory) {
                          setState(
                            () {
                              _selectedCategory =
                                  questionCategory ?? 'Sciences';
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SubmitQuestionFormButton(
                        onTap: _submitForm,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dynamic _validateTextField({required String? value, required bool isHelp}) {
    if (!isHelp) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      } else if (value.length > 200) {
        return 'Please make your question shorter';
      } else if (value[value.length - 1] != '?') {
        return 'A question must end in a question mark';
      }
      return null;
    } else {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      } else if (value.length > 50) {
        return 'Please make your hint/solution shorter';
      }
      return null;
    }
  }

  @override
  void dispose() {
    FocusScope.of(context).unfocus();
    super.dispose();
  }

  dynamic _validateCategoryField({required String? value}) {
    if (value == null) {
      return 'Please choose a category';
    } else {
      return null;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      questionsAll.add(
        Question(
          questionText: _questionTextController.text,
          hintOne: _questionHintOneController.text,
          hintTwo: _questionHintTwoController.text,
          solution: _questionSolutionController.text,
          questionCategory: QuestionCategory.values.byName(_selectedCategory),
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SuccessfulSubmissionSnackBar());
      _questionTextController.clear();
      _questionHintOneController.clear();
      _questionHintOneController.clear();
      _questionHintTwoController.clear();
      _questionSolutionController.clear();
      _dropdownKey.currentState!.reset();
      setState(() {});
    } else {
      setState(
        () {
          _formKey.currentState!.validate();
          _autovalidateMode = AutovalidateMode.always;
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(FormWarningSnackBar());
    }
  }

  String _capitalizeCategoryName({required String value}) {
    if (value.isEmpty) {
      return value;
    }

    String firstChar = value[0];
    String restOfString = value.substring(1);

    if (firstChar == firstChar.toUpperCase()) {
      return value;
    }
    return firstChar.toUpperCase() + restOfString;
  }
}
