import 'package:flutter/material.dart';

import 'caculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.black, fontSize: 16),
            )),
        home: Scaffold(
          body: Calculator(),
        )
      //TextWidgetInstance(title:"TextWidgetInstance")
      // SliderDemo(title: "SlideDemo")
    );
  }
}
