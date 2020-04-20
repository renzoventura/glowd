class Utils {
  static int maxBrightness = 254;
  static int maxRGBValue = 255;

  static String convertToPercent(int bri) {
    return ((bri / maxBrightness) * 100).round().toInt().toString();
  }

  static double convertToOpacity(int bri) {
    return bri / maxBrightness;
  }
}
