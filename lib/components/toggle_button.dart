import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyghts/models/group/group.dart';

class ToggleButton extends StatefulWidget {
  final Group group;
  final Function onToggle;
  ToggleButton({this.group, this.onToggle});
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    onChanged(bool value) async {
      bool newBool = await widget.onToggle();
      widget.group.state.anyOn = newBool;
      setState(() {});
    }

    return CupertinoSwitch(
      value: widget.group.state.anyOn,
      onChanged: (bool value) {
        onChanged(value);
      },
    );
  }
}
