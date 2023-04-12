import 'package:labbaik/features/authentaction/viewModel/auth.dart';
import 'package:labbaik/features/home/viewModel/calendar.dart';
import 'package:labbaik/features/home/viewModel/home.dart';
import 'package:labbaik/features/students_managment/viewModel/student_view_model.dart';
import 'package:labbaik/imports.dart';

class GlobalAppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthVM);
    Get.put(HomeVM(), permanent: true);
    Get.lazyPut(() => CalendarVM());
    Get.lazyPut(() => StudentVM());
    // Get.put(AdminVM(),permanent: true);
  }
}
