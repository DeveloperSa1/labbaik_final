import 'package:labbaik/features/authentaction/view/widgets/dark_background.dart';

import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/constant/sizes.dart';

import 'package:labbaik/shared/widgets/buttons/tab_btn.dart';

// ignore: must_be_immutable
class CalendarView1 extends GetView<CalendarView1> {
  @override
  const CalendarView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: [
      DarkRadialBackground(
        color: white,
        position: "topLeft",
      ),
      Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              // ChatIcon(),
                              SizedBox(width: 40),
                            ])),
                    sizedH20,
                    // TodayText(),
                    sizedH20,
                    // SingleChildScrollView(
                    //   // scrollDirection: Axis.horizontal,
                    //     child: CustomCalendarStaticsCard()),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 2,
                      color: color1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PrimaryTabButton(
                            fontS: 11,
                            buttonText: "التقارير",
                            itemIndex: 0,
                            notifier: ValueNotifier(0)),
                        PrimaryTabButton(
                            fontS: 9,
                            buttonText: "الحضور-طلاب",
                            itemIndex: 1,
                            notifier: ValueNotifier(0)),
                        PrimaryTabButton(
                            fontS: 9,
                            buttonText: "الحضور-طاقم العمل",
                            itemIndex: 2,
                            notifier: ValueNotifier(0)),
                      ],
                    ),
                    sizedH40,
                    ValueListenableBuilder(
                        valueListenable: ValueNotifier(0),
                        builder: (BuildContext context, _, __) {
                          return Container();
                        }),
                  ]))))
    ]));
  }
}
