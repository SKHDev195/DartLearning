import 'package:basics/presentation/counter/counter_screen.dart';
import 'package:basics/presentation/list/list_screen.dart';
import 'package:basics/presentation/theme_animation/theme_animation_screen.dart';
import 'package:basics/presentation/widget_examples/widget_examples_screen.dart';
import 'package:flutter/material.dart';

class RootBottomNavigation extends StatefulWidget {
  const RootBottomNavigation({super.key});

  @override
  State<RootBottomNavigation> createState() => _RootBottomNavigationState();
}

class _RootBottomNavigationState extends State<RootBottomNavigation> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          WidgetExamplesScreen(),
          CounterScreen(),
          ListScreen(),
          ThemeAnimationScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Examples",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Counter",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens),
            label: "Theme",
          ),
        ],
      ),
    );
  }
}
