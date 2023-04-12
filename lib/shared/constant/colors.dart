import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



// COLOR3

class LightColors  {
  static const Color kLightYellow = Color(0xFFFFF9EC);
  static const Color kLightYellow2 = Color(0xFFFFE4C7);
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  static const Color kPalePink = Color(0xFFFED4D6);
  static const Color kRed = Color(0xFFE46472);
  static const Color kLavender = Color(0xFFD5E4FE);
  static const Color kBlue = Color(0xFF6488E4);
  static const Color kLightGreen = Color(0xFFD9E6DC);
  static const Color kGreen = Color(0xFF309397);
  static const Color kDarkBlue = Color(0xFF0D253F);
}

// Colors 2 


const Color kYellowLight = Color(0xFFFFF7EC);
const Color kYellow = Color(0xFFFAF0DA);
const Color kYellowDark = Color(0xFFEBBB7F);
const Color kRedLight = Color(0xFFFCF0F0);
const Color kRed = Color(0xFFFBE4E6);
const Color kRedDark = Color(0xFFF08A8E);
const Color kBlueLight = Color(0xFFEDF4FE);
const Color kBlue = Color(0xFFE1EDFC);
const Color kBlueDark = Color(0xFFC0D3F8);



// App Colors.
Color color1 = HexColor('#181d51');
Color secondryColor = Colors.indigo[200]!; // 5856d6
Color color2 = HexColor('#4657b1');
Color white = HexColor('#EBECF1');
Color black = HexColor('#000000');
Color blue = HexColor('#3BA3D8');
Color green = HexColor('#90C54F');
Color yellow = HexColor('#F8D539');
Color orange = HexColor('#F39B3D');
Color indigo = HexColor('#181d51');
Color lightIndigo = Colors.indigo.withOpacity(0.2);

// RandomColors

const bWhite = Color(0xffffffff);
const darkGrey = Color(0xff2B2B2B);
const lightGrey = Color.fromARGB(255, 85, 84, 84);
const bluishPink = Color(0xffA467D5);
const pink = Color(0xffE85587);

Color randomColor() {
  var random = Random();
  final colorList = [
    color1,
    LightColors.kBlue,
    LightColors.kDarkBlue,
    LightColors.kDarkYellow,
    LightColors.kGreen,
    LightColors.kLavender,
    LightColors.kLightYellow,
    Colors.red,
    Colors.brown,
    LightColors.kPalePink,
    LightColors.kLightYellow2
  ];
  var color = colorList[random.nextInt(colorList.length)];
  return color;
}


// Gradiant

/////////// GRADIENT COLOR
Color first = HexColor('#3f0081');
Color second = HexColor('#4b3987');
Color third = HexColor('#6e61ab');
Color forth = HexColor('#928fce');
Color fifth = HexColor('#aab1e5');



LinearGradient greyGradient = const LinearGradient(
colors: [lightGrey, darkGrey],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0, 0.4],
);

LinearGradient primaryGradient = LinearGradient(
  colors: <Color>[first, second, third, forth, fifth],
  // stops: <double>[0.0, 1.0],
  // begin: Alignment.topCenter,
  // end: Alignment.bottomCenter,
);

LinearGradient gradient1 = LinearGradient(
  colors: [
    Colors.white.withOpacity(0.60),
    Colors.white.withOpacity(0.10),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);


LinearGradient borderGradient1 = LinearGradient(
  colors: [
    Colors.white.withOpacity(0.60),
    Colors.white.withOpacity(0.10),
    Colors.purpleAccent.withOpacity(0.05),
    Colors.purpleAccent.withOpacity(0.60),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: const [0.0, 0.39, 0.40, 1.0],
);

LinearGradient borderGradient2 = LinearGradient(
  colors: [
        Colors.grey.withOpacity(0.9),
    Colors.black.withOpacity(0.90),
    Colors.purpleAccent.withOpacity(0.05),
    Colors.purpleAccent.withOpacity(0.60),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: const [0.0, 0.39, 0.40, 1.0],
);

LinearGradient gradient3 = LinearGradient(
  begin: FractionalOffset.topCenter,
  colors: <Color>[
  HexColor("#a7b2fd"), 
  HexColor("#c1a0fd")],
);

LinearGradient gradient2 = const LinearGradient(
  colors: [Color(0xff0a0d1d), Color(0xff064170)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient glassGradient = LinearGradient(
  colors: [
    Colors.white.withOpacity(0.60),
    Colors.white.withOpacity(0.10),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

// ANOTHER COLORS

class AppColors2 {
  //Shared
  static Color primaryColor = const Color.fromARGB(255, 49, 45, 78);
  static Color scaffoldBackgroundColor = const Color(0xfffafafc);
  static Color borderColor = const Color(0xffd3d2d9);

  //Card
  static Color cardTrueStatusBackgroundColor = const Color(0xffe7e5f1);
  static Color cardFalseStatusTextColor = const Color.fromARGB(255, 95, 20, 15);
  static Color cardFalseStatusBackgroundColor = const Color(0xfffee2e7);

  //Progress
  static Color progressPrimaryTextColor = Colors.white;
  static Color progressPrimaryBackgroundColor = const Color(0xfff56c61);
  static Color progressSecondaryTextColor = const Color(0xFF705517);
  static Color progressSecondaryBackgroundColor = const Color(0xffffd465);

  //Bottom Navigation
  static Color inactiveIconColor = const Color(0xff9695a5);

  // CHART
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  // static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

