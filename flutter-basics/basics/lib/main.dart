import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
        ),
      ),
      home: Scaffold(
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Flexible(
                        child: Text(
                          'Just Another Text for Row  - it is very very long for test purposes',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(height: 20, width: 20, color: Colors.blue),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(height: 20, width: 20, color: Colors.green),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        color: Colors.green,
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('Column Child One'),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: const Center(
                            child: Text('Hello World',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20)),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/test.jpg',
                              fit: BoxFit.contain),
                        ),
                        const Positioned(
                            top: 80, left: 20, child: Text('Lego Minifigs')),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://media.cnn.com/api/v1/images/stellar/prod/230326144721-01-formula-equality.jpg?c=16x9&q=w_850,c_fill',
                          ),
                        )),
                    const SizedBox(height: 40, width: 40),
                    MediaQueryExample(),
                    const SizedBox(height: 40, width: 40),
                    Container(
                      height: 300,
                      width: 300,
                      color: Colors.yellow,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Center(
                          child: Container(
                            color: Colors.blue,
                            width: constraints.maxWidth * 0.8,
                            height: constraints.maxHeight / 2,
                            child: const Center(
                              child: Text('LayoutBuilder Example'),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 40, width: 40),
                  ],
                ),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint('clicked'),
          child: const Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.green,
      width: size.width / 2,
      height: size.height / 5,
      child: const Center(
        child: Text('MediaQuery Example'),
      ),
    );
  }
}
