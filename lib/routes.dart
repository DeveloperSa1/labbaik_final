import 'package:get/get.dart';
import 'package:labbaik/features/students_managment/view/student_view.dart';


appRoutes() => [
      GetPage(
        name: '/student/:id',
        page: () => const StudentView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    
    ];

class MyMiddelware extends GetMiddleware {
}