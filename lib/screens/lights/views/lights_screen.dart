import 'package:flutter/material.dart';

class LightsScreen extends StatelessWidget {
  static const id = "lights";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Lights Screen"),
        ),
      ),
    );
  }
}
