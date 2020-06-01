import 'package:flutter/material.dart';
import 'package:lyghts/constants/constants_labels.dart';
import 'package:lyghts/constants/constants_styles.dart';

class HomeBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(mediumPadding),
          child: Text(
            YOUR_ROOMS_TITLE,
            style: SCREEN_TITLE,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.keyboard_arrow_down),
            Text(
              PULL_TO_REFRESH,
              style: HEADER_TEXT_STYLE,
            ),
          ],
        ),
      ],
    );
  }
}
