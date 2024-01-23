import 'package:reminder_clean_arch/reminder/src/data/data.dart';
import 'package:reminder_clean_arch/reminder/src/database/database.dart';

class ReminderSembastDatasource implements IReminderLocalDatasource {
  final IReminderDatabase _localDatasource;

  ReminderSembastDatasource({required IReminderDatabase localDataBase})
      : _localDatasource = localDataBase;

  @override
  Future<List<ReminderModel>> getReminders() async {
    return await _localDatasource.getListaReminders();
  }

  @override
  Future<bool> setReminder({required ReminderModel reminder}) async {
    final failureOrSuccess =
        await _localDatasource.storeReminder(reminder: reminder);
    return failureOrSuccess;
  }

  @override
  Future<bool> deleteReminder({required int codigoReminder}) async {
    final failureOrSuccess =
        await _localDatasource.deleteReminder(codigoReminder: codigoReminder);
    return failureOrSuccess;
  }
}
