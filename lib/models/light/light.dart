import 'package:lyghts/models/light/sw_update.dart';

import 'capabilities.dart';
import 'config.dart';

class Light {
  State state;
  Swupdate swupdate;
  String type;
  String name;
  String modelid;
  String manufacturername;
  String productname;
  Capabilities capabilities;
  Config config;
  String uniqueid;
  String swversion;
  String swconfigid;
  String productid;
  int id;

  Light(
      {this.state,
      this.swupdate,
      this.type,
      this.name,
      this.modelid,
      this.manufacturername,
      this.productname,
      this.capabilities,
      this.config,
      this.uniqueid,
      this.swversion,
      this.swconfigid,
      this.productid});

  Light.fromJson(Map<String, dynamic> json) {
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    swupdate = json['swupdate'] != null
        ? new Swupdate.fromJson(json['swupdate'])
        : null;
    type = json['type'];
    name = json['name'];
    modelid = json['modelid'];
    manufacturername = json['manufacturername'];
    productname = json['productname'];
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    uniqueid = json['uniqueid'];
    swversion = json['swversion'];
    swconfigid = json['swconfigid'];
    productid = json['productid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.state != null) {
      data['state'] = this.state.toJson();
    }
    if (this.swupdate != null) {
      data['swupdate'] = this.swupdate.toJson();
    }
    data['type'] = this.type;
    data['name'] = this.name;
    data['modelid'] = this.modelid;
    data['manufacturername'] = this.manufacturername;
    data['productname'] = this.productname;
    if (this.capabilities != null) {
      data['capabilities'] = this.capabilities.toJson();
    }
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    data['uniqueid'] = this.uniqueid;
    data['swversion'] = this.swversion;
    data['swconfigid'] = this.swconfigid;
    data['productid'] = this.productid;
    return data;
  }

  //hue light uses a map key value pair that that adds sequentially each
  // time a new light is added therefore not permanent

  void setId(int customId) => id = customId;
}

class State {
  bool on;
  int bri;
  int hue;
  int sat;
  String effect;
  List<double> xy;
  int ct;
  String alert;
  String colormode;
  String mode;
  bool reachable;

  State(
      {this.on,
      this.bri,
      this.hue,
      this.sat,
      this.effect,
      this.xy,
      this.ct,
      this.alert,
      this.colormode,
      this.mode,
      this.reachable});

  State.fromJson(Map<String, dynamic> json) {
    on = json['on'];
    bri = json['bri'];
    hue = json['hue'];
    sat = json['sat'];
    effect = json['effect'];
    if (json.containsKey('xy')) xy = json['xy'].cast<double>();
    ct = json['ct'];
    alert = json['alert'];
    colormode = json['colormode'];
    mode = json['mode'];
    reachable = json['reachable'];
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
    data['mode'] = this.mode;
    data['reachable'] = this.reachable;
    return data;
  }

  void setBri(int newValue) => bri = newValue;
}
