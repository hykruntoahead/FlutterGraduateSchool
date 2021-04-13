import 'package:flutter/material.dart';

class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        child: Text('A 页面'),
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return BPage();
          // }));
          // Navigator.of(context).pushNamed('/B');
          Navigator.of(context).pushNamed('/B',arguments: '来自A');
        },
      ),
    );
  }
}

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          // child: Text('B 页面'),
          child: Text('B 页面 , ${ModalRoute.of(context).settings.arguments}'),
          onPressed: () {
            // Navigator.of(context).pop();
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return APage();
            // }));
            // Navigator.of(context).pushReplacementNamed('/C');
            Navigator.of(context).pushNamed('/C');
          },
        ),
      ),
    );
  }
}

class CPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          child: Text('C 页面'),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('/D', ModalRoute.withName('/B'));
          },
        ),
      ),
    );
  }
}


class DPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          child: Text('D 页面'),
          onPressed: () { 
            if(Navigator.of(context).canPop()){
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
