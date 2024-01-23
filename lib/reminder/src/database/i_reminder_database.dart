import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/data/data.dart';

abstract class IReminderDatabase extends IIntNoSQLDatabase {
  Future<bool> deleteReminder({
    required int codigoReminder,
  });

  Future<List<ReminderModel>> getListaReminders();

  Future<bool> storeReminder({
    required ReminderModel reminder,
  });
}
