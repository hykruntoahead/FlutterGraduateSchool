package com.example.flutter_app_demo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
//        MethodChannelDemo(this,flutterEngine.dartExecutor.binaryMessenger)
        BasicMessageChannelDemo(this,flutterEngine.dartExecutor.binaryMessenger);
    }
}