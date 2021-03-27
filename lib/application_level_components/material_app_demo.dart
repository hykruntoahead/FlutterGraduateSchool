import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('ykhe'),
        )),
      title: 'ykhe',
      theme: ThemeData(
          primaryColor: Colors.red
      ),
      darkTheme: ThemeData(
          primaryColor: Colors.red
      ),
      themeMode: ThemeMode.dark,
      onGenerateTitle: (context) {
        var local = Localizations.localeOf(context);
        if (local.languageCode == 'en') {
          return 'MLHL';
        }
        return '梦里花落';
      },
    );
  }
}
