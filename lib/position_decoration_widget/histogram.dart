// 柱状图
//效果分为3大部分：
//
// 坐标轴，左边和底部黑色直线。
// 矩形柱状图。
// 动画控制部分。

import 'package:flutter/material.dart';

class CylinderChart extends StatefulWidget{
  @override
  _CylinderChartState createState() => _CylinderChartState();
}

class _CylinderChartState extends State<CylinderChart>{
  List<double> _heightList = [60.0,80.0,100.0,120.0,140.0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 250,
        child: Stack(
          children: <Widget>[
            _Axis(),
            Positioned.fill(
              left: 5,
              right: 5,
              child: _buildHistogram(_heightList),
            ),
            Positioned(
              top: 0,
              left: 30,
              child: OutlinedButton(
                child: Text('反转'),
                onPressed: (){
                  setState(() {
                    _heightList = _heightList.reversed.toList();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}

//坐标轴实现
class _Axis extends StatelessWidget {
  final Widget child;

  const _Axis({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black,width: 2),
          bottom: BorderSide(color: Colors.black,width: 2),
        )
      ),
      child: child,
    );
  }
}



//单个柱状图实现
class _Cylinder extends StatelessWidget{
  final double height ;
  final double width;
  final Color color;

  const _Cylinder({Key key,this.height,this.width,this.color})
       :super(key: key);

  @override
  Widget build(BuildContext context) {
     return AnimatedContainer(
       duration: Duration(seconds: 1),
       height: height,
       width: width,
       color: color,
     );
  }
}

//生成多个柱状图
_buildHistogram(List<double> _heightList){
  final double _width=20.0;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: List.generate(_heightList.length, (index){
      return _Cylinder(
        height: _heightList[index],
        width: _width,
        color: Colors.primaries[index % Colors.primaries.length],
      );
    })
  );
}
