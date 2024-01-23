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
  Future<Either<IFailure, List<Reminder>>> getReminders() async {
    try {
      final List<Reminder> reminders =
          await _reminderLocalDatasource.getReminders();

      return Right(reminders);
    } on CacheException catch (e) {
      return Left(GetRemindersFailure(message: e.message));
    }
  }

  @override
  Future<Either<IFailure, bool>> setReminder(
      {required Reminder reminder}) async {
    try {
      final failureOrSuccess = await _reminderLocalDatasource.setReminder(
        reminder: ReminderModel.fromEntity(reminder),
      );

      if (failureOrSuccess) {
        return const Right(true);
      } else {
        return const Left(SetReminderFailure());
      }
    } on CacheException catch (e) {
      return Left(SetReminderFailure(message: e.message));
    }
  }

  @override
  Future<Either<IFailure, bool>> deleteReminder({
    required int codigoReminder,
  }) async {
    try {
      final failureOrSuccess = await _reminderLocalDatasource.deleteReminder(
        codigoReminder: codigoReminder,
      );

      if (failureOrSuccess) {
        return const Right(true);
      } else {
        return const Left(DeleteReminderFailure());
      }
    } on CacheException catch (e) {
      return Left(DeleteReminderFailure(message: e.message));
    }
  }
}
