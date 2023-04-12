// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:labbaik/features/authentaction/viewModel/auth.dart';
import 'package:labbaik/features/home/view/calendar_view.dart';
import 'package:labbaik/features/home/view/widgets/chat_icon.dart';
import 'package:labbaik/features/home/view/widgets/avatar.dart';
import 'package:labbaik/features/home/view/widgets/student_card.dart';
import 'package:labbaik/features/home/viewModel/home.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/stacky_bottom_nav_bar/models/stacky_animated_nav_bar_item.dart';
import 'package:labbaik/shared/stacky_bottom_nav_bar/models/stacky_bottom_nav_bar_params.dart';
import 'package:labbaik/shared/stacky_bottom_nav_bar/models/stacky_simple_nav_bar_item.dart';
import 'package:labbaik/shared/stacky_bottom_nav_bar/stacky_bottom_nav_bar.dart';
import 'package:labbaik/shared/widgets/buttons/tab_btn.dart';
import 'package:labbaik/shared/widgets/radial.dart';
import '../../../shared/helpers/my_flutter_app_icons.dart';

class BoilerPlate0 extends StatelessWidget {
  BoilerPlate0({super.key});
  AuthVM authCtrl = Get.find<AuthVM>();
  HomeVM controller = Get.find<HomeVM>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SafeArea(
              child: Stack(
        children: [
          RadialBackground(
            color: white,
            position: "topLeft",
          ),
          Obx(
            () => Positioned(
              bottom: StackyBottomNavBar.defaultHeigh,
              left: 0.0,
              right: 0.0,
              top: 0.0,
              child: IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: const [
                                ChatIcon(),
                                SizedBox(
                                  width: 40,
                                ),
                                ProfileUI(
                                  scale: 2.4,
                                  color: kRedLight,
                                ),
                              ],
                            ),
                            sizedH20,
                            Text(
                                "  مرحباَ 👋${authCtrl.appUser.value.userName}",
                                style: GoogleFonts.tajawal(
                                    color: color1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            sizedH20,
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //tab indicators
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        PrimaryTabButton(
                                            update: () => controller
                                                .changeChipIndex(0),
                                            fontS: 9,
                                            buttonText: "الطلاب",
                                            itemIndex: 0,
                                            notifier:
                                                controller.chipIndex.value),
                                        PrimaryTabButton(
                                            update: () => controller
                                                .changeChipIndex(1),
                                            fontS: 9,
                                            buttonText: "الأخصائيات",
                                            itemIndex: 1,
                                            notifier:
                                                controller.chipIndex.value),
                                        PrimaryTabButton(
                                            update: () => controller
                                                .changeChipIndex(2),
                                            fontS: 9,
                                            buttonText: "المعلمات",
                                            itemIndex: 2,
                                            notifier:
                                                controller.chipIndex.value),
                                        PrimaryTabButton(
                                            update: () => controller
                                                .changeChipIndex(3),
                                            fontS: 9,
                                            buttonText: "الأنشطة",
                                            itemIndex: 3,
                                            notifier:
                                                controller.chipIndex.value),
                                      ],
                                    ),
                                  ),
                                ]),
                            sizedH20,
                            ValueListenableBuilder(
                                valueListenable: controller.chipIndex.value,
                                builder: (BuildContext context, _, __) {
                                  return allStudent();
                                }),
                          ]))),
                  const CalendarView1(),
                ],
              ),
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ))),
    );
  }

  List<Widget> _adminWidgets() {
    return [
      // Students List .
      // Specialest List .
      // Teachers List .
      // Activity List .
      // With posiblity of search and good ui .
    ];
  }

  Widget allStudent() {
    return Column(
      children: [
        ...List.generate(
            controller.students.length,
            (index) => StudentCard(
                  student: controller.students[index],
                ))
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    final controller = Get.find<HomeVM>();
    return Obx(
      () => StackyBottomNavBar(
        params: StackyBottomNavBarParams(
          currentSelectedTabIndex: controller.tabIndex.value,
          animatedNavBarItems: [
            StackyAnimatedNavBarItem(
              icon: MyFlutterApp.addNotification,
              onTap: () => log("add noti"),
            ),
            StackyAnimatedNavBarItem(
              icon: MyFlutterApp.addUser,
              onTap: () => Get.to(Container()),
            ),
            StackyAnimatedNavBarItem(
              icon: MyFlutterApp.settings,
              onTap: () => log("settings"),
            ),
          ],
          simpleNavBarItems: [
            StackySimpleNavBarItem(
                // iconColor: 000000,
                icon: MyFlutterApp.house,
                onTap: () => controller.changeTabIndex(0)),
            StackySimpleNavBarItem(
                icon: MyFlutterApp.calendar,
                onTap: () => controller.changeTabIndex(1))
          ],
        ),
      ),
    );
  }
}
