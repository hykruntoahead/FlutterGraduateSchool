# flutter_app_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 1.跨平台开发演进及准备工作

### 1.1 跨平台开发演进

- 原生阶段:使用原生语言（Android使用Java或Kotlin，iOS使用Objective-C 或 Swift ）开发应用
- Hybird阶段:Hybird实现的基本原理是通过原生的WebView容器加载H5网页进行渲染，通过JavaScript Bridge调用一部分系统能力，同步更新服务器上的H5网页也实现了动态更新，俗称混合应用
- React Native阶段:React Native简称RN，是FaceBook在2015年开源，基于 JavaScript，具备动态配置能力跨平台开发框架。
- 小程序:从技术上来说，小程序（指微信小程序，下同）并不是新的跨平台方案，它使用浏览器内核来渲染界面，小部分由原生组件渲染,小程序的运行环境分成渲染层和逻辑层，通信会经由微信客户端（Native）做中转。
- Flutter:Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面.它既没有使用WebView，也没有使用原生控件进行绘制，而是自己实现了一套高性能渲染引擎来绘制UI，这个引擎就是大名鼎鼎的Skia.


### 1.2  环境安装和配置
  [flutter官网]:https://flutterchina.club/get-started/install/ (起步:安装Flutter)
 
### 1.3 创建flutter项目
##### 创建Flutter项目
Android Studio 作为 IDE，下面使用 Android Studio 创建Flutter项目。
File->New->New Flutter Project.
(注:没有 New Flutter Project 选项,需要先在Settings-Plugin 搜索 flutter插件安装.)
根据提示填入工程名(flutter_app)等,最后创建成功.
##### Flutter app 目录结构:
- android：Android原生代码目录。
- ios：iOS原生代码目录。
- lib：这个是Flutter项目的核心目录，我们写的代码放在这个目录，我们也可以在这个目录创建子目录。
- test：测试代码目录。
- pubspec.yaml：这个是Flutter项目的依赖配置文件，类似于Android build.gradle文件，这里面包含了Flutter SDK 版本、依赖等

##### 运行工程代码分析
代码实现在:lib/main.dart
```
void main() {
  runApp(MyApp());
}
```
main为入口函数,MyApp如下:
```dart
class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```
- MaterialApp：表示使用Material风格，后面会具体介绍Material 风格组件
- title：标题
- theme：主题，这里可以设置全区主题，后面会具体介绍theme
- home：首页，当前加载的Widget，例子中加载的是MyHomePage Widget

 MyHomePage :
 ```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//createState方法中创建了_MyHomePageState,MyHomePageState 如下：
 class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
```
- _counter属性就是App上展示的数字
- incrementCounter方法对counter进行加1操作，点击“+”按钮调用此方法
- setState方法中加1会更新到屏幕上 
- Scaffold：和Material 配合使用的控件
- AppBar：是顶部的区域
- body：表示AppBar以下区域
- Center：容器类控件，子控件居中显示
- Column：容器类控件，子控件垂直排列
- Text：文本控件
- FloatingActionButton：按钮控件，也就是App中“+”按钮

### 1.4 设置应用名称和图标

##### Android 设置App名称、图标
android->app->src->main-> AndroidManifest.xml:
<application 标签中 android:label android:icon 就是代表App名称和图标.

icon的值默认是@mipmap/ic_launcher，其中mipmap是Android的一类资源，在android->app->src->main->res下:
只需要把我们的icon图片替换原来的ic_launcher.png即可，图片名称要一样。目录中有mipmap-mdpi、mipmap-hdpi、mipmap-xdpi、mipmap-xxdpi、mipmap-xxxdpi，这代表不同分辨率的手机加载不同的图片，手机分辨率越高，加载的图标分辨率越高，正常情况下，mipmap-mdpi 放置4848的图标，mipmap-hdpi存放7272，mipmap-xdpi存放9696，mipmap-xxdpi存放144144，mipmap-xxxdpi存放192*192。

#####  iOS设置App名称、图标
打开ios->Runner->Info.plist 文件， <key>CFBundleName下面的值代表App的名称.
打开ios->Runner-> Assets.xcassets-> AppIcon.appiconset:Icon-App-xxx.png即为app图标所在位置: 
我们只需将这个文件夹里的图片替换为我们的图标即可，注意名称和分辨率保持一致.

### 1.5 打包部署

推荐参考官网，只有官网会及时更新，相关参考：
- 混淆 Dart 代码：https://flutter.dev/docs/deployment/obfuscate 
- 配置 flavors 构建双端：https://flutter.dev/docs/deployment/flavors
- 打包并发布 Android 应用：https://flutter.dev/docs/deployment/android
- 打包并发布 iOS 应用：https://flutter.dev/docs/deployment/ios 
- 打包并发布 Linux 应用：https://flutter.dev/docs/deployment/linux
- 打包并发布 Web 应用：https://flutter.dev/docs/deployment/web 

### 1.6 Flutter Application、Plugin、Package、Module的区别和使用场景

