import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 使用Flow实现水平展开/收起菜单的功能:

class DemoFlowPopMenu extends StatefulWidget{
   @override
  _DemoFlowPopMenuState createState() => _DemoFlowPopMenuState();
}

//通过将SingleTickerProviderStateMixin添加到类定义中，可以将stateful对象作为vsync的值。
// 如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin。
class _DemoFlowPopMenuState extends State<DemoFlowPopMenu>
    with SingleTickerProviderStateMixin{
    //动画必须要with这个类
    AnimationController _ctrlAnimationPopMenu;//定义动画变量
    IconData lastTapped = Icons.notifications;
    final List<IconData> menuItems = <IconData>[
      //菜单icon
      Icons.home,
      Icons.new_releases,
      Icons.notifications,
      Icons.settings,
      Icons.menu,
    ];

    void _updateMenu(IconData icon){
      if(icon != Icons.menu){
        setState(() =>
          lastTapped = icon
        );
      }else {
        _ctrlAnimationPopMenu.status == AnimationStatus.completed
            ? _ctrlAnimationPopMenu.reverse() //展开和收拢效果
            : _ctrlAnimationPopMenu.forward();
      }
    }

    @override
  void initState() {
    super.initState();
    _ctrlAnimationPopMenu = AnimationController(
      //必须初始化动画变量
      duration: const Duration(milliseconds: 250),//动画时长250毫秒
      //vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，动画定时器将会暂停，
      // 当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。
      // 如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin。
      vsync: this, //SingleTickerProviderStateMixin的作用
    );
  }

//生成Popmenu数据
  Widget flowMenuItem(IconData icon){
       //MediaQuery 用于查询解析给定数据的媒体信息（例如，window宽高/横竖屏/像素密度比 等信息）官方提供这个组件让开发者可以获取想要的数据。
       // 它主要用于不同尺寸大小设备的适配。
      //计算按钮直径
      final double buttonDiameter =
          MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: RawMaterialButton(
            fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
            splashColor: Colors.amber[100],
            shape: CircleBorder(),
            constraints: BoxConstraints.tight(Size(buttonDiameter,buttonDiameter)),
            onPressed: (){
              _updateMenu(icon);
            },
            child: Icon(icon,color: Colors.white,size: 30.0,),
          ),
      );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Flow(
        delegate: FlowMenuDelegate(animation:_ctrlAnimationPopMenu),
        children: menuItems
            .map<Widget>((IconData icon) => flowMenuItem(icon))
            .toList(),
      ),
    );
  }

}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({this.animation}):super(repaint: animation);

  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 50.0;
    double y = 50.0;

    for(int i = 0;i < context.childCount;++i){
      x = context.getChildSize(i).width * i * animation.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) =>
      animation != oldDelegate.animation;
}