class Startup {
  String mode;
  bool configured;

  Startup({this.mode, this.configured});

  Startup.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
    configured = json['configured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mode'] = this.mode;
    data['configured'] = this.configured;
    return data;
  }
}
