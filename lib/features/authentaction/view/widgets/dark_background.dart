import 'package:flutter/material.dart';
import 'package:labbaik/shared/constant/colors.dart';

// ignore: must_be_immutable
class DarkRadialBackground extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(
    3,
    (index) => color1.withOpacity(0.5)
  );
  DarkRadialBackground({super.key, required this.color, required this.position});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [...list, color],
        center: (position == "bottomRight")
            ? const Alignment(5.0, 5.0)
            : const Alignment(-2.0, -1.0),
      ),
    )));
  }
}