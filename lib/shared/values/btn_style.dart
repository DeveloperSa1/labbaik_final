
import 'package:flutter/material.dart';
import 'package:labbaik/shared/constant/colors.dart';

import 'app_colors.dart';

class ButtonStyles {
  static final ButtonStyle blueRounded = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(color1),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: HexColor.fromHex("246CFE")))));

  static final ButtonStyle imageRounded = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(HexColor.fromHex("181A1F")),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: HexColor.fromHex("666A7A"), width: 1))));
}
