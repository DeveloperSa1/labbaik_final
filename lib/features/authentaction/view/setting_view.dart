// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:labbaik/features/authentaction/viewModel/auth.dart';
// import 'package:labbaik/imports.dart';
// import 'package:labbaik/shared/constant/colors.dart';
// import 'package:labbaik/shared/widgets/radial.dart';

// import 'package:sizer/sizer.dart';
// import 'package:path/path.dart' as path;

// class AdminSettings extends StatelessWidget {
//   AuthVM controller = Get.find<AuthVM>();
//   @override
//   Widget build(BuildContext context) {
//     final String tabSpace = "\t\t\t";
//     final _nameController = new TextEditingController();
//     final _passController = new TextEditingController();
//     final _emailController = new TextEditingController();
//     final _roleController = new TextEditingController();
//     final _aboutController = new TextEditingController();
//     return Scaffold(
//         body: Directionality(
//       textDirection: TextDirection.rtl,
//       child: Stack(children: [
//         RadialBackground2(
//           color: white,
//           position: "topLeft",
//         ),
//         Padding(
//             padding: EdgeInsets.only(left: 20, right: 20),
//             child: SafeArea(
//                 child: SingleChildScrollView(
//                     child: Column(children: [
//               sizedH20,
//               sizedH20,
//               AppHeader(
//                 title: "الملف الشخصي",
//                 widget: Container(),
//                 // PrimaryProgressButton(
//                 //   width: 80,
//                 //   height: 40,
//                 //   label: "حفظ",
//                 //   textStyle: GoogleFonts.lato(
//                 //       color: Colors.white, fontWeight: FontWeight.bold),
//                 // ),
//               ),
//               SizedBox(height: 50),
//               Stack(
//                 children: [
//                   ProfileUI(
//                       isNetwork: true,
//                       color: HexColor.fromHex("94F0F1"),
//                       dummyType: ProfileType.Image,
//                       scale: 3.0,
//                       image: admin!.image),
//                   Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                           color: AppColors.primaryAccentColor.withOpacity(0.75),
//                           shape: BoxShape.circle),
//                       child: InkWell(
//                         onTap: () async {
//                           //   var _picker = ImagePicker();

//                           //   XFile? image = await _picker.pickImage(
//                           //       source: ImageSource.gallery);

//                           //   var imageFile = File(image!.path);
//                           //   String fileName = path.dirname(imageFile.path);
//                           //   FirebaseStorage storage = FirebaseStorage.instance;
//                           //   Reference ref =
//                           //       storage.ref().child("Image-" + staff.id!);

//                           //   UploadTask uploadTask = ref.putFile(imageFile);
//                           //   await uploadTask.whenComplete(() async {
//                           //     var url = await ref.getDownloadURL();
//                           //     var image_url = url.toString();
//                           //   }).catchError((onError) {
//                           //     print(onError);
//                           //   });

//                           //   await FirebaseFirestore.instance
//                           //       .collection('staff')
//                           //       .doc(staff.id)
//                           //       .update({

//                           //       });
//                         },
//                         child: Icon(FeatherIcons.camera,
//                             color: Colors.white, size: 20),
//                       ))
//                 ],
//               ),
//               sizedH20,
//               sizedH20,
//               LabelledFormInput(
//                   placeholder: admin.name!,
//                   keyboardType: "text",
//                   controller: _nameController,
//                   obscureText: false,
//                   label: "اسم المستخدم"),
//               LabelledFormInput(
//                   placeholder: admin.email!,
//                   keyboardType: "email",
//                   controller: _emailController,
//                   obscureText: true,
//                   label: "ايميلك"),
//               sizedH20,
//               LabelledFormInput(
//                   placeholder: 'حساب الإداره',
//                   keyboardType: "text",
//                   controller: _passController,
//                   obscureText: true,
//                   label: "صلاحيات المستخدم"),
//               sizedH20,
//               InkWell(
//                 onTap: () async {
//                   await Provider.of<AuthServices>(context, listen: false)
//                       .logout();
//                 },
//                 child: Container(
//                     width: double.infinity,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         color: HexColor.fromHex("FF968E"),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Center(
//                       child: Text("تسجيل خروج",
//                           style: GoogleFonts.lato(
//                               color: Colors.white,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold)),
//                     )),
//               ),
//               sizedH40,
//             ]))))
//       ]),
//     ));
//   }
// }
