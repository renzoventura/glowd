import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyghts/components/custom_safe_area.dart';
import 'package:lyghts/constants/constants_labels.dart';
import 'package:lyghts/constants/constants_styles.dart';
import 'package:lyghts/screens/groups/view_model/group_view_model.dart';
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
  @override
  Widget build(BuildContext context) {
    navigateAndReload() {
      Navigator.pop(context);
      Provider.of<GroupViewModel>(context, listen: true).getListOfGroups();
    }

    return Consumer<LightViewModel>(builder: (context, viewModel, child) {
      changeSelected(int i) {
        viewModel.changeSelected(i);
        setState(() {});
      }

      getLights() {
        if (viewModel.currentLights.isNotEmpty) {
          return Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(mediumPadding),
                        child: Text(
                          LIGHT_SCREEN,
                          style: SCREEN_TITLE,
                        ),
                      ),
                      IconButton(
                        onPressed: navigateAndReload,
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ],
                  ),
//                  InkWell(
//                    onTap: () => viewModel.updateLight(
//                        viewModel.currentLights[viewModel.currentSelected]),
//                    child: Text("UPDATE!"),
//                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: viewModel.currentLights.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => changeSelected(index),
                        child: HighlightWidget(
                          isSelected: viewModel.currentSelected == index,
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
                    light: viewModel.currentLights[viewModel.currentSelected],
                    rgb: HueToRgb.xyBriToRgb(
                      viewModel
                          .currentLights[viewModel.currentSelected].state.bri,
                      viewModel.currentLights[viewModel.currentSelected].state
                                  .xy !=
                              null
                          ? viewModel.currentLights[viewModel.currentSelected]
                              .state.xy[0]
                          : null,
                      viewModel.currentLights[viewModel.currentSelected].state
                                  .xy !=
                              null
                          ? viewModel.currentLights[viewModel.currentSelected]
                              .state.xy[1]
                          : null,
                    ),
                    onTap: () => viewModel.updateLight(
                        viewModel.currentLights[viewModel.currentSelected]),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Text(NO_LIGHTS),
          );
        }
      }

      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: CustomSafeArea(
          getLights(),
        ),
      );
    });
  }
}
