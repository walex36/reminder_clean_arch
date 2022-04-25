import '../models/reminder_model.dart';

abstract class IReminderLocalDatasource {
  Future<List<ReminderModel>> getReminderList();

  Future<bool> setReminderList({
    required List<ReminderModel> reminders,
  });

  Future<bool> setReminder({
    required ReminderModel reminder,
  });
}
