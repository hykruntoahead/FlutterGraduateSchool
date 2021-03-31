import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class AnimationCoreDemo extends StatefulWidget{
     @override
  State<StatefulWidget> createState() => _AnimationCoreState();

}


class _AnimationCoreState extends State<AnimationCoreDemo> with TickerProviderStateMixin{

  AnimationController _colorController;
  AnimationController _sizeController;

  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _sizeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {});
      });

    _colorController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500))
      ..addListener(() {
        setState(() {

        });
      });

    _sizeAnimation =
        Tween(begin: 100.0,end: 200.0)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(_sizeController);

    _colorAnimation = _colorController.
          drive(CurveTween(curve: Curves.bounceIn)).
          drive(ColorTween(begin: Colors.red,end: Colors.blue));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          if(_sizeController.isAnimating) return;
          if(_sizeController.isDismissed) {
            _sizeController.forward();
            _colorController.forward();
          }
          if(_sizeController.isCompleted){
            _sizeController.reverse();
            _colorController.reverse();
          }
        },
        child: Container(
          height: _sizeAnimation.value,
          width: _sizeAnimation.value,
          color: _colorAnimation.value,
          alignment: Alignment.center,
          child: Text(
              '点我变化',
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _colorController.dispose();
    _sizeController.dispose();
  }
}