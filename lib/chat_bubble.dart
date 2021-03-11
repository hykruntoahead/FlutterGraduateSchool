
import 'package:flutter/material.dart';

class ChatBubbleInstance extends StatefulWidget{
  ChatBubbleInstance({Key key,this.title}):super(key: key);
  final String title;
  
  @override
  __MyChatBubbleState createState() => __MyChatBubbleState();
}

class __MyChatBubbleState extends State<ChatBubbleInstance> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _createChatBubbleWidgets(),
      ),
    );
  }

 Column _createChatBubbleWidgets() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _createChatBubble(),
          _emptySpaceBetween(),
          _createCircleDecorImage(),
          _emptySpaceBetween(),
          _createPicturePlaceholder()
        ],
      );
 }
}

// 聊天气泡(.9图实现)
Container _createChatBubble() {
  return Container(
    width: 200,
    padding: EdgeInsets.only(left: 8,top: 8,right: 20,bottom: 8),
    decoration: BoxDecoration(
      image: DecorationImage(
        centerSlice: Rect.fromLTWH(20,10,1,60),
        image: AssetImage(
          'assets/images/chat.png',
        ),
        fit: BoxFit.fill)),
    child: Text(
      '边想边讲边走,直到最后路上花也没有,绿草也没有,只余小沙丘.'
      '边想边讲边走,直到最后路上花也没有,绿草也没有,只余小沙丘.'
      '边想边讲边走,直到最后路上花也没有,绿草也没有,只余小沙丘.',
    ),
  );
}

Container _emptySpaceBetween() {
  return Container(
    height: 32,
  );
}

// 圆形带边框的头像
Container _createCircleDecorImage() {
  return Container(
    width: 200,
    height: 200,
    padding: EdgeInsets.all(3),
    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blue),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/aa.jpg'),
          fit: BoxFit.cover),
      ),
    ),
  );
}

//图片占位符
_createPicturePlaceholder() {
  return Image.network(
    'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
    height: 200,
    width: 200,
    fit: BoxFit.cover,
    frameBuilder: ( BuildContext context,
        Widget child,
        int frame,
        bool wasSynchronouslyLoaded,
    ){
        if(frame == null){
          return Image.asset(
            'assets/images/place.png',
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          );
        }
        return child;
    },
  );
}
