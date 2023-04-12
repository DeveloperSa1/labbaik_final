import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';
import 'package:labbaik/shared/widgets/gradient_text.dart';

class AddDialog extends StatelessWidget {
  final homeCtrl = Get.find<StudentVM>();

  AddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Form(
        key: homeCtrl.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      homeCtrl.editCtrl.clear();
                      homeCtrl.changeplan(null);
                    },
                    icon: const Icon(CupertinoIcons.xmark),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      if (homeCtrl.formKey.currentState!.validate()) {
                        if (homeCtrl.plan.value == null) {
                          EasyLoading.showError("Please select plan type");
                        } else {
                          var success = homeCtrl.updateplan(
                            homeCtrl.plan.value!,
                            homeCtrl.editCtrl.text,
                          );
                          if (success) {
                            EasyLoading.showSuccess("Todo item added");
                            Get.back();
                            homeCtrl.changeplan(null);
                          } else {
                            EasyLoading.showError('Todo item already exist');
                          }
                          homeCtrl.editCtrl.clear();
                        }
                      }
                    },
                    child: Text(
                      'Done',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 14.0.sp,
                        color: const Color.fromARGB(255, 252, 122, 122),
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: GradientText(
                'New plan',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 22, 22, 22),
                  Color.fromARGB(255, 92, 92, 170),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: TextFormField(
                controller: homeCtrl.editCtrl,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your todo plan';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 5.0.wp, left: 5.0.wp, right: 5.0.wp, bottom: 2.0.wp),
              child: Text(
                'Add to',
                style: TextStyle(
                    fontSize: 14.0.sp,
                    color: const Color.fromRGBO(151, 159, 173, 1)),
              ),
            ),
            ...homeCtrl.plans
                .map(
                  (element) => Obx(
                    () => InkWell(
                      onTap: () => homeCtrl.changeplan(element),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0.wp, horizontal: 5.0.wp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.abc,
                                  color: HexColor.fromHex('#cccccc'),
                                ),
                                SizedBox(width: 3.0.wp),
                                Text(
                                  element.title!,
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.bold,
                                    // color: const Color.fromARGB(106, 54, 69, 79),
                                  ),
                                ),
                              ],
                            ),
                            if (homeCtrl.plan.value == element)
                              const Icon(
                                CupertinoIcons.checkmark_alt,
                                color: Color.fromARGB(255, 252, 122, 122),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      )),
    );
  }
}
