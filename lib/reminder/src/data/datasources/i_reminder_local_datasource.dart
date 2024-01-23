import 'package:reminder_clean_arch/reminder/src/data/data.dart';

abstract class IReminderLocalDatasource {
  Future<List<ReminderModel>> getReminders();

  Future<bool> setReminder({
    required ReminderModel reminder,
  });

  Future<bool> deleteReminder({
    required int codigoReminder,
  });
}
