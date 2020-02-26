class State {
  bool allOn;
  bool anyOn;

  State({this.allOn, this.anyOn});

  State.fromJson(Map<String, dynamic> json) {
    allOn = json['all_on'];
    anyOn = json['any_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_on'] = this.allOn;
    data['any_on'] = this.anyOn;
    return data;
  }
}
