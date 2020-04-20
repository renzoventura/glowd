import 'package:lyghts/models/light/startup.dart';

class Config {
  String archetype;
  String function;
  String direction;
  Startup startup;

  Config({this.archetype, this.function, this.direction, this.startup});

  Config.fromJson(Map<String, dynamic> json) {
    archetype = json['archetype'];
    function = json['function'];
    direction = json['direction'];
    startup = json['startup'] != null ? new Startup.fromJson(json['startup']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['archetype'] = this.archetype;
    data['function'] = this.function;
    data['direction'] = this.direction;
    if (this.startup != null) {
      data['startup'] = this.startup.toJson();
    }
    return data;
  }
}