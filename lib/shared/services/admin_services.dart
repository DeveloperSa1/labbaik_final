import 'dart:convert';
import 'package:labbaik/features/home/model/admin.dart';
import 'package:labbaik/features/home/model/guardian.dart';
import 'package:labbaik/features/students_managment/model/plan.dart';
import 'package:labbaik/imports.dart';

class AdminServices extends GetxService {
  static late Admin admin;
  static late List<String> students;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future<List<String>> fetchActivites() async {
    List<String> titles = [];
    return titles;
  }

  static Future<List<QueryDocumentSnapshot>> fetchAllDocs(
      String collection) async {
    List<QueryDocumentSnapshot> allDocs = [];
    var query = await firestore.collection(collection).get();
    query;
    var docs = query.docs;
    docs;
    allDocs.addAll(docs);
    return allDocs;
  }

  static Future<List<StudentModel>> allStudents() async {
    List<StudentModel> students = [];

    var docs = await fetchAllDocs('students');
    for (var element in docs) {
      students.add(StudentModel.fromJson(element.data()));
    }
    saveToLocal(students, 'students');

    return students;
  }

  static Future<StudentModel> getStudent(String id) async {
    var student = await firestore.collection('students').doc(id).get();
    final StudentModel model = StudentModel.fromJson(student.data());
    return model;
  }

  static void saveToLocal(
    List<dynamic> items,
    String key,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonItems = json.encode(items);
    await prefs.setString(key, jsonItems);
  }

  SharedPreferences prefs =
      SharedPreferences.getInstance() as SharedPreferences;

  static List<StudentModel> getStudents(String items) {
    var students = <StudentModel>[];
    jsonDecode(items.toString())
        .forEach((e) => {students.add(StudentModel.fromJson(e))});

    return students;
  }

  static updatePlan(Plan plan, List<String> goals) async {
    var q = await firestore
        .collection('plan')
        .where('name', isEqualTo: plan.title)
        .where('student_id', isEqualTo: plan.student_id)
        .get();
    String docId = q.docs.first.id;
    List<String> oldGoals = q.docs.first.get('goals');
    oldGoals.addAll(goals);

    await firestore.collection('plan').doc(docId).update({'goals': oldGoals});
  }

  static Future<List<dynamic>> getGoals(Plan plan) async {
    var q = await firestore
        .collection('plans')
        .where('title', isEqualTo: plan.title)
        .where('student_id', isEqualTo: plan.student_id)
        .get();

    String docId = q.docs.first.id;
    var q2 = await firestore.collection('plans').doc(docId).get();
    List<dynamic>? oldGoals;
    oldGoals = q2.get('goals');
    return oldGoals!;
  }

  static addGoal(Plan plan, String goal) async {

    List<dynamic>? oldGoals = plan.goals;
    oldGoals!.add(goal);
  }

  static removeGoal(Plan plan, String goal) async {
    var q = await firestore
        .collection('plans')
        .where('title', isEqualTo: plan.title)
        .where('student_id', isEqualTo: plan.student_id)
        .get();

    String docId = q.docs.first.id;
    List<dynamic>? oldGoals = plan.goals;
    oldGoals!.remove(goal);
    final Plan planModel = Plan(
      title: plan.title,
      byId: plan.byId,
      student_id: plan.student_id,
      goals: [...oldGoals],
      currentMonth: plan.currentMonth,
    );

    await firestore.collection('plans').doc(docId).update(planModel.toJson());
  }

  //  ----------------------- REGARDING STUDENTS -----------------------------------

  static addPlan(Plan plan) async {
  }

  static Future<List<Plan>> fetchStudentPlans(StudentModel student) async {
    List<Plan> plans = [];
    var q = await firestore
        .collection('plans')
        .where('student_id', isEqualTo: student.id.toString())
        .get();

    for (var element in q.docs) {
      plans.add(Plan.fromJson(element.data()));
    }
   
    return plans;
  }
}
