import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:lyghts/global.dart';
import 'package:lyghts/light_controller/models/group/group.dart';

part 'list_group_lights_service.chopper.dart';

@ChopperApi()
abstract class ListGroupLightsService extends ChopperService {
  @Get(path: "/groups")
  Future<Response> getGroups();

  @Get(path: "/lights")
  Future<Response> getLights();

  static ListGroupLightsService create() {
    final client = ChopperClient(
      baseUrl: 'http://$server/api/$api_key',
      services: [
        // The generated implementation
        _$ListGroupLightsService(),
      ],
      converter: JsonConverter(),
    );

    return _$ListGroupLightsService(client);
  }
}
