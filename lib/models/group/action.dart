class Action {
  bool on;
  int bri;
  int hue;
  int sat;
  String effect;
  List<dynamic> xy;
  int ct;
  String alert;
  String colormode;

  Action({
    this.on,
    this.bri,
    this.hue,
    this.sat,
    this.effect,
    this.xy,
    this.ct,
    this.alert,
    this.colormode,
  });

  Action.fromJson(Map<String, dynamic> json) {
    on = json['on'];
    bri = json['bri'];
    hue = json['hue'];
    sat = json['sat'];
    effect = json['effect'];
    xy = json['xy'];
    ct = json['ct'];
    alert = json['alert'];
    colormode = json['colormode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['on'] = this.on;
    data['bri'] = this.bri;
    data['hue'] = this.hue;
    data['sat'] = this.sat;
    data['effect'] = this.effect;
    data['xy'] = this.xy;
    data['ct'] = this.ct;
    data['alert'] = this.alert;
    data['colormode'] = this.colormode;
    return data;
  }
}
