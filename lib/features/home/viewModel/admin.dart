// import 'package:get/get.dart';
// import 'package:labbaik/features/home1/model/admin.dart';
// import 'package:labbaik/features/home1/view/admin_app.dart';
// import 'package:labbaik/features/home1/view/users_app/admin_app/admin_calendar.dart';
// import 'package:labbaik/features/home1/view/users_app/admin_app/admin_home.dart';
// import 'package:labbaik/imports.dart';
// import 'package:labbaik/shared/services/admin_services.dart';

// class AdminVM extends GetxController {
//   Admin admin = Admin();
//   Widget widg = AdminHomeView();
//   Widget widg1 = AdminCalendarView();
//   Rx<int> sIndex = 0.obs;
//   selectIndex(int index) {
//     if (index == 1) {
//       sIndex = 1.obs;
//       widg = const AdminCalendarView();
//       update();
//     } else if (index == 0) {
//       sIndex = 0.obs;
//       widg = AdminHomeView();
//       update();
//     }
//   }

//   Future<void> init() async {
//     admin = await AdminServices.fetchUserData();
//     // widg = AdminHomeView().obs;
//   }

//   Widget onr() {
//     update();
//     int indx = sIndex.value;
//     return indx == 0 ? widg : widg1;
//   }

//   @override
//   void onReady() {
//     onr;
//     super.onReady();
//   }

//   @override
//   void onInit() {
//     init;
//     super.onInit();
//   }
// }
