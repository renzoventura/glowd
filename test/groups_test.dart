import 'dart:convert';

import 'package:chopper/src/response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyghts/light_controller/models/group/group.dart';
import 'package:lyghts/light_controller/view_models/group_view_model.dart';
import 'package:lyghts/services/group/group_service.dart';
import 'package:lyghts/utils/dependency_assembly.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockGroupsService extends Mock implements GroupService {}

void main() {
  MockGroupsService mockGroupsService = MockGroupsService();
  mockGroupsService.getGroupsById(1);

  setupDependencyAssembler();
  var groupViewModel = dependencyAssembler<GroupViewModel>();
  groupViewModel.groupService = MockGroupsService();

  //Response is a chopper object that requires a http.Response
  //and the object casting
  //The http.Response should pass in the status code and the Map json
  Response<Group> response = Response(
    http.Response(json.encode(mockGroupJson1), 200),
    mockGroup,
  );

  group('Given Product Group Page Loads', () {
    test('Set retrieved Group when asked', () async {
      when(groupViewModel.groupService.getGroupsById(1))
          .thenAnswer((_) async => response); //the method you want to test
      await groupViewModel.getGroupById(1);
      expect(groupViewModel.retrievedGroup.name, 'My room');
      expect(groupViewModel.retrievedGroup.type, 'Room');
    });
  });
}

Group mockGroup = Group.fromJson(mockGroupJson1);
dynamic mockGroupJson1 = {
  "name": "My room",
  "lights": ["232323", "1"],
  "sensors": [],
  "type": "Room",
  "state": {"all_on": false, "any_on": false},
  "recycle": false,
  "class": "Office",
  "action": {
    "on": false,
    "bri": 254,
    "hue": 7613,
    "sat": 203,
    "effect": "none",
    "xy": [0.5051, 0.4151],
    "ct": 454,
    "alert": "none",
    "colormode": "ct"
  }
};
