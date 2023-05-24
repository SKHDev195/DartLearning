import 'package:flutter/material.dart';

class QuestionsAppTheme {
  QuestionsAppTheme._();

  static const _primaryColorLight = Color(0xF5EFAD43);

  static const _primaryColorDark = Color(0xF5151E28);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColorDark,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColorDark,
      brightness: Brightness.dark,
    ),
  );
}
