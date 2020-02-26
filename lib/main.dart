import 'package:flutter/material.dart';
import 'package:lyghts/light_controller/view_models/group_view_model.dart';
import 'package:lyghts/light_controller/view_models/light_view_model.dart';
import 'package:lyghts/light_controller/views/groups_screen.dart';
import 'package:lyghts/light_controller/views/lights_screen.dart';
import 'package:lyghts/utils/dependency_assembly.dart';
import 'package:provider/provider.dart';

void main() {
  setupDependencyAssembler();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LightViewModel()),
        ChangeNotifierProvider(create: (_) => GroupViewModel()),
      ],
      child: MaterialApp(
        title: 'Lyghts',
        theme: ThemeData.dark(),
        initialRoute: GroupsScreen.id,
        routes: {
          GroupsScreen.id: (context) => GroupsScreen(),
          LightsScreen.id: (context) => LightsScreen(),
        },
      ),
    );
  }
}
