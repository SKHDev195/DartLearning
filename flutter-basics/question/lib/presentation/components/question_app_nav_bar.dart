import 'package:flutter/material.dart';

class QuestionAppNavBar extends StatelessWidget {
  const QuestionAppNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.screens,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final List<Widget> screens;

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
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        selectedItemColor: Colors.white,
        onTap: onTabSelected,
        currentIndex: currentIndex,
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
            selectedIndex: currentIndex,
            backgroundColor: Colors.amber,
            selectedLabelTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            onDestinationSelected: onTabSelected,
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
              index: currentIndex,
              children: screens,
            ),
          )
        ],
      ),
    );
  }
}
