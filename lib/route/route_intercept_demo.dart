import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.black, fontSize: 16),
            )),

        home :MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<NavigatorState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    DateTime _lastQuitTime;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: WillPopScope(
          // onWillPop: () async {
          //   if (_key.currentState.canPop()) {
          //     _key.currentState.pop();
          //     return false;
          //   }
          //   return true;
          // },
          onWillPop: () async {
            if (_lastQuitTime == null ||
                DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
              print('再按一次 Back 按钮退出');
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('再按一次 Back 按钮退出')));
              _lastQuitTime = DateTime.now();
              return false;
            } else {
              print('退出');
              Navigator.of(context).pop(true);
              return true;
            }
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child: Navigator(
                  key: _key,
                  onGenerateRoute: (RouteSettings settings) =>
                      MaterialPageRoute(builder: (context) {
                        return OnePage();
                      }),
                ),
              ),
              Container(
                height: 50,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text('底部Bar'),
              )
            ],
          )),
    );
  }
}

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('去下一个页面'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TwoPage();
              }));
            },
          ),
        ),
      ),
    );
  }
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('这是第二个页面'),
        ),
      ),
    );
  }
}
