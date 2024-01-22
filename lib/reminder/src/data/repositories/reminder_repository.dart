import 'package:dartz/dartz.dart';
import 'package:reminder_clean_arch/core/core.dart';
import 'package:reminder_clean_arch/reminder/src/data/data.dart';
import 'package:reminder_clean_arch/reminder/src/domain/domain.dart';

class ReminderRepository implements IReminderRepository {
  final IReminderLocalDatasource _reminderLocalDatasource;

  ReminderRepository(
      {required IReminderLocalDatasource reminderLocalDatasource})
      : _reminderLocalDatasource = reminderLocalDatasource;

  @override
  Future<Either<IFailure, List<Reminder>>> getAllReminder() async {
    try {
      final List<Reminder> reminders =
          await _reminderLocalDatasource.getReminderList();

      return Right(reminders);
    } catch (e) {
      return const Left(AllReminderFailure());
    }
  }

  @override
  Future<Either<IFailure, Reminder>> getReminder(
      {required int codigoReminder}) {
    // TODO: implement getReminder
    throw UnimplementedError();
  }

  @override
  Future<Either<IFailure, bool>> setReminderList(
      {required List<Reminder> reminders}) async {
    try {
      await _reminderLocalDatasource.setReminderList(
          reminders: List<ReminderModel>.from(
              reminders.map(ReminderModel.fromEntity)));

      return const Right(true);
    } catch (e) {
      return const Left(SetReminderFailure());
    }
  }

  @override
  Future<Either<IFailure, bool>> setReminder(
      {required Reminder reminder}) async {
    try {
      final failureOrSuccess = await _reminderLocalDatasource.setReminder(
          reminder: ReminderModel.fromEntity(reminder));
      if (failureOrSuccess) {
        return const Right(true);
      } else {
        return const Left(SetReminderFailure());
      }
    } catch (e) {
      return const Left(SetReminderFailure());
    }
  }
}