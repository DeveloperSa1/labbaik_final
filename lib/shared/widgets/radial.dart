// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class RadialBackground extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(
    3,
    (index) => HexColor.fromHex("1D192D")  );
  RadialBackground({super.key, required this.color, required this.position});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [...list, color],
        center: (position == "bottomRight")
            ? Alignment(1.0, 1.0)
            : Alignment(-1.0, -1.0),
      ),
    )));
  }
}


class RadialBackground2 extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(
    3,
    (index) => HexColor.fromHex("CCCCCC")  );
  RadialBackground2({super.key, required this.color, required this.position});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [...list, color],
        center: (position == "bottomRight")
            ? Alignment(1.0, 1.0)
            : Alignment(-1.0, -1.0),
      ),
    )));
  }
}
