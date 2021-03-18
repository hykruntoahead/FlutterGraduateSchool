# flutter_app_demo

A new Flutter project.

Flutter　学习实践

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

### 3.3 复选组件
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

### 3.5 开关组件
#####  Switch
Switch为material风格的开关组件，基本用法如下:
```
 var _switchValue = false;
 _buildSwitch(){
   return Switch(
     value: _switchValue,
     onChanged: (value){
       setState(() {
         _switchValue = value;
       });
     },
   );
 }
```
设置激活状态下thumb及track颜色:
```
 Switch(
       activeColor: Colors.red,
       activeTrackColor: Colors.blue,
       ...
     ）
```

![效果图示](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/switch_active.png)

红色区域为thumb，蓝色区域为track。


thumb区域也可以设置图片:
```
 Switch(
   activeThumbImage: AssetImage('images/bird.png',),
   ...
 )
```
有激活状态样式的设置，也有未激活样式的设置:
```
 Switch(
   inactiveThumbColor: Colors.black54,
   inactiveThumbImage: AssetImage('images/bird.png',),
   inactiveTrackColor: Colors.blue,
   ...
 )
```

#####  SwitchListTile
SwitchListTile是Switch和ListTile组合控件:
```
 var _switchValue = false;
 _buildSwitch(){
   return SwitchListTile(
     title:Text('是否允许4G下载'),
     value: _switchValue,
     onChanged: (value){
       setState(() {
         _switchValue = value;
       });
     },
   );
 }
```
所有的属性都是Switch和ListTile属性的组合，可到具体控件查看其属性。

#####  CupertinoSwitch
CupertinoSwitch是ios风格控件，用法和Switch一样:
```
 var _switchValue = false;
 _buildSwitch(){
   return CupertinoSwitch(
     value: _switchValue,
     onChanged: (value){
       setState(() {
         _switchValue = value;
       });
     },
   );
 }
```

######  注:Switch.adaptive(value: value, onChanged: onChanged)类似 Slider.adaptive


### 3.6 进度组件
##### LinearProgressIndicator
```
 LinearProgressIndicator()
```
设置具体进度值,value的值范围是0-1:
```
 LinearProgressIndicator(
   value: 0.3,
 )
```
设置背景颜色及进度值：
```
 LinearProgressIndicator(
   value: 0.3,
   backgroundColor: Colors.greenAccent,
   valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
 )
```

##### CircularProgressIndicator
CircularProgressIndicator 是圆形进度条，和LinearProgressIndicator用法一样：
```
 CircularProgressIndicator()
```
设置进度值及颜色值：
```
CircularProgressIndicator(
  value: 0.3,
  backgroundColor: Colors.greenAccent,
  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
) 
```

#####  CupertinoActivityIndicator
CupertinoActivityIndicator是ios风格的指示器，CupertinoActivityIndicator不能设置进度，只能一直转“菊花”。
```
 CupertinoActivityIndicator(
   radius: 10,
 )
```
radius参数是半径，值越大，控件越大。

### 3.7图片和图标组件
图片组件是Flutter基础组件之一，和文本组件一样必不可少。图片组件包含Image和Icon两个组件，本质上Icon不属于图片组件，但其外形效果上类似于图片。

在项目中建议优先使用Icon组件，Icon本质上是一种字体，只不过显示的不是文字，而是图标，而Image组件先通过图片解码器将图片解码，Icon有如下优点：

- 通常，图标比图片体积更小，显著的减少App包体积
- 图标不会出现失真或者模糊的现象，例如将20x20的图片，渲染在200x200的屏幕上，图片会失真或模糊，而图标是矢量图，不会失真，就像字体一样
- 多个图标可以存放在一个文件中，方便管理
- 全平台通用

#####  Image
Image组件用于显示图片，图片的来源可以是网络、项目中图片或者设备上的图片.

加载网络图片：
```
 Image.network(
   'http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg',
 )
```
加载项目中图片：
首先将图片拷贝到项目中，通常情况下，拷贝到assets/images/目录下，assets/images/目录为手动创建，新建的项目默认是没有此目录的。

设置pubspec.yaml配置文件：
```
flutter:
   assets:
     - assets/images/
```
###### 注意：assets前面的空格问题，极容易引发编译异常，正确格式如下：
![引入assets](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/assets_dormat_right.png)

加载图片:
```
 Image.asset('assets/images/aa.jpg')
```

