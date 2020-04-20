import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyghts/components/toggle_button.dart';
import 'package:lyghts/constants/constants_labels.dart';
import 'package:lyghts/constants/constants_styles.dart';
import 'package:lyghts/models/group/group.dart';
import 'package:lyghts/utils/hue_to_rgb.dart';
import 'package:lyghts/utils/utils.dart';
import 'package:sprintf/sprintf.dart';

class GroupWidget extends StatelessWidget {
  final Group group;
  final Function onToggle;
  final Function onTap;

  GroupWidget({
    @required this.group,
    @required this.onToggle,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    int totalNumberOfLights = group.lights.length;
    Color backgroundColor = HueToRgb.getGroupRGBValues(group);
    Color textColor = backgroundColor.computeLuminance() > brightnessThreshold
        ? Colors.black
        : Colors.white;

    return Padding(
      padding: const EdgeInsets.all(mediumPadding),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(largePadding),
          decoration: curvedEdgesDecoration.copyWith(
            color: group.state.anyOn ? backgroundColor : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          group.name,
                          style: GROUPS_TITLE_TEXT_STYLE.copyWith(
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "$NUMBER_OF_LIGHTS_LABEL $totalNumberOfLights",
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainSemantics: true,
                    visible: group.state.anyOn,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            sprintf(
                              '%s ${Utils.convertToPercent(group.action.bri)}%s',
                              [BRIGHTNESS_LEVEL_LABEL, PERCENT],
                            ),
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ToggleButton(
                    group: group,
                    onToggle: onToggle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
