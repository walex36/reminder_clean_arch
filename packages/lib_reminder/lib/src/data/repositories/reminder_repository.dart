import 'package:lib_core/src/error/failures.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:dartz/dartz.dart';
import 'package:lib_reminder/lib_reminder.dart';
import 'package:lib_reminder/src/data/models/reminder_model.dart';


class ReminderRepository implements IReminderRepository {
  final IReminderLocalDatasource _iReminderLocalDatasource;

  ReminderRepository(
      {required IReminderLocalDatasource iReminderLocalDatasource})
      : _iReminderLocalDatasource = iReminderLocalDatasource;

  @override
  Future<Either<IFailure, List<Reminder>>> getAllReminder() async {
    final List<Reminder> reminders =
        await _iReminderLocalDatasource.getReminderList();

    return Right(reminders);
  }

  @override
  Future<Either<IFailure, Reminder>> getReminder(
      {required int codigoReminder}) {
    // TODO: implement getReminder
    throw UnimplementedError();
  }

  @override
  Future<Either<IFailure, bool>> setReminderList({required List<Reminder> reminders}) async {
    try {
      await _iReminderLocalDatasource.setReminderList(reminders: List<ReminderModel>.from(reminders.map(ReminderModel.fromEntity)));

      return const Right(true);
    } catch (e) {
      throw Exception();
    }
  }
}
