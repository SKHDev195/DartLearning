import 'package:flutter/widgets.dart';

class ThemeService extends ChangeNotifier {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
