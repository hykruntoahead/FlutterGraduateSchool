import 'dart:ui';

import 'package:flutter/material.dart';

class InteractiveViewerExample extends StatefulWidget {
  @override
  _InteractiveViewerExampleState createState() =>
      _InteractiveViewerExampleState();
}

const int _rowCount = 20;
const int _columnCount = 10;

class _InteractiveViewerExampleState extends State<InteractiveViewerExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildConstrainedInteractiveViewer()],
    );
  }

  // _buildInteractiveViewer() {
  //   return InteractiveViewer(
  //     child:
  //         Container(
  //           child:Image.asset('assets/images/go_board_09x09.png'),
  //           width: 400,
  //           height: 400,
  //         ),
  //
  //     //alignPanAxis 参数表示是否只在水平和垂直方向上拖拽，默认为false，设置为true，无法沿着对角线（斜着）方向移动
  //     alignPanAxis: false,
  //
  //     maxScale: 2,
  //     minScale: 1,
  //     scaleEnabled: true,
  //   );
  //
  // }

  _buildConstrainedInteractiveViewer() {
    return Center(
        child: Container(
      height: 300,
      width: 300,
      child: InteractiveViewer(
        constrained: false,
        child: Table(
          columnWidths: <int, TableColumnWidth>{
            for (int column = 0; column < _columnCount; column += 1)
              column: const FixedColumnWidth(100.0),
          },
          children: <TableRow>[
            for (int row = 0; row < _rowCount; row += 1)
              TableRow(
                children: <Widget>[
                  for (int column = 0; column < _columnCount; column += 1)
                    Container(
                      height: 50,
                      color:
                          row % 2 + column % 2 == 1 ? Colors.red : Colors.green,
                    ),
                ],
              ),
          ],
        ),
      ),
    ));
  }
}
