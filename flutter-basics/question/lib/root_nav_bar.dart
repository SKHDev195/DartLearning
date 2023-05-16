import 'package:flutter/material.dart';
import 'package:question/presentation/components/questions_all.dart';
import 'package:question/presentation/new_question_screen/new_question_screen.dart';
import 'package:question/presentation/questions_screen/questions_screen.dart';

class RootNavBar extends StatefulWidget {
  RootNavBar({super.key});

  final _screens = [
    QuestionsScreen(questionList: questionsAll),
    const NewQuestionScreen(),
  ];

  @override
  State<RootNavBar> createState() => _RootNavBarState();
}

class _RootNavBarState extends State<RootNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return _createHorizontalQuestionNavbar();
    } else {
      return _createVerticalQuestionNavbar();
    }
  }

  Scaffold _createHorizontalQuestionNavbar() {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: widget._screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: "Questions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: "Add Question",
          )
        ],
      ),
    );
  }

  Scaffold _createVerticalQuestionNavbar() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            groupAlignment: 0.0,
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            trailing: const SizedBox(),
            leading: const SizedBox(),
            labelType: NavigationRailLabelType.all,
            selectedIndex: _currentIndex,
            backgroundColor: Colors.amber,
            selectedLabelTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.question_answer),
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Questions"),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add_task),
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Add Question"),
                ),
              )
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
            color: Colors.black,
          ),
          Flexible(
            child: IndexedStack(
              index: _currentIndex,
              children: widget._screens,
            ),
          )
        ],
      ),
    );
  }
}
