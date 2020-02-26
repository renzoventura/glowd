// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$GroupService extends GroupService {
  _$GroupService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = GroupService;

  Future<Response<Group>> getGroupsById(int id) {
    final $url = '/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Group, Group>($request);
  }
}
