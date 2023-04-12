// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:labbaik/features/authentaction/model/app_user.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/enums/user_type.dart';

class AuthSERVICE {
  static Future<bool?> checkUserExist(UserType uType, String phone) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      String collection = UserTypeHelper.getCollectionValue(uType);
      var checkUsr = await firestore
          .collection(collection)
          .where('phone', isEqualTo: phone)
          .get();
      bool exist = checkUsr.docs.first.exists;
      return exist;
    } catch (e) {
      EasyLoading.showError(
        'الرقم خاطىء',
        // maskType: EasyLoadingMaskType.custom.
      );
      // # Todo Error
      print(e);
    }
    return null;
  }

  static Future<QueryDocumentSnapshot?> phoneLogin(
      UserType uType, String phone) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String collection = UserTypeHelper.getCollectionValue(uType);
    try {
      var query = await firestore
          .collection(collection)
          .where('phone', isEqualTo: phone)
          .get();
      await adminSignIn();
      return query.docs.first;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future adminSignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'admin@admin.com', password: '123456');
  }

  static void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  static void saveToLocal(
    AppUser user,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonUser = json.encode(user.toJson());
    await prefs.setString('user', jsonUser);
  }

  static Future<AppUser> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUser = prefs.getString('user');
    final AppUser user = AppUser.fromJson(jsonDecode(savedUser!));
    return user;
  }
}
