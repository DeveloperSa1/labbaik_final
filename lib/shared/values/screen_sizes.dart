import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Utils {
  static final double screenWidth = Get.width;
  static final double screenHeight = Get.width;
}

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 3});

  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val; //f(x)
  }
}

// Widget buildStackedImages(
//   List<StudentModel> students,
//     {TextDirection direction = TextDirection.rtl,
//     String? numberOfMembers,
//     bool? addMore}) {
//   final double size = 50;
//   final double xShift = 20;

//   Container lastContainer = Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//       child: Center(
//         child: Text(numberOfMembers!,
//             style: GoogleFonts.cairo(
//                 color: HexColor.fromHex("000000"),
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold)),
//       ));

//   Container iconContainer = Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//           color: AppColors.primaryAccentColor, shape: BoxShape.circle),
//       child: Icon(Icons.add, color: Colors.white));

//   final items = List.generate(
//       students.length,
//       (index) => ProfileUI(
//           // isNetwork: false,
//           color: color1,
//           isNetwork: true ,
//           dummyType: ProfileType.Image,
//           image: students[index].profileImg,
//           scale: 1.0));

//   return StackedWidgets(
//     direction: direction,
//     items: [
//       ...items,
//       lastContainer,
//       (addMore != null) ? iconContainer : SizedBox()
//     ],
//     size: size,
//     xShift: xShift,
//   );
// }
