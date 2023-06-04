import 'package:advisor/2_application/core/services/theme_service.dart';
import 'package:advisor/2_application/pages/advice/advisor_page.dart';
import 'package:advisor/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const AdvisorApp(),
      create: (context) => ThemeService(),
    ),
  );
}

class AdvisorApp extends StatelessWidget {
  const AdvisorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDark ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdvicePageWrapperProvider(),
      );
    });
  }
}
