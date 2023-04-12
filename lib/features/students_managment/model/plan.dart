// ignore_for_file: non_constant_identifier_names

import 'package:labbaik/shared/helpers/date_calendar_helper.dart';

class Plan  {
  final String? title;
  final String? byId;
  final String? student_id;
  final String? currentMonth;
  final List<dynamic>? goals;
  const Plan(
    {this.title,
   this.byId,this.student_id,this.currentMonth,  this.goals});


  /// bcz of using [const] keyword on [Plan] class, we can't change it.
  /// There for in order to edit it `later on`
  /// we are using another method called [copyWith] to create a new `instance`
  /// so that we could replace the `existing Plan`

  Plan copyWith({
    String? title,
    int? icon,
    String? color,
    List<dynamic>? goals,
  }) // returning new Plan
      =>
      Plan(
        title: title ?? this.title,
        goals: goals ?? this.goals,
      );

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        title: json['title'],
        goals: json['goals'],
        byId: json['byId'],
        student_id: json['student_id'],
        currentMonth: json['currentMonth'],
      );

  Map<String, dynamic> toJson() =>
      {'title': title,
       'goals': goals,
       'student_id': student_id,
        'byId': byId,
        'currentMonth': MyDateUtil.getCurrentMonth()
        };

}
