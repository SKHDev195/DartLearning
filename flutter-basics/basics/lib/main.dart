import 'package:basics/application/theme_service.dart';
import 'package:basics/presentation/navigation_example_screens/screen_one.dart';
import 'package:basics/presentation/navigation_example_screens/screen_two.dart';
import 'package:basics/root_bottom_navigation.dart';
import 'package:basics/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => ThemeService(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDark ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const RootBottomNavigation(),
        initialRoute: '/root',
        routes: {
          '/root': (BuildContext context) => const RootBottomNavigation(),
          '/screenOne': (BuildContext context) => const ScreenOne(),
          '/screenTwo': (BuildContext context) => const ScreenTwo(),
        },
      );
    });
  }
}
