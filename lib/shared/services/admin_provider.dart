// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:labbaik/features/authentaction/viewModel/auth.dart';
// import 'package:labbaik/features/home1/model/guardian.dart';
// import 'package:labbaik/shared/services/admin_services.dart';


// class AdminProvider {
//   final _storage = Get.find<AdminServices>();
//   List<StudentModel> getStudents() {
//     var students = <StudentModel>[];
//     jsonDecode(_storage.read('students').toString())
//         .forEach((e) => students.add(StudentModel.fromJson(e)));
//     return students;
//   }

//   void writeTasks(List<StudentModel> tasks) {
//     _storage.write('students', jsonEncode(tasks));
//   }
// }
