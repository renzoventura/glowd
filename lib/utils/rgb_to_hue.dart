import 'dart:math';
import 'package:lyghts/models/rgb.dart';

//for more info please visit
//https://github.com/PhilipsHue/PhilipsHueSDK-iOS-OSX/blob/00187a3db88dedd640f5ddfa8a474458dff4e1db/ApplicationDesignNotes/RGB%20to%20xy%20Color%20conversion.md
class RgbToHue {
  static List<double> rgbToXy(RGB rgb) {
    var r = (rgb.r / 255);
    var g = (rgb.g / 255);
    var b = (rgb.b / 255);
    var red =
        (r > 0.04045) ? pow((r + 0.055) / (1.0 + 0.055), 2.4) : (r / 12.92);
    var green =
        (g > 0.04045) ? pow((g + 0.055) / (1.0 + 0.055), 2.4) : (g / 12.92);
    var blue =
        (b > 0.04045) ? pow((b + 0.055) / (1.0 + 0.055), 2.4) : (b / 12.92);
    var X = red * 0.664511 + green * 0.154324 + blue * 0.162028;
    var Y = red * 0.283881 + green * 0.668433 + blue * 0.047685;
    var Z = red * 0.000088 + green * 0.072310 + blue * 0.986039;
    var x = X / (X + Y + Z);
    var y = Y / (X + Y + Z);
    List<double> xy = [x, y];
    return xy;
  }
}
