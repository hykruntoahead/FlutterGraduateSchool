import 'package:flutter/material.dart';
import 'package:flutter_app_demo/gesture_recognition/drawing_board.dart';
import 'package:flutter_app_demo/gesture_recognition/login_progress_button.dart';

import '../scroll_component/customize_scroll_bar.dart';


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
        home:Scaffold(
            body: DrawingBoard()
            // LoginProgressDemo()
        )
    );
  }
}