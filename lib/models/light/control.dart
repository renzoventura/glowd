import 'ct.dart';

class Control {
  int mindimlevel;
  int maxlumen;
  String colorgamuttype;
  List<dynamic> colorgamut;
  Ct ct;

  Control(
      {this.mindimlevel,
      this.maxlumen,
      this.colorgamuttype,
      this.colorgamut,
      this.ct});

  Control.fromJson(Map<String, dynamic> json) {
    mindimlevel = json['mindimlevel'];
    maxlumen = json['maxlumen'];
    colorgamuttype = json['colorgamuttype'];
    if (json['colorgamut'] != null) {
      colorgamut = json['colorgamut'];
    }
    ct = json['ct'] != null ? new Ct.fromJson(json['ct']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mindimlevel'] = this.mindimlevel;
    data['maxlumen'] = this.maxlumen;
    data['colorgamuttype'] = this.colorgamuttype;

    if (this.colorgamut != null) {
      data['colorgamut'] = this.colorgamut;
    }
    if (this.ct != null) {
      data['ct'] = this.ct.toJson();
    }
    return data;
  }
}
