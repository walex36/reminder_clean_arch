import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_core/lib_core.dart';

import '../data/models/reminder_model.dart';
import 'i_reminder_database.dart';

class ReminderDatabase extends IReminderDatabase {
  @override
  final String databaseName;

  @override
  final String storeName;

  static final ReminderDatabase _singleton = ReminderDatabase._();

  static ReminderDatabase get intance => _singleton;

  ReminderDatabase._({
    this.databaseName = 'db_reminder',
    this.storeName = 'reminders',
  });

  @override
  Future<List<ReminderModel>> getListaReminders() async {
    try {
      final _database = await database;
      final _store = await store;

      final responseToClone = await _store.record(0).get(_database);

      if (responseToClone != null) {
        final Map<String, dynamic> response = cloneMap(responseToClone);

        final List<ReminderModel> reminderModelList =
            List<ReminderModel>.generate(response.length,
                (index) => ReminderModel.fromMap(response['$index']));

        return reminderModelList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> storeListaReminders(
      {required List<ReminderModel> reminderList}) async {
    try {
      final _database = await database;
      final _store = await store;

      final Map<String, dynamic> remindersMap = <String, dynamic>{};
      final int cacheLength = reminderList.length;

      for (var i = 0; i < cacheLength; i++) {
        remindersMap['$i'] = reminderList[i].toMap();
      }

      await _store.record(0).put(_database, remindersMap);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> storeReminder() {
    // TODO: implement storeReminder
    throw UnimplementedError();
  }
}
