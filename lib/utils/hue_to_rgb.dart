import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lyghts/models/group/group.dart';
import 'package:lyghts/models/light/light.dart';
import 'package:lyghts/models/rgb.dart';
import 'package:lyghts/utils/utils.dart';

//for more info please visit
//https://github.com/PhilipsHue/PhilipsHueSDK-iOS-OSX/blob/00187a3db88dedd640f5ddfa8a474458dff4e1db/ApplicationDesignNotes/RGB%20to%20xy%20Color%20conversion.md
class HueToRgb {
  static Color defaultColor(int bri) => Color.fromRGBO(
      255, 183, 83, Utils.convertToOpacity(bri)); //default for non rgb light

  static Color getGroupRGBValues(Group group) {
    if (group.action.xy == null) return defaultColor(group.action.bri);
    return xyBriToColor(
        group.action.bri, group.action.xy[0], group.action.xy[1]);
  }

  static Color getLightRGBValues(Light light) {
    if (light.state.xy == null) return defaultColor(light.state.bri);
    return xyBriToColor(light.state.bri, light.state.xy[0], light.state.xy[1]);
  }

  static Color xyBriToColor(int bri, dynamic xValue, dynamic yValue) {
    double x = xValue.toDouble();
    double y = yValue.toDouble();
    double z = 1.0 - x - y;
    double Y = bri / 255.0; // Brightness of lamp
    double X = (Y / y) * x;
    double Z = (Y / y) * z;
    double r = X * 1.612 - Y * 0.203 - Z * 0.302;
    double g = -X * 0.509 + Y * 1.412 + Z * 0.066;
    double b = X * 0.026 - Y * 0.072 + Z * 0.962;
    r = r <= 0.0031308
        ? 12.92 * r
        : (1.0 + 0.055) * pow(r, (1.0 / 2.4)) - 0.055;
    g = g <= 0.0031308
        ? 12.92 * g
        : (1.0 + 0.055) * pow(g, (1.0 / 2.4)) - 0.055;
    b = b <= 0.0031308
        ? 12.92 * b
        : (1.0 + 0.055) * pow(b, (1.0 / 2.4)) - 0.055;
    //var maxValue = Math.max(r,g,b);
    double maxValue = [r, g, b].reduce(max);
    r /= maxValue;
    g /= maxValue;
    b /= maxValue;
    r = r * 255;
    if (r < 0) {
      r = 255;
    }
    g = g * 255;
    if (g < 0) {
      g = 255;
    }
    b = b * 255;
    if (b < 0) {
      b = 255;
    }

    return Color.fromRGBO(
        r.toInt(), g.toInt(), b.toInt(), Utils.convertToOpacity(bri));
  }

  static RGB xyBriToRgb(int bri, dynamic xValue, dynamic yValue) {
    if (xValue == null || yValue == null) {
      return RGB(null, null, null);
    }
    double x = xValue.toDouble();
    double y = yValue.toDouble();
    double z = 1.0 - x - y;
    double Y = bri / 255.0; // Brightness of lamp
    double X = (Y / y) * x;
    double Z = (Y / y) * z;
    double r = X * 1.612 - Y * 0.203 - Z * 0.302;
    double g = -X * 0.509 + Y * 1.412 + Z * 0.066;
    double b = X * 0.026 - Y * 0.072 + Z * 0.962;
    r = r <= 0.0031308
        ? 12.92 * r
        : (1.0 + 0.055) * pow(r, (1.0 / 2.4)) - 0.055;
    g = g <= 0.0031308
        ? 12.92 * g
        : (1.0 + 0.055) * pow(g, (1.0 / 2.4)) - 0.055;
    b = b <= 0.0031308
        ? 12.92 * b
        : (1.0 + 0.055) * pow(b, (1.0 / 2.4)) - 0.055;
    double maxValue = [r, g, b].reduce(max);
    r /= maxValue;
    g /= maxValue;
    b /= maxValue;
    r = r * 255;
    if (r < 0) r = 255;
    g = g * 255;
    if (g < 0) g = 255;
    b = b * 255;
    if (b < 0) b = 255;

    return RGB(r, g, b);
  }
}
