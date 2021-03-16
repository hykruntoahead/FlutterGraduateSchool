import 'package:flutter/material.dart';


//仿 掘金-我-头部的效果

class PersonalDemo extends StatefulWidget {
  @override
  _PersonalDemoState createState() => _PersonalDemoState();
}

class _PersonalDemoState extends State<PersonalDemo> {
  @override
  Widget build(BuildContext context) {
     return _buildPersonalContainer();
  }
}

_buildCircleImg(){
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(image: AssetImage('assets/images/logo.png'))
    ),
  );
}

_buildCenter(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Flutter L',style: TextStyle(fontSize: 20),),
      Text('Flutter,Android',style: TextStyle(color: Colors.grey),),
    ],
  );
}

_buildEndArrow(){
  return Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14,);
}

_buildPersonalContainer(){
  return Container(
    color: Colors.grey.withOpacity(.5),
    alignment: Alignment.center,
    height: 100,
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 15,
        ),
        _buildCircleImg(),
        SizedBox(
          width: 25,
        ),
        Expanded(child: _buildCenter()),
        _buildEndArrow(),
        SizedBox(
          width: 15,
        )
      ],
    ),
  );
}
