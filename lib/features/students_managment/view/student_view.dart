
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/features/home/model/guardian.dart';
import 'package:labbaik/features/home/view/widgets/lists/add_user.dart';
import 'package:labbaik/features/students_managment/model/plan.dart';
import 'package:labbaik/features/students_managment/view/widgets/activity_card.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';
import 'package:labbaik/shared/widgets/buttons/tab_btn.dart';
import 'package:labbaik/shared/widgets/gradient_text.dart';

import 'widgets/add_card.dart';

class StudentView extends GetView<StudentVM> {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 244),
      appBar: _buildAppBar(controller.student.value),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
               SafeArea(
                      child: ListView(
                        children: [
                          // Hello
                          Padding(
                            padding: EdgeInsets.only(
                                left: 5.0.wp, top: 4.0.wp, bottom: 3.0.wp),
                            child: GradientText(
                              controller.gendarTitle(),
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.bold,
                              )),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 0, 0, 0),
                                Color.fromARGB(255, 95, 110, 138),
                              ]),
                            ),
                          ),
                          // ROW ITEMS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PrimaryTabButton(
                                  update: () => controller.changeChipIndex(0),
                                  fontS: 9,
                                  buttonText: "الخطة الشهرية",
                                  itemIndex: 0,
                                  notifier: controller.chipIndex.value),
                              PrimaryTabButton(
                                  update: () => controller.changeChipIndex(1),
                                  fontS: 9,
                                  buttonText: "التقارير",
                                  itemIndex: 1,
                                  notifier: controller.chipIndex.value),
                              PrimaryTabButton(
                                  update: () => controller.changeChipIndex(2),
                                  fontS: 9,
                                  buttonText: "المعلمات",
                                  itemIndex: 2,
                                  notifier: controller.chipIndex.value),
                            ],
                          ),
                          Obx(
                            () => GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              children: [
                                ...controller.plans
                                    .map(
                                      (element) => LongPressDraggable(
                                          data: element,
                                          onDragStarted: () =>
                                              controller.changeDeleting(true),
                                          onDraggableCanceled: (_, __) =>
                                              controller.changeDeleting(false),
                                          onDragEnd: (_) =>
                                              controller.changeDeleting(false),
                                          feedback: Opacity(
                                            opacity: 0.8,
                                            child:
                                                ActivityCard(activity: element),
                                          ),
                                          child:
                                              ActivityCard(activity: element)),
                                    )
                                    .toList(),
                                AddCard(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
              // ReportPage(),
            ],
          ),
        ),
      ),
      floatingActionButton: DragTarget<Plan>(
        builder: (_, __, ___) {
          return Obx(
            () => FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              backgroundColor:
                  controller.deleting.value ? Colors.red : Colors.black,
              onPressed: () {
                if (controller.plans.isNotEmpty) {
                  Get.to(() => AddDialog(), transition: Transition.downToUp);
                } else {
                  EasyLoading.showInfo('Please show your task type');
                }
              },
              child: Icon(controller.deleting.value
                  ? CupertinoIcons.delete
                  : CupertinoIcons.chat_bubble),
            ),
          );
        },
        onAccept: (Plan task) {
          controller.deleteplan(task);
          EasyLoading.showSuccess('Deleted');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar(StudentModel student) {
    String name = student.gendar == 'انثى' ? 'الطالبه' : 'الطالب';
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 250, 244),
      elevation: 0,
      title: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sizedW10,
            sizedW10,
            sizedW10,
            Padding(
              padding: EdgeInsets.only(top: 1.5.wp),
              child: GradientText(
                '${student.name} : $name ',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.1)),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 59, 67, 88),
                  Color.fromARGB(255, 90, 69, 69),
                ]),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: EdgeInsets.only(top: 1.0.wp),
              child: SizedBox(
                height: 45,
                width: 45,
                // margin: EdgeInsets.only(left: .0.wp),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(student.image!),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(top: 1.0.wp, right: 2.0.wp),
            child: const Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Color.fromARGB(255, 25, 25, 25),
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildBottomNavigationBar() {
  final controller = Get.find<StudentVM>();
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10)
        ]),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: Obx(
          () => BottomNavigationBar(
            onTap: (int index) => controller.changeTabIndex(index),
            currentIndex: controller.tabIndex.value,
            showSelectedLabels: false,
            backgroundColor: Colors.white,
            showUnselectedLabels: false,
            selectedItemColor: const Color.fromARGB(255, 252, 122, 122),
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 15.0.wp),
                    child: const Icon(
                      Icons.home,
                      size: 30,
                    ),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 15.0.wp),
                    child: const Icon(
                      CupertinoIcons.chart_bar_alt_fill,
                      size: 30,
                    ),
                  ),
                  label: 'Report'),
            ],
          ),
        ),
      ),
    ),
  );
}
