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

- **原生阶段**:使用原生语言（Android使用Java或Kotlin，iOS使用Objective-C 或 Swift ）开发应用
- **Hybird阶段**:Hybird实现的基本原理是通过原生的WebView容器加载H5网页进行渲染，通过JavaScript Bridge调用一部分系统能力，同步更新服务器上的H5网页也实现了动态更新，俗称混合应用
- **React Native阶段**:React Native简称RN，是FaceBook在2015年开源，基于 JavaScript，具备动态配置能力跨平台开发框架。
- **小程序**:从技术上来说，小程序（指微信小程序，下同）并不是新的跨平台方案，它使用浏览器内核来渲染界面，小部分由原生组件渲染,小程序的运行环境分成渲染层和逻辑层，通信会经由微信客户端（Native）做中转。
- **Flutter**:Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面.它既没有使用WebView，也没有使用原生控件进行绘制，而是自己实现了一套高性能渲染引擎来绘制UI，这个引擎就是大名鼎鼎的Skia.


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
![运行图示](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/flutter_demo_home_page.png)
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

## 2.文本组件

### 2.1 文本组件-Text
Text是显示文本的组件，最常用的组件之一。基本用法如下：
``` 
Text('ykhe')
```
文本的样式在style中设置，类型为TextStyle，TextStyle中包含很多文本样式属性.

设置文本大小和颜色：
``` 
Text('ykhe',style: TextStyle(color: Colors.blue,fontSize: 20),)
```
设置字体粗细:
``` 
Text('ykhe',style: TextStyle(fontWeight: FontWeight.bold))
```
字体粗细共有9个级别，为w100至w900，FontWeight.bold是w700.

设置斜体:
``` 
Text('ykhe',style: TextStyle(fontStyle: FontStyle.italic,))
```

##### 设置自定义的字体：
- 首先下载字体库（比如中华字体库）
- 将字体文件拷贝的项目中，一般目录是：assets/fonts/，assets和fonts都需要手动创建，此目录不是必须的，而是约定俗成，资源一般都放在assets目录下。
- 配置pubspec.yaml：
``` 
fonts:
  - family: maobi 
    fonts:
      - asset: assets/fonts/maobi.ttf
```
> maobi：是自己对当前字体的命名，有意义即可。
> asset：字体文件的目录。

使用:
```
 Text('ykhe', style: TextStyle(fontFamily: 'maobi',))
```

设置对齐方式:
```
 Container(
   height: 100,
   width: 200,
   color: Colors.blue.withOpacity(.4),
   child: Text('ykhe', textAlign: TextAlign.center),
 )
```

textAlign只是控制水平方向的对齐方式，值说明如下:
 - left：左对齐
 - right：右对齐
 - center：居中
 - justify：两端对齐
 - start：前端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则左对齐，设置TextDirection.rtl则右对齐
 - end：末端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则右对齐，设置TextDirection.rtl则左对齐
 
设置文本自动换行：
``` 
Container(
  height: 100,
  width: 200,
  color: Colors.blue.withOpacity(.4),
  child: Text('专注分享Flutter技术和应用实战',softWrap: true,),
)
```

文本超出范围时的处理：
```
 Container(
   height: 100,
   width: 200,
   color: Colors.blue.withOpacity(.4),
   child: Text('ykhe，专注分享Flutter技术和应用实战',overflow: TextOverflow.ellipsis,),
 )
```
溢出的处理方式：
 - clip：直接裁剪
 - fade：越来越透明
 - ellipsis：省略号结尾
 - visible：依然显示，此时将会溢出父组件
 
##### 设置全局字体样式：
在MaterialApp的theme中设置如下:
```
 MaterialApp(
   title: 'Flutter Demo',
   theme: ThemeData(
    ...
     textTheme: TextTheme(
         bodyText2: TextStyle(color: Colors.red,fontSize: 24),
     )
   ),
   home: Scaffold(
     ...
   ),
 ) 
```
使用Text组件时,会发现默认就为红色了.

 ### 2.2文本组件-RichText
 
 如果想在一句话或者一段文字里面显示不同样式的文字，Text组件无法满足我们的需求，这个时候需要使用RichText.
 ``` 
 RichText(
      text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <InlineSpan>[
            TextSpan(text: 'ykhe',style: TextStyle(color: Colors.red)),
            TextSpan(text: '，'),
            TextSpan(text: '做一个有梦想的合格程序员'),
          ]),
    )
 ```

