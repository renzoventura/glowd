import 'package:flutter/material.dart';
import 'package:lyghts/constants/constants_labels.dart';
import 'package:lyghts/constants/constants_styles.dart';
import 'package:lyghts/models/light/light.dart' as Light;
import 'package:lyghts/models/rgb.dart';
import 'package:lyghts/screens/lights/components/slider_title.dart';
import 'package:lyghts/utils/hue_to_rgb.dart';
import 'package:lyghts/utils/rgb_to_hue.dart';
import 'package:lyghts/utils/utils.dart';
import 'package:provider/provider.dart';

class LightController extends StatefulWidget {
  final Light.Light light;
  final RGB rgb;
  LightController({@required this.light, this.rgb});

  @override
  _LightControllerState createState() => _LightControllerState();
}

class _LightControllerState extends State<LightController> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = HueToRgb.getLightRGBValues(widget.light);
    Color textColor = backgroundColor.computeLuminance() > brightnessThreshold
        ? Colors.black
        : Colors.white;

    updateBackgroundColor() =>
        widget.light.state.xy = RgbToHue.rgbToXy(widget.rgb);

    List<Widget> sliders = [
      Text(
        widget.light != null ? widget.light.name : LIGHT,
        style: TextStyle(color: textColor),
      ),
      Text(
        LIGHT_CONTROLLER,
        style: TextStyle(color: textColor),
      ),
      SizedBox(
        height: 30,
      ),
      SliderTitle(
        title: BRIGHTNESS,
        value: widget.light.state.bri.toDouble(),
        maxValue: Utils.maxBrightness,
        onChange: (newValue) {
          setState(() {
            widget.light.state.setBri(newValue.toInt());
            if (widget.rgb.isValidRGB())
              updateBackgroundColor(); //need to check if light has RGB
          });
        },
        textColor: textColor,
      ),
    ];

    if (widget.rgb.isValidRGB()) {
      sliders.add(SliderTitle(
        title: R,
        value: widget.rgb.r,
        maxValue: Utils.maxRGBValue,
        onChange: (newValue) {
          setState(() {
            widget.rgb.setR(newValue);
            updateBackgroundColor();
          });
        },
        textColor: textColor,

      ));
      sliders.add(
        SliderTitle(
          title: G,
          value: widget.rgb.g,
          maxValue: Utils.maxRGBValue,
          onChange: (newValue) {
            setState(() {
              widget.rgb.setG(newValue);
              updateBackgroundColor();
            });
          },
          textColor: textColor,
        ),
      );
      sliders.add(
        SliderTitle(
          title: B,
          value: widget.rgb.b,
          maxValue: Utils.maxRGBValue,
          onChange: (newValue) {
            setState(() {
              widget.rgb.setB(newValue);
              updateBackgroundColor();
            });
          },
          textColor: textColor,
        ),
      );
    }

    return Container(
      decoration: smallCurvedEdgesDecoration.copyWith(
        color: backgroundColor,
      ),
      padding: EdgeInsets.all(mediumPadding),
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: sliders,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
