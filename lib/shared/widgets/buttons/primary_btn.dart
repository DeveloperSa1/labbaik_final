import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/shared/values/btn_style.dart';

enum PrimaryButtonSizes { small, medium, large }

class AppPrimaryButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final bool? isPrimary;
  final String buttonText;
  final VoidCallback? callback;
  final double? fontS;
  const AppPrimaryButton(
      {Key? key,
      this.callback,
      required this.buttonText,
      required this.buttonHeight,
      required this.buttonWidth,
      this.isPrimary = true,  this.fontS})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //padding: EdgeInsets.all(20),
      // width: 180,
      // height: 50,
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
          onPressed: callback,
          style:
              isPrimary! ? ButtonStyles.blueRounded : ButtonStyles.imageRounded,
          child: Text(buttonText,
              style: GoogleFonts.cairo(
                  fontSize: fontS ?? 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }
}
