import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:lyghts/light_controller/models/group/group.dart';
import 'package:lyghts/services/group/group_service.dart';
import 'package:lyghts/services/lists/list_group_lights_service.dart';
import 'package:lyghts/utils/dependency_assembly.dart';

class GroupViewModel extends ChangeNotifier {
  List<Group> listOfGroups = [];

  Group retrievedGroup;

  GroupService groupService = dependencyAssembler<GroupService>();
  ListGroupLightsService listService =
      dependencyAssembler<ListGroupLightsService>();

  Future<Group> getGroupById(int id) async {
    Response<Group> response = await groupService.getGroupsById(id);
    if (response.statusCode == 200) {
      Group aGroup = (response.body);
      retrievedGroup = aGroup;
      return aGroup;
    }
    return null;
  }

  Future getListOfGroups() async {
    Response response = await listService.getGroups();
    if (response.statusCode == 200) {
      Map body = response.body;
      body.forEach(
        (k, v) => listOfGroups.add(
          Group.fromJson(v),
        ),
      );
      print(response.body);
    }

    return response;
  }
}
