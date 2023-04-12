import 'package:labbaik/features/home/model/guardian.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/imports.dart';

class StudentBGs implements Bindings {
  final StudentModel student;
  StudentBGs(this.student);
  @override
  void dependencies() {
    Get.lazyPut(() => StudentVM());
  }
}
