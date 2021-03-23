import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TimeSelector extends StatefulWidget {
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildShowTimePicker(context),
        SizedBox(
          height: 15,
        ),
        // _buildCalendarTimePicker(),
        SizedBox(
          height: 24,
        ),
        // _buildTimeRangePicker(context),
      ],
    );
  }

  Widget _buildShowTimePicker(BuildContext context) {
    return ElevatedButton(
      child: Text('弹出时间组件'),
      onPressed: () async {
        var result = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            initialEntryMode: TimePickerEntryMode.input,
            helpText: '选择时间',
            cancelText: '-取消-',
            confirmText: '-确定-',
            //24小时制
            // builder: (BuildContext context, Widget child) {
            //   return MediaQuery(
            //   data: MediaQuery.of(context)
            //       .copyWith(alwaysUse24HourFormat: true),
            //   child: child,);
            // },
            //暗黑主题
            // builder: (BuildContext context, Widget child) {
            //   return Theme(
            //     data: ThemeData.dark(),
            //     child: child,
            //   );
            // },

          builder: (BuildContext context, Widget child) {
            return Localizations(
              locale: Locale('en'),
              delegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              child: child,
            );
          },
        );
      },
    );
  }

}
