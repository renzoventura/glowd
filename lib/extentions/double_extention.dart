import 'dart:math';

extension Precision on double {
  double roundToTwoDecimal() {
    double mod = pow(10, 2.toDouble());
    return ((this * mod).round().toDouble() / mod);
  }
}
