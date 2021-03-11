

import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 50,),
        _buildWrap(),
        SizedBox(height: 30,),
        _buildVerticalWrap(),
        SizedBox(height: 30,),
        _buildWrapCrossAxis()
      ],
    );
  }
}

Wrap _buildWrapCrossAxis() {
  return Wrap(
    spacing: 5,
    runSpacing: 3,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: List.generate(10, (i) {
      double w = 50.0 + 10 * i;
      double h = 50.0 + 5 * i;
      return Container(
        color: Colors.primaries[i],
        height: h,
        alignment: Alignment.center,
        width: w,
        child: Text('$i'),
      );
    }),
  );
}

Wrap _buildVerticalWrap() {
  return Wrap(
    direction: Axis.vertical,
    children: List.generate(5, (i) {
      double w = 50.0 + 10 * i;
      return Container(
        color: Colors.primaries[i],
        height: 50,
        width: w,
        child: Text('$i'),
      );
    }),
  );
}

Wrap _buildWrap() {
  return Wrap(
    children: List.generate(10, (i) {
      double w = 50.0 + 10 * i;
      return Container(
        color: Colors.primaries[i],
        height: 50,
        width: w,
        child: Text('$i'),
      );
    }),
  );
}
