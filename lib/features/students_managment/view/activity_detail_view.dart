import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/features/students_managment/view/widgets/widgets/doing_list.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';
import 'package:labbaik/shared/services/admin_services.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class DetailPage extends StatelessWidget {
  final homeCtrl = Get.find<StudentVM>();

  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var task = homeCtrl.plan.value!;
    // var color = HexColor.fromHex(task.color);

    return WillPopScope(
      onWillPop: () async => false,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 250, 244),
          body: Form(
            key: homeCtrl.formKey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0.wp),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                          homeCtrl.updategoals();
                          homeCtrl.changegoals(null);
                          homeCtrl.editCtrl.clear();
                        },
                        icon: const Icon(CupertinoIcons.arrow_right),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.safari,
                        color: color1,
                        size: 9.0.wp,
                      ),
                      SizedBox(width: 3.0.wp),
                      Text(task.title!,
                          style: GoogleFonts.tajawal(
                            textStyle: TextStyle(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(197, 30, 31, 31)),
                          ))
                    ],
                  ),
                ),
                Obx(() {
                  var totalTodos = homeCtrl.doinggoals.length;
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 3.0.wp,
                      left: 16.0.wp,
                      right: 16.0.wp,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '$totalTodos اهداف',
                          style:
                              TextStyle(fontSize: 12.0.sp, color: Colors.grey),
                        ),
                        SizedBox(width: 3.0.wp),
                        Expanded(
                            child: StepProgressIndicator(
                          totalSteps: totalTodos == 0 ? 1 : totalTodos,
                          currentStep: homeCtrl.doinggoals.length,
                          size: 5,
                          padding: 0,
                          selectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [color1.withOpacity(0.5), color1],
                          ),
                          unselectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.grey[300]!, Colors.grey[300]!],
                          ),
                        )),
                      ],
                    ),
                  );
                }),
                Obx(() {
                  var totalTodos =
                      homeCtrl.doinggoals.length + homeCtrl.donegoals.length;
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 3.0.wp,
                      left: 16.0.wp,
                      right: 16.0.wp,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'التقييم',
                          style:
                              TextStyle(fontSize: 12.0.sp, color: Colors.grey),
                        ),
                        SizedBox(width: 3.0.wp),
                        Expanded(
                            child: StepProgressIndicator(
                          totalSteps: totalTodos == 0 ? 1 : totalTodos,
                          currentStep: homeCtrl.doinggoals.length,
                          size: 5,
                          padding: 0,
                          selectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [color1.withOpacity(0.5), color1],
                          ),
                          unselectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.grey[300]!, Colors.grey[300]!],
                          ),
                        )),
                      ],
                    ),
                  );
                }),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 2.0.wp, horizontal: 5.0.wp),
                  child: TextFormField(
                    controller: homeCtrl.editCtrl,
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      // prefixIcon: Padding(
                      //   padding: EdgeInsets.only(bottom: 1.3.wp),
                      //   child: Icon(
                      //     CupertinoIcons.checkmark,
                      //     color: Colors.grey[400],
                      //   ),
                      // ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          if (homeCtrl.formKey.currentState!.validate()) {
                            var success =
                                homeCtrl.addGoal(homeCtrl.editCtrl.text);

                            if (success) {
                              EasyLoading.showSuccess('تم اضافه هدف');
                              await AdminServices.addGoal(
                                  task, homeCtrl.editCtrl.text);
                            } else {
                              EasyLoading.showError('مكرر');
                            }

                            homeCtrl.editCtrl.clear();
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.plus_rectangle_fill,
                          color: AppColors2.contentColorGreen,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'اكتب الاهداف';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                DoingList(),
                // DoneList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
