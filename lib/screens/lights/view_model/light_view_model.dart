import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:lyghts/models/light/light.dart';
import 'package:lyghts/models/request_body/state_dto.dart';
import 'package:lyghts/services/light/light_service.dart';
import 'package:lyghts/utils/BaseViewModel.dart';
import 'package:lyghts/utils/dependency_assembly.dart';

class LightViewModel extends BaseViewModel {
  LightService lightService = dependencyAssembler<LightService>();
  List<dynamic> currentLightIds = [];
  List<Light> currentLights = [];

  //Q: why all these light api request?!
  //A: Group api does not return each light's current status
  //it only returns one of the lights displayed therefore we need to call each
  //light api to have the different colors and settings
  //unfortunately flutter is single threaded so we cannot call multiple calls
  //at the same time :(
  getLightsByGroup(List<dynamic> lightIds,
      {Function(List<Light>) onSuccessNavigate, Function onFail}) async {
    setBusy();
    currentLights.clear();
    currentLightIds.clear();
    currentLightIds = lightIds;

    bool hasSentAllSuccessfully = true;
    List<Light> lights = [];
    try {
      for (String id in lightIds) {
        Response resp = await lightService.getLightById(int.parse(id));
        if (!resp.isSuccessful) {
          hasSentAllSuccessfully = false;
        } else {
          Light newLight = Light.fromJson(resp.body);
          newLight.setId(int.parse(id));
          lights.add(Light.fromJson(resp.body));
          currentLights.add(Light.fromJson(resp.body));
        }
      }
      if (hasSentAllSuccessfully) {
        if (onSuccessNavigate != null) onSuccessNavigate(lights);
        setIdle();
      } else {
        if (onFail != null) onFail();
        setIdle();
      }
    } catch (e) {
      if (onFail != null) onFail();
    }
    setIdle();
  }

  updateLight(Light light) async {
    setBusy();
    try {
      StateDTO state = StateDTO(on: light.state.on, bri: light.state.bri);
      if (light.state.xy != null) state.setXY(light.state.xy);
      Response resp =
          await lightService.updateLightById(light.id, state.toJson());
      if (resp.isSuccessful) {
        getLightsByGroup(currentLightIds);
      } else {}
    } catch (e) {}
    setBusy();
  }
}
