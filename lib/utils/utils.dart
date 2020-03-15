class Utils {
  static int maxBrightness = 254;
  static String convertToPercent(int bri) {
    return ((bri / maxBrightness) * 100).toInt().toString();
  }

  static double convertToOpacity(int bri) {
    return bri / maxBrightness;
  }
}
