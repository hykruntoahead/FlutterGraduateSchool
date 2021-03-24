import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildAlertDialog(context),
        SizedBox(
          height: 15,
        ),
        _buildCupertinoAlertDialog(context),
        SizedBox(
          height: 24,
        ),
        _buildSimpleDialog(context),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }

  _buildAlertDialog(BuildContext context) {
    return ElevatedButton(
      child: Text('切换'),
      onPressed: () async {
        var result = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('提示'),
                content: Text('确认删除吗？'),
                actions: <Widget>[
                  TextButton(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.of(context).pop('cancel');
                    },
                  ),
                  TextButton(
                    child: Text('确认'),
                    onPressed: () {
                      Navigator.of(context).pop('ok');
                    },
                  ),
                ],
              );
            });
        print('$result');
      },
    );
  }

  _buildCupertinoAlertDialog(BuildContext context) {
    return ElevatedButton(
      child: Text('弹出ios样式弹窗Dialog'),
      onPressed: () {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('提示'),
                content: Text('确认删除吗？'),
                actions: <Widget>[
                  CupertinoDialogAction(child: Text('取消'),onPressed: (){},),
                  CupertinoDialogAction(child: Text('确认'),onPressed: (){},),
                ],
              );
            });
      },
    );
  }

  _buildSimpleDialog(BuildContext context) {
    return SimpleDialog(
      title: Text('提示'),
      children: <Widget>[
        Container(
          height: 80,
          alignment: Alignment.center,

          child: Text('确认删除吗？'),
        ),
        Divider(height: 1,),
        TextButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop('cancel');
          },
        ),
        Divider(height: 1,),
        TextButton(
          child: Text('确认'),
          onPressed: () {
            Navigator.of(context).pop('ok');
          },
        ),
      ],
    );
  }
}