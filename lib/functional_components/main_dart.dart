import 'package:flutter/material.dart';
import 'package:flutter_app_demo/functional_components/clip_star_path.dart';
import 'package:flutter_app_demo/functional_components/cupertino_date_picker.dart';
import 'package:flutter_app_demo/functional_components/date_selector.dart';
import 'package:flutter_app_demo/functional_components/dialog_components.dart';
import 'package:flutter_app_demo/functional_components/popup_components.dart';
import 'package:flutter_app_demo/functional_components/shape_components.dart';
import 'package:flutter_app_demo/functional_components/time_selector.dart';
import 'package:flutter_app_demo/gesture_recognition/drawing_board.dart';
import 'package:flutter_app_demo/gesture_recognition/login_progress_button.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'draggable_components.dart';
import 'dragtarget_details.dart';
import 'inter_active_viewer_components.dart';
import 'inter_active_viewer_components2.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh'),
          const Locale('en'),
        ],
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.black, fontSize: 16),
            )),
        home:Scaffold(
            body:InteractiveViewerDemo()
            // InteractiveViewerExample()
            // DragTargetDetailsExample()
            // StartClip()
            // ShapeDemo()
            //DialogDemo()
            // PopupComponent()
            //TimeSelector()
            //DateSelector()
        )
    );
  }
}