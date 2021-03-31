import 'package:flutter/material.dart';
import 'package:flutter_app_demo/animation/curve_demo.dart';
import 'package:flutter_app_demo/animation/tween_demo.dart';

import 'animation_controller_demo.dart';


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
          body:CurveDemo()
          // TweenDemo(),
          // AnimationBaseDemo(),
        )
      //TextWidgetInstance(title:"TextWidgetInstance")
      // SliderDemo(title: "SlideDemo")
    );
  }
}
