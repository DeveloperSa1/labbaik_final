import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart' as h;
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/values/app_colors.dart';
import 'package:sizer/sizer.dart';

class PrimaryTabButton extends StatelessWidget {
  final String buttonText;
  final int itemIndex;
  final ValueNotifier<int> notifier;
  final VoidCallback? callback;
  final double? fontS;
  final VoidCallback? update;
  const PrimaryTabButton(
      {Key? key,
      this.callback,
      required this.notifier,
      required this.buttonText,
      required this.itemIndex,
      this.fontS,
      this.update})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, _, __) {
            return ElevatedButton(
                onPressed: () {
                  notifier.value = itemIndex;
                  if (callback != null) {
                    callback!();
                  }
                  update!();
                },
                style: ButtonStyle(
                    backgroundColor: notifier.value == itemIndex
                        ? MaterialStateProperty.all<Color>(LightColors.kBlue)
                        : MaterialStateProperty.all<Color>(
                            LightColors.kDarkBlue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: notifier.value == itemIndex
                                ? BorderSide(color: h.HexColor("246CFE"))
                                : BorderSide(color: h.HexColor("181A1F"))))),
                child: Text(buttonText,
                    style: GoogleFonts.cairo(
                        fontSize: fontS ?? 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)));
          }),
    );
  }
}

class DayTabButton extends StatelessWidget {
  final String buttonText;
  final int itemIndex;
  final ValueNotifier<int> notifier;
  final VoidCallback? callback;
  final double? fontS;
  const DayTabButton(
      {Key? key,
      this.callback,
      required this.notifier,
      required this.buttonText,
      required this.itemIndex,
      this.fontS})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, _, __) {
            return ElevatedButton(
                onPressed: () {
                  notifier.value = itemIndex;
                  if (callback != null) {
                    callback!();
                  }
                },
                style: ButtonStyle(
                    backgroundColor: notifier.value == itemIndex
                        ? MaterialStateProperty.all<Color>(
                            AppColors.primaryAccentColor)
                        : MaterialStateProperty.all<Color>(
                            AppColors.primaryBackgroundColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: notifier.value == itemIndex
                                ? BorderSide(color: h.HexColor("246CFE"))
                                : BorderSide(color: h.HexColor("181A1F"))))),
                child: Text(buttonText,
                    style: GoogleFonts.cairo(
                        fontSize: fontS ?? 5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)));
          }),
    );
  }
}
