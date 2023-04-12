import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labbaik/features/home/model/guardian.dart';
import 'package:labbaik/features/students_managment/model/plan.dart';
import 'package:labbaik/shared/services/admin_services.dart';

class StudentVM extends GetxController with StateMixin {
  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final textTitle = ''.obs;
  final activityValue = ''.obs;
  final titles = <String>[].obs;
  final chipIndex = ValueNotifier(0).obs;
  final deleting = false.obs;
  final doinggoals = <dynamic>[].obs;
  final donegoals = <dynamic>[].obs;
  final tabIndex = 0.obs;
  final plans = <Plan>[].obs;
  final plan = Rx<Plan?>(null);
  final Rx<StudentModel> student = StudentModel().obs;
  @override
  void onInit() {
    convertToDecode();
    getPlans();
    super.onInit();
    getData();
    getTitles();
  }

  getGoals() async {
    List<dynamic> goalls = await AdminServices.getGoals(plan.value!);
    doinggoals.value = goalls;
  }

  int getNumber(String element) {
    int num = doinggoals.indexOf(element) + 1;
    return num;
  }

  convertToDecode() {
    change(student, status: RxStatus.loading());
    final decode = jsonDecode(Get.arguments['student']!);
    final passToModel = StudentModel.fromJson(decode);
    student(passToModel);
    // or if you are using getBuilder
    // try do it like this
    student.value = passToModel;
    update();
    change(student, status: RxStatus.loading());
    // don't forget to call update() since it's needed from getbuilder;
  }

  String gendarTitle() {
    if (student.value.gendar == 'انثى') {
      return "الطالبه : ${student.value.name}";
    } else {
      return "الطالب : ${student.value.name}";
    }
  }

  getData() async {
    // make status to loading
    // change(student, status: RxStatus.loading());

    // // Code to get data

    // // if done, change status to success
    // change(student, status: RxStatus.success());
  }

  void getTitles() async {
    List<String> acTitle = await AdminServices.fetchActivites();
    titles.assignAll(acTitle);
  }

  void getPlans() async {
    var plansFetched = await AdminServices.fetchStudentPlans(student.value);
    plans.assignAll(plansFetched);
  }

  void updateActivity(String title) {
    textTitle.value = title;
  }

  @override
  void onClose() {
    editCtrl.dispose();
    super.onClose();
  }

  void changeChipIndex(value) {
    chipIndex.value = ValueNotifier(value);
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  void changeplan(Plan? select) {
    plan.value = select;
  }

  void changegoals(List<dynamic>? select) {
    // doinggoals.clear();
    // donegoals.clear();
    // for (int i = 0; i < select!.length; i++) {
    //   var todo = select[i];
    //   var status = todo['done'];
    //   if (status == true) {
    //     donegoals.add(todo);
    //   } else {
    //     doinggoals.add(todo);
    //   }
    // }
  }

  Future addPlan(Plan plan) async {
    await AdminServices.addPlan(plan);
  }

  bool addplan(Plan plan) {
    if (plans.contains(plan)) {
      return false;
    }
    plans.add(plan);
    addPlan(plan);
    return true;
  }

  void deleteplan(Plan plan) {
    plans.remove(plan);
  }

  updateplan(Plan plan, String title) {
    var goals = plan.goals ?? [];
    if (containTodo(goals, title)) {
      return false;
    }
    var todo = {'title': title, 'done': false};
    goals.add(todo);

    var newplan = plan.copyWith(goals: goals);
    int oldIndex = plans.indexOf(plan);
    plans[oldIndex] = newplan;

    plans.refresh();

    return true;
  }

  bool containTodo(List goals, String title) {
    return goals.any((element) => element['title'] == title);
  }

  bool addGoal(String title) {
    if (doinggoals.contains(title)) {
      return false;
    } else {
      doinggoals.add(title);
      return true;
    }
  }

  // addToService(String goal) async {
  //   // var newgoals = doinggoals;

  //   // var newplan = plan.value!.copyWith(goals: newgoals);

  //   await AdminServices.addGoal(plans[oldIndex], goal);
  // }

  void updategoals() {
    var newgoals = [];

    newgoals.addAll(
      [
        ...doinggoals,
      ],
    );

    var newplan = plan.value!.copyWith(goals: newgoals);
    int oldIndex = plans.indexOf(plan.value);
    plans[oldIndex] = newplan;
    plans.refresh();
  }

  deleteGoal(String title) async {
    await AdminServices.removeGoal(plan.value!, title);
    doinggoals.remove(title);
    update();
  }

  void doneTodo(String title) {
    var doingTodo = {'title': title, 'done': false};
    int index = doinggoals.indexWhere(
        (element) => mapEquals<String, dynamic>(doingTodo, element));
    doinggoals.removeAt(index);

    var doneTodo = {'title': title, 'done': true};
    donegoals.add(doneTodo);

    doinggoals.refresh();
    donegoals.refresh();
  }

  void deleteDoneTodo(dynamic doneTodo) {
    int index = donegoals
        .indexWhere((element) => mapEquals<String, dynamic>(doneTodo, element));
    donegoals.removeAt(index);
    donegoals.refresh();
  }

  bool isTodoEmpty(Plan plan) {
    return plan.goals == null || plan.goals!.isEmpty;
  }

  int getDoneTodo(Plan plan) {
    // res refers to 'Result'
    var res = 0;
    for (int i = 0; i < plan.goals!.length; i++) {
      if (plan.goals![i] == true) {
        res += 1;
      }
    }
    return res;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  int getTotalplan() {
    var res = 0;

    for (int i = 0; i < plans.length; i++) {
      if (plans[i].goals != null) {
        res += plans[i].goals!.length;
      }
    }
    return res;
  }

  int getTotalDoneplan() {
    var res = 0;
    for (int i = 0; i < plans.length; i++) {
      if (plans[i].goals != null) {
        for (int j = 0; j < plans[i].goals!.length; j++) {
          if (plans[i].goals![j]['done'] == true) {
            res += 1;
          }
        }
      }
    }
    return res;
  }
}
