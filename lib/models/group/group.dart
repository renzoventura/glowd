import 'package:lyghts/models/group/action.dart';
import 'package:lyghts/models/group/state.dart';

class Group {
  String name;
  List<dynamic> lights;
  String type;
  State state;
  bool recycle;
  Action action;

  Group({
    this.name,
    this.lights,
    this.type,
    this.state,
    this.recycle,
    this.action,
  });

  Group.fromJson(dynamic json) {
    name = json['name'];
    lights = json['lights'];

    type = json['type'];
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    recycle = json['recycle'];
    action =
        json['action'] != null ? new Action.fromJson(json['action']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lights'] = this.lights;

    data['type'] = this.type;
    if (this.state != null) {
      data['state'] = this.state.toJson();
    }
    data['recycle'] = this.recycle;
    if (this.action != null) {
      data['action'] = this.action.toJson();
    }
    return data;
  }
}
