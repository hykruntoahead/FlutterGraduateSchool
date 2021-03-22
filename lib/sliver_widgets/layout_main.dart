import 'package:flutter/material.dart';
import 'package:flutter_app_demo/layout_widget/expand_collapse_menu_horizontally.dart';
import 'package:flutter_app_demo/layout_widget/half_circle_menu_demo.dart';
import 'package:flutter_app_demo/layout_widget/imitation_nuggets_i_effect.dart';
import 'package:flutter_app_demo/layout_widget/indexed_stack_demo.dart';
import 'package:flutter_app_demo/layout_widget/wrap_layout_demo.dart';
import 'package:flutter_app_demo/sliver_widgets/sliver_app_bar_demo.dart';

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
        body: SliverAppBarDemo()
      )
    );
  }
}



