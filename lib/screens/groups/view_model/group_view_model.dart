import 'package:chopper/chopper.dart';
import 'package:lyghts/models/group/group.dart';
import 'package:lyghts/models/light/light.dart';
import 'package:lyghts/services/group/group_service.dart';
import 'package:lyghts/services/light/light_service.dart';
import 'package:lyghts/services/lists/list_group_lights_service.dart';
import 'package:lyghts/utils/BaseViewModel.dart';
import 'package:lyghts/utils/dependency_assembly.dart';

class GroupViewModel extends BaseViewModel {
  List<Group> listOfGroups = [];

  Group retrievedGroup;

  GroupService groupService = dependencyAssembler<GroupService>();
  LightService lightService = dependencyAssembler<LightService>();

  ListGroupLightsService listService =
      dependencyAssembler<ListGroupLightsService>();

  getListOfGroups({Function onEmpty, Function onFail}) async {
    setBusy();
    try {
      listOfGroups.clear();
      Response response = await listService.getGroups();
      if (response.isSuccessful) {
        Map body = response.body;
        body.forEach((k, v) => listOfGroups.add(Group.fromJson(v)));
        if (listOfGroups.isEmpty) {
          if (onEmpty != null) onEmpty();
        }
      } else {
        if (onFail != null) onFail();
      }
    } catch (e) {
      if (onFail != null) onFail();
    }
    setIdle();
  }

  Future<bool> updateGroup(Group group, bool currentState,
      {Function onSuccess, Function onFail}) async {
    setBusy();
    bool hasSentAllSuccessfully = true;
    try {
      for (String id in group.lights) {
        Response resp = await lightService
            .updateLightById(int.parse(id), {"on": !currentState});
        if (!resp.isSuccessful) {
          hasSentAllSuccessfully = false;
        }
      }
      if (hasSentAllSuccessfully) {
        if (onSuccess != null) onSuccess();
        setIdle();
        return !currentState;
      } else {
        if (onFail != null) onFail();
        setIdle();
        return currentState;
      }
    } catch (e) {
      if (onFail != null) onFail();
    }
    setIdle();
    return !currentState;
  }


}
