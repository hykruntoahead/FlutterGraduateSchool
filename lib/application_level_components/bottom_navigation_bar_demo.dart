
import 'package:flutter/material.dart';


class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return buildBottomNavigation(context);
  }

  Widget buildBottomNavigation(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      bottomNavigationBar: BottomNavigationBar(
        //默认type为fixed
        type:BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,

        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('首页'),icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('书籍'),icon: Icon(Icons.book)),
          BottomNavigationBarItem(title: Text('我的'),icon: Icon(Icons.perm_identity)),
        ],
      ),
    );
  }
}
