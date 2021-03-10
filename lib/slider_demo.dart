import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  SliderDemo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0;
  double _iosSliderValue = 0;
  double _universalSliderValue = 0;
  RangeValues _rangeValues = RangeValues(0, 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('值：$_sliderValue'),
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
            ),
            RangeSlider(
              values: _rangeValues,
              labels:
                  RangeLabels('${_rangeValues.start}', '${_rangeValues.end}'),
              min: 0,
              max: 100,
              divisions: 4,
              onChanged: (v) {
                setState(() {
                  _rangeValues = v;
                });
              },
            ),
            CupertinoSlider(
              value: _iosSliderValue,
              onChanged: (v) {
                setState(() {
                  _iosSliderValue = v;
                });
              },
            ),
            Slider.adaptive(
              value: _universalSliderValue,
              onChanged: (v) {
                setState(() {
                  _universalSliderValue = v;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
