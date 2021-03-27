import 'package:flutter/material.dart';
import 'package:flutter_app_demo/application_level_components/app_bar_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AppBarPage(),
      // buildMaterialAppBar(),
    );
  }
}
