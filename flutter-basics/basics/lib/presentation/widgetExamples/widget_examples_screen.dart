import 'package:basics/main.dart';
import 'package:basics/presentation/components/custom_button.dart';
import 'package:basics/presentation/widgetExamples/widgets/first_column_child.dart';
import 'package:basics/presentation/widgetExamples/widgets/hello_world_widget.dart';
import 'package:basics/presentation/widgetExamples/widgets/row_expanded_example.dart';
import 'package:flutter/material.dart';

import '../components/custom_button_gesture.dart';
import 'widgets/box_MB.dart';
import 'widgets/buttons_example.dart';
import 'widgets/layout_builder_example.dart';
import 'widgets/media_query_example.dart';
import 'widgets/stack_MS.dart';

class WidgetExamplesScreen extends StatelessWidget {
  const WidgetExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(centerTitle: true, title: const Text('Flutter Basics')),
      body: Center(
        child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const RowExpandedExample(),
                  const SizedBox(
                    height: 20,
                  ),
                  const FirstColumnChild(),
                  const SizedBox(
                    height: 20,
                  ),
                  const HelloWorldWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const StackMS(),
                  const SizedBox(
                    height: 20,
                  ),
                  const BoxMB(),
                  const SizedBox(height: 40, width: 40),
                  const MediaQueryExample(),
                  const SizedBox(height: 40, width: 40),
                  const LayoutBuilderExample(),
                  const SizedBox(height: 40, width: 40),
                  const ButtonsExample(),
                  const SizedBox(height: 40, width: 40),
                  CustomButton(
                    onTap: () {
                      print('tapped!');
                    },
                    icon: Icons.home,
                    iconColor: Colors.white,
                  ),
                  const SizedBox(height: 40, width: 40),
                  CustomButton(
                    onTap: () {
                      print('tapped!');
                    },
                    icon: Icons.play_arrow,
                    iconColor: Colors.blue,
                  ),
                  const SizedBox(height: 40, width: 40),
                  CustomButtonGesture(
                      onTap: () {
                        print('tagged CBM!');
                      },
                      text: 'gesture button'),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('clicked'),
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}
