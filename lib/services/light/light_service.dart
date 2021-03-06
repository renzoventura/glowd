import 'package:chopper/chopper.dart';
import 'package:lyghts/global.dart';

part 'light_service.chopper.dart';

@ChopperApi()
abstract class LightService extends ChopperService {
  @Get(path: '/{id}')
  Future<Response> getLightById(@Path('id') int id);

  @Put(path: '/{id}/state')
  Future<Response> updateLightById(@Path('id') int id, @Body() Map map);

  static LightService create() {
    final client = ChopperClient(
      baseUrl: 'http://$server/api/$api_key/lights',
      services: [
        // The generated implementation
        _$LightService(),
      ],
      converter: JsonConverter(),
    );

    return _$LightService(client);
  }
}
