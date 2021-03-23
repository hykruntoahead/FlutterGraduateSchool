import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoDatePickerDemo extends StatefulWidget {
  @override
  _CupertinoDatePickerDemoState createState() =>
      _CupertinoDatePickerDemoState();
}

class _CupertinoDatePickerDemoState extends State<CupertinoDatePickerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 200,
          color: Colors.grey.withOpacity(.5),
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (date) {
              print('$date');
            },
          ),
        ),
      ),
    );
  }
}
