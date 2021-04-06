
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';


class ShareAxisDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShareAxisDemo();
}

class _ShareAxisDemo extends State<ShareAxisDemo> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget _child = _OnePage();
    switch (_currentIndex) {
      case 1:
        _child = _TwoPage();
        break;
    }
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 1500),
        reverse: false,
        transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            transitionType: SharedAxisTransitionType.scaled,
            secondaryAnimation: secondaryAnimation,
          );
        },
        child: _child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('我的'), icon: Icon(Icons.perm_identity)),
        ],
      ),
    );
  }
}

class _OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.withOpacity(.5),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/abc.jpg',
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
      ),
    );
  }
}

class _TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.withOpacity(.5),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/abc.jpg',
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
      ),
    );
  }
}

