import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavigationAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: OutlineButton(
          child: Text('跳转'),
          onPressed: () {
            // Navigator.push(context, CupertinoPageRoute(builder: (context) {
            //   return _TwoPage();
            // }));
            // _pushPageRoute(context);
            Navigator.push(context, CustomPageRoute(this, _TwoPage()));
          },
        ),
      ),
    );
  }
}

_pushPageRoute(BuildContext context){
  Navigator.push(context,
    PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return _TwoPage();
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation,Widget child){
        return SlideTransition(
          position: Tween(begin: Offset(-1,0),end: Offset(0,0))
                    .animate(animation),
          child: child,
        );
      }));
}

class _TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}


class CustomPageRoute extends PageRouteBuilder {
  final Widget currentPage;
  final Widget newPage;

  CustomPageRoute(this.currentPage, this.newPage)
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    currentPage,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Stack(
          children: <Widget>[
            SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0, 0),
                end: const Offset(0, -1),
              ).animate(animation),
              child: currentPage,
            ),
            SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset(0, 0),
              ).animate(animation),
              child: newPage,
            )
          ],
        ),
  );
}


