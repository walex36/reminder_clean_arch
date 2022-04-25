import 'package:lib_core/lib_core.dart';
import '../data/models/reminder_model.dart';

abstract class IReminderDatabase extends IIntNoSQLDatabase {
  Future<void> storeListaReminders({
    required List<ReminderModel> reminderList,
  });

  Future<List<ReminderModel>> getListaReminders();

  Future<void> storeReminder();
}