import 'package:flutter/material.dart';
import 'package:flutter_app_demo/slider_demo.dart';

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
      home: SliderDemo(title: "SlideDemo")
    );
  }
}



