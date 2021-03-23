import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildShowDatePicker(context),
        SizedBox(
          height: 15,
        ),
        _buildCalendarDatePicker(),
        SizedBox(
          height: 24,
        ),
        _buildDateRangePicker(context),
      ],
    );
  }

  Widget _buildShowDatePicker(BuildContext context) {
    return ElevatedButton(
      child: Text('弹出日期组件'),
      onPressed: () async {
        var result = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
            // 直接显示 输入模式，默认是日历模式。
            // initialEntryMode: DatePickerEntryMode.input,
            // 设置日历日期选择器的初始显示，包含 day 和 year
            // initialDatePickerMode: DatePickerMode.year,
            // 设置顶部标题、取消按钮、确定按钮 文案
            helpText: '选择日期',
            cancelText: '取消',
            confirmText: '确定',

            //修改 输入模式 下文案
            errorFormatText: '错误的日期格式',
            errorInvalidText: '日期格式非法',
            fieldHintText: '月/日/年',
            fieldLabelText: '填写日期',

            //今天以后的日期全部为灰色，不可选状态。
            selectableDayPredicate: (date) {
              return date.difference(DateTime.now()).inMilliseconds < 0;
            },

            // 设置深色主题使 builder ，其用于包装对话框窗口小部件以添加继承的窗口小部件，例如Theme，设置深色主题如下
            builder: (context, child) {
              return Theme(
                data: ThemeData.dark(),
                child: child,
              );
            });

        print('$result');
      },
    );
  }

  Widget _buildCalendarDatePicker() {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      onDateChanged: (date) {
        print('$date');
      },
    );
  }

  _buildDateRangePicker(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          var date = showDateRangePicker(
              context: context,
              firstDate: DateTime(2010),
              lastDate: DateTime(2025)
          );
          print('date=$date');
        },
        child: Text('范围日期'));
  }
}
