import 'package:basics/presentation/navigation_example_screens/screen_one.dart';
import 'package:basics/presentation/navigation_example_screens/screen_two.dart';
import 'package:basics/root_bottom_navigation.dart';
import 'package:basics/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
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
  }
}
