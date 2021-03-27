import 'dart:html';

import 'package:flutter/material.dart';

class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  @override
  Widget build(BuildContext context) {
    return buildBottomNavigation(context);
  }

  Widget buildBottomNavigation(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        child: Text('snack_bar'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            content: Row(
              children: <Widget>[
                Icon(Icons.check,color: Colors.green,),
                Text('下载成功')],
            ),
            duration: Duration(seconds: 3),
            //默认为fixed
            behavior: SnackBarBehavior.floating,

            action: SnackBarAction(
              label: '确定',
              onPressed: () {
                print('确定');
              },
            ),
          ));
        },
      ),
    );
  }
}
