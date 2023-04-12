import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/features/authentaction/model/app_user.dart';
import 'package:labbaik/features/authentaction/view/widgets/dark_background.dart';
import 'package:labbaik/features/authentaction/viewModel/auth.dart';
import 'package:labbaik/features/home/viewModel/calendar.dart';
import 'package:labbaik/features/home/viewModel/home.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/widgets/logo_image.dart';

class HomeSplash extends StatefulWidget {
  final AppUser user;
  const HomeSplash({super.key, required this.user});
  @override
  // ignore: library_private_types_in_public_api
  _HomeSplashState createState() => _HomeSplashState();
}

// ignore: unused_element
class _HomeSplashState extends State<HomeSplash> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeVM());
    Get.put(CalendarVM(user: widget.user));
    Future.delayed(const Duration(seconds: 1), () {});
    
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
