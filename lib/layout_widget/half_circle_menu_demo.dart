import 'dart:math';

import 'package:flutter/material.dart';

class DemoCircleFlowMenu extends StatefulWidget {
  @override
  _DemoFlowMenuState createState() => _DemoFlowMenuState();
}

class _DemoFlowMenuState extends State<DemoCircleFlowMenu>
    with TickerProviderStateMixin {
  //动画需要这个类来混合
  //动画变量,以及初始化和销毁
  AnimationController _ctrlAnimationCircle;

  @override
  void initState() {
    super.initState();
    _ctrlAnimationCircle = AnimationController(
        lowerBound: 0,
        upperBound: 180,
        duration: Duration(milliseconds: 300),
        vsync: this);
    _ctrlAnimationCircle.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    //销毁变量,释放资源
    _ctrlAnimationCircle.dispose();
  }

  //生成Flow数据
  List<Widget> _buildFlowChildren() {
    return List.generate(
        5,
        (index) => Container(
              child: Icon(
                index.isEven ? Icons.timer : Icons.ac_unit,
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: Flow(
          delegate: FlowAnimatedCircle(_ctrlAnimationCircle.value),
          children: _buildFlowChildren(),
        )),
        Positioned.fill(
            child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              //点击后让动画可前行或回退
              _ctrlAnimationCircle.status == AnimationStatus.completed
                  ? _ctrlAnimationCircle.reverse()
                  : _ctrlAnimationCircle.forward();
            });
          },
        )),
      ],
    );
  }
}

class FlowAnimatedCircle extends FlowDelegate {
  final double radius;

  FlowAnimatedCircle(this.radius);

  @override
  void paintChildren(FlowPaintingContext context) {
    if (radius == 0) {
      return;
    }

    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      x = radius * cos(i * pi / (context.childCount - 1));
      y = radius * sin(i * pi / (context.childCount - 1));
      print("x=$x;y=$y;i=$i");
      context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
    } //使用Matrix定位每个子组件
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) => true;
}
