import 'package:flutter/material.dart';
import 'package:lyghts/constants/constants_labels.dart';
import 'package:lyghts/constants/constants_styles.dart';

class HomeBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(mediumPadding),
          child: Text(
            YOUR_ROOMS_TITLE,
            style: TextStyle(fontSize: largeFontSize),
          ),
        ),
        Text(PULL_TO_REFRESH),
        Icon(Icons.arrow_downward),
      ],
    );
  }
}