##### Flutter Application
 Flutter Application 表示一个Flutter项目，主体是Flutter，当然它也可以接入Android Module 或者 iOS Framework,Web(Flutter2)，其内部包含 Android 和 iOS 项目（默认情况下，以后正式支持Web、Windows、Mac等系统后可能更多）.

##### Flutter Plugin
 表示 Flutter 插件，包含 Android 和 iOS 项目，如果你要开发一个 Plugin 且此 Plugin 涉及到原生支持，比如蓝牙功能、网络功能等，这些功能纯 Flutter 是无法实现的。
其目录比 Flutter Application 多了一个 example，example用于当前 Plugin 的demo， Flutter Plugin 开发完成后可以发布到 pub 上.

##### Flutter package
Flutter Package 和 Flutter Plugin 基本一样，唯一的区别是Flutter Package表示纯 Flutter 模块，不需要原生开发，没有Android 和 iOS 项目，比如开发一个纯 UI 的插件。

##### Flutter Module
Flutter Module 用于原生项目中插入 Flutter 模块，原生为主体，与 Flutter 进行混合开发。

### 1.7 pubspec.yaml 配置文件详解
```
name: flutter_app_demo
description: A new Flutter project.  
publish_to: 'none'  
 
version: 1.0.0+1

environment:
  sdk: ">=2.7.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
    
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
    
flutter:
  uses-material-design: true
```
#####  name 
此属性表示包名（package name），此属性是非常重要的，引入其他文件时需要使用此包名：
```
import 'package:flutter_app_demo/home_page.dart';
```
#####  description
description 属性是一个可选配置属性，是对当前项目的介绍。

#####  version
此属性应用程序的版本和内部版本号，格式为 x.x.x+x，例如：1.0.0+1.
版本号 + 前面到部分，叫做 version number，由 2 个小点隔开，后面的部分叫做 build number。 
在 Android 中 version number 对应 versionName，build number 对应 versionCode

##### author homepage issue_tracker repository
这四种属性在 Flutter Application 项目中默认是没有的，正常项目中也无需这几个属性，当我们开发插件并发布到 pub 时需要这几个属性: 
- author：作者，填写自己的署名
- homepage：主页
- issue_tracker：issue，一般写当前插件源代码的Github issue 地址
- repository：一般写当前插件源代码的Github地址

#####  Environment
Environment 属性下添加 Flutter 和 Dart 版本控制

#####  dependencies 和 dev_dependencies
dependencies 和 dev_dependencies 下包含应用程序所依赖的包，dependencies 和 dev_dependencies 就像其名字一样，dependencies 下的所有依赖会编译到项目中，而 dev_dependencies 仅仅是运行期间的包，比如自动生成代码的库。 

通过四种方式依赖其包：
- 依赖 pub.dev 上的第三方库
```
    dependencies:
      path_provider: ^1.6.22
```
- 依赖本地库
``` 
    dependencies:
      flutter_package:
        path: ../flutter_package
```
- 依赖 git repository
``` 
    dependencies:
      bloc:
        git:
          url: https://github.com/felangel/bloc.git
          ref: bloc_fixes_issue_110
          path: packages/bloc
```
>     url：github 地址
>     ref：表示git引用，可以是 commit hash, tag 或者 branch
>     path：如果 git 仓库中有多个软件包，则可以使用此属性指定软件包
  
- 依赖我们自己的 pub仓库 
``` 
dependencies:
  bloc: 
    hosted:
      name: bloc
      url: http://your-package-server.com
    version: ^6.0.0
```

######  依赖覆盖
工作中会出现如下场景:项目依赖一个库（比如 path_provider）的版本为 1.6.22，而另一个依赖库也依赖这个path_provider,但版本为 0.5.0，那么我最终到底依赖哪个版本，此时执行 flutter pub get 则会出现错误.

要解决这个冲突，可以添加 dependency_overrides: eg:
``` 
dependency_overrides:
  path_provider: ^1.6.22
```

#####  Flutter
下面的配置都是 Flutter 的相关配置。
###### uses-material-design
``` 
flutter:
  uses-material-design: true
```
引入以使用material Icons类中的图标.

######  assets

assets 是对当前资源的配置，比如 图片、字体等

配置本地图片，使用Image.asset() 加载:
``` 
assets:
  - images/a_dot_burr.jpeg
  - images/a_dot_ham.jpeg
```
配置字体：
``` 
fonts:
  - family: Schyler
    fonts:
      - asset: fonts/Schyler-Regular.ttf
      - asset: fonts/Schyler-Italic.ttf
        style: italic
  - family: Trajan Pro
    fonts:
      - asset: fonts/TrajanPro.ttf
      - asset: fonts/TrajanPro_Bold.ttf
        weight: 700
```
######  plugin
plugin 配置只存在与插件项目中，package 和 pluginClass 一般是不需要修改的.

pubspec.yaml 包含应用程序和依赖的软件包，规定Dart和Flutter SDK的版本约束，管理依赖关系并设置Flutter特定的配置.

如需了解更详细请查阅:
[pubspec file 官方文档](https://dart.dev/tools/pub/pubspec)