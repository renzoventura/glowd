class Streaming {
  bool renderer;
  bool proxy;

  Streaming({this.renderer, this.proxy});

  Streaming.fromJson(Map<String, dynamic> json) {
    renderer = json['renderer'];
    proxy = json['proxy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['renderer'] = this.renderer;
    data['proxy'] = this.proxy;
    return data;
  }
}
