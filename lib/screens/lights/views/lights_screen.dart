import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyghts/models/light/light.dart' as Light;
import 'package:lyghts/screens/lights/components/highlight_widget.dart';
import 'package:lyghts/screens/lights/components/light_controller.dart';
import 'package:lyghts/screens/lights/components/light_widget.dart';
import 'package:lyghts/screens/lights/view_model/light_view_model.dart';
import 'package:lyghts/utils/hue_to_rgb.dart';
import 'package:provider/provider.dart';

class LightsScreen extends StatefulWidget {
  static const id = "lights";

  @override
  _LightsScreenState createState() => _LightsScreenState();
}

class _LightsScreenState extends State<LightsScreen> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<LightViewModel>(builder: (context, viewModel, child) {
      changeSelected(int i) {
        currentSelected = i;
        setState(() {});
      }

      getLights() {
        if (viewModel.currentLights.isNotEmpty) {
          return Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Text("Lights Screen"),
                  ),
                  InkWell(
                    onTap: () => viewModel
                        .updateLight(viewModel.currentLights[currentSelected]),
                    child: Text("UPDATE!"),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: viewModel.currentLights.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => changeSelected(index),
                        child: HighlightWidget(
                          isSelected: currentSelected == index,
                          child: LightWidget(
                            light: viewModel.currentLights[index],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: LightController(
                    light: viewModel.currentLights[currentSelected],
                    rgb: HueToRgb.xyBriToRgb(
                      viewModel.currentLights[currentSelected].state.bri,
                      viewModel.currentLights[currentSelected].state.xy != null
                          ? viewModel.currentLights[currentSelected].state.xy[0]
                          : null,
                      viewModel.currentLights[currentSelected].state.xy != null
                          ? viewModel.currentLights[currentSelected].state.xy[1]
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Text("No Lights"),
          );
        }
      }

      return SafeArea(
        child: Scaffold(
          body: getLights(),
        ),
      );
    });
  }
}
