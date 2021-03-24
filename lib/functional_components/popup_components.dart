import 'dart:ui';

import 'package:flutter/material.dart';

class PopupComponent extends StatefulWidget {
  @override
  _DatePopupComponentState createState() => _DatePopupComponentState();
}

class _DatePopupComponentState extends State<PopupComponent> {

  @override
  Widget build(BuildContext context) {
      return Column(
      children: <Widget>[
        _buildPopupMenuButton(context),
        SizedBox(
          height: 24,
        ),
        _buildPopupMenuButton2(context),
        SizedBox(
          height: 24,
        ),
        _buildCheckedPopupMenu(context)
        // _buildTimeRangePicker(context),
      ],
    );
  }

  Widget _buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'PopupMenuButton',
      elevation: 5,
      padding: EdgeInsets.all(5),
      color: Colors.red,
      // child: Text('学科'),
      icon: Icon(Icons.add),
      //弹窗位置
      offset: Offset(0,100),
      // 弹出菜单边框
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.red
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: '语文',
            child: Text('语文'),
          ),
          PopupMenuItem<String>(
            value: '数学',
            child: Text('数学'),
          ),
          PopupMenuItem<String>(
            value: '英语',
            child: Text('英语'),
          ),
          PopupMenuItem<String>(
            value: '生物',
            child: Text('生物'),
          ),
          PopupMenuItem<String>(
            value: '化学',
            child: Text('化学'),
          ),
        ];
      },
    );
  }


  Widget _buildPopupMenuButton2(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value){
        print('$value');
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: '语文',
            enabled: false,
            child: Text('语文'),
          ),
          PopupMenuDivider(),
          PopupMenuItem<String>(
            value: '数学',
            textStyle: TextStyle(color: Colors.red),
            child: Text('数学'),
          ),
          PopupMenuItem<String>(
            value: '英语',
            height: 100,
            child: Text('英语'),
          ),
          PopupMenuItem<String>(
            value: '生物',
            child: Text('生物'),
          ),
          PopupMenuDivider(
            height: 50,
          ),
          PopupMenuItem<String>(
            value: '化学',
            child: Text('化学'),
          ),
        ];
      },
    );
  }




  Widget _buildCheckedPopupMenu(BuildContext context){
    return PopupMenuButton<String>(
      onSelected: (value) {
        print('$value');
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          CheckedPopupMenuItem(
            value: '语文',
            checked: true,
            child: Text('语文'),
          ),
          CheckedPopupMenuItem(
            value: '数学',
            child: Text('数学'),
          ),
        ];
      },
    );
  }
  
  
}