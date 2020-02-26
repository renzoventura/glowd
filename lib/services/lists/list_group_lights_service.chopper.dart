// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_group_lights_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ListGroupLightsService extends ListGroupLightsService {
  _$ListGroupLightsService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ListGroupLightsService;

  Future<Response<dynamic>> getGroups() {
    final $url = '/groups';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response<dynamic>> getLights() {
    final $url = '/lights';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
