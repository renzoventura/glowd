import 'package:chopper/chopper.dart';
import 'package:lyghts/models/light/light.dart';
import 'package:lyghts/models/request_body/state_dto.dart';
import 'package:lyghts/services/light/light_service.dart';
import 'package:lyghts/utils/BaseViewModel.dart';
import 'package:lyghts/utils/dependency_assembly.dart';
import 'package:lyghts/extentions/double_extention.dart';

class LightViewModel extends BaseViewModel {
  LightService lightService = dependencyAssembler<LightService>();
  List<dynamic> currentLightIds = [];
  List<Light> currentLights = [];
  int currentSelected = 0;

  //Q: why all these light api request?!
  //A: Group api does not return each light's current status
  //it only returns one of the lights displayed therefore we need to call each
  //light api to have the different colors and settings
  //unfortunately flutter is single threaded so we cannot call multiple calls
  //at the same time :(
  getLightsByGroup(List<dynamic> lightIds,
      {Function onSuccessNavigate, Function onFail}) async {
    setBusy();
    currentSelected = 0;
    currentLights = [];
    currentLightIds = [];
    currentLightIds = lightIds;

    bool hasSentAllSuccessfully = true;
    try {
      for (String id in lightIds) {
        Response resp = await lightService.getLightById(int.parse(id));
        if (!resp.isSuccessful) {
          hasSentAllSuccessfully = false;
        } else {
          Light newLight = Light.fromJson(resp.body);
          newLight.setId(int.parse(id));
          currentLights.add(newLight);
        }
      }
      if (hasSentAllSuccessfully) {
        if (onSuccessNavigate != null) onSuccessNavigate();
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
      print(light.id);
      StateDTO state = StateDTO(on: light.state.on, bri: light.state.bri);
      if (light.state.xy != null && light.state.xy.isNotEmpty)
        state.setXY(light.state.xy.map((f) => f.roundToTwoDecimal()).toList());
      print(state.toJson().toString());
      Response resp = await lightService.updateLightById(
        light.id,
        state.toJson(),
      );
      if (resp.isSuccessful) {
        print(resp.body.toString());
//        getLightsByGroup(currentLightIds);
      } else {}
    } catch (e) {}
    setBusy();
  }

  changeSelected(int i) {
    currentSelected = i;
  }
}
