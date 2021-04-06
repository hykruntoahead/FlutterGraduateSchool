import 'package:flutter/material.dart';
import 'package:flutter_app_demo/animation/curve_demo.dart';
import 'package:flutter_app_demo/animation/hero_demo.dart';
import 'package:flutter_app_demo/animation/tween_demo.dart';
import 'package:flutter_app_demo/animation/tween_sequence_demo.dart';

import 'animation_20_widgets.dart';
import 'animation_controller_demo.dart';
import 'animation_core_summary_demo.dart';
import 'animation_list_demo.dart';
import 'fade_scale_transition.dart';
import 'fade_through_transition.dart';
import 'material_motion_shared_axis_demo.dart';


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
          body:FadeScaleTransitionDemo(),
          //FadeThroughTransitionDemo(),
          //ShareAxisDemo(),
          //MaterialMotionDemo(),
          //HeroDemo()
          //AnimatedListDemo(),
          //AnimatedBuilderDemo()
          //AnimatedWidgetDemo(),
          //ScaleAnimationDemo(),
          //AnimationDemo(),
          // CurveDemo()
          // TweenDemo(),
          // AnimationBaseDemo(),
        )
      //TextWidgetInstance(title:"TextWidgetInstance")
      // SliderDemo(title: "SlideDemo")
    );
  }
}
