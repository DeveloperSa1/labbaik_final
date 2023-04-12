// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:labbaik/imports.dart';
// import 'package:labbaik/shared/constant/colors.dart';
// import 'package:labbaik/shared/constant/texts_styles.dart';
// import 'package:labbaik/shared/helpers/data_util.dart';
// import 'package:labbaik/shared/store/values/appColors.dart';
// import 'package:labbaik/shared/values/color_values.dart';
// import 'package:labbaik/shared/widget/headers/profileWidget.dart';

// class DashboardNav extends StatelessWidget {
//   final String title;
//   final String image;
//   final IconData icon;
//   final Widget? page;
//   final VoidCallback? onImageTapped;
//   final String notificationCount;

//   DashboardNav(
//       {Key? key,
//       required this.title,
//       required this.icon,
//       required this.image,
//       required this.notificationCount,
//       this.page,
//       this.onImageTapped})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return Row(
//     //   mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//     //   InkWell(
//     //     onTap: () {
//     //       if (page != null) Get.to(() => page!);
//     //     },
//     //     child: Stack(children: <Widget>[
//     //       Icon(icon, color: color1, size: 5.h),
//     //       Positioned(
//     //         // draw a red marble
//     //         top: 0.0,
//     //         right: 0.0,
//     //         child: Container(
//     //           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//     //           decoration: BoxDecoration(
//     //               shape: BoxShape.circle, color: HexColor.fromHex("FF9B76")),
//     //           alignment: Alignment.center,
//     //           child: Text(notificationCount,
//     //               style: GoogleFonts.cairo(fontSize: 11, color: color1)),
//     //         ),
//     //       ),
//     //       Align(
//     //           alignment: Alignment.bottomCenter,
//     //           child: Container(
//     //             margin: EdgeInsets.only(top: 32),
//     //             child: Text(
//     //               '${MyDateUtil.getCurrentMonth()} - ${DateTime.now().year}',
//     //               style: blueText,
//     //             ),
//     //           ))
//     //     ]),
//     //   ),
//     //   SizedBox(width: 40),
//     //   InkWell(
//     //     onTap: onImageTapped,
//     //     //
//     //     child: ProfileUI(
//     //         isNetwork: true,
//     //         color: LightColors.kLavender,
//     //         dummyType: ProfileType.Image,
//     //         image: this.image,
//     //         scale: 1.9),
//     //   )
//     // ]);
//   }
// }


// class BackNav extends StatelessWidget {
//   final String title;
//   final String image;
//   final IconData icon;
//   final Widget? page;
//   final VoidCallback? onImageTapped;
//   final String notificationCount;

//   BackNav(
//       {Key? key,
//       required this.title,
//       required this.icon,
//       required this.image,
//       required this.notificationCount,
//       this.page,
//       this.onImageTapped})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//         InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: Stack(children: <Widget>[
//             Icon(icon, color: color1, size: 5.h),
//             Positioned(
//               // draw a red marble
//               top: 0.0,
//               right: 0.0,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle, color: HexColor.fromHex("FF9B76")),
//                 alignment: Alignment.center,
//                 child: Text(notificationCount,
//                     style: GoogleFonts.cairo(fontSize: 11, color: color1)),
//               ),
//             ),
//             Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   margin: EdgeInsets.only(top: 32),
//                   child: Text(
//                     '${MyDateUtil.getCurrentMonth()} - ${DateTime.now().year}',
//                     style: blueText,
//                   ),
//                 ))
//           ]),
//         ),
//         SizedBox(width: 40)
//       ]),
//       InkWell(
//         onTap: onImageTapped,
//         //
//         child: ProfileUI(
//             isNetwork: true,
//             color: LightColors.kLavender,
//             dummyType: ProfileType.Image,
//             image: this.image,
//             scale: 1.9),
//       )
//     ]);
//   }
// }

// class CalendarNav extends StatelessWidget {
//   final String title;
//   final String image;
//   final IconData icon;
//   final VoidCallback? onTap;
//   final VoidCallback? onImageTapped;
//   final String notificationCount;

//   CalendarNav(
//       {Key? key,
//       required this.title,
//       required this.icon,
//       required this.image,
//       required this.notificationCount,
//       this.onTap,
//       this.onImageTapped})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//         InkWell(
//           onTap: onTap,
//           child: Stack(children: <Widget>[
//             Icon(icon, color: color1, size: 5.h),
//             Positioned(
//               // draw a red marble
//               top: 0.0,
//               right: 0.0,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle, color: HexColor.fromHex("FF9B76")),
//                 alignment: Alignment.center,
//                 child: Text(notificationCount,
//                     style: GoogleFonts.cairo(fontSize: 11, color: color1)),
//               ),
//             ),
           
//           ]),
//         ), Positioned(
//                 bottom: 0,
//                 child: Text(
//                   MyDateUtil.getCurrentMonth(),
//                   style: blueText,
//                 )),
//         SizedBox(width: 40)
//       ]),
//       InkWell(
//         onTap: onImageTapped,
//         //
//         child: ProfileUI(
//             isNetwork: true,
//             color: LightColors.kLavender,
//             dummyType: ProfileType.Image,
//             image: this.image,
//             scale: 1.9),
//       )
//     ]);
//   }
// }
