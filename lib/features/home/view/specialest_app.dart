// import 'dart:developer';
import 'dart:developer';

import 'package:labbaik/features/authentaction/view/widgets/dark_background.dart';
import 'package:labbaik/features/home/view/calendar_view.dart';
import 'package:labbaik/features/home/viewModel/home.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';
import 'package:labbaik/shared/stacky_bottom_nav_bar/models/stacky_animated_nav_bar_item.dart';
import 'package:labbaik/shared/stacky_bottom_nav_bar/models/stacky_bottom_nav_bar_params.dart';
import 'package:labbaik/shared/stacky_bottom_nav_bar/models/stacky_simple_nav_bar_item.dart';
import 'package:labbaik/shared/stacky_bottom_nav_bar/stacky_bottom_nav_bar.dart';
import 'package:labbaik/shared/widgets/buttons/tab_btn.dart';
import '../../../shared/helpers/my_flutter_app_icons.dart';

class SpecialestAppView extends GetView<HomeVM> {
  const SpecialestAppView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SafeArea(
              child: Stack(
        children: [
          DarkRadialBackground(
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
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                // ChatIcon(),
                                sizedH20,
                                Text(
                                    "مرحباَ 👋 ${controller.students.length.toString()}",
                                    style: GoogleFonts.tajawal(
                                        color: color1,
                                        fontSize: 30,
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
                                                fontS: 9,
                                                buttonText: "الطلاب",
                                                itemIndex: 0,
                                                notifier: ValueNotifier(0)),
                                            PrimaryTabButton(
                                                fontS: 9,
                                                buttonText: "الأخصائيات",
                                                itemIndex: 1,
                                                notifier: ValueNotifier(0)),
                                            PrimaryTabButton(
                                                fontS: 9,
                                                buttonText: "المعلمات",
                                                itemIndex: 2,
                                                notifier: ValueNotifier(0)),
                                            PrimaryTabButton(
                                                fontS: 9,
                                                buttonText: "الأنشطة",
                                                itemIndex: 3,
                                                notifier: ValueNotifier(0)),
                                          ],
                                        ),
                                      ),
                                    ]),
                                sizedH20,
                                ValueListenableBuilder(
                                    valueListenable: ValueNotifier(0),
                                    builder: (BuildContext context, _, __) {
                                      return Container();
                                    }),
                              ])))),
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
              onTap: () => log("add user"),
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