当文字有较多行时，可以设置其对齐方式：
``` 
RichText(
	textAlign: TextAlign.end,
	...
)
```

#####  手势交互
以设置其他样式，比如大小、斜体等，甚至我们还可以添加点击效果:
```
 RichText(
       text: TextSpan(
           style: DefaultTextStyle.of(context).style,
           children: <InlineSpan>[
             TextSpan(text: '登陆即视为同意'),
             TextSpan(
               text: '《做个沙叼的服务协议》',
               style: TextStyle(color: Colors.red),
               recognizer: TapGestureRecognizer()..onTap = () {
                 
               },
             ),
           ]),
     )
```


### 1.3 文本输入组件-TextField
TextField 是文本输入组件，即输入框，常用组件之一。基本用法：
``` 
TextField()
```

decoration是TextField组件的装饰（外观）参数，类型是InputDecoration  
 icon显示在输入框的前面，用法如下:
```
 TextField(
   decoration: InputDecoration(
     icon: Icon(Icons.person),
   )
 )
```

当输入框是空而且没有焦点时，labelText显示在输入框上边，当获取焦点或者不为空时labelText往上移动一点，labelStyle参数表示文本样式，具体参考TextStyle， 用法如下:

``` 
TextField(
  decoration: InputDecoration(
    labelText: '姓名：',
    labelStyle: TextStyle(color:Colors.red)
  ),
)
```
![效果图示](https://img-blog.csdnimg.cn/20200306165321575.gif)

hasFloatingPlaceholder参数控制当输入框获取焦点或者不为空时是否还显示labelText，默认为true，显示。

helperText显示在输入框的左下部，用于提示用户，helperStyle参数表示文本样式.
```
 TextField(
   decoration: InputDecoration(
     helperText: '用户名长度为6-10个字母',
     helperStyle: TextStyle(color: Colors.blue),
     helperMaxLines: 1
   ),
 )
```
hintText是当输入框为空时的提示，不为空时不在显示:
```
 TextField(
   decoration: InputDecoration(
     hintText: '请输入用户名',
     hintStyle: TextStyle(color: Colors.grey),
     hintMaxLines: 1
   ),
 )
```
errorText显示在输入框的左下部，默认字体为红色，用法如下：
``` 
TextField(
  decoration: InputDecoration(
    errorText: '用户名输入错误',
    errorStyle: TextStyle(fontSize: 12),
    errorMaxLines: 1,
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  ),
)
```

prefix系列的组件是输入框前面的部分:
```
 TextField(
   decoration: InputDecoration(
     prefixIcon: Icon(Icons.person)
   ),
 )
```
注意prefix和icon的区别，icon是在输入框边框的外部，而prefix在里面。

suffix和prefix相反，suffix在输入框的尾部:
```
TextField(
  decoration: InputDecoration(
      suffixIcon: Icon(Icons.person)
  ),
)
```
counter组件统计输入框文字的个数，counter仅仅是展示效果，不具备自动统计字数的功能:
```
var _textFieldValue = '';
TextField(
  onChanged: (value){
    setState(() {
      _textFieldValue = value;
    });
  },
  decoration: InputDecoration(
    counterText: '${_textFieldValue.length}/32'
  ),
)
```

filled为true时，输入框将会被fillColor填充，仿QQ登录输入框代码如下：
```
 Container(
   height: 60,
   width: 250,
   child: TextField(
     decoration: InputDecoration(
       fillColor: Color(0x30cccccc),
       filled: true,
       enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Color(0x00FF0000)),
           borderRadius: BorderRadius.all(Radius.circular(100))),
       hintText: 'QQ号/手机号/邮箱',
       focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Color(0x00000000)),
           borderRadius: BorderRadius.all(Radius.circular(100))),
     ),
   ),
 )
```
controller是输入框文本编辑的控制器，可以获取TextField的内容、设置TextField的内容，下面将输入的英文变为大写：
```
 TextEditingController _controller;
 
 @override
 void initState() {
   super.initState();
   _controller = TextEditingController()
     ..addListener(() {
       //获取输入框的内容，变为大写
       _controller.text = _controller.text.toUpperCase();
 
     });
 }
 
 @override
 Widget build(BuildContext context) {
   return TextField(
     controller: _controller,
   );
 }
 
 @override
 dispose() {
   super.dispose();
   _controller.dispose();
 }
```
有时输入框后面带有“清除”功能，需要controller来实现。

##### keyboardType参数控制软键盘的类型:
    - text：通用键盘。
    - multiline：当TextField为多行时（maxLines设置大于1），右下角的为“换行” 按键。
    - number：数字键盘。
    - phone：手机键盘，比数字键盘多"*"和 "#"。
    - datetime：在ios上和text一样，在android上出现数字键盘、":"和 "-"。
    - emailAddress：邮箱键盘，有"@" 和 "."按键。
    - url：url键盘，有"/" 和 "."按键。
    - visiblePassword：既有字母又有数字的键盘。

##### textInputAction参数控制软键盘右下角的按键:
      -  none：android上显示返回键，ios不支持。
      -  unspecified：让操作系统自己决定哪个合适，一般情况下，android显示“完成”或者“返回”。
      -  done：android显示代表“完成”的按钮，ios显示“Done”（中文：完成）。
      -  go：android显示表达用户去向目的地的图标，比如向右的箭头，ios显示“Go”（中文：前往）。
      -  search：android显示表达搜索的按钮，ios显示"Search"（中文：搜索）。
      -  send：android显示表达发送意思的按钮，比如“纸飞机”按钮，ios显示"Send"（中文：发送）。
      -  next：android显示表达“前进”的按钮，比如“向右的箭头”,ios显示"Next"（中文：下一项）。
      -  previous：android显示表达“后退”的按钮，比如“向左的箭头”,ios不支持。
      -  continueAction：android 不支持，ios仅在ios9.0+显示"Continue"（中文：继续）。
      -  join：Android和ios显示"Join"（中文：加入）。
      -  route：android 不支持，ios显示"Route"（中文：路线）。
      -  emergencyCall：android 不支持，ios显示"Emergency Call"（中文：紧急电话）。
      -  newline：android显示表达“换行”的按钮，ios显示”换行“。
 
##### textCapitalization参数是配置键盘是大写还是小写，仅支持键盘模式为text，其他模式下忽略此配置
       -   words：每一个单词的首字母大写。
       -   sentences：每一句话的首字母大写。
       -   characters：每个字母都大写
       -   none：都小写

这里仅仅控制软键盘是大写模式还是小写模式，你也可以切换大小写，系统并不会改变输入框内的内容。

textAlignVertical表示垂直方向的对齐方式，textDirection表示文本方向:
```
TextField(
  textAlignVertical: TextAlignVertical.center,
  textDirection: TextDirection.rtl,
) 
```
toolbarOptions表示长按时弹出的菜单，有copy、cut、paste、selectAll，用法如下：
```
 TextField(
   toolbarOptions: ToolbarOptions(
     copy: true,
     cut: true,
     paste: true,
     selectAll: true
   ),
 )
```
cursor表示光标，用法如下：
```
 TextField(
   showCursor: true,
   cursorWidth: 3,
   cursorRadius: Radius.circular(10),
   cursorColor: Colors.red,
 )
```
将输入框设置为密码框，只需obscureText属性设置true即可:
```
 TextField(
   obscureText: true,
 )

```
通过inputFormatters可以限制用户输入的内容，比如只想让用户输入字符，设置如下
```
 TextField(
   inputFormatters: [
     WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
   ],
 )

```

onChanged是当内容发生变化时回调，onSubmitted是点击回车或者点击软键盘上的完成回调，onTap点击输入框时回调:
```
 TextField(
   onChanged: (value){
     print('onChanged:$value');
   },
   onEditingComplete: (){
     print('onEditingComplete');
   },
   
   onTap: (){
     print('onTap');
   },
 )
```
输入框右下角经常需要**字数统计**，除了使用上面介绍的方法外，还可以**使用buildCounter，建议使用此方法**:
```
 TextField(
   maxLength: 100,
   buildCounter: (
     BuildContext context, {
     int currentLength,
     int maxLength,
     bool isFocused,
   }) {
     return Text(
       '$currentLength/$maxLength',
     );
   },
 )
```

动态获取焦点:
```
 FocusScope.of(context).requestFocus(_focusNode);
```
_focusNode为TextField的focusNode：
```
 _focusNode = FocusNode();
 
 TextField(
 	focusNode: _focusNode,
 	...
 )
```
动态失去焦点:
```
 _focusNode.unfocus();
```
### 2.4文本组件案例
参见:  
[text_widget_instances.dart](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/text_widget_instances.dart)


## 3.基础组件

### 3.1 按钮组件
Flutter 提供了 10 多种 Button 类组件，比如 **RaisedButton**、**FlatButton**、**OutlineButton**、DropdownButton、RawMaterialButton、PopupMenuButton、**IconButton**、BackButton、CloseButton、ButtonBar、ToggleButtons等。

以加粗这几个Button开始介绍.
RaisedButton、FlatButton、OutlineButton 基础用法如下：
```
 RaisedButton(child: Text('RaisedButton'),onPressed: (){},),
 FlatButton(child: Text('FlatButton'),color: Colors.blue,onPressed: (){},),
 OutlineButton(child: Text('OutlineButton'),onPressed: (){},),
```
这3个组件的用法基本一样，仅仅是展示的外观效果不同，区别是：

   - RaisedButton：Material风格”凸起“的按钮。
   - FlatButton：扁平的按钮。
   - OutlineButton：带边框的按钮。
  
以 RaisedButton 为例介绍， RaisedButton 有3个回调函数:
    - onPressed：点击回调。
    - onLongPress：长按回调。
    - onHighlightChanged：按钮高亮变化回调，当点击或者按住按钮时，按钮出现水波纹效果，水波纹变化时就是高亮状态。
    
用法如下：
```
 RaisedButton(
   child: Text('RaisedButton'),
   onPressed: () {
     print('onPressed');
   },
   onLongPress: () {
     print('onLongPress');
   },
   onHighlightChanged: (highlight) {
     print('onHighlightChanged:$highlight');
   },
 )
```

按钮有两种状态：**禁用状态**和**正常状态**。当onPressed不设置或者设置为 null 时为禁用状态，反之为正常状态，**禁用状态下不可点击**。

| 属性 |	说明 |
| --- | --- |
| textColor | 正常状态下，字体颜色 |
| color | 正常状态下，背景颜色 |
| disabledTextColor | 禁用状态下，字体颜色 |
| disabledColor | 禁用状态下，背景颜色 |
| highlightColor | 高亮颜色，按下时的颜色 |
| splashColor | 水波纹颜色，按下时会有水波纹效果 |

hover 相关的属性是鼠标悬停时的状态，移动端没有效果，比如 hoverColor 表示鼠标悬停时的颜色。
和 focus 相关的属性是指获取焦点时的状态。
这两种状态在 Android 和 iOS 端基本用不到.

设置阴影：
```
 RaisedButton(
   child: Text('RaisedButton'),
   onPressed: () {
   },
   elevation: 10.0,
 ),
 
 RaisedButton(
   child: Text('RaisedButton'),
   onPressed: () {
   },
   
   elevation: 1.0,
 )
```

阴影设置为 10 和 1 效果还是很明显的，这是正常状态下的阴影，还有高亮阴影（**highlightElevation**）和禁用状态阴影（**disabledElevation**），用法一样。

设置按钮形状：
```
RaisedButton(
  child: Text('RaisedButton'),
  onPressed: () {},
  shape: BeveledRectangleBorder(
      side: BorderSide(width: 1, color: Colors.red),
      borderRadius: BorderRadius.circular(10)),
  elevation: 1.0,
)
```
flutter自带许多形状,可参见:
[ShapeBorder](http://laomengit.com/flutter/widgets/ShapeBorder.html#beveledrectangleborder)

IconButton 的用法和 RaisedButton 基本一样:
```
 IconButton(icon: Icon(Icons.add),)
```


### 3.2 单选组件

##### Radio

Radio为单选控件，基本用法:
```
 var _radioValue = '1';
 var _radioGroupValue = '';
 _buildEditable() {
   return Radio(
     value: _radioValue,
     groupValue: _radioGroupValue,
     onChanged: (value){
       print('$value');
       setState(() {
         _radioGroupValue = value;
       });
     },
   );
 }
```

Radio控件本身没有State状态，当value的值和groupValue值相等时，Radio显示选中状态.

通常情况下，有多个单选按钮，当选中一个时，其他自动变为未选中状态:

```
 var _radioGroupValue = '语文';
 _buildEditable() {
   return Row(
     children: <Widget>[
       Radio(
         value: '语文',
         groupValue: _radioGroupValue,
         onChanged: (value){
           setState(() {
             _radioGroupValue = value;
           });
         },
       ),
       Radio(
         value: '数学',
         groupValue: _radioGroupValue,
         onChanged: (value){
           setState(() {
             _radioGroupValue = value;
           });
         },
       ),
       Radio(
         value: '英语',
         groupValue: _radioGroupValue,
         onChanged: (value){
           setState(() {
             _radioGroupValue = value;
           });
         },
       ),
     ],
   );
 }
```
activeColor是选中状态下颜色:

```
 Radio(
   activeColor: Colors.red,
   ...
 )
```

#####  RadioListTile
通常情况下，需要在Radio控件的后面添加说明，用户需要知道自己选择的是什么，当然我们可以直接在Radio后面添加Text控件，不过，Flutter已经为我们提供了相应的控件，就是RadioListTile:
```
 Row(
   children: <Widget>[
     Flexible(
       child: RadioListTile(
         title: Text('语文'),
         value: '语文',
         groupValue: _radioGroupValue,
         onChanged: (value) {
           setState(() {
             _radioGroupValue = value;
           });
         },
       ),
     ),
     Flexible(
         child: RadioListTile(
       title: Text('数学'),
       value: '数学',
       groupValue: _radioGroupValue,
       onChanged: (value) {
         setState(() {
           _radioGroupValue = value;
         });
       },
     )),
     Flexible(
         child: RadioListTile(
       title: Text('英语'),
       value: '英语',
       groupValue: _radioGroupValue,
       onChanged: (value) {
         setState(() {
           _radioGroupValue = value;
         });
       },
     )),
   ],
 )
```

3.3 复选组件
##### Checkbox

Checkbox是勾选框控件，本身不包含任何状态，改变状态需要通过改变value的值改变:
```
 var _checkValue = false;
 _buildCheckbox(){
   return Checkbox(
     value: _checkValue,
     onChanged: (value){
       setState(() {
         _checkValue = value;
       });
     },
   );
 }
```
- value值为bool类型，true表示选择状态
- onChanged为发生变化时回调，即点击控件时回调，方法内的参数为新的值

activeColor为激活状态下颜色，是矩形区域内的颜色，checkColor是选中后“对勾”的颜色:
```
Checkbox(
  activeColor: Colors.red,
  checkColor: Colors.blue,
  ...
) 
```
#####  CheckboxListTile
通常情况下，我们不直接使用Checkbox，而是使用CheckboxListTile，因为我们需要Checkbox后面添加说明:
```
 Container(
   width: 120,
   child: CheckboxListTile(
     title: Text('kiss dog'),
     value: _checkValue,
     onChanged: (value){
       setState(() {
         _checkValue = value;
       });
     },
   ),
 )

```

CheckboxListTile默认是充满父组件的，因此需要Container限制其宽度.
一般的习惯是将勾选框放在前面，用法如下：
```
 CheckboxListTile(
   controlAffinity: ListTileControlAffinity.leading,
   ...
 )
```
ListTileControlAffinity取值范围说明如下：
  - leading：勾选框在开头位置
  - trailing：勾选框在结尾位置
  - platform：根据平台确定
 
 还可以设置其子标题和第二图标:
 ```
CheckboxListTile(
  subtitle: Text('一枚有态度的程序员'),
  secondary: Icon(Icons.person),
  ...
) 
 ```
secondary一般放置一个图标，位于勾选框的另一边

selected参数设置true，secondary、title和subtitle都会被渲染为activeColor的颜色.

### 3.4 滑块组件

##### Slide
基础用法:
```
class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('值：$_sliderValue'),
            Slider(
              value: _sliderValue,
              onChanged: (v){
                setState(() {
                  _sliderValue = v;
                });
              },
            )
          ],
        ),
      ),
    );
  }
} 
```
- value：当前值。
- onChanged：滑块值改变时回调。

Slider 默认滑动范围是 0-1，修改为 1-100:
```
 Slider(
   value: _sliderValue,
   min: 1,
   max: 100,
   onChanged: (v){
     setState(() {
       _sliderValue = v;
     });
   },
 )
```

设置滑块的滑动为 离散的，即滑动值为 0、25 、50、75 100：
```
 Slider(
   value: _sliderValue,
   min: 0,
   max: 100,
   divisions: 4,
   onChanged: (v){
     setState(() {
       _sliderValue = v;
     });
   },
 )

```

设置标签，滑动过程中在其上方显示：
```
 Slider(
   value: _sliderValue,
   label: '$_sliderValue',
   min: 0,
   max: 100,
   divisions: 4,
   onChanged: (v){
     setState(() {
       _sliderValue = v;
     });
   },
 )
```

下面是官方给的 Slider 结构图：
![Slider结构图](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/slider.png)

   - **1 ：轨道（Track）**，1 和 4 是有区别的，1 指的是底部整个轨道，轨道显示了可供用户选择的范围。对于从左到右（LTR）的语言，最小值出现在轨道的最左端，而最大值出现在最右端。对于从右到左（RTL）的语言，此方向是相反的。
   - **2：滑块（Thumb）**，位置指示器，可以沿着轨道移动，显示其位置的选定值。
   - **3：标签（label）**，显示与滑块的位置相对应的特定数字值。
   - **4：刻度指示器（Tick mark）**，表示用户可以将滑块移动到的预定值。
   
 自定义滑块 **激活的颜色** 和 **未激活的颜色**：
 ``` 
Slider(
  activeColor: Colors.red,
  inactiveColor: Colors.blue,
  value: _sliderValue,
  label: '$_sliderValue',
  min: 0,
  max: 100,
  divisions: 4,
  onChanged: (v){
    setState(() {
      _sliderValue = v;
    });
  },
)
 ```
##### 自定义样式

更细致的自定义：
```
 SliderTheme(
   data: SliderTheme.of(context).copyWith(
       activeTrackColor: Color(0xff404080),
       thumbColor: Colors.blue,
       overlayColor: Colors.green,
       valueIndicatorColor: Colors.purpleAccent),
   child: Slider(
     value: _sliderValue,
     label: '$_sliderValue',
     min: 0,
     max: 100,
     divisions: 4,
     onChanged: (v) {
       setState(() {
         _sliderValue = v;
       });
     },
   ),
 )

```

#####  RangeSlider
**RangeSlider** 和 **Slider** 几乎一样，RangeSlider 是范围滑块，想要选择一段值，可以使用 RangeSlider。
```
 RangeValues _rangeValues = RangeValues(0, 25);
 
 RangeSlider(
   values: _rangeValues,
   labels: RangeLabels('${_rangeValues.start}','${_rangeValues.end}'),
   min: 0,
   max: 100,
   divisions: 4,
   onChanged: (v) {
     setState(() {
       _rangeValues = v;
     });
   },
 ),

```

#####  滑块状态
![滑块状态](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/slider_state.png)

##### ios风格的 Slider
ios风格的 Slider，使用 CupertinoSlider：
``` 
double _sliderValue = 0;
CupertinoSlider(
  value: _sliderValue,
  onChanged: (v) {
    setState(() {
      _sliderValue = v;
    });
  },
)

```

当然也可以根据平台显示不同风格的Slider，ios平台显示CupertinoSlider效果，其他平台显示Material风格，用法如下：
```
 Slider.adaptive(
   value: _sliderValue,
   onChanged: (v) {
     setState(() {
       _sliderValue = v;
     });
   },
 )
 
```

[Slider实践代码](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/slider_demo.dart)