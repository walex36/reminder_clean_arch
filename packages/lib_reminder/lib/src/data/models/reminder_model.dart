import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lib_reminder/src/domain/entities/reminder_entity.dart';

class ReminderModel extends Reminder {
  const ReminderModel({
    required int codigoReminder,
    required int codigoCategory,
    required String titleReminder,
    required String bodyReminder,
    required Color backgroudReminder,
  }) : super(
          codigoReminder: codigoReminder,
          codigoCategory: codigoCategory,
          titleReminder: titleReminder,
          bodyReminder: bodyReminder,
          backgroudReminder: backgroudReminder,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'codigoReminder': codigoReminder});
    result.addAll({'codigoCategory': codigoCategory});
    result.addAll({'titleReminder': titleReminder});
    result.addAll({'bodyReminder': bodyReminder});
    result.addAll({'backgroudReminder': backgroudReminder.value});

    return result;
  }

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      codigoReminder: map['codigoReminder']?.toInt() ?? 0,
      codigoCategory: map['codigoCategory']?.toInt() ?? 0,
      titleReminder: map['titleReminder'] ?? '',
      bodyReminder: map['bodyReminder'] ?? '',
      backgroudReminder: Color(map['backgroudReminder']?.toInt()?? Colors.grey[350]?.value),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReminderModel.fromJson(String source) =>
      ReminderModel.fromMap(json.decode(source));

  factory ReminderModel.fromEntity(Reminder reminder) {
    return ReminderModel(
      codigoReminder: reminder.codigoReminder,
      codigoCategory: reminder.codigoCategory,
      titleReminder: reminder.titleReminder,
      bodyReminder: reminder.bodyReminder,
      backgroudReminder: reminder.backgroudReminder,
    );
  }

  @override
  String toString() =>
      'ReminderModel(codigoReminder: $codigoReminder, codigoCategory: $codigoCategory, titleReminder: $titleReminder, bodyReminder: $bodyReminder, backgroudReminder: ${backgroudReminder.value})';
}
