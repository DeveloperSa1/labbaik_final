// ignore_for_file: deprecated_member_use

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getwidget/getwidget.dart';
import 'package:labbaik/features/students_managment/model/plan.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<StudentVM>();
  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    // final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
           homeCtrl.titles.first;
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 15,
              title: 'نوع النشاط',
              titleStyle: const TextStyle(
                  fontFamily: 'Nexa', fontWeight: FontWeight.w700),
              content: Form(
                key: homeCtrl.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                      child: DropdownButtonHideUnderline(
                        child: GFDropdown(
                          padding: const EdgeInsets.all(15),
                          borderRadius: BorderRadius.circular(10),
                          border:
                              const BorderSide(color: Colors.black12, width: 1),
                          dropdownButtonColor: Colors.grey[300],
                          value: homeCtrl.titles.first,
                          onChanged: (newValue) {
                            // setState(() {
                            //   dropdownValue = newValue;
                            // });
                          
                            homeCtrl.updateActivity(newValue.toString());
                          },
                          items: homeCtrl.titles
                              .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    // Wrap(
                    //   spacing: 2.0.wp,
                    //   children: icons
                    //       .map((e) => Obx(() {
                    //             final index = icons.indexOf(e);
                    //             return ChoiceChip(
                    //               selectedColor: Colors.grey[200],
                    //               pressElevation: 0,
                    //               backgroundColor: Colors.white,
                    //               label: e,
                    //               selected: homeCtrl.chipIndex.value == index,
                    //               onSelected: (bool selected) {
                    //                 homeCtrl.chipIndex.value =
                    //                     selected ? index : 0;
                    //               },
                    //             );
                    //           }))
                    //       .toList(),
                    // ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(150, 40),
                      ),
                      onPressed: () {
                        if (homeCtrl.formKey.currentState!.validate()) {
                          var plan = Plan(
                            title: homeCtrl.textTitle.value,
                            goals: [],
                            byId: uid,
                            student_id: homeCtrl.student.value.id.toString(),
                          );                          
                          Get.back();
                          homeCtrl.addplan(plan)
                              ? EasyLoading.showSuccess('تم بنجاح')
                              : EasyLoading.showError('مكرر');
                        }
                      },
                      child: const Text('تاكيد'),
                    ),
                  ],
                ),
              ));
          homeCtrl.editCtrl.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DottedBorder(
            color: Colors.grey[400]!,
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            dashPattern: const [10, 10],
            strokeWidth: 2,
            child: Center(
              child: Text(
                '+ اضف',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
