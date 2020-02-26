import 'package:chopper/chopper.dart';
import 'package:lyghts/global.dart';
import 'package:lyghts/light_controller/models/group/group.dart';
import 'package:lyghts/utils/json_converter.dart';

part 'group_service.chopper.dart';

@ChopperApi()
abstract class GroupService extends ChopperService {
  @Get(path: '/{id}')
  Future<Response<Group>> getGroupsById(@Path('id') int id);

  static GroupService create() {
    final client = ChopperClient(
      baseUrl: 'http://$server/api/$api_key/groups',
      services: [
        // The generated implementation
        _$GroupService(),
      ],
      converter: JsonToTypeConverter({
        Group: (jsonData) => Group.fromJson(jsonData),
      }),
      // converter: JsonConverter(),
    );

    return _$GroupService(client);
  }
}
