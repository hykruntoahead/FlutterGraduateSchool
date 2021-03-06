
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/position_decoration_widget/histogram.dart';
import 'package:flutter_app_demo/position_decoration_widget/personal_info.dart';

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
            body: CylinderChart()
            // PersonalDemo()
        )
    );
  }
}