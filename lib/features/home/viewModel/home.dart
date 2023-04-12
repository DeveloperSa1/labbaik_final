// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:labbaik/features/home/model/guardian.dart';
import 'package:labbaik/features/students_managment/model/plan.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/enums/user_type.dart';
import 'package:labbaik/shared/services/admin_services.dart';
import '../../authentaction/model/app_user.dart';

class HomeVM extends GetxController {
  var appUser = AppUser().obs;
  var userType = UserType.undefiend.obs;
  final tabIndex = 0.obs;
  final activeIndex = 0.obs;
  final chipIndex = ValueNotifier(0).obs;
  final students = <StudentModel>[].obs;
  final plans = <Plan>[].obs;
  final student = StudentModel().obs;

//  Regarding Add Form

  final formKey = GlobalKey<FormState>();
  // final formGs = GSForm<GsForm>;
  final data = {}.obs;
  final firstName = ''.obs;
  final lastName = TextEditingController();
  final diagnose = TextEditingController();
  final phoneNumber = TextEditingController();
  final extra = TextEditingController();
  // final phoneNumber = TextEditingController();

  Future<List<Plan>> fetchStudentPlans() async {
    List<Plan> studentPlans =
        await AdminServices.fetchStudentPlans(student.value);
    plans.assignAll(studentPlans);
    return plans;
  }

  updateData(Map<String, dynamic> newData) {
    data.value = newData;
  }

  void fetchStudents() async {
    await AdminServices.allStudents();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? items = pref.getString('students');
    List<StudentModel> _students = AdminServices.getStudents(items!);
    students.addAll(_students);
  }

  Future<StudentModel> getStudentData(String id) async {
    StudentModel stu = await AdminServices.getStudent(id);
    student.value = stu;
    return stu;
  }

  @override
  void onInit() {
    fetchStudents();

    super.onInit();
  }
  // ------- For Updating User Widgets ------------- //

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  bool changeStepIndex(int index) {
    if (activeIndex.value == 0 && userType.value == UserType.undefiend) {
      print('clicked');
      return false;
    }
    // else if (activeIndex.value == 1 && userType.value == UserType.undefiend) {
    // }
    // else if (activeIndex.value == 1 && userType.value == UserType.undefiend) {
    // }
    else {
      // activeIndex.value = index == 0 ;
      print('clicked here ${activeIndex.value} ${userType.value.toString()}');
      activeIndex.value = index;
      return true;
    }
  }

  @override
  void onClose() {
    changeStepIndex(0);
    print('yes');
    super.onClose();
  }

  void changeChipIndex(int index) {
    chipIndex.value = ValueNotifier(index);
  }

  void updateForm(String title) {
    UserType uType = UserTypeHelper.convert(title);
    userType.value = uType;
  }

  void updateUser(AppUser u) async {
    appUser.value = u;
  }
}
