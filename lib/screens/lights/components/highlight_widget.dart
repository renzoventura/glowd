import 'package:flutter/material.dart';
import 'package:lyghts/constants/constants_styles.dart';

class HighlightWidget extends StatelessWidget {
  final bool isSelected;
  final Widget child;

  HighlightWidget({@required this.child, @required this.isSelected});
  @override
  Widget build(BuildContext context) {
    getColor() => isSelected ? Colors.white : Colors.transparent;
    return Padding(
      padding: const EdgeInsets.all(smallPadding),
      child: Container(
        decoration: smallCurvedEdgesDecoration.copyWith(
            color: getColor(),
            border: Border.all(
              color: getColor(),
              width: borderWidth,
            )),
        child: child,
      ),
    );
  }
}
