import 'package:flutter/material.dart';

class ScaleAnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimationDemo();
}

class _ScaleAnimationDemo extends State<ScaleAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = Tween(begin: .5, end: .1).animate(_animationController);

    //开始动画
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        height: 200,
        width: 200,
        color: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


class AnimatedWidgetDemo extends StatefulWidget {
  @override
  _AnimatedWidgetDemoState createState() => _AnimatedWidgetDemoState();
}

class _AnimatedWidgetDemoState extends State<AnimatedWidgetDemo> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 2),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _opacity = 0;
            });
          },
          child: Container(
            height: 60,
            width: 150,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}


class AnimatedBuilderDemo extends StatefulWidget {
  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<Size> _sizeAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
    _sizeAnimation =
        SizeTween(begin: Size(100.0, 50.0), end: Size(200.0, 100.0))
            .animate(_controller);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return Container(
            width: _sizeAnimation.value.width,
            height: _sizeAnimation.value.height,
            color: _colorAnimation.value,
          );
        },
      ),
    );
  }
}



