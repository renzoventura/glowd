import 'package:lyghts/models/light/streaming.dart';

import 'control.dart';

class Capabilities {
  bool certified;
  Control control;
  Streaming streaming;

  Capabilities({this.certified, this.control, this.streaming});

  Capabilities.fromJson(Map<String, dynamic> json) {
    certified = json['certified'];
    control =
        json['control'] != null ? new Control.fromJson(json['control']) : null;
    streaming = json['streaming'] != null
        ? new Streaming.fromJson(json['streaming'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['certified'] = this.certified;
    if (this.control != null) {
      data['control'] = this.control.toJson();
    }
    if (this.streaming != null) {
      data['streaming'] = this.streaming.toJson();
    }
    return data;
  }
}
