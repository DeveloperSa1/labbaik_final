import 'package:flutter/material.dart';
import 'package:labbaik/shared/helpers/another_colors.dart';


class AppConstants {
  AppConstants._();

  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      width: 2,
      color: AnotherAppColor.lightNavyBlue,
    ),
  );

  static InputDecoration get inputDecoration => InputDecoration(
        border: inputBorder,
        disabledBorder: inputBorder,
        errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            width: 2,
            color: AnotherAppColor.red,
          ),
        ),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        hintText: "Event Title",
        hintStyle: const TextStyle(
          color: AnotherAppColor.black,
          fontSize: 17,
        ),
        labelStyle: const TextStyle(
          color: AnotherAppColor.black,
          fontSize: 17,
        ),
        helperStyle: const TextStyle(
          color: AnotherAppColor.black,
          fontSize: 17,
        ),
        errorStyle: const TextStyle(
          color: AnotherAppColor.red,
          fontSize: 12,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      );
}

class BreakPoints {
  static const double web = 800;
}