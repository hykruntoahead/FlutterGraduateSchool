import 'package:flutter/material.dart';
import 'package:flutter_app_demo/layout_widget/indexed_stack_demo.dart';
import 'package:flutter_app_demo/layout_widget/wrap_layout_demo.dart';

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
        body: WrapDemo()
        // IndexedStackDemo(),
      )
    );
  }
}