加载设备上的图片：
要加载设备（手机）上的图片首先需要获取设备图片的路径，由于不同平台的路径不同,可以使用第三方插件获取路径，这里推荐官方的
![path_provider](https://pub.flutter-io.cn/packages/path_provider)

加载设备上的图片:
```
 Image.file(File('path'))

```

设置图片的大小：
```
 Image.asset('assets/images/aa.jpg',width: 100,height: 200,),
```

当Image的大小和图片大小不匹配时，需要设置填充模式fit，设置组件大小为150x150:
```
 Container(
   color: Colors.red.withOpacity(.3),
   child: Image.asset('assets/images/aa.jpg',width: 150,height: 150),
 )
```
如果想要图片充满整个区域，设置如下:
```
 Container(
   color: Colors.red.withOpacity(.3),
   child: Image.asset('assets/images/aa.jpg',width: 150,height: 150,fit: BoxFit.fill,),
 )

```
有时会造成图片充满整个区域，但图片变形了，使**图片等比拉伸**，直到两边都充满区域：
```
 Container(
   color: Colors.red.withOpacity(.3),
   child: Image.asset('assets/images/aa.jpg',width: 150,height: 150,fit: BoxFit.cover,),
 )
```
fit参数就是设置填充方式，其值介绍如下：

    - fill：完全填充，宽高比可能会变。
    - contain：等比拉伸，直到一边填充满。
    - cover：等比拉伸，直到2边都填充满，此时一边可能超出范围。
    - fitWidth：等比拉伸，宽填充满。
    - fitHeight：等比拉伸，高填充满。
    - none：当组件比图片小时，不拉伸，超出范围截取。
    - scaleDown：当组件比图片小时，图片等比缩小，效果和contain一样。
   
![image fit](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/image_fit.png)

BoxFit.none的裁减和alignment相关，默认居中，
``` 
Image.asset(
  'assets/images/aa.jpg',
  width: 150,
  height: 150,
  fit: BoxFit.none,
  alignment: Alignment.centerRight,
),
```
设置对齐方式：
```
 Container(
   color: Colors.red.withOpacity(.3),
   child: Image.asset(
     'assets/images/aa.jpg',
     width: 150,
     height: 150,
     alignment: Alignment.centerLeft,
   ),
 ),
```

color和colorBlendMode用于将颜色和图片进行颜色混合，colorBlendMode表示混合模式，下面介绍的混合模式比较多，浏览一遍即可，此属性可以用于简单的滤镜效果。

    - clear：清楚源图像和目标图像。
    - color：获取源图像的色相和饱和度以及目标图像的光度。
    - colorBurn：将目标的倒数除以源，然后将结果倒数。
    - colorDodge：将目标除以源的倒数。
    - darken：通过从每个颜色通道中选择最小值来合成源图像和目标图像。
    - difference：从每个通道的较大值中减去较小的值。合成黑色没有效果。合成白色会使另一张图像的颜色反转。
    - dst：仅绘制目标图像。
    - dstATop：将目标图像合成到源图像上，但仅在与源图像重叠的位置合成。
    - dstIn：显示目标图像，但仅显示两个图像重叠的位置。不渲染源图像，仅将其视为蒙版。源的颜色通道将被忽略，只有不透明度才起作用。
    - dstOut：显示目标图像，但仅显示两个图像不重叠的位置。不渲染源图像，仅将其视为蒙版。源的颜色通道将被忽略，只有不透明度才起作用。
    - dstOver：将源图像合成到目标图像下。
    - exclusion：从两个图像的总和中减去两个图像的乘积的两倍。
    - hardLight：调整源图像和目标图像的成分以使其适合源图像之后，将它们相乘。
    - hue：获取源图像的色相，以及目标图像的饱和度和光度。
    - lighten：通过从每个颜色通道中选择最大值来合成源图像和目标图像。
    - luminosity：获取源图像的亮度，以及目标图像的色相和饱和度。
    - modulate：将源图像和目标图像的颜色分量相乘。
    - multiply：将源图像和目标图像的分量相乘，包括alpha通道。
    - overlay：调整源图像和目标图像的分量以使其适合目标后，将它们相乘。
    - plus：对源图像和目标图像的组成部分求和。
    - saturation：获取源图像的饱和度以及目标图像的色相和亮度。
    - screen：将源图像和目标图像的分量的逆值相乘，然后对结果求逆。
    - softLight：对于低于0.5的源值使用colorDodge，对于高于0.5的源值使用colorBurn。
    - src：放置目标图像，仅绘制源图像。
    - srcATop：将源图像合成到目标图像上，但仅在与目标图像重叠的位置合成。
    - srcIn：显示源图像，但仅显示两个图像重叠的位置。目标图像未渲染，仅被视为蒙版。目标的颜色通道将被忽略，只有不透明度才起作用。
    - srcOut：显示源图像，但仅显示两个图像不重叠的位置。
    - srcOver：将源图像合成到目标图像上。
    - xor：将按位异或运算符应用于源图像和目标图像。
 
 
 repeat表示当组件有空余位置时，将会重复显示图片:
 ```
 Image.asset(
   'assets/images/aa.jpg',
   width: double.infinity,
   height: 150,
   repeat: ImageRepeat.repeatX,
 )
 ```
重复的模式有：

    - repeat：x,y方向都充满。
    - repeatX：x方向充满。
    - repeatY：y方向充满。
    - noRepeat：不重复。

matchTextDirection设置为true时，图片的绘制方向为TextDirection设置的方向，其父组件必须为**Directionality**：
``` 
Directionality(
    textDirection: TextDirection.rtl,
    child: Image.asset(
      'assets/images/logo.png',
      height: 150,
      matchTextDirection: true,
    )),
```
 上面实现左右镜像效果.
 
 **filterQuality**表示绘制图像的质量，从高到低为：**high->medium->low->none**。越高效果越好，越平滑，当然性能损耗越大，默认是**low**，如果发现图片有锯齿，可以设置此参数。
 
 当加载图片的时候回调**frameBuilder**，当此参数为null时，此控件将会在图片加载完成后显示，未加载完成时显示空白，尤其在加载网络图片时会更明显。因此此参数可以用于处理图片加载时显示占位图片和加载图片的过渡效果，比如淡入淡出效果。
 
 下面是淡入淡出效果:
 ```
 Image.network(
   'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
   frameBuilder: (BuildContext context, Widget child, int frame,
       bool wasSynchronouslyLoaded) {
     if (wasSynchronouslyLoaded) {
       return child;
     }
     return AnimatedOpacity(
       child: child,
       opacity: frame == null ? 0 : 1,
       duration: const Duration(seconds: 2),
       curve: Curves.easeOut,
     );
   },
 )
 ```

**loadingBuilder**参数比frameBuilder控制的力度更细，可以获取图片加载的进度，下面的案例显示了加载进度条：
``` 
Image.network(
    'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
    loadingBuilder: (BuildContext context, Widget child,
        ImageChunkEvent loadingProgress) {
  if (loadingProgress == null) {
    return child;
  }
  return Center(
    child: CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes
          : null,
    ),
  );
})

```

centerSlice用于.9图，.9图用于拉伸图片的特定区域，centerSlice设置的区域（Rect）就是拉伸的区域。.9图通常用于控件大小、宽高比不固定的场景，比如聊天背景图片等:
```
Container(
    width: 250,
    height: 300,
    decoration: BoxDecoration(
        image: DecorationImage(
            centerSlice: Rect.fromLTWH(20, 20, 10, 10),
            image: AssetImage(
              'assets/images/abc.jpg',
            ),
            fit: BoxFit.fill))), 
```

###### 注:如果使用centerSlice属性，图片必须比组件的尺寸小，一般情况下，.9图的尺寸都非常小

#####  Icon
Icon是图标组件，Icon不具有交互属性，如果想要交互，可以使用IconButton:
```
 Icon(Icons.add),
```
设置图标的大小和颜色：
```
 Icon(
   Icons.add,
   size: 40,
   color: Colors.red,
 )
```
Icons.add是系统提供的图标，创建Flutter项目的时候，pubspec.yaml中默认有如下配置：
``` 
 uses-material-design: true
```
可以到
[官网查看所有图标](https://api.flutter.dev/flutter/material/Icons-class.html)

##### 3.8实例 - 聊天气泡

[聊天气泡(.9图实现)+圆形带边框的头像+图片占位符](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/chat_bubble.dart)


## 4.布局组件
### 4.1 水平/垂直布局组件 -- Row/Column
**Row** 是将子组件以水平方式布局的组件， **Column** 是将子组件以垂直方式布局的组件。
项目中 8-90% 的页面布局都可以通过 Row 和 Column 来实现。

将3个组件水平排列：
```
 Row(
   children: <Widget>[
     Container(
       height: 50,
       width: 100,
       color: Colors.red,
     ),
     Container(
       height: 50,
       width: 100,
       color: Colors.green,
     ),
     Container(
       height: 50,
       width: 100,
       color: Colors.blue,
     ),
   ],
 )
```
将3个组件垂直排列：
``` 
Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Container(
      height: 50,
      width: 100,
      color: Colors.red,
    ),
    Container(
      height: 50,
      width: 100,
      color: Colors.green,
    ),
    Container(
      height: 50,
      width: 100,
      color: Colors.blue,
    ),
  ],
)
```

在 Row 和 Column 中有一个非常重要的概念：**主轴（ MainAxis ）** 和 **交叉轴（ CrossAxis ）**
- 主轴就是与组件布局方向一致的轴  
- 交叉轴就是与主轴方向垂直的轴

具体到 Row 组件，主轴 是水平方向，交叉轴 是垂直方向。而 Column 与 Row 正好相反，主轴 是垂直方向，交叉轴 是水平方向。

来看下 mainAxisAlignment 属性，此属性表示主轴方向的对齐方式，默认值为 start，表示从组件的开始处布局，此处的开始位置和 textDirection 属性有关，textDirection 表示文本的布局方向，其值包括 ltr（从左到右） 和 rtl（从右到左），当 textDirection = ltr 时，start 表示左侧，当 textDirection = rtl 时，start 表示右侧，:

```
 Container(
   decoration: BoxDecoration(border: Border.all(color: Colors.black)),
   child: Row(
     children: <Widget>[
       Container(
         height: 50,
         width: 100,
         color: Colors.red,
       ),
       Container(
         height: 50,
         width: 100,
         color: Colors.green,
       ),
       Container(
         height: 50,
         width: 100,
         color: Colors.blue,
       ),
     ],
   ),
 )
```

主轴对齐方式有6种，效果如下图：

![row 主轴对齐方式](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/row_mainAxisAlignment.jpg)

spaceAround 和 spaceEvenly 区别是：

    - spaceAround ：第一个子控件距开始位置和最后一个子控件距结尾位置是其他子控件间距的一半。
    - spaceEvenly ： 所有间距一样。

和主轴对齐方式相对应的就是交叉轴对齐方式 **crossAxisAlignment** ，交叉轴对齐方式默认是居中。

```
 Container(
       decoration: BoxDecoration(border: Border.all(color: Colors.black)),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Container(
             height: 50,
             width: 100,
             color: Colors.red,
           ),
           Container(
             height: 100,
             width: 100,
             color: Colors.green,
           ),
           Container(
             height: 150,
             width: 100,
             color: Colors.blue,
           ),
         ],
       ),
     )

```

![row 交叉轴默认对齐](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/row_default_crossAxisAlignment.png)

交叉轴对齐方式:

![row 交叉轴对齐方式](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/row_cross_axis_alignment.png)

**mainAxisSize** 表示主轴尺寸，有 **min** 和 **max** 两种方式，默认是 max。min 表示尽可能小，max 表示尽可能大。

![row mainAxisSize-min](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/row_cross_axis_alignment.png)

看黑色边框，正好包裹子组件，而 max 效果如下：

![row mainAxisSize-max](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/row_cross_axis_alignment.png)

**textDirection** 表示子组件主轴布局方向，值包括 ltr（从左到右） 和 rtl（从右到左）:

```
 Container(
   decoration: BoxDecoration(border: Border.all(color: Colors.black)),
   child: Row(
     textDirection: TextDirection.rtl,
     children: <Widget>[每一个子组件比上一个组件向下偏移30。
       ...
     ],
   ),
 )
```

![row textDirection-rtl](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/row_text_decoration_rtl.png)

verticalDirection 表示子组件交叉轴布局方向：

    - up ：从底部开始，并垂直堆叠到顶部，对齐方式的 start 在底部，end 在顶部。
    - down： 与 up 相反。
    
 ```
  Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        Container(
          height: 50,
          width: 100,
          color: Colors.red,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
        ),
        Container(
          height: 150,
          width: 100,
          color: Colors.blue,
        ),
      ],
    ),
  )   
 ```

![row verticalDirection-up](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/row_verticalDirection_up.png)

想一想这种效果完全可以通过对齐方式实现，
那么为什么还要有 **textDirection** 和 **verticalDirection** 这两个属性，官方API文档已经解释了这个问题：

> 用于消除 MainAxisAlignment.start 和 CrossAxisAlignment.end 值的歧义



### 4.2 叠加布局组件-Stack/IndexedStack

叠加布局组件包含 **Stack** 和 **IndexedStack，Stack** 组件将子组件叠加显示，根据子组件的顺序依次向上叠加:

```
Stack(
  children: <Widget>[
    Container(
      height: 200,
      width: 200,
      color: Colors.red,
    ),
    Container(
      height: 170,
      width: 170,
      color: Colors.blue,
    ),
    Container(
      height: 140,
      width: 140,
      color: Colors.yellow,
    )
  ],
)
```


Stack 对未定位（不被 Positioned 包裹）子组件的大小由 fit 参数决定，默认值是 StackFit.loose ，表示子组件自己决定，StackFit.expand 表示尽可能的大:
```
 Stack(
   fit: StackFit.expand,
   children: <Widget>[
     Container(
       height: 200,
       width: 200,
       color: Colors.red,
     ),
     Container(
       height: 170,
       width: 170,
       color: Colors.blue,
     ),
     Container(
       height: 140,
       width: 140,
       color: Colors.yellow,
     )
   ],
 )
```
效果只有黄色（最后一个组件的颜色），并不是其他组件没有绘制，而是另外两个组件被黄色组件覆盖。

Stack 对未定位（不被 Positioned 包裹）子组件的对齐方式由**alignment** 控制，默认左上角对齐，用法如下：

``` 
Stack(
  alignment: AlignmentDirectional.center,
  children: <Widget>[
    Container(
      height: 200,
      width: 200,
      color: Colors.red,
    ),
    Container(
      height: 170,
      width: 170,
      color: Colors.blue,
    ),
    Container(
      height: 140,
      width: 140,
      color: Colors.yellow,
    )
  ],
)
```
通过 Positioned 定位的子组件：
```
 Stack(
   alignment: AlignmentDirectional.center,
   children: <Widget>[
     Container(
       height: 200,
       width: 200,
       color: Colors.red,
     ),
     Container(
       height: 170,
       width: 170,
       color: Colors.blue,
     ),
     Positioned(
       left: 30,
       right: 40,
       bottom: 50,
       top: 60,
       child: Container(
         color: Colors.yellow,
       ),
     )
   ],
 )
```
**top** 、**bottom** 、**left** 、**right** 四种定位属性，分别表示距离上下左右的距离。


如果子组件超过 Stack 边界由 overflow 控制，默认是裁剪，下面设置总是显示的用法：
```
 Stack(
   overflow: Overflow.visible,
   children: <Widget>[
     Container(
       height: 200,
       width: 200,
       color: Colors.red,
     ),
     Positioned(
       left: 100,
       top: 100,
       height: 150,
       width: 150,
       child: Container(
         color: Colors.green,
       ),
     )
   ],
 )
```

**IndexedStack** 是 Stack 的子类，Stack 是将所有的子组件叠加显示，而 IndexedStack 通过 index 只显示指定索引的子组件:

[IndexedStackDemo 示例](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/layout_widget/indexed_stack_demo.dart)


###4.3　 流式布局组件－Wrap
 
 **Wrap** 为子组件进行水平或者垂直方向布局，且当空间用完时，Wrap 会自动换行，也就是流式布局。
 
 创建多个子控件做为 Wrap 的子控件:
 ```
  Wrap(
    children: List.generate(10, (i) {
      double w = 50.0 + 10 * i;
      return Container(
        color: Colors.primaries[i],
        height: 50,
        width: w,
        child: Text('$i'),
      );
    }),
  )
 ```
 
 **direction** 属性控制布局方向，默认为水平方向，设置方向为垂直代码:
 ```
   Wrap(
     direction: Axis.vertical,
     children: List.generate(4, (i) {
       double w = 50.0 + 10 * i;
       return Container(
         color: Colors.primaries[i],
         height: 50,
         width: w,
         child: Text('$i'),
       );
     }),
   )  
 ```

**alignment** 属性控制主轴对齐方式，**crossAxisAlignment** 属性控制交叉轴对齐方式，对齐方式只对有剩余空间的行或者列起作用，例如水平方向上正好填充完整，则不管设置主轴对齐方式为什么，看上去的效果都是铺满.

>说明 ：主轴就是与当前组件方向一致的轴，而交叉轴就是与当前组件方向垂直的轴，如果Wrap的布局方向为水平方向 Axis.horizontal,那么主轴就是水平方向，反之布局方向为垂直方向 Axis.vertical ，主轴就是垂直方向。

```
Wrap(
	alignment: WrapAlignment.spaceBetween,
	...
) 
```
主轴对齐方式有6种:
![wrap 主轴对齐](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/wrap_main_axis_alignment.jpg)

**spaceAround** 和 **spaceEvenly** 区别是：
- spaceAround：第一个子控件距开始位置和最后一个子控件距结尾位置是其他子控件间距的一半。
- spaceEvenly：所有间距一样。
设置交叉轴对齐代码如下：

```
Wrap(
	crossAxisAlignment: WrapCrossAlignment.center,
	...
)     
```
如果 Wrap 的主轴方向为水平方向，交叉轴方向则为垂直方向，如果想要看到交叉轴对齐方式的效果需要设置子控件的高不一样:
```
 Wrap(
   spacing: 5,
   runSpacing: 3,
   crossAxisAlignment: WrapCrossAlignment.center,
   children: List.generate(10, (i) {
     double w = 50.0 + 10 * i;
     double h = 50.0 + 5 * i;
     return Container(
       color: Colors.primaries[i],
       height: h,
       alignment: Alignment.center,
       width: w,
       child: Text('$i'),
     );
   }),
 )
```

**runAlignment** 属性控制 Wrap 的交叉抽方向上每一行的对齐方式，下面直接看 runAlignment 6中方式对应的效果图:

![runAlignment](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/wrap_run_alignment.jpg)

runAlignment 和 alignment 的区别：
- **alignment** ：是主轴方向上对齐方式，作用于每一行。
- **runAlignment** ：是交叉轴方向上将每一行看作一个整体的对齐方式。

**spacing** 和 **runSpacing** 属性控制Wrap主轴方向和交叉轴方向子控件之间的间隙:
```
 Wrap(
 	spacing: 5,
     runSpacing: 2,
 	...
 )
```

**textDirection** 属性表示 Wrap 主轴方向上子组件的方向，取值范围是 ltr（从左到右） 和 rtl（从右到左），下面是从右到左：
```
 Wrap(
 	textDirection: TextDirection.rtl,
 	...
 )
```

**verticalDirection** 属性表示 Wrap 交叉轴方向上子组件的方向，取值范围是 up（向上） 和 down（向下）:
``` 
Wrap(
	verticalDirection: VerticalDirection.up,
	...
)
```

![verticalDirection up](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/wrap_vertical_up.png)


###### 注意：从图示可以看到，文字为0的组件是在下面的。


### 4.4 自定义布局组件-Flow

大部分情况下，不会使用到 **Flow** ，但 Flow 可以调整子组件的位置和大小，结合Matrix4绘制出各种酷炫的效果。

Flow 组件对使用转换矩阵操作子组件经过系统优化，性能非常高效:
```
 Flow(
   delegate: SimpleFlowDelegate(),
   children: List.generate(5, (index) {
     return Container(
       height: 100,
       color: Colors.primaries[index % Colors.primaries.length],
     );
   }),
 )
```
delegate 控制子组件的位置和大小，定义如下 ：

```
 class SimpleFlowDelegate extends FlowDelegate {
   @override
   void paintChildren(FlowPaintingContext context) {
     for (int i = 0; i < context.childCount; ++i) {
       context.paintChild(i);
     }
   }
 
   @override
   bool shouldRepaint(SimpleFlowDelegate oldDelegate) {
     return false;
   }
 }

```
delegate 要继承 **FlowDelegate**，重写 **paintChildren** 和 **shouldRepaint** 函数，上面直接绘制子组件，效果如下：

![FlowDelegate](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/flow_p1.png)

只看到一种颜色并不是只绘制了这一个，而是叠加覆盖了，和 Stack 类似，下面让每一个组件有一定的偏移，**SimpleFlowDelegate** 修改如下：

```
 class SimpleFlowDelegate extends FlowDelegate {
   @override
   void paintChildren(FlowPaintingContext context) {
     for (int i = 0; i < context.childCount; ++i) {
       context.paintChild(i,transform: Matrix4.translationValues(0,i*30.0,0));
     }
   }
 
   @override
   bool shouldRepaint(SimpleFlowDelegate oldDelegate) {
     return false;
   }
 }
```
![FlowDelegate](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/flow_p2.png)

每一个子组件比上一个组件向下偏移30。


### 4.5 布局案例－　仿 掘金-我 效果
[仿　掘金－我效果](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/layout_widget/imitation_nuggets_i_effect.dart)

### 4.6 布局案例－　水平展开/收起菜单
[水平展开/收起菜单](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/layout_widget/expand_collapse_menu_horizontally.dart)

### 4.7 布局案例－　半圆菜单展开/收起
[半圆菜单展开/收起](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/layout_widget/half_circle_menu_demo.dart) 


## 5 定位装饰权重组件

### 5.1 定位装饰组件 - Container

**Container** 是最常用的组件之一，它是单容器类组件，即**仅能包含一个子组件，用于装饰和定位子组件**，例如设置背景颜色、形状等。
```
 Container(
 	child: Text('ykhe'),
  )

```

设置背景颜色：
```
 Container(
 	color: Colors.blue,
     child: Text('ykhe'),
 )

```
设置内边距(**padding**) 和 外边距(**margin**):
```
Container(
      color: Colors.blue,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        color: Colors.red,
        child: Text('ykhe'),
      ),
    ) 
```

**decoration** 属性设置子组件的背景颜色、形状等。设置背景为圆形，颜色为蓝色：
```
 Container(
   child: Text('学习与分享Flutter技术及应用'),
   decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
 )
```
默认情况下，圆形的直径等于 Container 窄边长度，相当于在矩形内绘制内切圆。

绘制背景是圆角矩形：
```
 Container(
         child: Text('学习与分享Flutter技术及应用'),
         padding: EdgeInsets.symmetric(horizontal: 10),
         decoration: BoxDecoration(
             shape: BoxShape.rectangle,
             borderRadius: BorderRadius.all(Radius.circular(20)),
             color: Colors.blue),
       )
```

除了背景我们可以设置边框效果:
```
 Container(
         child: Text('老孟，专注分享Flutter技术及应用'),
         padding: EdgeInsets.symmetric(horizontal: 10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(12),
           border: Border.all(
             color: Colors.blue,
             width: 2,
           ),
         ),
       )
```

创建圆角图片和圆形图片：
```
 Container(
       height: 200,
       width: 200,
       decoration: BoxDecoration(
         image:  DecorationImage(
           image: NetworkImage(
               'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
           fit: BoxFit.cover,
         ),
         border: Border.all(
           color: Colors.blue,
           width: 2,
         ),
         borderRadius: BorderRadius.circular(12),
       ),
     )
```
 修改其形状为圆形:
 ```
   Container(
         height: 200,
         width: 200,
         decoration: BoxDecoration(
           image: DecorationImage(
             image: NetworkImage(
                 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
             fit: BoxFit.cover,
           ),
           border: Border.all(
             color: Colors.blue,
             width: 2,
           ),
           shape: BoxShape.circle,
         ),
       )
 ```

设置对齐方式为居中，背景色为蓝色:
```
 Container(
         color: Colors.blue,
         child: Text('一个有态度的程序员'),
         alignment: Alignment.center,
       )
```

>注意：设置对齐方式后，Container将会充满其父控件，相当于Android中 match_parent 。

**Alignment** 已经封装了常用的位置:

topLeft; topCenter; topRight; 
centerLeft; center; centerRight;
bottomLeft; bottomCenter; bottomRight;

通过名字就知道其位置，这里要介绍一下其他的位置，比如在距离左上角1/4处：
```
 Container(
   alignment: Alignment(-.5,-.5),
   child: Text('分享Flutter技术及应用'),
 )

```

这里有一个非常重要的坐标系，Alignment 坐标系如下：


![alignment_coordinate_system](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/alignment_coordinate_system.png)

设置固定的宽高属性：
```
 Container(
         color: Colors.blue,
         child: Text('分享Flutter技术及应用'),
         alignment: Alignment.center,
         height: 60,
         width: 250,
       )
```
通过 **constraints** 属性设置最大/小宽、高来确定大小，如果不设置，默认最小宽高是0，最大宽高是无限大（double.infinity），约束width代码如下：
```
 Container(
         color: Colors.blue,
         child: Text('分享Flutter技术及应用'),
         alignment: Alignment.center,
         constraints: BoxConstraints(
           maxHeight: 100,
           maxWidth: 300,
           minHeight: 100,
           minWidth: 100,
         ),
       )
```

通过**transform**可以旋转、平移、缩放Container，旋转代码如下：
```
  Container(
          color: Colors.blue,
          child: Text('分享Flutter技术及应用'),
          alignment: Alignment.center,
          height: 60,
          width: 250,
          transform: Matrix4.rotationZ(0.5),
        )
```

> 注意：Matrix4.rotationZ()参数的单位是弧度而不是角度


### 5.2 固定宽高组件-SizeBox

**SizedBox** 是具有固定宽高的组件，直接指定具体的宽高:
```
 SizedBox(
         height: 60,
         width: 200,
         child: Container(
           color: Colors.blue,
           alignment: Alignment.center,
           child: Text('分享Flutter技术及应用'),
         ),
       )
```

设置尺寸无限大，如下：
```
 SizedBox(
   height: double.infinity,
   width: double.infinity,
   ...
 )
```

虽然设置了无限大，子控件是否会无限长呢？不，不会，子控件依然会受到父组件的约束，会扩展到父组件的尺寸，还有一个便捷的方式设置此方式：
```
 SizedBox.expand(
   child: Text('分享Flutter技术及应用'),
 )
```

SizedBox 可以没有子组件，但仍然会占用空间，所以 SizedBox 非常适合控制2个组件之间的空隙:
```
 Column(
           children: <Widget>[
             Container(height: 30,color: Colors.blue,),
             SizedBox(height: 30,),
             Container(height: 30,color: Colors.red,),
           ],
         )
```

### 5.3 宽高比组件-AspectRatio
AspectRatio 是固定宽高比的组件:
```
  Container(
          height: 300,
          width: 300,
          color: Colors.blue,
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(color: Colors.red,),
          ),
        )
```

aspectRatio 是宽高比，可以直接写成分数的形式，也可以写成小数的形式，但建议写成分数的形式，可读性更高. 


### 5.4 相对父组件尺寸 - FractionallySizedBox

**FractionallySizedBox** 是一个相对父组件尺寸的组件，比如占父组件的70%：
``` 
 Container(
   height: 200,
   width: 200,
   color: Colors.blue,
   child: FractionallySizedBox(
     widthFactor: .8,
     heightFactor: .3,
     child: Container(
       color: Colors.red,
     ),
   ),
 )
```
通过 alignment 参数控制子组件显示的位置，默认为居中:
```
  FractionallySizedBox(
    alignment: Alignment.center,
    ...
  )
```


### 5.5 权重组件- Expanded、Flexible 和 Spacer

**Expanded、Flexible 和 Spacer** 都是具有权重属性的组件，可以控制 Row、Column、Flex 的子控件如何布局的组件.

Flexible 组件可以控制 Row、Column、Flex 的子控件占满父组件，比如，Row 中有3个子组件，两边的宽是100，中间的占满剩余的空间:
```
 Row(
       children: <Widget>[
         Container(
           color: Colors.blue,
           height: 50,
           width: 100,
         ),
         Flexible(
             child: Container(
               color: Colors.red,
               height: 50,
             )
         ),
         Container(
           color: Colors.blue,
           height: 50,
           width: 100,
         ),
       ],
     )
```

还是有3个子组件，第一个占1/6，第二个占2/6，第三个占3/6:
```
 Column(
       children: <Widget>[
         Flexible(
           flex: 1,
           child: Container(
             color: Colors.blue,
             alignment: Alignment.center,
             child: Text('1 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
           ),
         ),
         Flexible(
           flex: 2,
           child: Container(
             color: Colors.red,
             alignment: Alignment.center,
             child: Text('2 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
           ),
         ),
         Flexible(
           flex: 3,
           child: Container(
             color: Colors.green,
             alignment: Alignment.center,
             child: Text('3 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
           ),
         ),
       ],
     )
```

子组件占比 = 当前子控件 flex / 所有子组件 flex 之和。

Flexible中 **fit** 参数表示填满剩余空间的方式，说明如下：
    - tight：必须（强制）填满剩余空间。
    - loose：尽可能大的填满剩余空间，但是可以不填满。
    
这2个看上去不是很好理解啊，什么叫尽可能大的填满剩余空间？什么时候填满？看下面的例子：
```
  Row(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 50,
            width: 100,
          ),
          Flexible(
              child: Container(
                color: Colors.red,
                height: 50,
  			  child: Text('Container',style: TextStyle(color: Colors.white),),
              )
          ),
          Container(
            color: Colors.blue,
            height: 50,
            width: 100,
          ),
        ],
      )
```
![flexible_contariner_0](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/flexible_contariner_0.png)

这段代码是在最上面代码的基础上给中间的红色Container添加了Text子控件，此时红色Container就不在充满空间，再给Container添加对齐方式，代码如下：
```
 Row(
       children: <Widget>[
         Container(
           color: Colors.blue,
           height: 50,
           width: 100,
         ),
         Flexible(
             child: Container(
               color: Colors.red,
               height: 50,
 			  alignment: Alignment.center,
 			  child: Text('Container',style: TextStyle(color: Colors.white),),
             )
         ),
         Container(
           color: Colors.blue,
           height: 50,
           width: 100,
         ),
       ],
     )
```
![flexible_contariner_1](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/flexible_contariner_1.png)

此时又填满剩余空间。

大家是否还记得 Container 组件的大小是如何调整的吗？Container 默认是适配子控件大小的，但当设置对齐方式时 Container 将会填满父组件，因此是否填满剩余空间取决于子组件是否需要填满父组件。

如果把 Flexible 中子组件由 Container 改为 OutlineButton，代码如下：
```
  Row(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 50,
            width: 100,
          ),
          Flexible(
            child: OutlineButton(
              child: Text('OutlineButton'),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 50,
            width: 100,
          ),
        ],
      )
```
OutlineButton 正常情况下是不充满父组件的，因此最终的效果应该是不填满剩余空间：
![flexible_outline_button](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/flexible_outline_button.png)


下面再来介绍另一个权重组件**Expanded** ，源代码如下：
``` 
 class Expanded extends Flexible {
   /// Creates a widget that expands a child of a [Row], [Column], or [Flex]
   /// so that the child fills the available space along the flex widget's
   /// main axis.
   const Expanded({
     Key key,
     int flex = 1,
     @required Widget child,
   }) : super(key: key, flex: flex, fit: FlexFit.tight, child: child);
 }
```
Expanded 继承字 Flexible，fit 参数固定为 **FlexFit.tight**，也就是说 Expanded 必须（强制）填满剩余空间。上面的 OutlineButton 想要充满剩余空间可以直接使用 Expanded ：

```
 Row(
       children: <Widget>[
         Container(
           color: Colors.blue,
           height: 50,
           width: 100,
         ),
         Expanded(
           child: OutlineButton(
             child: Text('OutlineButton'),
           ),
         ),
         Container(
           color: Colors.blue,
           height: 50,
           width: 100,
         ),
       ],
     ) 
```
![flexible_outline_button_expanded](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/flexible_outline_button_expanded.png)

**Spacer** 也是一个权重组件，源代码如下：
```
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: const SizedBox.shrink(),
    );
  }
```
Spacer 的本质也是 Expanded 的实现的，和Expanded的区别是：Expanded 可以设置子控件，而 Spacer 的子控件尺寸是0，因此**Spacer适用于撑开 Row、Column、Flex 的子控件的空隙**，用法如下：

```
  Row(
    children: <Widget>[
      Container(width: 100,height: 50,color: Colors.green,),
      Spacer(flex: 2,),
      Container(width: 100,height: 50,color: Colors.blue,),
      Spacer(),
      Container(width: 100,height: 50,color: Colors.red,),
    ],
  )
```
**三个权重组建总结如下：**
  - Spacer 是通过 Expanded 实现的，Expanded继承自Flexible。
  - 填满剩余空间直接使用Expanded更方便。
  - Spacer 用于撑开 Row、Column、Flex 的子组件的空隙。


### 5.6 案例－　仿掘金个人信息效果
[仿掘金个人信息效果](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/position_decoration_widget/personal_info.dart)

### 5.7 案例－　柱状图
[柱状图](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/lib/position_decoration_widget/histogram.dart) 


## 6.手势识别组件

### 6.1手势识别组件 - GestureDetector
**GestureDetector** 是手势识别的组件，可以识别点击、双击、长按事件、拖动、缩放等手势。

##### 点击事件
点击相关事件包括：
- onTapDown：按下时回调
- onTapUp：抬起时回调
- onTap：点击事件回调
- onTapCancel：点击取消事件回调

用法如下：
```
 GestureDetector(
       onTapDown: (TapDownDetails tapDownDetails) {
         print('onTapDown');
       },
       onTapUp: (TapUpDetails tapUpDetails) {
         print('onTapUp');
       },
       onTap: () {
         print('onTap');
       },
       onTapCancel: () {
         print('onTapCancel');
       },
       child: Center(
         child: Container(
           width: 200,
           height: 200,
           color: Colors.red,
         ),
       ),
     )
```

按下然后抬起调用顺序：
```
 onTapDown-> onTapUp-> onTap
```
按下后移动的调用顺序：
```
  onTapDown-> onTapCancel
```
这种情况下不在调用onTapUp和onTap.

##### 双击事件
双击是快速且连续2次在同一个位置点击，双击监听使用onDoubleTap方法:
```
 GestureDetector(
   onDoubleTap: ()=>print('onDoubleTap'),
   child: Center(
     child: Container(
       width: 200,
       height: 200,
       color: Colors.red,
     ),
   ),
 )
```
当同时监听onTap和onDoubleTap事件时，只会触发一个事件，如果触发onTap事件，onTap将会延迟触发（延迟时间为系统判断是onDoubleTap事件的间隔），
因为系统将会等待一段时间来判断是否为onDoubleTap事件，如果用户只监听了onTap事件则没有延迟。

##### 长按事件
长按事件（LongPress）包含长按开始、移动、抬起、结束事件，说明如下：
- onLongPressStart：长按开始事件回调
- onLongPressMoveUpdate：长按移动事件回调
- onLongPressUp：长按抬起事件回调
- onLongPressEnd：长按结束事件回调
- onLongPress：长按事件回调

```
 GestureDetector(
   onLongPressStart: (v) => print('onLongPressStart'),
   onLongPressMoveUpdate: (v) => print('onLongPressMoveUpdate'),
   onLongPressUp: () => print('onLongPressUp'),
   onLongPressEnd: (v) => print('onLongPressEnd'),
   onLongPress: () => print('onLongPress'),
   child: Center(
     child: Container(
       width: 200,
       height: 200,
       color: Colors.red,
     ),
   ),
 )
```
用户按下->移动->抬起的过程调用如下：
```
 onLongPressStart->onLongPress->onLongPressMoveUpdate->... ->onLongPressMoveUpdate
  -> onLongPressEnd-> onLongPressUp
```

##### 水平/垂直拖动事件
垂直/水平拖动事件包括按下、开始、移动更新、结束、取消事件，以垂直为例说明如下：

- onVerticalDragDown：垂直拖动按下事件回调
- onVerticalDragStart：垂直拖动开始事件回调
- onVerticalDragUpdate：指针移动更新事件回调
- onVerticalDragEnd：垂直拖动结束事件回调
- onVerticalDragCancel：垂直拖动取消事件回调

```
  GestureDetector(
    onVerticalDragStart: (v) => print('onVerticalDragStart'),
    onVerticalDragDown: (v) => print('onVerticalDragDown'),
    onVerticalDragUpdate: (v) => print('onVerticalDragUpdate'),
    onVerticalDragCancel: () => print('onVerticalDragCancel'),
    onVerticalDragEnd: (v) => print('onVerticalDragEnd'),
    child: Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    ),
  )
```
用户垂直方向拖动调用顺序如下：
```
  onVerticalDragDown->onVerticalDragStart->onVerticalDragUpdate-> … -> onVerticalDragUpdate->
  onVerticalDragEnd
```

##### 缩放事件

缩放（Scale）包含缩放开始、更新、结束。说明如下：
- onScaleStart：缩放开始事件回调。
- onScaleUpdate：缩放更新事件回调。
- onScaleEnd：缩放结束事件回调。
```
  GestureDetector(
    onScaleStart: (v) => print('onScaleStart'),
    onScaleUpdate: (ScaleUpdateDetails v) => print('onScaleUpdate'),
    onScaleEnd: (v) => print('onScaleEnd'),
    child: Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    ),
  )
```
缩放需要2个指针，对于手机就是2个手指进行缩放操作，调用顺序如下：
```
 onScaleStart->onScaleUpdate->…->onScaleUpdate->onScaleEnd 
```


### 手势识别组件 - Ink/InkWell

**InkWell** 组件在用户点击时出现“水波纹”效果，InkWell简单用法：
```
  InkWell(
          onTap: (){},
          child: Text('这是InkWell点击效果'),
  )
```
onTap是点击事件回调，如果不设置无法出现“水波纹”效果，效果如下：

![点击效果](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/inkwell_default.gif)


设置水波纹颜色:
```
 InkWell(
 	onTap: () {},
 	splashColor: Colors.red,
 	...
 )
```

![点击效果](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/inkwell_red.gif)

设置高亮颜色颜色：
```
  InkWell(
  	onTap: () {},
  	highlightColor: Colors.blue,
  	...
  )
```
高亮颜色是按住时显示的颜色，效果如下：

![点击效果](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/inkwell_blue.gif)

给字体添加边距和圆角边框，扩大“水波纹”效果：
```
  InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
            decoration: BoxDecoration(
              border:Border.all(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(30))
                  
            ),
            child: Text('这是InkWell点击效果'),
          ),
        )
```

![点击效果](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/inkwell_border.gif)

发现“水波纹”超出的了圆角边框，如何解决这个问题呢？ 这时候需要使用Ink来解决：

##### Ink

Ink控件用于在[Material]控件上绘制图像和其他装饰，以便[InkWell]、[InkResponse]控件的“水波纹”效果在其上面显示.
上面的问题修改代码如下：

``` 
 Ink(
         decoration: BoxDecoration(
             gradient: LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                 colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
             borderRadius: BorderRadius.all(Radius.circular(20))),
         child: InkWell(
           borderRadius: BorderRadius.all(Radius.circular(20)),
           child: Container(
             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
             child: Text(
               '这是InkWell的点击效果',
               style: TextStyle(color: Colors.white),
             ),
           ),
           onTap: () {},
         ),
       )
```
效果：

![点击效果](https://github.com/hykruntoahead/FlutterGraduateSchool/blob/master/rmd_img/Ink_inkwell.gif)



