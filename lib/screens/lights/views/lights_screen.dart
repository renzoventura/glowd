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

  final List<Light.Light> lights;

  LightsScreen({this.lights});

  @override
  _LightsScreenState createState() => _LightsScreenState();
}

class _LightsScreenState extends State<LightsScreen> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {

    changeSelected(int i) {
      currentSelected = i;
      setState(() {});
    }
    return Consumer<LightViewModel>(builder: (context, viewModel, child) {
//      double x;
//      double y;
//      if (widget.lights[currentSelected].state.xy != null) {
//        x = widget.lights[currentSelected].state.xy[0];
//        y = widget.lights[currentSelected].state.xy[1];
//      }

      return SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Text("Lights Screen"),
                  ),
                  InkWell(
                    onTap: () {
                      viewModel.updateLight(widget.lights[currentSelected]);
                    },
                    child: Text("UPDATE!"),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.lights.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          changeSelected(index);
                        },
                        child: HighlightWidget(
                          isSelected: currentSelected == index,
                          child: LightWidget(
                            light: widget.lights[index],
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
                    light: widget.lights[currentSelected],
                    rgb: HueToRgb.xyBriToRgb(
                      widget.lights[currentSelected].state.bri,
                      widget.lights[currentSelected].state.xy != null
                          ? widget.lights[currentSelected].state.xy[0]
                          : null,
                      widget.lights[currentSelected].state.xy != null
                          ? widget.lights[currentSelected].state.xy[1]
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

  }
}
