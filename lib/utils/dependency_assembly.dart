import 'package:get_it/get_it.dart';
import 'package:lyghts/screens/groups/view_model/group_view_model.dart';
import 'package:lyghts/screens/lights/view_model/light_view_model.dart';
import 'package:lyghts/services/group/group_service.dart';
import 'package:lyghts/services/light/light_service.dart';
import 'package:lyghts/services/lists/list_group_lights_service.dart';

//TODO: DI
GetIt dependencyAssembler = GetIt.instance;

void setupDependencyAssembler() {
  dependencyAssembler.registerLazySingleton(() => GroupService.create());
  dependencyAssembler.registerLazySingleton(() => LightService.create());
  dependencyAssembler
      .registerLazySingleton(() => ListGroupLightsService.create());
  dependencyAssembler.registerLazySingleton(() => GroupViewModel());
  dependencyAssembler.registerLazySingleton(() => LightViewModel());
}
