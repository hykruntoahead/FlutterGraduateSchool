import 'dart:ui';

import 'package:flutter/material.dart';

class DraggableComponent extends StatefulWidget {
  @override
  _DraggableComponentState createState() => _DraggableComponentState();
}

class _DraggableComponentState extends State<DraggableComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: <Widget>[
              _buildDraggable(),
              SizedBox(
                height: 200,
              ),
              _buildDragTarget()
            ]
        )
    );
  }


  _buildDraggable() {
    return Draggable(
      data: Color(0x000000FF),
      // axis: Axis.vertical,
      child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: Text(
          'ykhe',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      feedback: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Text(
          'ykhe',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      childWhenDragging: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Text(
          'ykhe',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      onDragStarted: () {
        print('onDragStarted');
      },
      onDragEnd: (DraggableDetails details) {
        print('onDragEnd:$details');
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        print('onDraggableCanceled velocity:$velocity,offset:$offset');
      },
      onDragCompleted: () {
        print('onDragCompleted');
      },
    );
  }

  var _dragData;

  _buildDragTarget() {
    return DragTarget<Color>(
      builder: (BuildContext context, List<Color> candidateData,
          List<dynamic> rejectedData) {
        print('candidateData:$candidateData,rejectedData:$rejectedData');
        return _dragData == null
            ? Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.red)),
        )
            : Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'ykhe',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
      onWillAccept: (Color color) {
        print('onWillAccept:$color');
        return true;
      },
      onAccept: (Color color) {
        setState(() {
          _dragData = color;
        });
        print('onAccept:$color');
      },
      onLeave: (Color color) {
        print('onLeave:$color');
      },
    );
  }

}