import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';


class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  @override
  Widget build(BuildContext context) {
    return buildDrawer(context);
  }

  Widget buildDrawer(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/images/aa.jpg'),
            ),
            ListTile(
              leading: Icon(Icons.notifications,
              color: Colors.amber,),
              title: Text('通知'),
            ),
            ListTile(leading: Icon(Icons.home,
              color: Colors.cyan,),
              title: Text('首页'),),
            ListTile(leading: Icon(Icons.web,
              color: Colors.brown,),
              title: Text("广播"),),
            ListTile(leading: Icon(Icons.wb_cloudy_sharp,
              color: Colors.blue,),
              title: Text('天气'),),
          ],
        ),
      ),
      endDrawer: Drawer(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Center(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Builder(
            builder: (BuildContext context){
              return ElevatedButton(
                child: Text(
                  '点我，弹出&隐藏Drawer',
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}