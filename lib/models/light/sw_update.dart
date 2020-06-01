class Swupdate {
  String state;
  String lastinstall;

  Swupdate({this.state, this.lastinstall});

  Swupdate.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    lastinstall = json['lastinstall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['lastinstall'] = this.lastinstall;
    return data;
  }
}
