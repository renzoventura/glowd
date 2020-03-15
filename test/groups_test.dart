import 'dart:convert';

import 'package:chopper/src/response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lyghts/models/group/group.dart';
import 'package:lyghts/screens/groups/view_model/group_view_model.dart';
import 'package:lyghts/services/group/group_service.dart';
import 'package:lyghts/services/light/light_service.dart';
import 'package:lyghts/services/lists/list_group_lights_service.dart';
import 'package:lyghts/utils/dependency_assembly.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'mock_data.dart';

class MockGroupsService extends Mock implements GroupService {}

class MockLightsService extends Mock implements LightService {}

class MockListService extends Mock implements ListGroupLightsService {}

void main() {
  MockLightsService mockLightsService = MockLightsService();
  MockGroupsService mockGroupsService = MockGroupsService();
  MockListService mockListService = MockListService();

  setupDependencyAssembler();
  GroupViewModel groupViewModel = dependencyAssembler<GroupViewModel>();
  groupViewModel.groupService = mockGroupsService;
  groupViewModel.listService = mockListService;
  groupViewModel.lightService = mockLightsService;

  Response listGroupsResponse5 = Response(
      http.Response(json.encode(mockListOfGroups5), 200), mockListOfGroups5);
  Response listGroupsResponse2 = Response(
      http.Response(json.encode(mockListOfGroups2), 200), mockListOfGroups2);
  Response listGroupsResponse1 = Response(
      http.Response(json.encode(mockListOfGroups1), 200), mockListOfGroups1);
  Response listGroupsResponse0 = Response(
      http.Response(json.encode(mockListOfGroups1), 200),
      mockEmptyListOfGroups);
  Response groupsResponse = Response(
      http.Response(json.encode(mockListOfGroups5), 200), mockGroupJson1);

  Response failedGroupsResponse =
      Response(http.Response("", 400), mockListOfGroups5);
  Response failedGroupResponse =
      Response(http.Response("", 400), mockGroupJson1);

  group('Get Groups:', () {
    test('Request failed and list of Groups is empty', () async {
      bool onEmptyCallBackCalled = false;
      bool failedCallBackCalled = false;
      onEmptyCallBack() => onEmptyCallBackCalled = true;
      failedCallBack() => failedCallBackCalled = true;
      when(groupViewModel.listService.getGroups())
          .thenAnswer((_) async => failedGroupsResponse);
      await groupViewModel.getListOfGroups(
          onEmpty: onEmptyCallBack, onFail: failedCallBack);
      expect(failedCallBackCalled, true);
      expect(onEmptyCallBackCalled, false);
      expect(groupViewModel.listOfGroups.length, 0);
    });
    test('Request returns list of 0 and listOfGroups.lenght is 0', () async {
      bool onEmptyCallBackCalled = false;
      bool failedCallBackCalled = false;
      onEmptyCallBack() => onEmptyCallBackCalled = true;
      failedCallBack() => failedCallBackCalled = true;
      when(groupViewModel.listService.getGroups())
          .thenAnswer((_) async => listGroupsResponse0);
      await groupViewModel.getListOfGroups(
          onEmpty: onEmptyCallBack, onFail: failedCallBack);
      expect(failedCallBackCalled, false);
      expect(onEmptyCallBackCalled, true);
      expect(groupViewModel.listOfGroups.length, 0);
    });
    test('Request returns list of 5 and listOfGroups.lenght is 5', () async {
      bool onEmptyCallBackCalled = false;
      bool failedCallBackCalled = false;
      onEmptyCallBack() => onEmptyCallBackCalled = true;
      failedCallBack() => failedCallBackCalled = true;
      when(groupViewModel.listService.getGroups())
          .thenAnswer((_) async => listGroupsResponse5);
      await groupViewModel.getListOfGroups(
          onEmpty: onEmptyCallBack, onFail: failedCallBack);
      expect(failedCallBackCalled, false);
      expect(onEmptyCallBackCalled, false);
      expect(groupViewModel.listOfGroups.length, 5);
    });
    test('Request returns list of 2 and listOfGroups.lenght is 2', () async {
      bool onEmptyCallBackCalled = false;
      bool failedCallBackCalled = false;
      onEmptyCallBack() => onEmptyCallBackCalled = true;
      failedCallBack() => failedCallBackCalled = true;
      when(groupViewModel.listService.getGroups())
          .thenAnswer((_) async => listGroupsResponse2);
      await groupViewModel.getListOfGroups(
          onEmpty: onEmptyCallBack, onFail: failedCallBack);
      expect(failedCallBackCalled, false);
      expect(onEmptyCallBackCalled, false);
      expect(groupViewModel.listOfGroups.length, 2);
    });
    test('Request returns list of 1 and listOfGroups.lenght is 1', () async {
      bool onEmptyCallBackCalled = false;
      bool failedCallBackCalled = false;
      onEmptyCallBack() => onEmptyCallBackCalled = true;
      failedCallBack() => failedCallBackCalled = true;
      when(groupViewModel.listService.getGroups())
          .thenAnswer((_) async => listGroupsResponse1);
      await groupViewModel.getListOfGroups(
          onEmpty: onEmptyCallBack, onFail: failedCallBack);
      expect(failedCallBackCalled, false);
      expect(onEmptyCallBackCalled, false);
      expect(groupViewModel.listOfGroups.length, 1);
    });
  });

  group('Update Groups:', () {
    test('Request failed', () async {
      bool onSuccessCallBackCalled = false;
      bool failedCallBackCalled = false;
      onSuccessCallBack() => onSuccessCallBackCalled = true;
      failedCallBack() => failedCallBackCalled = true;
      Group group = Group.fromJson(mockGroupJson1);
      when(groupViewModel.lightService
              .updateLightById(1, {"on": !group.state.anyOn}))
          .thenAnswer((_) async => failedGroupResponse);
      await groupViewModel.updateGroup(group, group.state.anyOn,
          onSuccess: onSuccessCallBack, onFail: failedCallBack);
      expect(failedCallBackCalled, true);
      expect(onSuccessCallBackCalled, false);
    });
    test('Request successful', () async {
      bool onSuccessCallBackCalled = false;
      bool failedCallBackCalled = false;
      onSuccessCallBack() => onSuccessCallBackCalled = true;
      failedCallBack() => failedCallBackCalled = true;
      Group group = Group.fromJson(mockGroupJson1);
      for (String id in group.lights) {
        when(groupViewModel.lightService
                .updateLightById(int.parse(id), {"on": !group.state.anyOn}))
            .thenAnswer((_) async => groupsResponse);
      }
      await groupViewModel.updateGroup(group, group.state.anyOn,
          onSuccess: onSuccessCallBack, onFail: failedCallBack);
      expect(failedCallBackCalled, false);
      expect(onSuccessCallBackCalled, true);
    });
  });
}
