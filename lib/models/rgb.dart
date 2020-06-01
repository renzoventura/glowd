class RGB {
  double r;
  double g;
  double b;

  RGB(this.r, this.g, this.b);

  void setR(double newValue) => r = newValue;
  void setG(double newValue) => g = newValue;
  void setB(double newValue) => b = newValue;

  bool isValidRGB() => (r != null && g != null && b != null);
}
