import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/shared/helpers/sizes_extension.dart';


class DoneList extends StatelessWidget {
  final homeCtrl = Get.find<StudentVM>();
  DoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeCtrl.donegoals.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 5.0.wp),
                child: Text(
                  'Completed (${homeCtrl.donegoals.length})',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 14.0.sp, color: Colors.grey),
                  ),
                ),
              ),
              ...homeCtrl.donegoals
                  .map((element) => Dismissible(
                        key: ObjectKey(element),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => homeCtrl.deleteDoneTodo(element),
                        background: Container(
                          color: Colors.red.withOpacity(0.8),
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.0.wp),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0.wp, horizontal: 9.0.wp),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  CupertinoIcons.checkmark_alt,
                                  color: Color.fromARGB(255, 252, 122, 122),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.0.wp),
                                child: Text(
                                  element['title'],
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList()
            ],
          )
        : Container());
  }
}
