import 'package:flutter/material.dart';
import 'package:lyghts/constants/constants_labels.dart';
import 'package:lyghts/constants/constants_styles.dart';
import 'package:lyghts/models/light/light.dart';
import 'package:lyghts/utils/hue_to_rgb.dart';
import 'package:lyghts/utils/utils.dart';
import 'package:sprintf/sprintf.dart';

class LightWidget extends StatelessWidget {
  final Light light;
  final Function onToggle;

  LightWidget({@required this.light, this.onToggle});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = HueToRgb.getLightRGBValues(light);
    Color textColor = backgroundColor.computeLuminance() > brightnessThreshold
        ? Colors.black
        : Colors.white;
    return Container(
      padding: const EdgeInsets.all(largePadding),
      decoration: smallCurvedEdgesDecoration.copyWith(
        color: light.state.on ? backgroundColor : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      light.name,
                      style: GROUPS_TITLE_TEXT_STYLE.copyWith(
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                light.productname,
                style: HEADER_TEXT_STYLE.copyWith(
                  color: textColor,
                ),
                textAlign: TextAlign.start,
              ),
              Visibility(
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                maintainSemantics: true,
                visible: light.state.on,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        sprintf(
                          '%s ${Utils.convertToPercent(light.state.bri)}%s',
                          [BRIGHTNESS_LEVEL_LABEL, PERCENT],
                        ),
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
