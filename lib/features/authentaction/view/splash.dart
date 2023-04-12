import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/features/authentaction/viewModel/auth.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/widgets/logo_image.dart';
import 'widgets/dark_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

late Size mq;

// ignore: unused_element
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
          Get.put(AuthVM());

    Future.delayed(const Duration(seconds: 3), () {
    });
  }

  final Shader linearGradient = const LinearGradient(
    begin: FractionalOffset.topCenter,
    colors: <Color>[kYellowDark, LightColors.kLightGreen],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 30.0, 40.0));

  @override
  Widget build(BuildContext context) {
    AuthVM cl = Get.find();
    cl.retriveData();
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: white,
            position: "topLeft",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: LogoImage3(),
              ),
              sizedH20,
              RichText(
                text: TextSpan(
                  text: 'تطبيق',
                  style: GoogleFonts.cairo(fontSize: 40),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' لبيك',
                        style: TextStyle(
                            foreground: Paint()..shader = linearGradient,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
          DarkRadialBackground(
            color: Colors.transparent,
            position: "bottomRight",
          )
        ],
      ),
    );
  }
}
