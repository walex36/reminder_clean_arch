import 'package:lib_reminder/src/data/datasources/i_reminder_local_datasource.dart';
import 'package:lib_reminder/src/data/models/reminder_model.dart';
import 'package:lib_reminder/src/database/i_reminder_database.dart';

class ReminderSembastDatasource implements IReminderLocalDatasource {
  final IReminderDatabase _localDatasource;

  ReminderSembastDatasource({required IReminderDatabase localDataBase}) : _localDatasource = localDataBase;


  @override
  Future<List<ReminderModel>> getReminderList() async {
    try {
      return await _localDatasource.getListaReminders();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> setReminder({required ReminderModel reminder}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> setReminderList({required List<ReminderModel> reminders}) async {
    try {
      await _localDatasource.storeListaReminders(reminderList: reminders);

      return true;
    } catch (e) {
      throw Exception();
    }
  }
  
}