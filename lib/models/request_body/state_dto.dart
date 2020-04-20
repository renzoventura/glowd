class StateDTO {
  bool on;
  int bri;
  List<double> xy;
  StateDTO({
    this.on,
    this.bri,
    this.xy,
  });

  StateDTO.fromJson(Map<String, dynamic> json) {
    on = json['on'];
    bri = json['bri'];
    if (json.containsKey('xy')) xy = json['xy'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['on'] = this.on;
    data['bri'] = this.bri;
    data['xy'] = this.xy;
    return data;
  }

  void setBri(int newValue) => bri = newValue;
  void setXY(List<double> newValue) => xy = newValue;
}
