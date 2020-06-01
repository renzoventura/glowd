import 'package:flutter/material.dart';

class CustomSafeArea extends StatelessWidget {
  final Widget child;
  CustomSafeArea(this.child);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: child,
        ),
      ),
    );
  }
}
