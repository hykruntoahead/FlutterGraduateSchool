import 'package:flutter/material.dart';

class CurveDemo extends StatefulWidget {
  @override
  _CurveDemoState createState() => _CurveDemoState();
}

class _CurveDemoState extends State<CurveDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {});
      });

    _animation = Tween(begin: 100.0, end: 200.0)
        // .chain(CurveTween(curve: Curves.bounceIn))
        .chain(CurveTween(curve:_StairsCurve(5)))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _controller.forward();
        },
        child: Container(
          height: _animation.value,
          width: _animation.value,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            '点我变大',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _StairsCurve extends Curve {
  //阶梯的数量
  final int num;
  double _perStairY;
  double _perStairX;

  _StairsCurve(this.num) {
    _perStairY = 1.0 / (num - 1);
    _perStairX = 1.0 / num;
  }

  @override
  double transformInternal(double t) {
    //floor 求一个最接近它的整数，它的值小于或等于这个浮点数
    return _perStairY * (t / _perStairX).floor();
  }
}