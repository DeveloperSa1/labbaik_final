import 'package:labbaik/features/authentaction/model/app_user.dart';
import 'package:labbaik/imports.dart';
import 'package:labbaik/shared/enums/user_type.dart';
import 'package:labbaik/shared/helpers/date_calendar_helper.dart';

class CalendarVM extends GetxController {
  final AppUser? user;
  CalendarVM({this.user});
  String get id => user!.uid!;
  UserType get uType => user!.userType!;
  var selectedDate = DateTime.now().obs;
  var selectedDay = DateTime.now().day.obs;
  var selectedMonth = MyDateUtil.getCurrentMonth().obs;

// ALL FUNCTIONS
  void updateDay(int day) {
    selectedDay.value = day;
    update();
  }
// void updateMonth(int month) {
//     // selectedMonth.value = MyDateUtil.getCurrentMonth();
//     update();
//   }

  void updateDate(DateTime date) {
    selectedDate.value = date;
    updateDay(date.day);

    
    update();
  }
}
