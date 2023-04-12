import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/features/students_managment/model/plan.dart';
import 'package:labbaik/features/students_managment/view/activity_detail_view.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

class ActivityCard extends StatelessWidget {
  final Plan activity;
  ActivityCard({super.key, required this.activity});
  final homeCtrl = Get.find<StudentVM>();

  @override
  Widget build(BuildContext context) {
    var squareWidth = Get.width - 8.0.wp;

    return GestureDetector(
      onTap: () {
        homeCtrl.changeplan(activity);
        homeCtrl.changegoals(activity.goals ?? []);

        Get.to(() => DetailPage());
      },

      child: Container(
        width: squareWidth / 2,
        height: squareWidth / 2,
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(
          gradient: gradient2,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 252, 122, 122),
              blurRadius: 5,
              offset: Offset(0, 7),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1, right: 10),
              child: StepProgressIndicator(
                roundedEdges: const Radius.circular(10),
                totalSteps: homeCtrl.isTodoEmpty(activity) ? 1 : activity.goals!.length,
                currentStep:
                    homeCtrl.isTodoEmpty(activity) ? 0 : homeCtrl.getDoneTodo(activity),
                size: 5.5,
                padding: 0,
                selectedGradientColor: gradient1,
                unselectedGradientColor: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white70, Colors.white70],
                ),
              ),
            ),
           
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.0.wp),
                    child: Text(
                      'اسم النشاط : ${activity.title}',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0.sp,
                        ),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 15.0.wp),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      _buildactivityStatusDone(activity)
                    ],
                  ),
                  // check the goals whether it's null or not,
                  // not null => return length, null => return 0
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget _buildactivityStatusDone(activity) {
  var createdactivitysCurrent = Get.find<StudentVM>().getDoneTodo(activity);

  return Container(
    width: 50,
    height: 27,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 252, 244, 243),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        '$createdactivitysCurrent اهداف',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.black54,
        ),
      ),
    ),
  );
}
