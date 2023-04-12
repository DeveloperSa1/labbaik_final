// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:labbaik/features/authentaction/model/app_user.dart';
import 'package:labbaik/features/authentaction/view/splash.dart';
import 'package:labbaik/features/authentaction/view/welcome.dart';

import 'package:labbaik/features/home/view/admin_app.dart';
import 'package:labbaik/features/home/view/specialest_app.dart';
import 'package:labbaik/features/home/view/teacher_app.dart';
import 'package:labbaik/imports.dart';

import 'package:labbaik/shared/enums/user_type.dart';
import 'package:labbaik/shared/services/auth_service.dart';

class AuthVM extends GetxController {
  final Rx<bool> isLoggedIn = false.obs;
  late Rx<UserType> userType = UserType.undefiend.obs;
  var phone = '+966 5'.obs;
  var appUser = AppUser().obs;

  String get userUid => appUser.value.uid!;

  @override
  void onInit() {
    retriveData();
// logOut();
    super.onInit();
  }

  void phoneLogin() async {
    try {
      bool? check =
          await AuthSERVICE.checkUserExist(userType.value, phone.value);
      if (check!) {
        var userData =
            await AuthSERVICE.phoneLogin(userType.value, phone.value);
        final user = AppUser(
          uid: userData!.id,
          userName: userData.get('name'),
          phoneNumber: phone.value,
          image: userData.get('image'),
          userType: userType.value,
        );
        print(user.userName);
        appUser.value = user;
        update();
        AuthSERVICE.saveToLocal(appUser.value);
        isLoggedIn.value = true;
        Get.offAll(const SplashScreen());
      }
    } catch (e) {
      print(e);
    }
  }

  void logOut() async {
    AuthSERVICE.logOut();
    Get.offAll(const SplashScreen());
  }

  void retriveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedUser = prefs.getString('user');
    try {
      if (savedUser != null) {
        final AppUser user = AppUser.fromJson(jsonDecode(savedUser));
        appUser.value = user;
        isLoggedIn.value = true;
        if (user.userType == UserType.admin) {
          Get.offAll(
            AdminAppView(),
          );
        } else if (user.userType == UserType.guardian) {
          Get.offAll(
            // home splash extends auth vm its job to direct a user to the app how?
            const Placeholder(),
          );
        } else if (user.userType == UserType.teacher) {
          Get.offAll(
            // home splash extends auth vm its job to direct a user to the app how?
            const TeacharAppView(),
          );
        } else if (user.userType == UserType.specialest) {
          Get.offAll(
            // home splash extends auth vm its job to direct a user to the app how?
            const SpecialestAppView(),
          );
        }
      } else {
        isLoggedIn.value = false;
        Get.offAll(const WelcomeScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}
