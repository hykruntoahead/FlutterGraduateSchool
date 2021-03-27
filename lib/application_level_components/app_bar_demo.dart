import 'dart:html';

import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

var tabController;

class _AppBarPageState extends State<AppBarPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildAppBarRoute(context);
  }
}

buildMaterialAppBar() {
  return Scaffold(
    appBar: AppBar(
      leading: BackButton(),
      title: Text('何'),
    ),
  );
}

buildAppBarRoute(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      iconTheme:IconThemeData(size: 24),
      actionsIconTheme: IconThemeData(size: 24),
      textTheme: TextTheme(title: TextStyle(color: Colors.red)),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
            topRight: Radius.circular(20))
      ),
      backgroundColor: Colors.blue,
      title: Text('三国志'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: () {},
        )
      ],
      bottom: TabBar(tabs: <Widget>[
        Text('语文'),
        Text('数学'),
        Text('英语'),
        Text('体育'),
        Text('音乐'),
      ], controller: tabController),
    ),
    body: Center(
      child: ElevatedButton(
        child: Text('跳转'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('何1'),
              ),
            );
          }));
        },
      ),
    ),
  );
}
