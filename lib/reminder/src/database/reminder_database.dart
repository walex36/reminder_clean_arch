import 'package:reminder_clean_arch/core/core.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';

import '../data/models/reminder_model.dart';
import 'i_reminder_database.dart';

class ReminderDatabase extends IReminderDatabase {
  @override
  String get storeName => 'reminder';

  @override
  Future<List<ReminderModel>> getListaReminders() async {
    try {
      final _database = await database;
      final _store = await store;

      final responseToClone = await _store.record(0).get(_database);

      if (responseToClone != null) {
        final Map<String, dynamic> response = cloneMap(responseToClone);

        final List<ReminderModel> reminderModelList =
            List<ReminderModel>.generate(
          response.length,
          (index) => ReminderModel.fromMap(response['$index']),
        );

        return reminderModelList;
      } else {
        return [];
      }
    } catch (e) {
      throw CacheException(message: 'Não foi possivel buscar os lembretes');
    }
  }

  @override
  Future<bool> storeReminder({required ReminderModel reminder}) async {
    try {
      final _database = await database;
      final _store = await store;

      final responseToClone = await _store.record(0).get(_database);

      if (responseToClone != null) {
        final Map<String, dynamic> response = cloneMap(responseToClone);

        final List<ReminderModel> reminderModelList =
            List<ReminderModel>.generate(
          response.length,
          (index) => ReminderModel.fromMap(response['$index']),
        );

        final int index = reminderModelList.indexWhere((reminderModel) =>
            reminderModel.codigoReminder == reminder.codigoReminder);

        if (index == -1) {
          reminderModelList.add(reminder);
        } else {
          reminderModelList[index] = reminder;
        }

        final Map<String, dynamic> reminderMap = <String, dynamic>{};
        final int cachedLenght = reminderModelList.length;

        for (var i = 0; i < cachedLenght; i++) {
          reminderMap['$i'] = reminderModelList[i].toMap();
        }

        await _store.record(0).put(_database, reminderMap);
      } else {
        final Map<String, dynamic> reminderMap = <String, dynamic>{};

        reminderMap['0'] = reminder.toMap();

        await _store.record(0).put(_database, reminderMap);
      }
      return true;
    } catch (e) {
      throw CacheException(message: 'Não foi possivel salvar os lembretes');
    }
  }

  @override
  Future<bool> deleteReminder({required int codigoReminder}) async {
    try {
      final _database = await database;
      final _store = await store;

      final responseToClone = await _store.record(0).get(_database);

      if (responseToClone != null) {
        final Map<String, dynamic> response = cloneMap(responseToClone);

        List<ReminderModel> reminderModelList = List<ReminderModel>.generate(
          response.length,
          (index) => ReminderModel.fromMap(response['$index']),
        );

        final int index = reminderModelList.indexWhere(
            (reminderModel) => reminderModel.codigoReminder == codigoReminder);

        if (index != -1) {
          reminderModelList.removeAt(index);
        } else {
          throw CacheException(message: 'Lembrete inexistente');
        }

        final Map<String, dynamic> reminderMap = <String, dynamic>{};
        final int cachedLenght = reminderModelList.length;

        for (var i = 0; i < cachedLenght; i++) {
          reminderMap['$i'] = reminderModelList[i].toMap();
        }

        await _store.record(0).put(_database, reminderMap);
      }
      return true;
    } catch (e) {
      throw CacheException(message: 'Não foi possivel deletar o lembrete');
    }
  }
}
