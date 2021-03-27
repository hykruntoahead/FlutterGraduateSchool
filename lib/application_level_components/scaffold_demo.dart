import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        endDrawer: Drawer(),
        appBar: AppBar(
          title: Text('ykhe'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('个人')),
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页'))
          ],
        ),
        body: Center(
          child: Text('程序员'),
        ),
      ),
    );
  }
}
