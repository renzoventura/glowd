// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$LightService extends LightService {
  _$LightService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = LightService;

  Future<Response<dynamic>> getLightById(int id) {
    final $url = '/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
