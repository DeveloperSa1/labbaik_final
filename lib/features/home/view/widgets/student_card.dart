// ignore_for_file: file_names

import 'dart:convert';

import 'package:getwidget/getwidget.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:labbaik/features/home/model/guardian.dart';
import 'package:labbaik/features/students_managment/binding.dart';
import 'package:labbaik/features/students_managment/view/student_view.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/constant/colors.dart';

class StudentCard extends StatelessWidget {
  final StudentModel student;
  const StudentCard({super.key, required this.student});
  @override
  Widget build(BuildContext context) {
    String name = student.gendar == "انثى" ? "اسم الطالبه" : 'اسم الطالب';

    return GlassContainer(
      height: 13.h,
      width: 90.h,
      margin: const EdgeInsets.symmetric(vertical: 10),
      gradient: gradient1,
      borderRadius: BorderRadius.circular(10),
      borderGradient: gradient3,
      isFrostedGlass: true,
      child: GFListTile(
        color: Colors.white,
        avatar: CircleAvatar(
          backgroundImage: NetworkImage(student.image!),
        ),
        titleText: name,
        subTitleText: student.name,
        icon: IconButton(
            onPressed: () {
              Get.to(const StudentView(),
                  binding: StudentBGs(student),
                  arguments: {'student': jsonEncode(student)},
                  transition: Transition.rightToLeftWithFade);
            },
            icon: Icon(Icons.settings, color: color1)),
      ),
    );
  }
}
