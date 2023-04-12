import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<StudentVM>();

  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    homeCtrl.getGoals();
    return Obx(
      () => homeCtrl.doinggoals.isEmpty && homeCtrl.donegoals.isEmpty
          ? Column(children: [
              Image.asset('assets/images/Labbaik.png',
                  fit: BoxFit.cover, width: 65.0.wp),
              Text(
                'لم يتم تحديد اهداف',
                style: GoogleFonts.changa(
                    fontWeight: FontWeight.bold, fontSize: 16.0.sp),
              ),
            ])
          : ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...homeCtrl.doinggoals
                    .map(
                      (element) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 1.0.wp,
                          horizontal: 9.0.wp,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Row(
                                children: [
                                  Text(
                                      '${homeCtrl.getNumber(element).toString()} -'),
                                  // IconButton(
                                  //   icon: Icon(Icons.remove),
                                  //   onPressed: () async {
                                  //     await homeCtrl.deleteGoal(element);
                                  //     EasyLoading.showSuccess('تم حذف');
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                              child: Text(
                                element,
                                style:  GoogleFonts.changa(
                    fontWeight: FontWeight.bold, fontSize: 12.0.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                              IconButton(
                                    icon: const Icon(Icons.delete_forever,color: kRedDark,),
                                    onPressed: () async {
                                      await homeCtrl.deleteGoal(element);
                                      EasyLoading.showSuccess('تم حذف');
                                    },
                                  ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                if (homeCtrl.doinggoals.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                    child: const Divider(thickness: 2),
                  )
              ],
            ),
    );
  }
}
