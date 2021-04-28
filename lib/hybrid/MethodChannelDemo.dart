
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelDemo extends StatefulWidget {
  @override
  _MethodChannelDemoState createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  var channel = MethodChannel('com.flutter.guide.MethodChannel');

  var _data;
  var _nativeData;

  @override
  void initState() {
    super.initState();
    channel.setMethodCallHandler((call) {
      setState(() {
        _nativeData = call.arguments['count'];
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            child: Text('发送数据到原生'),
            onPressed: () async {
              var result = await channel
                  .invokeMethod('sendData', {'name': 'ykhe', 'age': 27});
              var name = result['name'];
              var age = result['age'];
              setState(() {
                _data = '$name,$age';
              });
            },
          ),
          Text('原生返回数据：$_data'),
          Text('原生端主动发送消息给Flutter:$_nativeData 秒')
        ],
      ),
    );
  }
}
