import 'package:flutter/material.dart';

class LoginProgressDemo extends StatefulWidget {
  @override
  _LoginProgressState createState() => _LoginProgressState();
}

class _LoginProgressState extends State<LoginProgressDemo> {
  LoginStatus _status = LoginStatus.none;

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: _buildLoginButton(context),
      );

  }

  _buildLoginButton(BuildContext context){
    return MaterialButton(
      color: Colors.blue,
      minWidth: 240,
      height: 64,
      onPressed: () {
        setState(() {
          if (_status == LoginStatus.loading) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('is on loading...'),
              duration: Duration(milliseconds: 1500),
            ));
            return;
          }

          _status = LoginStatus.loading;
          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              _status = LoginStatus.complete;
            });
          });
        });
      },
      child: _buildWidget(),
    );
  }

  _buildWidget() {
    if (_status == LoginStatus.none) {
      return Text(
        '登录',
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    } else if (_status == LoginStatus.loading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_status == LoginStatus.complete) {
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    }
  }
}

enum LoginStatus { none, loading, complete }
