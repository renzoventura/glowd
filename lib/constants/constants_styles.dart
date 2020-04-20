import 'package:flutter/material.dart';


const double smallPadding = 8;
const double mediumPadding = 12;
const double largePadding = 16;

const double borderWidth = 3;
const double largeFontSize = 20;

const GROUPS_TITLE_TEXT_STYLE = TextStyle(
  fontSize: 20,
);

const HEADER_TEXT_STYLE = TextStyle(
  fontSize: 10,
);


final curvedEdgesDecoration = BoxDecoration(
  color: Colors.black12,
  borderRadius: BorderRadius.all(
    Radius.circular(30.0),
  ),
);

final smallCurvedEdgesDecoration = BoxDecoration(
  color: Colors.black12,
  borderRadius: BorderRadius.all(
    Radius.circular(15.0),
  ),
);

const double brightnessThreshold = 0.7;
const int sliderDivisions = 10;
