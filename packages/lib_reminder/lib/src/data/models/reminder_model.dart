import 'dart:convert';

import 'package:lib_reminder/src/domain/entities/reminder_entity.dart';

class ReminderModel extends Reminder {
  const ReminderModel(
      {required int codigoReminder,
      required String titleReminder,
      required String bodyReminder})
      : super(
            codigoReminder: codigoReminder,
            titleReminder: titleReminder,
            bodyReminder: bodyReminder);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'codigoReminder': codigoReminder});
    result.addAll({'titleReminder': titleReminder});
    result.addAll({'bodyReminder': bodyReminder});

    return result;
  }

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      codigoReminder: map['codigoReminder']?.toInt() ?? 0,
      titleReminder: map['titleReminder'] ?? '',
      bodyReminder: map['bodyReminder'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReminderModel.fromJson(String source) =>
      ReminderModel.fromMap(json.decode(source));

  factory ReminderModel.fromEntity(Reminder reminder) {
    return ReminderModel(
        codigoReminder: reminder.codigoReminder,
        titleReminder: reminder.titleReminder,
        bodyReminder: reminder.bodyReminder);
  }

  @override
  String toString() =>
      'ReminderModel(codigoReminder: $codigoReminder, titleReminder: $titleReminder, bodyReminder: $bodyReminder)';
}
