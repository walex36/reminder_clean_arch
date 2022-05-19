import 'package:lib_core/lib_core.dart';
import '../data/models/reminder_model.dart';

abstract class IReminderDatabase extends IIntNoSQLDatabase {
  Future<void> setListaReminders({
    required List<ReminderModel> reminderList,
  });

  Future<List<ReminderModel>> getListaReminders();

  Future<bool> storeReminder({
    required ReminderModel reminder,
  });
}
