import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidgetInstance {
  Column createTextWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _createTransitionColorText(),
        emptySpaceBetween(),
        _createLabeledText(),
        emptySpaceBetween(),
        _createServiceAgreementText(),
        emptySpaceBetween(),
        _createLoginInput(),
        emptySpaceBetween(),
        _createCommentReplyText()
      ],
    );
  }

// 过渡颜色的文字: Builder组件是为了计算当前Text组件大小，生成LinearGradient
  Builder _createTransitionColorText() {
    return Builder(builder: (BuildContext context) {
      RenderBox box = context.findRenderObject();
      final Shader linearGradient = LinearGradient(
        colors: <Color>[Colors.purple, Colors.blue],
      ).createShader(Rect.fromLTWH(0.0, 0.0, box?.size?.width?.toDouble(),
          box?.size?.height?.toDouble()));

      return Text(
        "专注flutter技术及应用实战",
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = linearGradient),
      );
    });
  }

//带前后置标签的文本
  RichText _createLabeledText() {
    return RichText(
        text: TextSpan(style: defaultTextStyle(), children: <InlineSpan>[
      WidgetSpan(
          child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue),
        child: Text(
          '判断题',
          style: TextStyle(color: Colors.white),
        ),
      )),
      TextSpan(text: '鬼兔赛跑跑不过没有风火轮骑着猪的太乙真人'),
    ]));
  }

//通常在登录页面的底部会出现登录即代表同意并阅读 《服务协议》，其中**《服务协议》**为蓝色且可点击：
  Text _createServiceAgreementText() {
    return Text.rich(TextSpan(
        text: '登录即代表同意并继续',
        style: TextStyle(fontSize: 16, color: Color(0xff999999)),
        children: [
          TextSpan(
              text: '<服务协议>',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("你点击了<服务协议>");
                })
        ]));
  }

//登录密码输入框
  TextField _createLoginInput() {
    return TextField(
      decoration: InputDecoration(
        fillColor: Color(0x30cccccc),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00ff0000),width: 4),
            borderRadius: BorderRadius.all(Radius.circular(100))),
        hintText: '输入密码',
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000),width: 4),
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
      textAlign: TextAlign.center,
      obscureText: true,
      onChanged: (value) {
        print("value=" + value);
      },
    );
  }

  //评论回复
  Text _createCommentReplyText(){
    return Text.rich(
      TextSpan(
        text: '回复',
        style: TextStyle(fontSize: 16,color: Color(0xff999999)),
        children: [
          TextSpan(
            text: '@ykhe',
            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = (){
                print('ykhe onTap');
              }
          ),
          TextSpan(
            text: '你好,flutter有学习前景吗?值得花精力去学吗?'
          )
        ]
      ),
    );
  }

  TextStyle defaultTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 16);
  }

  Container emptySpaceBetween() {
    return Container(
      height: 20,
    );
  }
}
