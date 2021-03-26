
import 'package:flutter/material.dart';

class ShapeDemo extends StatefulWidget {
  @override
  _ShapeDemoState createState() => _ShapeDemoState();
}

class _ShapeDemoState extends State<ShapeDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // SizedBox(
        //   height: 24,
        // ),
        // _buildShapeButton(context),
        // SizedBox(
        //   height: 24,
        // ),
        // _buildShapeButton2(context),
        // SizedBox(
        //   height: 24,
        // ),
        // _buildShapeButton3(context),
        SizedBox(
          height: 24,
        ),
        _buildClipRect(context),
        SizedBox(
          height: 24,
        ),
        _buildClipRRect(context),
        SizedBox(
          height: 24,
        ),
        _buildClipOval(context),
        SizedBox(
          height: 24,
        ),
        _buildClipPath(context),
        SizedBox(
          height: 24,
        ),
        _buildCustomClipper(context),
        SizedBox(
          height: 24,
        ),
        _buildShapeButton(context),
      ],
    );
  }

  _buildShapeButton(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      child: Text('ykheee'),
      shape: BeveledRectangleBorder(
        side: BorderSide(width: 1, color: Colors.red),
        // borderRadius: BorderRadius.circular(10),
        // borderRadius: BorderRadius.circular(100),
        borderRadius: BorderRadius.circular(0),
      ),
      onPressed: () {
        print("onPressed click");
      },
    );
  }

  _buildShapeButton2(BuildContext context) {
    return RaisedButton(
      shape: Border(
        top: BorderSide(color: Colors.red, width: 10),
        right: BorderSide(color: Colors.blue, width: 10),
        bottom: BorderSide(color: Colors.yellow, width: 10),
        left: BorderSide(color: Colors.green, width: 10),
      ),
      child: Text('ykheee'),
      onPressed: () {},
    );
  }

  _buildShapeButton3(BuildContext context) {
    return RaisedButton(
      // shape: CircleBorder(side: BorderSide(color: Colors.red)),
      shape: StadiumBorder(
        side: BorderSide(color: Colors.red),
      ),
      child: Text('ykheee'),
      onPressed: () {},
    );
  }

  _buildClipRect(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.5,
        child: Container(
          height: 150,
          width: 150,
          child: Image.asset(
            'images/1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _buildClipRRect(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Container(
        height: 150,
        width: 150,
        child: Image.asset(
          'images/1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildClipOval(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 150,
        width: 250,
        child: Image.asset(
          'images/1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildClipPath(BuildContext context) {
    return ClipPath.shape(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 150,
          width: 150,
          child: Image.asset(
            'images/1.png',
            fit: BoxFit.cover,
          ),
        ));
  }

  _buildCustomClipper(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: TrianglePath(),
        child: Container(
          height: 150,
          width: 250,
          child: Image.asset(
            'images/1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

//使用CustomClipper可以绘制出任何我们想要的形状，比如三角形
class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
