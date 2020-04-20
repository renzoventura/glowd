import 'package:flutter/material.dart';
import 'package:lyghts/constants/constants_styles.dart';
import 'package:lyghts/utils/utils.dart';

class SliderTitle extends StatefulWidget {
  final String title;
  final double value;
  final int maxValue;
  final Function(double) onChange;
  final Color textColor;
  SliderTitle({
    @required this.title,
    @required this.value,
    @required this.onChange,
    @required this.maxValue,
    @required this.textColor,
  });
  @override
  _SliderTitleState createState() => _SliderTitleState();
}

class _SliderTitleState extends State<SliderTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Slider(
            value: widget.value.toDouble(),
            min: 1,
            max: widget.maxValue.toDouble(),
            divisions: sliderDivisions,
            activeColor: Colors.black45,
            inactiveColor: Colors.black,
            label: '${Utils.convertToPercent(widget.value.toInt())}%',
            onChanged: (double newValue) {
              widget.onChange(newValue);
            },
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: widget.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
